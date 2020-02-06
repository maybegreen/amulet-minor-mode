(defconst amulet-minor-mode-version-number "1.0"
  "The version number of the Amulet minor mode.")

(defvar amulet-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "M-p") `amulet/launch)
    map)
  "A Keymap for Amulet minor mode.")

(defgroup amulet nil
  "The customization group for Amulet minor mode."
  :prefix "amulet-"
  :group 'amulet)

;;;###autoload
(define-minor-mode amulet-minor-mode
  "toggles Amulet minor mode."
  :init-value nil
  :lighter " Amulet"
  :group `amulet
  :keymap amulet-minor-mode-map)

(defcustom amulet-path (or (executable-find "amulet")
			   "~/bin/amulet")
  "Path to Amulet executable."
  :type `string
  :group `amulet)

(defun amulet/launch ()
  "Launch Amulet."
  (interactive)
  (message amulet-path)
  (call-process amulet-path nil "*amulet-output*" t
		(file-name-directory (buffer-file-name))))

(provide `amulet)
