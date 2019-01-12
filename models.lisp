(defpackage :ceramic-utopian-app/models
  (:use :cl
        :sxql
        :ceramic-utopian-app/config)
  (:import-from :mito))
(in-package :ceramic-utopian-app/models)

;;;
;; DB Utility

(defun conn-settings (&optional (db :maindb))
  (cdr (assoc db (config :databases))))

(defun db (&optional (db :maindb))
  (apply #'mito:connect-toplevel (conn-settings db)))

(defmacro with-connection (conn &body body)
  `(let ((mito:*connection* ,conn))
     ,@body))

