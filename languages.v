module slugify

pub enum Language {
	en
	it
	nl
	no
}

const lang_to_subs = {
	Language.en: en_sub
	Language.it: it_sub
	Language.nl: nl_sub
	Language.no: no_sub
}

fn language_sub(not_a_slug string, lang Language) string {
	mut s := not_a_slug

	if lang == Language.en {
		s = substitute(s, en_sub)
	} else {
		mut fallback_sub := map[string]string{}
		for k, v in en_sub {
			if k !in lang_to_subs[lang] {
				fallback_sub[k] = v
			}
		}
		s = substitute(s, lang_to_subs[lang])
		s = substitute(s, fallback_sub)
	}
	return s
}
