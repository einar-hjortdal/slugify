# slugify

Generate slug from string

## Features

- language-specific transliteration toggle
- custom replacement map support
- truncate at maximum character length
- truncate at the end of a word before given maximum character length
- transform to lowercase toggle

## Usage

Install with `v install einar-hjortdal.slugify`

```V
import einar_hjortdal.slugify

slugifier := slugify.default()
slug := slugifier.make('Slugs are NOT snails') // slugs-are-not-snails
```

Please take a look at the test files for more information.

## Notes

`make` and `make_lang` return a string that:
- contains exclusively word characters (`\w`) and hyphens (`-`).
- does not start nor end with hyphens (`-`) or underscores (`_`).
- **may be empty**: if the given string contains exclusively non-word characters and those characters 
are not contained in the `substitutions.v` file.

Pull requests are welcome to add support for more languages. To add subsitutions or a whole new language, 
please look at the [substitutions.v](./substitutions.v) file and at the [CONTRIBUTING.md](./CONTRIBUTING.md) 
file.
