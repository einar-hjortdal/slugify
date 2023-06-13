module slugify

const (
	default_sub = {
		'"': ''
		"'": ''
		'’': ''
		'‒': '-'
		'–': '-'
		'—': '-'
		'―': '-'
	}
	en_sub = {
		'&': 'and'
		'@': 'at'
	}
	it_sub = {
		'&': 'e'
		'@': 'chiocciola'
	}
	nl_sub = {
		'&': 'en'
		'@': 'at'
	}
	no_sub = {
		'&': 'og'
		'@': 'at'
		'æ': 'ae'
		'ø': 'oe'
		'å': 'aa'
		'Æ': 'Ae'
		'Ø': 'Oe'
		'Å': 'Aa'
	}
)
