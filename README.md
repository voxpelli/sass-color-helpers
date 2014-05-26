# Sass Color Helpers

A collection of color helpers (and some related math helpers). Handles HSL to HSV/HSB conversion, calculation of contrast (and warnings for worst case scenarios) and estimation of semi-transparent colors – everything to make it easier and more fool-proof to implement a target design and in the end get as good of a design as possible.

Lastly also some candy for the geeks: nth root and decimal exponent powers function. Because graphics can be tough.

## Installation

```bash
bower install sass-color-helpers --save
```

Then include either the individual helpers manually from the `lib/` folder, set the load path of something like [grunt-contrib-sass](https://npmjs.org/package/grunt-contrib-sass) to look for  [grunt-bower-install](https://www.npmjs.org/package/grunt-bower-install)

## Helpers

### Alpha Picker / Estimation

```scss
$alpha: ch_calculate_alpha(#FFF, #526D4E, #DFE4DF);
$actionColor: ch_calculate_top_color($alpha, #BEDBA1, #89D338);
```

Originaly published at: https://gist.github.com/voxpelli/8452877

#### Methods:

* `ch_calculate_alpha($topColor, $bottomColor, $targetColor)` – to calculate an alpha from a defined color and colors picked from a reference image
* `ch_calculate_top_color($alpha, $bottomColor, $targetColor)` – to calculate a color from a defined alpha and colors picked from a reference image

### Contrast

```scss
$contrast: ch_color_contrast($backgroundColor, $textColor);

@if ($contrast < 3) {
  @warn "Contrast ratio of #{$textColor} on #{$backgroundColor} is pretty bad, just #{$contrast}";
}
```

Originally published at: https://gist.github.com/voxpelli/6304812
Based on code from: https://github.com/LeaVerou/contrast-ratio

#### Methods:

* `ch_color_contrast($color1, $color2)` – when given a background color and a front color it returns the [contrast ratio](http://www.w3.org/TR/2008/REC-WCAG20-20081211/#contrast-ratiodef) between those two
* `ch_best_color_contrast($base, $colors, $tolerance: 0)` – when given a background color and a list of front colors it will return the first front color with the best contrast ratio. If tolerance is set to something higher than 0 than a front color later in the list will only beat a previous color if it improves the contrast ratio  by at least that much – useful if one has a preferably color that one wants to use in all but the most extreme cases.

### HSV/HSB to HSL

```scss
$hsv: ch_color_to_hsv($color);

$v: nth($hsv, 3);
$s: nth($hsv, 2);
$h: nth($hsv, 1);

$v: max(0%, min(100%, $v + $tweak));

$color: ch_hsv_to_color($h, $s, $v);
```

Originally published at: https://gist.github.com/voxpelli/1069204
Based on code from: http://ariya.blogspot.com/2008/07/converting-between-hsl-and-hsv.html

#### Methods:

* `ch_hsv_to_hsl($h, $s: 0, $v: 0)` – transforms a hsv value given by either individual parameters, or by a list as the first parameter, to a list of hsl values
* `ch_hsl_to_hsv($h, $ss: 0, $ll: 0)` – transforms a hsl value given by either individual parameters, a list values as the first parameter or as a color as the first parameter, to a list of hsv values
* `ch_color_to_hsv($color)` – alias for `ch_hsl_to_hsv($color)`
* `ch_hsv_to_color($h, $s: 0, $v: 0)` – shorthand for a `ch_hsv_to_hsl($h, $s, $v)` followed by a `hsl()` transforming the hsl values to a color
* `ch_brightness($h, $s: 0, $v: 0, $adjustment: 0)` – shorthand for changing the brightness of a color. If first argument is either a list of hsv values or a color then the second argument is the adjustment to apply. Otherwise the first threee arguments are the individal hsv values and the adjustment the fourth argument.

### Math

```scss
$hsv: ch_color_to_hsv($color);

$v: nth($hsv, 3);
$s: nth($hsv, 2);
$h: nth($hsv, 1);

$v: max(0%, min(100%, $v + $tweak));

$color: ch_hsv_to_color($h, $s, $v);
```

Originally published at: https://gist.github.com/voxpelli/6304812
Based on code from: http://rosettacode.org/wiki/Greatest_common_divisor#JavaScript and http://rosettacode.org/wiki/Nth_root#JavaScript

#### Methods:

* `ch_pow($base, $exponent, $prec: 12)` – calculates $base raised to the power of $exponent where $exponent can be a decimal number – and if so, $prec defines the precision of the calculation
* `ch_nth_root($num, $n: 2, $prec: 12)` – calculates the nth root of a number with the defined precision. Used by `ch_pow()`.
* `ch_gcd($a, $b)` – finds the greatest common divisor between the two values
* `ch_max($v1, $v2)` – returns the biggest of the two values
* `ch_min($v1, $v2)` – returns the smaller of the two values

## License

MIT, [http://voxpelli.mit-license.org](http://voxpelli.mit-license.org)

## Changelog

### 1.0.0

* First packaged version of the scripts. They were previously published as gists on GitHub over a period of time.
