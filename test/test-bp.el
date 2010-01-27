(require 'test-unit)
(load-file "../dbgr/bp.el")

(test-unit-clear-contexts)

(context "breakpoints"
	 (tag bp)
	 (setq temp-srcbuf (generate-new-buffer "*srcbuf-test*"))
	 (with-current-buffer temp-srcbuf
	   (insert "abc\ndef\n")
	   (specify "breakpoint reset"
		    (dbgr-bp-remove-icons (point-min) (point-max))
		    (assert-equal 0 (length (overlays-in (point-min) (point-max)))
				  "Should not have any breakpoints in buffer")
		    )
	   ;; (specify "breakpoint set"
	   ;; 	    (dbgr-bp-put-icon (point-min) 't 1 temp-srcbuf)
	   ;; 	    (dbgr-bp-put-icon (point-max) nil 2 temp-srcbuf)
	   ;; 	    (assert-equal 2 (length (overlays-in (point-min) (point-max)))
	   ;; 			  (format 
	   ;; 			   "Should find breakpoints in buffer %s" 
	   ;; 			   temp-srcbuf))
	   ;; 	    (let* ((ov-list (overlays-in (point-min) (point-min)))
	   ;; 		   (ov (car-safe ov-list))
	   ;; 		   (before-string)
	   ;; 		   )
	   ;; 	      (assert-equal 1 (length ov-list)
	   ;; 			    "Should find 1 breakpoint at (point-min)")
	   ;; 	      (setq before-string (overlay-get ov 'before-string))
	   ;; 	      (assert-equal 1 (get-text-property 0 'dbgr-bptno before-string)
	   ;; 			    "Should find breakpoint number 1 in overlay's before-string")
	   ;; 	      (assert-equal t (get-text-property 0 'enabled before-string)
	   ;; 			    "Breakpoint 1 should be enabled")
	   ;; 	      )
	   ;; 	    (let* ((ov-list (overlays-in (point-max) (point-max)))
	   ;; 		   (ov (car-safe ov-list))
	   ;; 		   (before-string)
	   ;; 		   )
	   ;; 	      (assert-equal 1 (length ov-list)
	   ;; 			    "Should find 1 breakpoint at (point-max)")
	   ;; 	      (setq before-string (overlay-get ov 'before-string))
	   ;; 	      (assert-equal 2 (get-text-property 0 'dbgr-bptno before-string)
	   ;; 			    "Should find breakpoint number 1 in overlay's before-string")
	   ;; 	      (assert-equal nil (get-text-property 0 'enabled before-string)
	   ;; 			    "Breakpoint 1 should be disabled")
	   ;; 	      )
	   ;; 	    )
	   )
	 )

(test-unit "bp")