(defsystem "ceramic-utopian-app"
  :class :package-inferred-system
  :version "0.1.0"
  :author "fireflower0"
  :license ""
  :depends-on (;; Web Framework
               "clack"
               "utopian"
               ;; Environment
               "envy"
               ;; HTML Template
               "djula"
               ;; DB
               "mito"
               "sxql"
               ;; UI
               "ceramic"
               ;; Top level app
               "ceramic-utopian-app/app"
               "ceramic-utopian-app/main"))
