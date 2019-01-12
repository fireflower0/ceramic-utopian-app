(defpackage :ceramic-utopian-app/app
  (:use :cl
        :utopian
        :ceramic-utopian-app/controllers)
  (:import-from :ceramic-utopian-app/config
                :*static-dir*))
(in-package :ceramic-utopian-app/app)

(defapp ceramic-utopian-app () ())

(defvar *app* (make-instance 'ceramic-utopian-app :routes *routes*))

(builder
 (:static :path "/static/"
          :root *static-dir*)
 *app*)
