module slugify

import regex

pub struct SlugifyOptions {
	mut:
	// to_lower when true produces lowercase slugs.
	to_lower bool
	// max_length is the maximum number of characters allowed in the slug.
	max_length int
	// smart_truncate when true prevents words from being cut in half to fit max_length.
	smart_truncate bool
	// transliterate when true replaces special characters to language-specific \w approximations.
	transliterate bool
	// lang is the language code used to perform the language-specific transliterations.
	lang Language
	// custom_substitutions performs transliteration with the provided map.
	// Done before language transliteration.
	// Can be done when transliteration is false.
	custom_substitutions map[string]string
}

// default is a shortcut to the most commonly used options.
// Feel free to build your own SlugifyOptions struct.
pub fn default() SlugifyOptions {
	return SlugifyOptions{
		to_lower: true
		transliterate: true
	}
}

// make creates a slug from a given string.
pub fn (opts SlugifyOptions) make(not_a_slug string) string {
	mut s := not_a_slug.trim_space()

	if opts.custom_substitutions.len > 0 {
		s = substitute(s, opts.custom_substitutions)
	}

	if opts.transliterate {
		s = language_sub(s, opts.lang)
	}

	mut re_non_word := regex.regex_opt(r'\W+') or { panic(err) }
	s = re_non_word.replace(s, '-')

	s = s.trim('-_')

	if opts.to_lower {
		s = s.to_lower()
	}

	if opts.max_length > 0 && s.len > opts.max_length {
		if opts.smart_truncate {
			s = smart_truncate(s, opts.max_length)
		} else {
			s = s[0..opts.max_length]
		}
	}

	return s
}

fn substitute(s string, substitutions map[string]string) string {
	mut r := s
	for k, v in substitutions {
		r = r.replace(k, v)
	}
	return r
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

fn smart_truncate(s string, max_length int) string {
	mut truncated := s.all_before_last('-')
	if truncated.len > max_length {
		truncated = smart_truncate(truncated, max_length)
	}
	return truncated
}

// is_slug returns true if the string:
// - only contains `\w` and `-` characters.
// - does not begin nor end with `-` or `_`.
pub fn is_slug(sussy string) bool {
	if sussy == '' || sussy.starts_with('-') || sussy.starts_with('_') || sussy.ends_with('-')
		|| sussy.ends_with('_') {
		return false
	}

	mut re_slug_chars := regex.regex_opt(r'^[\w\-]+$') or { panic(err) }
	return re_slug_chars.matches_string(sussy)
}
