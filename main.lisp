(defpackage :ceramic-utopian-app/main
  (:use :cl
        :utopian)
  (:import-from :ceramic)
  (:export :app-start
           :app-stop
           :app-build))
(in-package :ceramic-utopian-app/main)

(ceramic:define-resources :ceramic-utopian-app ()
  (assets #P"static/")
  (templates #p"template/"))

(defvar *handler* nil)
(defvar *window* nil)
(defvar *app-path* (asdf:system-relative-pathname :ceramic-utopian-app #P"app.lisp"))

(defun server-start ()
  (unless *handler*
    (setf *handler* (clack:clackup *app-path*))))

(defun server-stop ()
  (clack:stop *handler*)
  (setf *handler* nil))

(defun app-start ()
  (server-start)
  (ceramic:start)
  (setf *window* (ceramic:make-window :url (format nil "http://localhost:5000")
                                      :width  640
                                      :height 480))
  (ceramic:show *window*)
  (ceramic:open-dev-tools *window*))

(defun app-stop ()
  (server-stop)
  (ceramic:stop)
  (setf *window* nil))

(defvar *build-path* (asdf:system-relative-pathname :ceramic-utopian-app "build/"))

(defun app-build ()
  (ceramic:bundle :ceramic-utopian-app :bundle-pathname (format nil "~Aapp.tar" *build-path*)))

(ceramic:define-entry-point :ceramic-utopian-app ()
  (app-start))
