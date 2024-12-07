module slugify

// substitutions_en are the default and fallback substitution mappings.
// When passing a different language to `make_lang`, any mapping found in the passed language will
// override the mappings in `substitutions_en`. Mappings that exist in `substitutions_en` but not in
// the passed language will still apply.
//
// Please note that some symbols are not only used for a single meaning. For example `£` is not only
// used for british pounds. In such cases it is best to use either more ambiguous replacement than
// `GBP` or none at all and let the character be removed.
//
// Replacements should only contain `\w` characters and hyphens `-`, any other character will be removed.
const substitutions_en = {
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
