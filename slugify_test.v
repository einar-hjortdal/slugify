module slugify

fn test_slugify_regexes() {
	slugifier := default()
	assert slugifier.make('ThIs IS a_    test?@') == 'this-is-a_-test-at'
}

fn test_slugify_make_lang() {
	mut slugifier := default()
	assert slugifier.make('Har du røykt sokka dine?') == 'har-du-r-ykt-sokka-dine'
	slugifier.lang = Language.no
	assert slugifier.make('Har du røykt sokka dine?') == 'har-du-roeykt-sokka-dine'
	slugifier.lang = Language.it
	assert slugifier.make('Un € o un $') == 'un-eur-o-un'
}

fn test_max_length() {
	slugifier := SlugifyOptions{
		max_length: 12
	}
	assert slugifier.make('Sugma Willy: we are your fitness family.').len == 12
}

fn test_smart_truncate() {
	slugifier := SlugifyOptions{
		max_length: 12
		smart_truncate: true
	}
	assert slugifier.make('Sugma Willy: we are your fitness family.') == 'Sugma-Willy'
}

fn test_skip_transliteration() {
	mut slugifier := SlugifyOptions{
		transliterate: false
	}
	assert slugifier.make('Har du røykt sokka dine?') == 'Har-du-r-ykt-sokka-dine'
	slugifier.lang = Language.no
	assert slugifier.make('Har du røykt sokka dine?') == 'Har-du-r-ykt-sokka-dine'
}

fn test_is_slug() {
	assert is_slug('') == false
	assert is_slug('-begin') == false
	assert is_slug('_begin') == false
	assert is_slug('end-') == false
	assert is_slug('end_') == false
	assert is_slug('singleword') == true
	assert is_slug('includes_underscores') == true
	assert is_slug('includes whitespaces') == false
	assert is_slug('includes-dashes') == true
	assert is_slug('Har du røykt sokka dine?') == false
	assert is_slug('Include_Capital_Letters') == true
}
