ContributeClassView = require './ContributeClassView'
template = require 'templates/contribute/diplomat'
{me} = require 'core/auth'

require("locale/en")
require("locale/en-US")
require("locale/en-GB")
require("locale/ru")
require("locale/de-DE")
require("locale/de-AT")
require("locale/de-CH")
require("locale/es-419")
require("locale/es-ES")
require("locale/zh-HANS")
require("locale/zh-HANT")
require("locale/zh-WUU-HANS")
require("locale/zh-WUU-HANT")
require("locale/fr")
require("locale/ja")
require("locale/ar")
require("locale/pt-BR")
require("locale/pt-PT")
require("locale/pl")
require("locale/it")
require("locale/tr")
require("locale/nl")
require("locale/nl-BE")
require("locale/nl-NL")
require("locale/fa")
require("locale/cs")
require("locale/sv")
require("locale/id")
require("locale/el")
require("locale/ro")
require("locale/vi")
require("locale/hu")
require("locale/th")
require("locale/da")
require("locale/ko")
require("locale/sk")
require("locale/sl")
require("locale/fi")
require("locale/fil")
require("locale/bg")
require("locale/nb")
require("locale/nn")
require("locale/he")
require("locale/lt")
require("locale/sr")
require("locale/uk")
require("locale/hi")
require("locale/ur")
require("locale/ms")
require("locale/ca")
require("locale/gl")
require("locale/mk-MK")
require("locale/eo")
require("locale/uz")
require("locale/my")
require("locale/et")
require("locale/hr")
require("locale/mi")
require("locale/haw")
require("locale/kk")

module.exports = class DiplomatView extends ContributeClassView
  id: 'diplomat-view'
  template: template

  initialize: ->
    @contributorClassName = 'diplomat'

  calculateSpokenLanguageStats: ->
    @locale ?= require 'locale/locale'
    totalStrings = @countStrings @locale.en
    languageStats = {}
    for languageCode, language of @locale
      continue if languageCode in ['update', 'installVueI18n']
      languageStats[languageCode] =
        githubURL: "https://github.com/codecombat/codecombat/blob/master/app/locale/#{languageCode}.coffee"
        completion: @countStrings(language) / totalStrings
        nativeDescription: language.nativeDescription
        englishDescription: language.englishDescription
        diplomats: @diplomats[languageCode]
        languageCode: languageCode
    languageStats

  countStrings: (language) ->
    translated = 0
    for section, strings of language.translation
      translated += _.size strings
    translated

  diplomats:
    en: []             # English - English
    'en-US': []        # English (US), English (US)
    'en-GB': []        # English (UK), English (UK)
    ru: ['EagleTA', 'ImmortalJoker', 'Mr A', 'Shpionus', 'a1ip', 'fess89', 'iulianR', 'kerradus', 'kisik21', 'nixel', 'ser-storchak', 'CatSkald']             # ?????????????? ????????, Russian
    'de-DE': ['Anon', 'Dirk', 'HiroP0', 'bahuma20', 'bkimminich', 'djsmith85', 'dkundel', 'domenukk', 'faabsen', 'Zeldaretter', 'joca16']        # Deutsch (Deutschland), German (Germany)
    'de-AT': ['djsmith85']        # Deutsch (??sterreich), German (Austria)
    'de-CH': ['greyhusky']        # Deutsch (Schweiz), German (Switzerland)
    'es-419': ['2xG', 'Federico Tomas', 'Jes??s Ruppel', 'Mariano Luzza', 'Matthew Burt']       # espa??ol (Am??rica Latina), Spanish (Latin America)
    'es-ES': ['3rr3s3v3n', 'Anon', 'DanielRodriguezRivero', 'Matthew Burt', 'OviiiOne', 'Pouyio', 'Vindurrin']        # espa??ol (ES), Spanish (Spain)
    'zh-HANS': ['1c7', 'Adam23', 'BonnieBBS', 'Cheng Zheng', 'Vic020', 'ZephyrSails', 'julycoolwind', 'onion7878', 'spacepope', 'yangxuan8282', 'yfdyh000']      # ????????????, Chinese (Simplified)
    'zh-HANT': ['Adam23', 'gintau', 'shuwn']      # ????????????, Chinese (Traditional)
    'zh-WUU-HANS': []  # ??????, Wuu (Simplified)
    'zh-WUU-HANT': ['benojan']  # ??????, Wuu (Traditional)
    fr: ['Anon', 'Armaldio', 'ChrisLightman', 'Elfisen', 'Feugy', 'MartinDelille', 'Oaugereau', 'Xeonarno', 'dc55028', 'jaybi', 'pstweb', 'veritable', 'xavismeh', 'CatSkald']             # fran??ais, French
    ja: ['Coderaulic', 'g1itch', 'kengos', 'treby']             # ?????????, Japanese
    ar: ['5y', 'ahmed80dz']             # ??????????????, Arabic
    'pt-BR': ['Bia41', 'Gutenberg Barros', 'Kieizroe', 'Matthew Burt', 'brunoporto', 'cassiocardoso', 'jklemm', 'Arkhad']        # portugu??s do Brasil, Portuguese (Brazil)
    'pt-PT': ['Imperadeiro98', 'Matthew Burt', 'ProgramadorLucas', 'ReiDuKuduro', 'batista', 'gutierri']        # Portugu??s (Portugal), Portuguese (Portugal)
    pl: ['Anon', 'Kacper Ciepielewski', 'TigroTigro', 'kvasnyk', 'CatSkald']             # j??zyk polski, Polish
    it: ['AlessioPaternoster', 'flauta', 'Atomk', 'Lionhear7']              # italiano, Italian
    tr: ['Naz??m Gediz Ayd??ndo??mu??', 'cobaimelan', 'gediz', 'ilisyus', 'wakeup']             # T??rk??e, Turkish
    nl: []        # Nederlands, Dutch
    'nl-BE': ['Glen De Cauwsemaecker', 'Ruben Vereecken']        # Nederlands (Belgi??), Dutch (Belgium)
    'nl-NL': ['Guido Zuidhof', "Jasper D\'haene"]        # Nederlands (Nederland), Dutch (Netherlands)
    fa: ['Reza Habibi (Rehb)']             # ??????????, Persian
    cs: ['Martin005', 'Gygram', 'vanous']             # ??e??tina, Czech
    sv: ['iamhj', 'Galaky']             # Svenska, Swedish
    id: ['mlewisno-oberlin']             # Bahasa Indonesia, Indonesian
    el: ['Stergios', 'micman', 'zsdregas']             # ????????????????, Greek
    ro: []             # limba rom??n??, Romanian
    vi: ['An Nguyen Hoang Thien']             # Ti???ng Vi???t, Vietnamese
    hu: ['Anon', 'atlantisguru', 'bbeasmile', 'csuvsaregal', 'divaDseidnA', 'ferpeter', 'kinez', 'adamcsillag', 'LogMeIn', 'espell.com']             # magyar, Hungarian
    th: ['Kamolchanok Jittrepit']             # ?????????, Thai
    da: ['Anon', 'Einar Rasmussen', 'Rahazan', 'Randi Hiller??e', 'Silwing', 'marc-portier', 'sorsjen', 'Zleep-Dogg']             # dansk, Danish
    ko: ['Melondonut']             # ?????????, Korean
    sk: ['Anon', 'Juraj Pech????']             # sloven??ina, Slovak
    sl: []             # sloven????ina, Slovene
    fi: []             # suomi, Finnish
    bg: []             # ?????????????????? ????????, Bulgarian
    nb: ['bardeh', 'ebirkenes', 'matifol', 'mcclane654', 'mogsie', 'torehaug']             # Norsk Bokm??l, Norwegian (Bokm??l)
    nn: []             # Norsk Nynorsk, Norwegian (Nynorsk)
    he: ['OverProgram', 'monetita']             # ??????????, Hebrew
    lt: []             # lietuvi?? kalba, Lithuanian
    sr: []             # ????????????, Serbian
    uk: ['ImmortalJoker', 'OlenaGapak', 'Rarst', 'endrilian', 'fess89', 'gorodsb', 'probil', 'CatSkald']             # ????????????????????, Ukrainian
    hi: []             # ???????????? ??????????????????, Hindi
    ur: []             # ????????????, Urdu
    ms: []             # Bahasa Melayu, Bahasa Malaysia
    ca: ['ArniMcFrag', 'Nainufar']             # Catal??, Catalan
    gl: ['mcaeiror']             # Galego, Galician
    'mk-MK': ['SuperPranx']             # ????????????????????, Macedonian
    eo: []             # Esperanto, Esperanto
    uz: []             # O'zbekcha, Uzbek
    my: []             # ??????????????????????????????, Myanmar language
    et: []             # Eesti, Estonian
    hr: []             # hrvatski jezik, Croatian
    mi: []             # te reo M??ori, M??ori
    haw: []            # ????lelo Hawai??i, Hawaiian
    kk: []            # ?????????? ????????, Kazakh
    fil: ['Celestz'] #Like This?
