# slugify

Generate slug from string. Features multi-language custom replacement map support.

Pull requests are welcome to add support for more languages.

## Usage

```V
import coachonko.slugify

fn main() {
  slugifier := slugify.default()
  slug := slugifier.make('Slugs are NOT snails') // slugs-are-not-snails
}
```

Please take a look at the test files for more information.
