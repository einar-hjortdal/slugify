module slugify

// Language is the enum provided to the make_lang function.
// `en` should always be the first language in the enum.
pub enum Language {
	en
	fa
	it
	nl
	no
}

const (
	// lang_to_subs matches a `Language` value to its substitutions map.
	lang_to_subs = {
		Language.en: en_sub
		Language.fa: fa_sub
		Language.it: it_sub
		Language.nl: nl_sub
		Language.no: no_sub
	}
	// en_sub are the default and fallback substitution mappings.
	// When passing a different language to `make_lang`, any mapping found in the passed language will
	// override the mappings in `en_sub`. Mappings that exist in `en_sub` but not in the passed language
	// will still apply.
	//
	// Please note that some symbols are not only used for a single meaning. For example `£` is not only 
	// used for british pounds. In such cases it is best to use either more ambiguous replacement than 
	// `GBP` or none at all and let the character be removed.
	//
	// Replacements should only contain `\w` characters and hyphens `-`, any other character will be removed.
	en_sub = {
		'&': 'and'
		'@': 'at'
		'%': 'percent'
		'<': 'less'
		'>': 'greater'
		'|': 'or'
		'€': 'EUR'
		'¢': 'C'
		'£': 'PS'
		'¥': 'Y'
		'฿': 'Bh'
		'₠': 'ECU'
		'₢': 'Cr'
		'₣': 'FF'
		'₤': 'L'
		'₥': 'mil'
		'₦': 'N'
		'₧': 'Pts'
		'₨': 'Rs'
		'₩': 'W'
		'₪': 'NS'
		'₫': 'D'
		'₭': 'K'
		'₮': 'T'
		'₯': 'Dr'
		'₰': 'Pf'
		'₱': 'P'
		'₲': 'G'
		'₳': 'A'
		'₴': 'UAH'
		'₵': 'C'
		'₸': 'T'
		'₹': 'Rs'
		'₺': 'L'
		'₽': 'R'
		'₿': 'BTC'
		'∆': 'delta'
		'∑': 'sum'
		'∞': 'infinity'
		'♥': 'heart'
	}
	fa_sub = {
		'ک': 'kh'
		'ی': 'y'
	}
	it_sub = {
		'&': 'e'
		'@': 'chiocciola'
		'%': 'per cento'
		'<': 'minore'
		'>': 'maggiore'
		'|': 'o'
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
