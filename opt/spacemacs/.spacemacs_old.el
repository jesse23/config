;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     csv
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     ;; better-defaults
     helm
     html
     emacs-lisp
     gtags
     ;; git
     javascript 
     markdown

     ;; NOTE: org will confilict with auto-completion, makes company-complete
     ;; not working in emacs shell mode in w32
     ;; org

     semantic
     (shell :variables
             shell-default-shell  'shell 
             shell-default-height 30
             shell-default-position 'bottom)
     (spell-checking :variables spell-checking-enable-by-default nil)
      syntax-checking
     ;; version-control
     vimscript
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     dired+
     dired-quick-sort
     fzf
     sqlplus
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   ;; for mac we need insecure
   dotspacemacs-elpa-https nil
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; Set to 30 for avoid file-error "Cannot open load file" "No such file or directory" "bind-map"
   dotspacemacs-elpa-timeout 30
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(darkokai
                         tango-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 16
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
 ;; Default font setting
  (cond
   ((string-equal system-type "windows-nt")
    (setq-default dotspacemacs-default-font 
                  '("Source Code Pro for Powerline"
                    :size 18
                    :weight normal
                    :width normal
                    :powerline-scale 1.0)))
   ((string-equal system-type "darwin")
    (setq-default dotspacemacs-default-font 
                  ;;'("Monaco"
                  '("Source Code Pro for Powerline"
                    :size 15
                    :weight normal
                    :width normal
                    :powerline-scale 1.0)))
   ((string-equal system-type "gnu/linux")
    (setq-default dotspacemacs-default-font 
                  '("Mono"
                    :size 14
                    :weight normal
                    :width normal
                    :powerline-scale 1.0))))
  )
  ;; Bypass unsafe folder check
  (require 'server)
  (and (>= emacs-major-version 23)
    (defun server-ensure-safe-dir (dir) "Noop" t))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; Company mode
  (global-company-mode t)
  (setq company-show-numbers t)
  (setq company-dabbrev-downcase nil)
  (setq company-dabbrev-ignore-case nil)
  (setq company-clang-insert-arguments nil)
  (setq company-require-match nil)
  (setq company-etags-ignore-case t)
  (setq company-auto-complete nil)
  (setq company-idle-delay 0.2)

  ;;Short key to truncate
  (global-set-key [f2] 'rename-buffer)
  (global-set-key [f3] 'company-complete)
  (global-set-key [f4] 'kill-this-buffer)
  (global-set-key [f5] 'untabify)
  (global-set-key [f11] 'toggle-menu-bar-mode-from-frame)
  (global-set-key [f12] 'toggle-truncate-lines)

  (require 'dired-quick-sort) 
  (defun cycle-dired-quick-sort-js (*n)
    "Cycle background color among a preset list. If `universal-argument' is called first, cycle n steps. Default is 1 step. URL `http://ergoemacs.org/emacs/elisp_toggle_command.html' Version 2015-12-17"
    (interactive "p")
    (let* (
           (-values ["version" "time" "extension" "size"])
           (-index-before
            (if (get 'cycle-dired-quick-sort-js 'state)
                (get 'cycle-dired-quick-sort-js 'state)
              0))
           (-index-after (% (+ -index-before (length -values) *n) (length -values)))
           (-next-value (aref -values -index-after)))

      (put 'cycle-dired-quick-sort-js 'state -index-after)

      (dired-quick-sort -next-value nil ?y nil)
      (dired-quick-sort--sort-by-last -next-value)
      (message "sort by %s" -next-value)))

  (cond
   ((string-equal system-type "windows-nt")
    (setq ls-lisp-use-insert-directory-program t)      ;; use external ls
    (setq insert-directory-program "c:/cygwin64/bin/ls") ;; ls program name
    (setq find-program "c:/cygwin64/bin/find")
    )
   ((string-equal system-type "darwin")
    (setq ls-lisp-use-insert-directory-program t)      ;; use external ls
    (setq insert-directory-program "/usr/local/bin/gls") ;; ls program name
    )
  )

  ;; my settings for dired mode 
  (require 'dired+)
  (diredp-toggle-find-file-reuse-dir 1)
  (setq diredp-hide-details-initially-flag nil)
  (setq diredp-hide-details-propagate-flag nil)
  (setq dired-recursive-copies 'always )
  (setq dired-recursive-deletes 'always )

  (add-hook 'dired-mode-hook ( 
    lambda () (dired-quick-sort "version" nil ?y nil)
  ))

  (defun xah-open-in-external-app ()
    "Open the current file or dired marked files in external app.
The app is chosen from your OS's preference.
URL `http://ergoemacs.org/emacs/emacs_dired_open_file_in_ext_apps.html'
Version 2016-10-15"
    (interactive)
    (let* (
           (-file-list
            (if (string-equal major-mode "dired-mode")
                (dired-get-marked-files)
              (list (buffer-file-name))))
           (-do-it-p (if (<= (length -file-list) 5)
                         t
                       (y-or-n-p "Open more than 5 files? "))))
      (when -do-it-p
        (cond
         ((string-equal system-type "windows-nt")
          (mapc
           (lambda (-fpath)
             (w32-shell-execute "open" (replace-regexp-in-string "/" "\\" -fpath t t))) -file-list))
         ((string-equal system-type "darwin")
          (mapc
           (lambda (-fpath)
             (shell-command
              (concat "open " (shell-quote-argument -fpath))))  -file-list))
         ((string-equal system-type "gnu/linux")
          (mapc
           (lambda (-fpath) (let ((process-connection-type nil))
                              (start-process "" nil "xdg-open" -fpath))) -file-list))))))

  (defun xah-open-in-gvim ()
    "Open the current file or dired marked files in external app.
The app is chosen from your OS's preference.
URL `http://ergoemacs.org/emacs/emacs_dired_open_file_in_ext_apps.html'
Version 2016-10-15"
    (interactive)
    (let* (
           (-file-list
            (if (string-equal major-mode "dired-mode")
                (dired-get-marked-files)
              (list (buffer-file-name))))
           (-do-it-p (if (<= (length -file-list) 5)
                         t
                       (y-or-n-p "Open more than 5 files? "))))
      (when -do-it-p
        (cond
         ((string-equal system-type "windows-nt")
          (mapc
           (lambda (-fpath)
             (start-process "gvim" nil "gvim" (replace-regexp-in-string "/" "\\" -fpath t t))) -file-list))
         ((string-equal system-type "darwin")
          (mapc
           (lambda (-fpath)
             (start-process "gvim" nil "gvim" -fpath))  -file-list))
         ((string-equal system-type "gnu/linux")
          (mapc
           (lambda (-fpath) (let ((process-connection-type nil))
             (start-process "vim" nil "vvim" -fpath))) -file-list))))))

  (defun dired-back-to-top ()
    (interactive)
    (beginning-of-buffer)
    (dired-next-line 2))

  (defun dired-jump-to-bottom ()
    (interactive)
    (end-of-buffer)
    (dired-next-line -1))

  (defun pengw/copy-file-name ()
    (interactive)
    (let ((temp-msg (dired-copy-filename-as-kill)))  
      (progn (dired-unmark-all-marks) 
             ( message temp-msg ))))

  (defun pengw/copy-full-file-name ()
    (interactive)
    (let ((temp-msg (dired-copy-filename-as-kill 0)))  
      (progn (dired-unmark-all-marks) 
             ( message temp-msg ))))

;;  (add-hook 'dired-mode-hook 'ensure-buffer-name-ends-in-slash)
;;  (defun ensure-buffer-name-ends-in-slash ()
;;    "change buffer name to end with slash"
;;    (let ((name (buffer-name)))
;;      (if (not (string-match "/$" name))
;;          (rename-buffer (concat name "/") t))))

  (evilified-state-evilify dired-mode dired-mode-map
    "j"        'evil-next-line
    "^"        (lambda () (interactive) (find-alternate-file ".."))
    "H"        (lambda () (interactive) (find-alternate-file ".."))
    "s"        'cycle-dired-quick-sort-js
    "S"        'cycle-dired-quick-sort-js
    "o"        'diredp-find-file-reuse-dir-buffer
    "O"        'xah-open-in-external-app
    "c"        'dired-do-copy
    "C"        'dired-do-compress-to
    "y"        'pengw/copy-file-name
    "Y"        'pengw/copy-full-file-name
    "r"        'dired-do-rename
    "d"        'dired-do-delete
    "D"        'make-directory
    "e"        'xah-open-in-gvim
    "."        'helm-buffers-list
    "k"        'evil-previous-line
    "h"        'evil-backward-char
    "l"        'evil-forward-char
    [mouse-2]  'diredp-mouse-find-file
    "$"        'evil-end-of-line
    "gg"       'dired-back-to-top
    "G"        'dired-jump-to-bottom
    )


  ;; overwrite evil setting with colemak key mapping
  ;; (define-key evil-normal-state-map (kbd "h") 'evil-previous-visual-line)
  ;; (define-key evil-motion-state-map "h" 'evil-previous-line)
  ;; (define-key evil-window-map "h" 'evil-window-up)

  ;; (define-key evil-normal-state-map (kbd "k") 'evil-next-visual-line)
  ;; (define-key evil-motion-state-map "k" 'evil-next-line)
  ;; (define-key evil-window-map "k" 'evil-window-down)

  ;; (define-key evil-normal-state-map (kbd "j") 'evil-backward-char)
  ;; (define-key evil-motion-state-map "j" 'evil-backward-char)
  ;; (define-key evil-window-map "j" 'evil-window-left)

  ;; (define-key evil-normal-state-map (kbd "l") 'evil-forward-char)
  ;; (define-key evil-motion-state-map "l" 'evil-forward-char)
  ;; (define-key evil-window-map "l" 'evil-window-right)

  ;;  sqlplus-mode --> looks not working fine in xterm mode
  ;; (require 'sqlplus)
  ;; (add-to-list 'auto-mode-alist '("\\.sqp\\'" . sqlplus-mode))
  ;; (setq  sql-oracle-program "Z:/scripts/run_sqlplus10.bat")
  ;; (setq  sqlplus-command "Z:/scripts/run_sqlplus10.bat")

  ;;; scroll one line at a time (less "jumpy" than defaults)
  (setq mouse-wheel-scroll-amount '(2 ((shift) . 1))) ;; two lines at a time
  (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
  (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

  ;; emacs shell
  ;; 2017-06-20: fix shell-popup issue for windows shell
  (push (cons "\\*shell\\*" display-buffer--same-window-action) display-buffer-alist)
  ;; Don't make shell to be read only
  (setq comint-prompt-read-only nil)
  (evil-set-initial-state 'shell-mode 'emacs)
  (eval-after-load 'shell
    '(progn
        (define-key shell-mode-map ( kbd "C-l" ) 'comint-clear-buffer)
        (evil-define-key 'insert shell-mode-map ( kbd "C-d" ) #'delete-region)
        (evil-define-key 'visual shell-mode-map ( kbd "C-d" ) #'delete-region)
     )
  )

  ;; redefine quit
  (defun xah-close-current-buffer ()
  "Close the current buffer with save check.
   URL `http://ergoemacs.org/emacs/elisp_close_buffer_open_last_closed.html'
   Version 2016-06-19"
    (interactive)
    (let (-emacs-buff-p
           (-org-p (string-match "^*Org Src" (buffer-name))))
    
      (setq -emacs-buff-p (if (string-match "^*" (buffer-name)) t nil))
    
      (if (string= major-mode "minibuffer-inactive-mode")
          (minibuffer-keyboard-quit) ; if the buffer is minibuffer
        (progn
          ;; offer to save buffers that are non-empty and modified, even for non-file visiting buffer. (because kill-buffer does not offer to save buffers that are not associated with files)
          (when (and (buffer-modified-p)
                     (not -emacs-buff-p)
                     (not (string-equal major-mode "dired-mode"))
                     (if (equal (buffer-file-name) nil)
                         (if (string-equal "" (save-restriction (widen) (buffer-string))) nil t)
                       t))
            (if (y-or-n-p (format "Buffer %s modified; Do you want to save? " (buffer-name)))
                (save-buffer)
                (set-buffer-modified-p nil)))
          (when (and (buffer-modified-p)
                     -org-p)
            (if (y-or-n-p (format "Buffer %s modified; Do you want to save? " (buffer-name)))
                (org-edit-src-save)
              (set-buffer-modified-p nil)))

          ;; close
          (spacemacs/kill-this-buffer (current-buffer))))))

  (defun xah-write-close-current-buffer ()
    (interactive)
    (save-buffer)
    (spacemacs/kill-this-buffer))

  (evil-ex-define-cmd "q" 'xah-close-current-buffer)
  (evil-ex-define-cmd "wq" 'xah-write-close-current-buffer)

  ;; split window get focus
  (global-set-key "\C-x2" 'split-window-below-and-focus)
  (global-set-key "\C-x3" 'split-window-right-and-focus)
  (global-set-key (kbd "C-x C-m") 'helm-M-x)
  (global-set-key (kbd "C-c C-m") 'helm-M-x)
  (global-set-key (kbd "M-<SPC>") 'helm-M-x)
  (spacemacs/set-leader-keys "ws" 'split-window-below-and-focus)
  (spacemacs/set-leader-keys "wS" 'split-window-below)
  (spacemacs/set-leader-keys "wv" 'split-window-right-and-focus)
  (spacemacs/set-leader-keys "wV" 'split-window-right)
  (spacemacs/set-leader-keys "w2" 'split-window-below-and-focus)
  (spacemacs/set-leader-keys "w3" 'split-window-right-and-focus)
  (spacemacs/set-leader-keys "w0" 'delete-window)
  (spacemacs/set-leader-keys "w1" 'maximize-window)

  ;; remap <ESC> and C-[. 
  ;; Use single <ESC> here will cause Alt-Meta problem
  (define-key evil-emacs-state-map (kbd "<ESC><ESC>") 'keyboard-quit)
  ;;(define-key evil-emacs-state-map (kbd "C-[") 'keyboard-quit)

  (eval-after-load 'company
    '(progn
        (bind-key "<ESC><ESC>" #'company-abort company-active-map)
     )
  )

  (eval-after-load 'helm-command
    '(progn
       (bind-key "M-x" #'helm-keyboard-quit helm-M-x-map)
       (bind-key "<ESC><ESC>" #'helm-keyboard-quit helm-M-x-map)
       (bind-key "<ESC><ESC>" #'helm-keyboard-quit helm-buffer-map)
     )
  )

  ;; buffer switch
  (global-set-key (kbd "M-.") 'helm-mini) 
  (define-key evil-normal-state-map ( kbd "M-." ) 'helm-mini )
  (define-key evil-motion-state-map ( kbd "M-." ) 'helm-mini )
  (define-key evil-normal-state-map ( kbd "." ) 'helm-mini )
  (define-key evil-motion-state-map ( kbd "." ) 'helm-mini )
  (eval-after-load "helm"
    '(define-key helm-map (kbd "M-,") 'ace-jump-helm-line))
  (setq ace-jump-helm-line-style 'pre)
  (setq ace-jump-helm-line-default-action 'select)
  (ace-jump-helm-line-idle-exec-add 'helm-mini)
  (setq avy-keys (append "arstdqwfpgzxcv" nil))

  ;; Disable dialog box
  (setq use-dialog-box nil)

  ;; FZF
  (setq fzf/executable "c:/windows/fzf")
  ;; Truncate lines on
  (spacemacs/toggle-truncate-lines-on)
  ;; virsual lne navigation for textual modes
  ;; (add-hook 'text-mode-hook 'spacemacs/toogle-line-on)
  ;;(add-hook 'text-mode-hook 'spacemacs/toogle-visual-line-navigation-on)
  ;;(setq org-startup-truncated t)

  ;; csv mode
  (setq csv-separators '( "," "|" ))

  ;; projectile
  (eval-after-load 'projectile
    '(progn
       ( add-to-list 'projectile-project-root-files "init.def" )
     )
  )

  ( setq projectile-enable-caching t)

  (cond
   ((string-equal system-type "windows-nt")
    ( setq projectile-generic-command ( concat find-program " . -type f -print0" ) )
    ( setq projectile-indexing-method 'alien)
   )
  )

  ;; neotree
(defun pengw/neotree-smart-toogle ()
  (interactive)
  (if (neo-global--window-exists-p)
      (neotree-hide)
    (let ((origin-buffer-file-name (buffer-file-name)))
      (cond
        ((projectile-project-p)
           (neotree-find (projectile-project-root))
           (neotree-find origin-buffer-file-name)
        )
        (t
          (neotree-show)
        )
      )
    )
  )
)

  (global-set-key (kbd "M-,") 'pengw/neotree-smart-toogle) 
  (with-eval-after-load 'neotree
;;    (evil-define-key 'evilified neotree-mode-map (kbd "h") 'neotree-previous-line)
;;    (evil-define-key 'evilified neotree-mode-map (kbd "H") 'neotree-select-up-node)
;;    (evil-define-key 'evilified neotree-mode-map (kbd "j") 'spacemacs/neotree-collapse-or-up)
;;    (evil-define-key 'evilified neotree-mode-map (kbd "J") 'neotree-select-previous-sibling-node)
;;    (evil-define-key 'evilified neotree-mode-map (kbd "k") 'neotree-next-line)
;;    (evil-define-key 'evilified neotree-mode-map (kbd "K") 'neotree-select-down-node)
    (evil-define-key 'evilified neotree-mode-map (kbd "<ESC><ESC>") 'pengw/neotree-smart-toogle)
  )

  ;; ggtags
  (add-to-list 'exec-path "d:/pengw/software/glo656wb/bin")
  (eval-after-load "helm-gtags"
    '(progn
       (bind-key "M-," #'pengw/neotree-smart-toogle ggtags-mode-map)
     )
  )

  ;; End of the dotspacemacs/user-config, be careful
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (evil-unimpaired fzf web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data helm-gtags ggtags csv-mode vimrc-mode dactyl-mode web-beautify livid-mode skewer-mode simple-httpd json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc company-tern dash-functional tern coffee-mode stickyfunc-enhance srefactor flyspell-correct-helm flyspell-correct auto-dictionary org-projectile org-present org-pomodoro alert log4e gntp org-download htmlize gnuplot mmm-mode markdown-toc markdown-mode gh-md xterm-color shell-pop multi-term flycheck-pos-tip pos-tip flycheck eshell-z eshell-prompt-extras esh-help helm-company helm-c-yasnippet fuzzy company-statistics company auto-yasnippet yasnippet ac-ispell auto-complete sqlplus dired-quick-sort dired+ ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed dash aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((((class color) (min-colors 257)) (:foreground "#f8fbfc" :background "#242728")) (((class color) (min-colors 89)) (:foreground "#F5F5F5" :background "#1B1E1C")))))
