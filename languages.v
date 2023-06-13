module slugify

pub enum Language {
	en
	it
	nl
	no
}

fn language_sub(not_a_slug string, lang Language) string {
	mut s := not_a_slug

	if lang == Language.en {
		s = substitute(s, en_sub)
	} else if lang == Language.it {
		s = substitute(s, it_sub)
	} else if lang == Language.nl {
		s = substitute(s, nl_sub)
	} else if lang == Language.no {
		s = substitute(s, no_sub)
	}

	return s
}
