// CHATBOT CODE

if (document.documentElement.clientWidth >= 1024) {
  (function(w, i, d, g, e, t, s) {
    const iapp = document.createElement('app-root')
    document.getElementsByTagName('body')[0].appendChild(iapp)
    const link = document.createElement('link')
    link.setAttribute('rel', 'stylesheet')
    link.setAttribute('type', 'text/css')
    link.setAttribute('href', 'https://apps.clientify.net/chatbot/styles.css')
    document.getElementsByTagName('head')[0].appendChild(link)
    const iDiv = document.createElement('div')
    iDiv.id = '13084'
    iDiv.className = 'script'
    document.getElementsByTagName('body')[0].appendChild(iDiv)
    w[d] = w[d] || []
    t = i.createElement(g)
    t.async = 1
    t.src = e
    s = i.getElementsByTagName(g)[0]
    s.parentNode.insertBefore(t, s)
  })(
    window,
    document,
    '_gscq',
    'script',
    'https://apps.clientify.net/chatbot/dist/embed.js'
  )
}