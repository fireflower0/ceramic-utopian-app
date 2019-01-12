(defpackage :ceramic-utopian-app/config
  (:use :cl)
  (:import-from :envy
                :config-env-var
                :defconfig)
  (:export :config
           :*tmp-dir*
           :*static-dir*))
(in-package :ceramic-utopian-app/config)

(setf (config-env-var) "APP_ENV")

;;;
;; File & Directory Path

(defparameter *app-root*   (asdf:system-source-directory :ceramic-utopian-app))
(defparameter *tmp-dir*    (merge-pathnames #P"template/" *app-root*))
(defparameter *static-dir* (merge-pathnames #P"static/" *app-root*))

;;;
;; DB Config

(defconfig :common
    `(:databases ((:maindb :sqlite3 :database-name ,(merge-pathnames #P"db/test.db" *app-root*)))))

;;;
;; Config Function

(defun config (&optional key)
  (envy:config #.(package-name *package*) key))
