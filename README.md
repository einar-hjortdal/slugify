# slugify

Generate slug from string. Features multi-language and custom replacement map support.

Pull requests are welcome to add support for more languages. To add subsitutions or a whole new language, 
modify the `substitutions.v` file.

## Usage

Install with `v install Coachonko.slugify`

```V
import coachonko.slugify

fn main() {
  slugifier := slugify.default()
  slug := slugifier.make('Slugs are NOT snails') // slugs-are-not-snails
}
```

Please take a look at the test files for more information.

## Notes

`make` and `make_lang`:
- return a string containing exclusively word characters (`\w`) and hyphens (`\-`).
- can return an empty string if they are given exclusively non-word characters that are not contained 
in the `substitutions.v` file.