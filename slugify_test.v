module slugify

fn test_slugify_regexes() {
	slugifier := default()
	assert slugifier.make('ThIs IS a_    test?@') == 'this-is-a_-test-at'
}

fn test_slugify_no() {
	slugifier := default()
	assert slugifier.make_lang(' Har du røykt sokka dine? ', Language.no) == 'har-du-roeykt-sokka-dine'
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
