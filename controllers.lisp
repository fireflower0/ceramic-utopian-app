(defpackage :ceramic-utopian-app/controllers
  (:use :cl
        :utopian
        :ceramic-utopian-app/views
        :ceramic-utopian-app/models)
  (:export :*routes*))
(in-package :ceramic-utopian-app/controllers)

;;;
;; Routing Function

;; トップページ
(defun index (param)
  (declare (ignore params))
  (djula-render #P"index.html"))

;;;
;; Definition route

(defroutes *routes*
    ((:GET "/" #'index)))
