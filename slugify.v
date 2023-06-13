module slugify

import regex

pub struct SlugifyOptions {
	to_lower             bool
	max_length           int
	smart_truncate       bool
	custom_substitutions map[string]string
}

pub fn default() SlugifyOptions {
	return SlugifyOptions{
		to_lower: true
		max_length: 0
		smart_truncate: false
	}
}

pub fn (opts SlugifyOptions) make(not_a_slug string) string {
	return opts.make_lang(not_a_slug, Language.en)
}

pub fn (opts SlugifyOptions) make_lang(not_a_slug string, lang Language) string {
	mut s := not_a_slug.trim_space()

	if opts.custom_substitutions.len > 0 {
		s = substitute(s, opts.custom_substitutions)
	}

	s = substitute(s, default_sub)
	s = language_sub(s, lang)

	// TODO add unidecode-like module to handle all non-ascii characters
	// https://pypi.org/project/Unidecode/

	mut re_non_ascii := regex.regex_opt(r'[\W]+') or { panic(err) }
	s = re_non_ascii.replace(s, '-')

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

fn smart_truncate(s string, max_length int) string {
	mut truncated := s.all_before_last('-')
	if truncated.len > max_length {
		truncated = smart_truncate(truncated, max_length)
	}
	return truncated
}
