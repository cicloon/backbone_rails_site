# ActiveAdmin brokes default locale making it to be :en
# This quick hack fix it

I18n.locale = :es # this should be the default locale
I18n.load_path += Dir[Rails.root.join("config/locales/**/*.yml")]
I18n.reload!