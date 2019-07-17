(defparameter *nodes* '((living-room
			 (You are in the living room. A wizard is snoring loudly on the couch.))
			(garden
			 (You are in a a beautiful garden. There is a well in front of you.))
			(attic (You are in the attic. There is a giant welding torch in the corner.))))
			
(defun describe-location (location nodes)
  (cadr (assoc location nodes)))

(defparameter *edges* '((living-room (garden west door)
			 (attic upstairs ladder))
			(garden (living-room east door))
			(attic (living-room downstairs ladder))))

(defun describe-path (edge)
  `(there is a ,(caddr edge) going ,(cadr edge) from here.))

(defun describe-paths (location edges)
  (apply #'append (mapcar #'describe-path (cdr (assoc
						location edges)))))
