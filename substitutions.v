module slugify

// Language is the enum provided to the make_lang function.
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
	en_sub = {
		'&': 'and'
		'@': 'at'
		'%': 'percent'
		'<': 'less'
		'>': 'greater'
		'|': 'or'
		// TODO some currency symbols are used for more than just one currency.
		'€': 'euro'
		'$': 'dollar'
		'¢': 'cent'
		'£': 'pound'
		'¤': 'currency'
		'¥': 'yen'
		'฿': 'baht'
		'₠': 'ecu'
		'₢': 'cruzeiro'
		'₣': 'french franc'
		'₤': 'lira'
		'₥': 'mill'
		'₦': 'naira'
		'₧': 'peseta'
		'₨': 'rupee'
		'₩': 'won'
		'₪': 'new shequel'
		'₫': 'dong'
		'₭': 'kip'
		'₮': 'tugrik'
		'₯': 'drachma'
		'₰': 'penny'
		'₱': 'peso'
		'₲': 'guarani'
		'₳': 'austral'
		'₴': 'hryvnia'
		'₵': 'cedi'
		'₸': 'kazakhstani tenge'
		'₹': 'indian rupee'
		'₺': 'turkish lira'
		'₽': 'russian ruble'
		'₿': 'bitcoin'
		'؋': 'afghani'
		'﷼': 'rial'
		//
		'∆': 'delta'
		'∑': 'sum'
		'∞': 'infinity'
		'♥': 'love'
	}
	fa_sub = {

	}
	it_sub = {
		'&': 'e'
		'@': 'chiocciola'
		'%': 'per cento'
		'<': 'minore'
		'>': 'maggiore'
		'|': 'o'
		'$': 'dollaro'
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
