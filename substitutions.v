module slugify

pub enum Language {
	en
	it
	nl
	no
}

const (
	lang_to_subs = {
		Language.en: en_sub
		Language.it: it_sub
		Language.nl: nl_sub
		Language.no: no_sub
	}
	en_sub = {
		//
		'&': 'and'
		'@': 'at'
		'%': 'percent'
		'<': 'less'
		'>': 'greater'
		'|': 'or'
		// currency
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
		'元': 'yuan'
		'円': 'yen'
		//
		'∆': 'delta'
		'∑': 'sum'
		'∞': 'infinity'
		'♥': 'love'
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
