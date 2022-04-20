# List of the BCP-47 language codes
# https://www.iana.org/assignments/language-subtag-registry/language-subtag-registry
# Sort according to language popularity on Internet
# http://en.wikipedia.org/wiki/Languages_used_on_the_Internet

module.exports =
  update: ->
    localesLoaded = (s for s in window.require.list() when _.string.startsWith(s, 'locale/'))

    store = require('core/store')

    for path in localesLoaded
      continue if path is 'locale/locale'
      code = path.replace('locale/', '')
      store.commit('addLocaleLoaded', code)
      @[code] = require(path)


  'en': { nativeDescription: 'English', englishDescription: 'English' }
  'en-US': { nativeDescription: 'English (US)', englishDescription: 'English (US)' }
  'zh-HANS': { nativeDescription: '简体中文', englishDescription: 'Chinese (Simplified)' }
  'zh-HANT': { nativeDescription: '繁體中文', englishDescription: 'Chinese (Traditional)' }

  installVueI18n: ->
    # https://github.com/rse/vue-i18next/blob/master/vue-i18next.js, converted by js2coffee 2.2.0
    store = require('core/store')

    VueI18Next = install: (Vue, options) ->
    
      ###  determine options  ###
    
      opts = {}
      Vue.util.extend opts, options
    
      ###  expose a global API method  ###
    
      Vue.t = (key, options) ->
        opts = {}
        lng = store.state.me.preferredLanguage or 'en'
        if not store.state.localesLoaded[lng]
          lng = 'en'
        if typeof lng == 'string' and lng != ''
          opts.lng = lng
        Vue.util.extend opts, options
        i18n.t key, opts
    
      ###  expose a local API method  ###
    
      Vue::$t = (key, options) ->
        opts = {}
        lng = store.state.me.preferredLanguage or 'en'
        if not store.state.localesLoaded[lng]
          lng = 'en'
        if typeof lng == 'string' and lng != ''
          opts.lng = lng
        ns = @$options.i18nextNamespace
        if typeof ns == 'string' and ns != ''
          opts.ns = ns
        Vue.util.extend opts, options
        i18n.t key, opts
    
      return
    
    Vue.use(VueI18Next)
