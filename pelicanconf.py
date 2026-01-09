AUTHOR = 'Karim Vergnes'
SITENAME = 'thesola.io blog'
SITEURL = ''
SITELOGO = '/images/logo-light.png'
SITELOGO_DARK = '/images/logo.png'

PATH = 'content'

TIMEZONE = 'Europe/Paris'

DEFAULT_LANG = 'en'

ARTICLE_URL = '{date:%Y}/{slug}'
ARTICLE_SAVE_AS = '{date:%Y}/{slug}/index.html'

# Feed generation is usually not desired when developing
FEED_ALL_ATOM = None
CATEGORY_FEED_ATOM = None
TRANSLATION_FEED_ATOM = None
AUTHOR_FEED_ATOM = None
AUTHOR_FEED_RSS = None

CATEGORIES_URL = 'categories'
CATEGORIES_SAVE_AS = 'categories/index.html'

ARCHIVES_URL = 'archives'
ARCHIVES_SAVE_AS = 'archives/index.html'

MENU_INTERNAL_PAGES = (
        ('Categories', CATEGORIES_URL, CATEGORIES_SAVE_AS),
        ('Archives', ARCHIVES_URL, ARCHIVES_SAVE_AS)
)

MENUITEMS = (
        ('Portfolio', 'https://thesola.io/'),
)

# Blogroll
LINKS = (('Pelican', 'https://getpelican.com/'),
         ('Python.org', 'https://www.python.org/'),
         ('Jinja2', 'https://palletsprojects.com/p/jinja/'),
         ('You can modify those links in your config file', '#'),)

# Social widget
SOCIAL = (('You can add links in your config file', '#'),
          ('Another social link', '#'),)

DEFAULT_PAGINATION = 10

# Uncomment following line if you want document-relative URLs when developing
#RELATIVE_URLS = True
