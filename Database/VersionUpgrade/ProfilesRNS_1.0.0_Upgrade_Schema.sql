/ *  
 R u n   t h i s   s c r i p t   o n :  
  
                 P r o f i l e s   V e r s i o n   1 . 0 . 0         -     T h i s   d a t a b a s e   w i l l   b e   m o d i f i e d  
  
 t o   s y n c h r o n i z e   i t   w i t h :  
  
               P r o f i l e s 1 0 1   V e r s i o n   1 . 0 . 1  
  
 Y o u   a r e   r e c o m m e n d e d   t o   b a c k   u p   y o u r   d a t a b a s e   b e f o r e   r u n n i n g   t h i s   s c r i p t  
  
 * /  
 S E T   N U M E R I C _ R O U N D A B O R T   O F F  
 G O  
 S E T   A N S I _ P A D D I N G ,   A N S I _ W A R N I N G S ,   C O N C A T _ N U L L _ Y I E L D S _ N U L L ,   A R I T H A B O R T ,   Q U O T E D _ I D E N T I F I E R ,   A N S I _ N U L L S   O N  
 G O  
 I F   E X I S T S   ( S E L E C T   *   F R O M   t e m p d b . . s y s o b j e c t s   W H E R E   i d = O B J E C T _ I D ( ' t e m p d b . . # t m p E r r o r s ' ) )   D R O P   T A B L E   # t m p E r r o r s  
 G O  
 C R E A T E   T A B L E   # t m p E r r o r s   ( E r r o r   i n t )  
 G O  
 S E T   X A C T _ A B O R T   O N  
 G O  
 S E T   T R A N S A C T I O N   I S O L A T I O N   L E V E L   S E R I A L I Z A B L E  
 G O  
 B E G I N   T R A N S A C T I O N  
 G O  
 P R I N T   N ' C r e a t i n g   s c h e m a t a '  
 G O  
 C R E A T E   S C H E M A   [ S e a r c h . C a c h e ]  
 A U T H O R I Z A T I O N   [ d b o ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 C R E A T E   S C H E M A   [ S e a r c h . ]  
 A U T H O R I Z A T I O N   [ d b o ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 C R E A T E   S C H E M A   [ F r a m e w o r k . ]  
 A U T H O R I Z A T I O N   [ d b o ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 C R E A T E   S C H E M A   [ D i r e c t . ]  
 A U T H O R I Z A T I O N   [ d b o ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 C R E A T E   S C H E M A   [ O n t o l o g y . I m p o r t ]  
 A U T H O R I Z A T I O N   [ d b o ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 C R E A T E   S C H E M A   [ O n t o l o g y . P r e s e n t a t i o n ]  
 A U T H O R I Z A T I O N   [ d b o ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 C R E A T E   S C H E M A   [ P r o f i l e . M o d u l e ]  
 A U T H O R I Z A T I O N   [ d b o ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 C R E A T E   S C H E M A   [ E d i t . M o d u l e ]  
 A U T H O R I Z A T I O N   [ d b o ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   f o r e i g n   k e y s   f r o m   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . A c c e s s i o n ] '  
 G O  
 A L T E R   T A B L E   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . A c c e s s i o n ]   D R O P   C O N S T R A I N T [ F K _ p m _ p u b s _ a c c e s s i o n s _ p m _ p u b s _ g e n e r a l ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   f o r e i g n   k e y s   f r o m   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . A u t h o r ] '  
 G O  
 A L T E R   T A B L E   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . A u t h o r ]   D R O P   C O N S T R A I N T [ F K _ p m _ p u b s _ a u t h o r s _ p m _ p u b s _ g e n e r a l ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   f o r e i g n   k e y s   f r o m   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . C h e m i c a l ] '  
 G O  
 A L T E R   T A B L E   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . C h e m i c a l ]   D R O P   C O N S T R A I N T [ F K _ p m _ p u b s _ c h e m i c a l s _ p m _ p u b s _ g e n e r a l ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   f o r e i g n   k e y s   f r o m   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . D a t a b a n k ] '  
 G O  
 A L T E R   T A B L E   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . D a t a b a n k ]   D R O P   C O N S T R A I N T [ F K _ p m _ p u b s _ d a t a b a n k s _ p m _ p u b s _ g e n e r a l ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   f o r e i g n   k e y s   f r o m   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . G r a n t ] '  
 G O  
 A L T E R   T A B L E   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . G r a n t ]   D R O P   C O N S T R A I N T [ F K _ p m _ p u b s _ g r a n t s _ p m _ p u b s _ g e n e r a l ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   f o r e i g n   k e y s   f r o m   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . I n v e s t i g a t o r ] '  
 G O  
 A L T E R   T A B L E   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . I n v e s t i g a t o r ]   D R O P   C O N S T R A I N T [ F K _ p m _ p u b s _ i n v e s t i g a t o r s _ p m _ p u b s _ g e n e r a l ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   f o r e i g n   k e y s   f r o m   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . K e y w o r d ] '  
 G O  
 A L T E R   T A B L E   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . K e y w o r d ]   D R O P   C O N S T R A I N T [ F K _ p m _ p u b s _ k e y w o r d s _ p m _ p u b s _ g e n e r a l ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   f o r e i g n   k e y s   f r o m   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . M e s h ] '  
 G O  
 A L T E R   T A B L E   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . M e s h ]   D R O P   C O N S T R A I N T [ F K _ p m _ p u b s _ m e s h _ p m _ p u b s _ g e n e r a l ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   f o r e i g n   k e y s   f r o m   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . P u b T y p e ] '  
 G O  
 A L T E R   T A B L E   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . P u b T y p e ]   D R O P   C O N S T R A I N T [ F K _ p m _ p u b s _ p u b t y p e s _ p m _ p u b s _ g e n e r a l ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   f o r e i g n   k e y s   f r o m   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P e r s o n . I n c l u d e ] '  
 G O  
 A L T E R   T A B L E   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P e r s o n . I n c l u d e ]   D R O P   C O N S T R A I N T [ F K _ p u b l i c a t i o n s _ i n c l u d e _ p m _ p u b s _ g e n e r a l ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ U t i l i t y . A p p l i c a t i o n ] . [ L o a d X M L F i l e ] '  
 G O  
 D R O P   P R O C E D U R E   [ U t i l i t y . A p p l i c a t i o n ] . [ L o a d X M L F i l e ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ D i r e c t . F r a m e w o r k ] . [ R e s o l v e D i r e c t U R L ] '  
 G O  
 D R O P   P R O C E D U R E   [ D i r e c t . F r a m e w o r k ] . [ R e s o l v e D i r e c t U R L ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ E d i t . F r a m e w o r k ] . [ R e s o l v e E d i t U R L ] '  
 G O  
 D R O P   P R O C E D U R E   [ E d i t . F r a m e w o r k ] . [ R e s o l v e E d i t U R L ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ S e a r c h . F r a m e w o r k ] . [ R e s o l v e S e a r c h U R L ] '  
 G O  
 D R O P   P R O C E D U R E   [ S e a r c h . F r a m e w o r k ] . [ R e s o l v e S e a r c h U R L ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ U t i l i t y . A p p l i c a t i o n ] . [ L I C E N C E ] '  
 G O  
 D R O P   P R O C E D U R E   [ U t i l i t y . A p p l i c a t i o n ] . [ L I C E N C E ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ U t i l i t y . A p p l i c a t i o n ] . [ v w R a n d o m S o r t ] '  
 G O  
 D R O P   V I E W   [ U t i l i t y . A p p l i c a t i o n ] . [ v w R a n d o m S o r t ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ O n t o l o g y . ] . [ C o n v e r t O W L 2 T r i p l e ] '  
 G O  
 D R O P   P R O C E D U R E   [ O n t o l o g y . ] . [ C o n v e r t O W L 2 T r i p l e ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ O n t o l o g y . ] . [ R e s o l v e U R L ] '  
 G O  
 D R O P   P R O C E D U R E   [ O n t o l o g y . ] . [ R e s o l v e U R L ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ R D F . S t a g e ] . [ R u n J o b G r o u p ] '  
 G O  
 D R O P   P R O C E D U R E   [ R D F . S t a g e ] . [ R u n J o b G r o u p ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ R D F . S e a r c h ] . [ G e t T o p S e a r c h P h r a s e ] '  
 G O  
 D R O P   P R O C E D U R E   [ R D F . S e a r c h ] . [ G e t T o p S e a r c h P h r a s e ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ O n t o l o g y . ] . [ L o a d I n s t a l l D a t a ] '  
 G O  
 D R O P   P R O C E D U R E   [ O n t o l o g y . ] . [ L o a d I n s t a l l D a t a ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ M o d u l e . B e t a ] . [ G e t C o a u t h o r N e t w o r k ] '  
 G O  
 D R O P   P R O C E D U R E   [ M o d u l e . B e t a ] . [ G e t C o a u t h o r N e t w o r k ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ O n t o l o g y . ] . [ C h a n g e B a s e U R I ] '  
 G O  
 D R O P   P R O C E D U R E   [ O n t o l o g y . ] . [ C h a n g e B a s e U R I ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ R D F . S e a r c h ] . [ C a c h e . H i s t o r y . U p d a t e T o p S e a r c h P h r a s e ] '  
 G O  
 D R O P   P R O C E D U R E   [ R D F . S e a r c h ] . [ C a c h e . H i s t o r y . U p d a t e T o p S e a r c h P h r a s e ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ O n t o l o g y . ] . [ C o n v e r t T r i p l e 2 O W L ] '  
 G O  
 D R O P   P R O C E D U R E   [ O n t o l o g y . ] . [ C o n v e r t T r i p l e 2 O W L ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ O n t o l o g y . ] . [ C r e a t e I n s t a l l D a t a ] '  
 G O  
 D R O P   P R O C E D U R E   [ O n t o l o g y . ] . [ C r e a t e I n s t a l l D a t a ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ R D F . S e a r c h ] . [ v w C a c h e . P u b l i c . N o d e M a p V a l u e ] '  
 G O  
 D R O P   V I E W   [ R D F . S e a r c h ] . [ v w C a c h e . P u b l i c . N o d e M a p V a l u e ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ U t i l i t y . A p p l i c a t i o n ] . [ v w D a t a b a s e C o d e ] '  
 G O  
 D R O P   V I E W   [ U t i l i t y . A p p l i c a t i o n ] . [ v w D a t a b a s e C o d e ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ U t i l i t y . A p p l i c a t i o n ] . [ v w D a t a b a s e O b j e c t s ] '  
 G O  
 D R O P   V I E W   [ U t i l i t y . A p p l i c a t i o n ] . [ v w D a t a b a s e O b j e c t s ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ O n t o l o g y . ] . [ v w O w l T r i p l e ] '  
 G O  
 D R O P   V I E W   [ O n t o l o g y . ] . [ v w O w l T r i p l e ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ M o d u l e . E d i t ] . [ P e r s o n . G e t P u b l i c a t i o n s ] '  
 G O  
 D R O P   P R O C E D U R E   [ M o d u l e . E d i t ] . [ P e r s o n . G e t P u b l i c a t i o n s ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ M o d u l e . P r o f i l e ] . [ P e r s o n . G e t P u b l i c a t i o n s ] '  
 G O  
 D R O P   P R O C E D U R E   [ M o d u l e . P r o f i l e ] . [ P e r s o n . G e t P u b l i c a t i o n s ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ R D F . S e a r c h ] . [ C a c h e . P r i v a t e . U p d a t e C a c h e ] '  
 G O  
 D R O P   P R O C E D U R E   [ R D F . S e a r c h ] . [ C a c h e . P r i v a t e . U p d a t e C a c h e ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ R D F . S e a r c h ] . [ P r i v a t e . G e t N o d e s ] '  
 G O  
 D R O P   P R O C E D U R E   [ R D F . S e a r c h ] . [ P r i v a t e . G e t N o d e s ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ M o d u l e . B e t a ] . [ G e t P e o p l e I n S a m e D e p a r t m e n t ] '  
 G O  
 D R O P   P R O C E D U R E   [ M o d u l e . B e t a ] . [ G e t P e o p l e I n S a m e D e p a r t m e n t ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ R D F . S e a r c h ] . [ G e t N o d e s ] '  
 G O  
 D R O P   P R O C E D U R E   [ R D F . S e a r c h ] . [ G e t N o d e s ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ R D F . S e a r c h ] . [ G e t A l l N o d e s ] '  
 G O  
 D R O P   P R O C E D U R E   [ R D F . S e a r c h ] . [ G e t A l l N o d e s ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ R D F . S e a r c h ] . [ G e t C o n n e c t i o n ] '  
 G O  
 D R O P   P R O C E D U R E   [ R D F . S e a r c h ] . [ G e t C o n n e c t i o n ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ P r o f i l e . D a t a ] . [ f n _ G e t U s e r P u b l i c a t i o n s ] '  
 G O  
 D R O P   F U N C T I O N   [ P r o f i l e . D a t a ] . [ f n _ G e t U s e r P u b l i c a t i o n s ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ R D F . S e a r c h ] . [ C a c h e . P u b l i c . U p d a t e C a c h e ] '  
 G O  
 D R O P   P R O C E D U R E   [ R D F . S e a r c h ] . [ C a c h e . P u b l i c . U p d a t e C a c h e ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ M o d u l e . E d i t ] . [ A w a r d R e c e i p t . S t o r e ] '  
 G O  
 D R O P   P R O C E D U R E   [ M o d u l e . E d i t ] . [ A w a r d R e c e i p t . S t o r e ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ R D F . S e a r c h ] . [ P a r s e S e a r c h S t r i n g ] '  
 G O  
 D R O P   P R O C E D U R E   [ R D F . S e a r c h ] . [ P a r s e S e a r c h S t r i n g ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ O n t o l o g y . ] . [ f n G e t C l a s s T r e e ] '  
 G O  
 D R O P   F U N C T I O N   [ O n t o l o g y . ] . [ f n G e t C l a s s T r e e ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ O n t o l o g y . ] . [ f n G e t P r o p e r t y T r e e ] '  
 G O  
 D R O P   F U N C T I O N   [ O n t o l o g y . ] . [ f n G e t P r o p e r t y T r e e ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ M o d u l e . B e t a ] . [ G e t S i m i l a r M a p ] '  
 G O  
 D R O P   P R O C E D U R E   [ M o d u l e . B e t a ] . [ G e t S i m i l a r M a p ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   [ M o d u l e . B e t a ] . [ G e t C o a u t h o r M a p ] '  
 G O  
 D R O P   P R O C E D U R E   [ M o d u l e . B e t a ] . [ G e t C o a u t h o r M a p ]  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 a l t e r   s c h e m a   [ D i r e c t . ]   t r a n s f e r   [ P r o f i l e . D a t a ] . [ D i r e c t . L o g I n c o m i n g ]  
 a l t e r   s c h e m a   [ D i r e c t . ]   t r a n s f e r   [ P r o f i l e . D a t a ] . [ D i r e c t . L o g O u t g o i n g ]  
 a l t e r   s c h e m a   [ D i r e c t . ]   t r a n s f e r   [ P r o f i l e . D a t a ] . [ D i r e c t . S i t e s ]  
 a l t e r   s c h e m a   [ F r a m e w o r k . ]   t r a n s f e r   [ O n t o l o g y . ] . [ I n s t a l l D a t a ]  
 a l t e r   s c h e m a   [ F r a m e w o r k . ]   t r a n s f e r   [ O n t o l o g y . ] . [ J o b ]  
 a l t e r   s c h e m a   [ F r a m e w o r k . ]   t r a n s f e r   [ O n t o l o g y . ] . [ J o b G r o u p ]  
 a l t e r   s c h e m a   [ F r a m e w o r k . ]   t r a n s f e r   [ R D F . S t a g e ] . [ L o g . J o b ]  
 a l t e r   s c h e m a   [ F r a m e w o r k . ]   t r a n s f e r   [ O n t o l o g y . ] . [ P a r a m e t e r ]  
 a l t e r   s c h e m a   [ F r a m e w o r k . ]   t r a n s f e r   [ O n t o l o g y . ] . [ R e s t P a t h ]  
 a l t e r   s c h e m a   [ O n t o l o g y . I m p o r t ]   t r a n s f e r   [ O n t o l o g y . ] . [ O W L ]  
 a l t e r   s c h e m a   [ O n t o l o g y . I m p o r t ]   t r a n s f e r   [ O n t o l o g y . ] . [ T r i p l e ]  
 a l t e r   s c h e m a   [ O n t o l o g y . P r e s e n t a t i o n ]   t r a n s f e r   [ O n t o l o g y . ] . [ P r e s e n t a t i o n ]  
 a l t e r   s c h e m a   [ S e a r c h . ]   t r a n s f e r   [ R D F . S e a r c h ] . [ H i s t o r y . P h r a s e ]  
 a l t e r   s c h e m a   [ S e a r c h . ]   t r a n s f e r   [ R D F . S e a r c h ] . [ H i s t o r y . Q u e r y ]  
 a l t e r   s c h e m a   [ S e a r c h . C a c h e ]   t r a n s f e r   [ R D F . S e a r c h ] . [ C a c h e . H i s t o r y . T o p S e a r c h P h r a s e ]  
 a l t e r   s c h e m a   [ S e a r c h . C a c h e ]   t r a n s f e r   [ R D F . S e a r c h ] . [ C a c h e . P r i v a t e . N o d e C l a s s ]  
 a l t e r   s c h e m a   [ S e a r c h . C a c h e ]   t r a n s f e r   [ R D F . S e a r c h ] . [ C a c h e . P r i v a t e . N o d e E x p a n d ]  
 a l t e r   s c h e m a   [ S e a r c h . C a c h e ]   t r a n s f e r   [ R D F . S e a r c h ] . [ C a c h e . P r i v a t e . N o d e M a p ]  
 a l t e r   s c h e m a   [ S e a r c h . C a c h e ]   t r a n s f e r   [ R D F . S e a r c h ] . [ C a c h e . P r i v a t e . N o d e P r e f i x ]  
 a l t e r   s c h e m a   [ S e a r c h . C a c h e ]   t r a n s f e r   [ R D F . S e a r c h ] . [ C a c h e . P r i v a t e . N o d e R D F ]  
 a l t e r   s c h e m a   [ S e a r c h . C a c h e ]   t r a n s f e r   [ R D F . S e a r c h ] . [ C a c h e . P r i v a t e . N o d e S u m m a r y ]  
 a l t e r   s c h e m a   [ S e a r c h . C a c h e ]   t r a n s f e r   [ R D F . S e a r c h ] . [ C a c h e . P u b l i c . N o d e C l a s s ]  
 a l t e r   s c h e m a   [ S e a r c h . C a c h e ]   t r a n s f e r   [ R D F . S e a r c h ] . [ C a c h e . P u b l i c . N o d e E x p a n d ]  
 a l t e r   s c h e m a   [ S e a r c h . C a c h e ]   t r a n s f e r   [ R D F . S e a r c h ] . [ C a c h e . P u b l i c . N o d e M a p ]  
 a l t e r   s c h e m a   [ S e a r c h . C a c h e ]   t r a n s f e r   [ R D F . S e a r c h ] . [ C a c h e . P u b l i c . N o d e P r e f i x ]  
 a l t e r   s c h e m a   [ S e a r c h . C a c h e ]   t r a n s f e r   [ R D F . S e a r c h ] . [ C a c h e . P u b l i c . N o d e R D F ]  
 a l t e r   s c h e m a   [ S e a r c h . C a c h e ]   t r a n s f e r   [ R D F . S e a r c h ] . [ C a c h e . P u b l i c . N o d e S u m m a r y ]  
  
 E X E C   s p _ r e n a m e   ' [ D i r e c t . ] . [ D i r e c t . L o g I n c o m i n g ] ' ,   ' L o g I n c o m i n g '    
 E X E C   s p _ r e n a m e   ' [ D i r e c t . ] . [ D i r e c t . L o g O u t g o i n g ] ' ,   ' L o g O u t g o i n g '    
 E X E C   s p _ r e n a m e   ' [ D i r e c t . ] . [ D i r e c t . S i t e s ] ' ,   ' S i t e s '    
 E X E C   s p _ r e n a m e   ' [ O n t o l o g y . P r e s e n t a t i o n ] . [ P r e s e n t a t i o n ] ' ,   ' X M L '    
 E X E C   s p _ r e n a m e   ' [ S e a r c h . C a c h e ] . [ C a c h e . H i s t o r y . T o p S e a r c h P h r a s e ] ' ,   ' H i s t o r y . T o p S e a r c h P h r a s e '    
 E X E C   s p _ r e n a m e   ' [ S e a r c h . C a c h e ] . [ C a c h e . P r i v a t e . N o d e C l a s s ] ' ,   ' P r i v a t e . N o d e C l a s s '    
 E X E C   s p _ r e n a m e   ' [ S e a r c h . C a c h e ] . [ C a c h e . P r i v a t e . N o d e E x p a n d ] ' ,   ' P r i v a t e . N o d e E x p a n d '    
 E X E C   s p _ r e n a m e   ' [ S e a r c h . C a c h e ] . [ C a c h e . P r i v a t e . N o d e M a p ] ' ,   ' P r i v a t e . N o d e M a p '    
 E X E C   s p _ r e n a m e   ' [ S e a r c h . C a c h e ] . [ C a c h e . P r i v a t e . N o d e P r e f i x ] ' ,   ' P r i v a t e . N o d e P r e f i x '    
 E X E C   s p _ r e n a m e   ' [ S e a r c h . C a c h e ] . [ C a c h e . P r i v a t e . N o d e R D F ] ' ,   ' P r i v a t e . N o d e R D F '    
 E X E C   s p _ r e n a m e   ' [ S e a r c h . C a c h e ] . [ C a c h e . P r i v a t e . N o d e S u m m a r y ] ' ,   ' P r i v a t e . N o d e S u m m a r y '    
 E X E C   s p _ r e n a m e   ' [ S e a r c h . C a c h e ] . [ C a c h e . P u b l i c . N o d e C l a s s ] ' ,   ' P u b l i c . N o d e C l a s s '    
 E X E C   s p _ r e n a m e   ' [ S e a r c h . C a c h e ] . [ C a c h e . P u b l i c . N o d e E x p a n d ] ' ,   ' P u b l i c . N o d e E x p a n d '    
 E X E C   s p _ r e n a m e   ' [ S e a r c h . C a c h e ] . [ C a c h e . P u b l i c . N o d e M a p ] ' ,   ' P u b l i c . N o d e M a p '    
 E X E C   s p _ r e n a m e   ' [ S e a r c h . C a c h e ] . [ C a c h e . P u b l i c . N o d e P r e f i x ] ' ,   ' P u b l i c . N o d e P r e f i x '    
 E X E C   s p _ r e n a m e   ' [ S e a r c h . C a c h e ] . [ C a c h e . P u b l i c . N o d e R D F ] ' ,   ' P u b l i c . N o d e R D F '    
 E X E C   s p _ r e n a m e   ' [ S e a r c h . C a c h e ] . [ C a c h e . P u b l i c . N o d e S u m m a r y ] ' ,   ' P u b l i c . N o d e S u m m a r y '    
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ S e a r c h . ] . [ G e t T o p S e a r c h P h r a s e ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ S e a r c h . ] . [ G e t T o p S e a r c h P h r a s e ]  
 	 @ T i m e P e r i o d   C H A R ( 1 )  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
 	 S E L E C T   *  
 	 	 F R O M   [ S e a r c h . C a c h e ] . [ H i s t o r y . T o p S e a r c h P h r a s e ]  
 	 	 W H E R E   T i m e P e r i o d   =   @ T i m e P e r i o d  
 	 	 O R D E R   B Y   N u m b e r O f Q u e r i e s   D E S C  
  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ F r a m e w o r k . ] . [ R u n J o b G r o u p ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ F r a m e w o r k . ] . [ R u n J o b G r o u p ]  
 	 @ J o b G r o u p   I N T  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
 	 - -   E x i t   i f   t h e r e   i s   a n   e r r o r  
 	 I F   E X I S T S   ( S E L E C T   *   F R O M   [ F r a m e w o r k . ] . [ J o b ]   W H E R E   I s A c t i v e   =   1   A N D   S t a t u s   =   ' E R R O R ' )  
 	 B E G I N  
 	 	 R E T U R N  
 	 E N D  
 	  
 	 C R E A T E   T A B L E   # J o b   (  
 	 	 S t e p   I N T   I D E N T I T Y ( 0 , 1 )   P R I M A R Y   K E Y ,  
 	 	 J o b I D   I N T ,  
 	 	 S c r i p t   N V A R C H A R ( M A X )  
 	 )  
 	  
 	 - -   G e t   t h e   l i s t   o f   j o b   s t e p s  
 	 I N S E R T   I N T O   # J o b   ( J o b I D ,   S c r i p t )  
 	 	 S E L E C T   J o b I D ,   S c r i p t  
 	 	 	 F R O M   [ F r a m e w o r k . ] . [ J o b ]  
 	 	 	 W H E R E   J o b G r o u p   =   @ J o b G r o u p   A N D   I s A c t i v e   =   1  
 	 	 	 O R D E R   B Y   S t e p ,   J o b I D  
  
 	 D E C L A R E   @ S t e p   I N T  
 	 D E C L A R E   @ S Q L   N V A R C H A R ( M A X )  
 	 D E C L A R E   @ L o g I D   I N T  
 	 D E C L A R E   @ J o b S t a r t   D A T E T I M E  
 	 D E C L A R E   @ J o b E n d   D A T E T I M E  
 	 D E C L A R E   @ J o b I D   I N T  
 	 D E C L A R E   @ E r r M s g   n v a r c h a r ( 4 0 0 0 ) ,   @ E r r S e v e r i t y   i n t  
 	 D E C L A R E   @ d a t e   D A T E T I M E , @ a u d i t i d   U N I Q U E I D E N T I F I E R ,   @ r o w s   I N T  
 	 S E L E C T   @ d a t e = G E T D A T E ( )    
 	  
 	 - -   L o o p   t h r o u g h   a l l   s t e p s  
 	 W H I L E   E X I S T S   ( S E L E C T   *   F R O M   # J o b )  
 	 B E G I N  
 	 	 - -   G e t   t h e   n e x t   s t e p  
 	 	 S E L E C T   @ S t e p   =   ( S E L E C T   M I N ( S t e p )   F R O M   # J o b )  
 	 	  
 	 	 - -   G e t   t h e   S Q L  
 	 	 S E L E C T   @ S Q L   =   S c r i p t ,   @ J o b I D   =   J o b I D  
 	 	 	 F R O M   # J o b  
 	 	 	 W H E R E   S t e p   =   @ S t e p  
  
 	 	 - -   W a i t   u n t i l   o t h e r   j o b s   a r e   c o m p l e t e  
 	 	 W H I L E   E X I S T S   ( S E L E C T   *  
 	 	 	 	 	 	 F R O M   [ F r a m e w o r k . ] . [ J o b ]   o ,   # J o b   j  
 	 	 	 	 	 	 W H E R E   o . J o b I D   =   j . J o b I D   A N D   o . S t a t u s   =   ' P R O C E S S I N G ' )  
 	 	 B E G I N  
 	 	 	 W A I T F O R   D E L A Y   ' 0 0 : 0 0 : 3 0 '  
 	 	 E N D  
  
 	 	 - -   U p d a t e   t h e   s t a t u s  
 	 	 S E L E C T   @ J o b S t a r t   =   G e t D a t e ( )  
 	 	 U P D A T E   o  
 	 	 	 S E T   o . S t a t u s   =   ' P R O C E S S I N G ' ,   o . L a s t S t a r t   =   @ J o b S t a r t ,   o . L a s t E n d   =   N U L L ,   o . E r r o r C o d e   =   N U L L ,   o . E r r o r M s g   =   N U L L  
 	 	 	 F R O M   [ F r a m e w o r k . ] . [ J o b ]   o ,   # J o b   j  
 	 	 	 W H E R E   o . J o b I D   =   j . J o b I D   A N D   j . S t e p   =   @ S t e p  
 	 	 I N S E R T   I N T O   [ F r a m e w o r k . ] . [ L o g . J o b ]   ( J o b I D ,   J o b G r o u p ,   S t e p ,   S c r i p t ,   J o b S t a r t ,   S t a t u s )  
 	 	 	 S E L E C T   @ J o b I D ,   @ J o b G r o u p ,   @ S t e p ,   @ S Q L ,   @ J o b S t a r t ,   ' P R O C E S S I N G '  
 	 	 S E L E C T   @ L o g I D   =   @ @ I D E N T I T Y  
 	 	 	  
 	 	  
 	 	 - -   L o g   S t e p   E x e c u t i o n  
 	 	 - - S E L E C T   @ d a t e = G E T D A T E ( )  
 	 	 - - E X E C   [ P r o f i l e . C a c h e ] . [ P r o c e s s . A d d A u d i t U p d a t e ]   @ a u d i t i d = @ a u d i t i d   O U T P U T , @ P r o c e s s N a m e   = @ S Q L , @ P r o c e s s S t a r t D a t e = @ d a t e , @ i n s e r t _ n e w _ r e c o r d = 1  
 	 	  
 	 	 B E G I N   T R Y    
 	 	 	 - -   R u n   t h e   s t e p  
 	 	 	 E X E C   s p _ e x e c u t e s q l   @ S Q L  
 	 	 E N D   T R Y    
 	 	 B E G I N   C A T C H  
 	 	 	 - - C h e c k   s u c c e s s  
 	 	 	 I F   @ @ T R A N C O U N T   >   0  
 	 	 	 	 R O L L B A C K  
 	 	 	 	  
 	 	 	 - - S E L E C T   @ d a t e = G E T D A T E ( )  
 	 	 	 - - E X E C   [ P r o f i l e . C a c h e ] . [ P r o c e s s . A d d A u d i t U p d a t e ]   @ a u d i t i d = @ a u d i t i d   O U T P U T , @ P r o c e s s N a m e   = @ S Q L , @ P r o c e s s E n d D a t e = @ d a t e , @ e r r o r   =   1 , @ i n s e r t _ n e w _ r e c o r d = 0  
 	 	 	 - -   L o g   e r r o r    
 	 	 	 - -   U p d a t e   t h e   s t a t u s  
 	 	 	 S E L E C T   @ J o b E n d   =   G e t D a t e ( )  
 	 	 	 U P D A T E   o  
 	 	 	 	 S E T   o . S t a t u s   =   ' J O B   F A I L E D ' ,   o . L a s t E n d   =   G e t D a t e ( ) ,   o . E r r o r C o d e   =   N U L L ,   o . E r r o r M s g   =   N U L L  
 	 	 	 	 F R O M   [ F r a m e w o r k . ] . [ J o b ]   o ,   # J o b   j  
 	 	 	 	 W H E R E   o . J o b I D   =   j . J o b I D   A N D   j . S t e p   =   @ S t e p  
 	 	 	 U P D A T E   [ F r a m e w o r k . ] . [ L o g . J o b ]  
 	 	 	 	 S E T   J o b E n d   =   @ J o b E n d ,   S t a t u s   =   ' J O B   F A I L E D '  
 	 	 	 	 W H E R E   L o g I D   =   @ L o g I D  
 	 	 	 - - R a i s e   a n   e r r o r   w i t h   t h e   d e t a i l s   o f   t h e   e x c e p t i o n  
 	 	 	 S E L E C T   @ E r r M s g   =   E R R O R _ M E S S A G E ( ) ,   @ E r r S e v e r i t y   =   E R R O R _ S E V E R I T Y ( )  
 	 	 	 R A I S E R R O R ( @ E r r M s g ,   @ E r r S e v e r i t y ,   1 )  
 	 	 E N D   C A T C H  
 	 	  
 	 	 - -   L o g   S t e p   E x e c u t i o n  
 	 	 - - S E L E C T   @ d a t e = G E T D A T E ( )  
 	 	 - - E X E C   [ P r o f i l e . C a c h e ] . [ P r o c e s s . A d d A u d i t U p d a t e ]   @ a u d i t i d = @ a u d i t i d   O U T P U T , @ P r o c e s s N a m e   = @ S Q L , @ P r o c e s s S t a r t D a t e = @ d a t e , @ i n s e r t _ n e w _ r e c o r d = 0  
 	 	  
 	 	  
 	 	 - -   U p d a t e   t h e   s t a t u s  
 	 	 S E L E C T   @ J o b E n d   =   G e t D a t e ( )  
 	 	 U P D A T E   o  
 	 	 	 S E T   o . S t a t u s   =   ' C O M P L E T E D ' ,   o . L a s t E n d   =   G e t D a t e ( ) ,   o . E r r o r C o d e   =   N U L L ,   o . E r r o r M s g   =   N U L L  
 	 	 	 F R O M   [ F r a m e w o r k . ] . [ J o b ]   o ,   # J o b   j  
 	 	 	 W H E R E   o . J o b I D   =   j . J o b I D   A N D   j . S t e p   =   @ S t e p  
 	 	 U P D A T E   [ F r a m e w o r k . ] . [ L o g . J o b ]  
 	 	 	 S E T   J o b E n d   =   @ J o b E n d ,   S t a t u s   =   ' C O M P L E T E D '  
 	 	 	 W H E R E   L o g I D   =   @ L o g I D  
  
 	 	 - -   R e m o v e   t h e   f i r s t   s t e p   f r o m   t h e   l i s t  
 	 	 D E L E T E   j  
 	 	 	 F R O M   # J o b   j  
 	 	 	 W H E R E   S t e p   =   @ S t e p  
 	 E N D  
  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A l t e r i n g   [ P r o f i l e . F r a m e w o r k ] . [ R e s o l v e U R L ] '  
 G O  
 A L T E R   P R O C E D U R E   [ P r o f i l e . F r a m e w o r k ] . [ R e s o l v e U R L ]  
 	 @ A p p l i c a t i o n N a m e   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 1   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 2   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 3   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 4   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 5   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 6   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 7   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 8   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 9   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ S e s s i o n I D   u n i q u e i d e n t i f i e r   =   n u l l ,  
 	 @ C o n t e n t T y p e   v a r c h a r ( 2 5 5 )   =   n u l l ,  
 	 @ R e s o l v e d   b i t   =   N U L L   O U T P U T ,  
 	 @ E r r o r D e s c r i p t i o n   v a r c h a r ( m a x )   =   N U L L   O U T P U T ,  
 	 @ R e s p o n s e U R L   v a r c h a r ( 1 0 0 0 )   =   N U L L   O U T P U T ,  
 	 @ R e s p o n s e C o n t e n t T y p e   v a r c h a r ( 2 5 5 )   =   N U L L   O U T P U T ,  
 	 @ R e s p o n s e S t a t u s C o d e   i n t   =   N U L L   O U T P U T ,  
 	 @ R e s p o n s e R e d i r e c t   b i t   =   N U L L   O U T P U T ,  
 	 @ R e s p o n s e I n c l u d e P o s t D a t a   b i t   =   N U L L   O U T P U T ,  
 	 @ s u b j e c t   B I G I N T   =   N U L L   O U T P U T ,  
 	 @ p r e d i c a t e   B I G I N T   =   N U L L   O U T P U T ,  
 	 @ o b j e c t   B I G I N T   =   N U L L   O U T P U T  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
 	 - -   U R L   P a t t e r n   S t r i n g :  
 	 - -   d o m a i n n a m e 	 / { p r o f i l e   |   d i s p l a y } 	 / { s N o d e I D   |   s A l i a s T y p e / s A l i a s I D } 	 / { p N o d e I D   |   p A l i a s T y p e / p A l i a s I D   |   s T a b } 	 / { o N o d e I D   |   o A l i a s T y p e / o A l i a s I D   |   p T a b } 	 / o T a b 	 / s N o d e I D _ p N o d e I D _ o N o d e I D . r d f  
  
 	 D E C L A R E   @ S e s s i o n H i s t o r y   X M L  
  
 	 - -   B y   d e f a u l t   w e   w e r e   n o t   a b l e   t o   r e s o l v e   t h e   U R L  
 	 S E L E C T   @ R e s o l v e d   =   0  
  
 	 - -   L o a d   p a r a m   v a l u e s   i n t o   a   t a b l e  
 	 D E C L A R E   @ p a r a m s   T A B L E   ( i d   i n t ,   v a l   v a r c h a r ( 1 0 0 0 ) )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 1 ,   @ p a r a m 1 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 2 ,   @ p a r a m 2 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 3 ,   @ p a r a m 3 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 4 ,   @ p a r a m 4 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 5 ,   @ p a r a m 5 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 6 ,   @ p a r a m 6 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 7 ,   @ p a r a m 7 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 8 ,   @ p a r a m 8 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 9 ,   @ p a r a m 9 )  
  
 	 D E C L A R E   @ M a x P a r a m   i n t  
 	 S E L E C T   @ M a x P a r a m   =   0  
 	 S E L E C T   @ M a x P a r a m   =   M A X ( i d )   F R O M   @ p a r a m s   W H E R E   v a l   >   ' '  
  
 	 D E C L A R E   @ T a b   V A R C H A R ( 1 0 0 0 )  
 	 D E C L A R E   @ F i l e   V A R C H A R ( 1 0 0 0 )  
 	 D E C L A R E   @ V i e w A s   V A R C H A R ( 5 0 )  
 	  
 	 S E L E C T   @ s u b j e c t = N U L L ,   @ p r e d i c a t e = N U L L ,   @ o b j e c t = N U L L ,   @ T a b = N U L L ,   @ F i l e = N U L L  
 	  
 	 S E L E C T   @ F i l e   =   v a l ,   @ M a x P a r a m   =   @ M a x P a r a m - 1  
 	 	 F R O M   @ p a r a m s  
 	 	 W H E R E   i d   =   @ M a x P a r a m   a n d   v a l   l i k e   ' % . % '  
  
 	 D E C L A R E   @ p o i n t e r   I N T  
 	 S E L E C T   @ p o i n t e r = 1  
 	  
 	 D E C L A R E   @ a l i a s e s   I N T  
 	 S E L E C T   @ a l i a s e s   =   0  
 	  
 	 - -   s u b j e c t  
 	 I F   ( @ M a x P a r a m   > =   @ p o i n t e r )  
 	 B E G I N  
 	 	 S E L E C T   @ s u b j e c t   =   C A S T ( v a l   A S   B I G I N T ) ,   @ p o i n t e r   =   @ p o i n t e r   +   1  
 	 	 	 F R O M   @ p a r a m s    
 	 	 	 W H E R E   i d = @ p o i n t e r   A N D   v a l   N O T   L I K E   ' % [ ^ 0 - 9 ] % '  
 	 	 I F   @ s u b j e c t   I S   N U L L   A N D   @ M a x P a r a m   >   @ p o i n t e r  
 	 	 	 S E L E C T   @ s u b j e c t   =   N o d e I D ,   @ p o i n t e r   =   @ p o i n t e r   +   2 ,   @ a l i a s e s   =   @ a l i a s e s   +   1  
 	 	 	 	 F R O M   [ R D F . ] . A l i a s    
 	 	 	 	 W H E R E   A l i a s T y p e   =   ( S E L E C T   v a l   F R O M   @ p a r a m s   W H E R E   i d   =   @ p o i n t e r )  
 	 	 	 	 	 A N D   A l i a s I D   =   ( S E L E C T   v a l   F R O M   @ p a r a m s   W H E R E   i d   =   @ p o i n t e r + 1 )  
 	 	 I F   @ s u b j e c t   I S   N U L L  
 	 	 	 S E L E C T   @ E r r o r D e s c r i p t i o n   =   ' T h e   s u b j e c t   c a n n o t   b e   f o u n d . '  
 	 E N D  
  
 	 - -   p r e d i c a t e  
 	 I F   ( @ M a x P a r a m   > =   @ p o i n t e r )   A N D   ( @ s u b j e c t   I S   N O T   N U L L )  
 	 B E G I N  
 	 	 S E L E C T   @ p r e d i c a t e   =   C A S T ( v a l   A S   B I G I N T ) ,   @ p o i n t e r   =   @ p o i n t e r   +   1  
 	 	 	 F R O M   @ p a r a m s    
 	 	 	 W H E R E   i d = @ p o i n t e r   A N D   v a l   N O T   L I K E   ' % [ ^ 0 - 9 ] % '  
 	 	 I F   @ p r e d i c a t e   I S   N U L L   A N D   @ M a x P a r a m   >   @ p o i n t e r  
 	 	 	 S E L E C T   @ p r e d i c a t e   =   N o d e I D ,   @ p o i n t e r   =   @ p o i n t e r   +   2 ,   @ a l i a s e s   =   @ a l i a s e s   +   1  
 	 	 	 	 F R O M   [ R D F . ] . A l i a s    
 	 	 	 	 W H E R E   A l i a s T y p e   =   ( S E L E C T   v a l   F R O M   @ p a r a m s   W H E R E   i d   =   @ p o i n t e r )  
 	 	 	 	 	 A N D   A l i a s I D   =   ( S E L E C T   v a l   F R O M   @ p a r a m s   W H E R E   i d   =   @ p o i n t e r + 1 )  
 	 	 I F   @ p r e d i c a t e   I S   N U L L   A N D   @ M a x P a r a m   =   @ p o i n t e r  
 	 	 	 S E L E C T   @ T a b = ( S E L E C T   v a l   F R O M   @ p a r a m s   W H E R E   i d   =   @ p o i n t e r )  
 	 	 I F   @ p r e d i c a t e   I S   N U L L   A N D   @ T a b   I S   N U L L  
 	 	 	 S E L E C T   @ E r r o r D e s c r i p t i o n   =   ' T h e   p r e d i c a t e   c a n n o t   b e   f o u n d . '  
 	 E N D  
 	  
 	 - -   o b j e c t  
 	 I F   ( @ M a x P a r a m   > =   @ p o i n t e r )   A N D   ( @ p r e d i c a t e   I S   N O T   N U L L )  
 	 B E G I N  
 	 	 S E L E C T   @ o b j e c t   =   C A S T ( v a l   A S   B I G I N T ) ,   @ p o i n t e r   =   @ p o i n t e r   +   1  
 	 	 	 F R O M   @ p a r a m s    
 	 	 	 W H E R E   i d = @ p o i n t e r   A N D   v a l   N O T   L I K E   ' % [ ^ 0 - 9 ] % '  
 	 	 I F   @ o b j e c t   I S   N U L L   A N D   @ M a x P a r a m   >   @ p o i n t e r  
 	 	 	 S E L E C T   @ o b j e c t   =   N o d e I D ,   @ p o i n t e r   =   @ p o i n t e r   +   2 ,   @ a l i a s e s   =   @ a l i a s e s   +   1  
 	 	 	 	 F R O M   [ R D F . ] . A l i a s    
 	 	 	 	 W H E R E   A l i a s T y p e   =   ( S E L E C T   v a l   F R O M   @ p a r a m s   W H E R E   i d   =   @ p o i n t e r )  
 	 	 	 	 	 A N D   A l i a s I D   =   ( S E L E C T   v a l   F R O M   @ p a r a m s   W H E R E   i d   =   @ p o i n t e r + 1 )  
 	 	 I F   @ o b j e c t   I S   N U L L   A N D   @ M a x P a r a m   =   @ p o i n t e r  
 	 	 	 S E L E C T   @ T a b = ( S E L E C T   v a l   F R O M   @ p a r a m s   W H E R E   i d   =   @ p o i n t e r )  
 	 	 I F   @ o b j e c t   I S   N U L L   A N D   @ T a b   I S   N U L L  
 	 	 	 S E L E C T   @ E r r o r D e s c r i p t i o n   =   ' T h e   o b j e c t   c a n n o t   b e   f o u n d . '  
 	 E N D  
 	  
 	 - -   t a b  
 	 I F   ( @ M a x P a r a m   =   @ p o i n t e r )   A N D   ( @ o b j e c t   I S   N O T   N U L L )   A N D   ( @ T a b   I S   N U L L )  
 	 	 S E L E C T   @ T a b = ( S E L E C T   v a l   F R O M   @ p a r a m s   W H E R E   i d   =   @ p o i n t e r )  
 	  
 	 - -   R e t u r n   r e s u l t s  
 	 I F   ( @ E r r o r D e s c r i p t i o n   I S   N U L L )  
 	 B E G I N  
  
 	 	 d e c l a r e   @ b a s e P a t h   n v a r c h a r ( 4 0 0 )  
 	 	 s e l e c t   @ b a s e P a t h   =   v a l u e   f r o m   [ F r a m e w o r k . ] . P a r a m e t e r   w h e r e   P a r a m e t e r I D   =   ' b a s e P a t h '  
  
 	 	 - -   D e f a u l t  
 	 	 S E L E C T 	 @ R e s o l v e d   =   1 ,  
 	 	 	 	 @ E r r o r D e s c r i p t i o n   =   ' ' ,  
 	 	 	 	 @ R e s p o n s e C o n t e n t T y p e   =   @ C o n t e n t T y p e ,  
 	 	 	 	 @ R e s p o n s e S t a t u s C o d e   =   2 0 0 ,  
 	 	 	 	 @ R e s p o n s e R e d i r e c t   =   0 ,  
 	 	 	 	 @ R e s p o n s e I n c l u d e P o s t D a t a   =   0 ,  
 	 	 	 	 @ R e s p o n s e U R L   =   ' ~ / p r o f i l e / P r o f i l e . a s p x ? '  
 	 	 	 	 	 +   ' s u b j e c t = '   +   I s N u l l ( c a s t ( @ s u b j e c t   a s   v a r c h a r ( 5 0 ) ) , ' ' )  
 	 	 	 	 	 +   ' & p r e d i c a t e = '   +   I s N u l l ( c a s t ( @ p r e d i c a t e   a s   v a r c h a r ( 5 0 ) ) , ' ' )  
 	 	 	 	 	 +   ' & o b j e c t = '   +   I s N u l l ( c a s t ( @ o b j e c t   a s   v a r c h a r ( 5 0 ) ) , ' ' )  
 	 	 	 	 	 +   ' & t a b = '   +   I s N u l l ( @ t a b , ' ' )  
 	 	 	 	 	 +   ' & f i l e = '   +   I s N u l l ( @ f i l e , ' ' )  
  
 	 	 D E C L A R E   @ F i l e R D F   v a r c h a r ( 1 0 0 0 )  
 	 	 S E L E C T   @ F i l e R D F   = 	 I s N u l l ( c a s t ( @ s u b j e c t   a s   v a r c h a r ( 5 0 ) ) , ' ' )  
 	 	 	 	 	 	 	 + I s N u l l ( ' _ ' + c a s t ( @ p r e d i c a t e   a s   v a r c h a r ( 5 0 ) ) , ' ' )  
 	 	 	 	 	 	 	 + I s N u l l ( ' _ ' + c a s t ( @ o b j e c t   a s   v a r c h a r ( 5 0 ) ) , ' ' ) + ' . r d f '  
  
 	 	 D E C L A R E   @ F i l e P r e s e n t a t i o n X M L   v a r c h a r ( 1 0 0 0 )  
 	 	 S E L E C T   @ F i l e P r e s e n t a t i o n X M L   =   ' p r e s e n t a t i o n _ '  
 	 	 	 	 	 	 	 + I s N u l l ( c a s t ( @ s u b j e c t   a s   v a r c h a r ( 5 0 ) ) , ' ' )  
 	 	 	 	 	 	 	 + I s N u l l ( ' _ ' + c a s t ( @ p r e d i c a t e   a s   v a r c h a r ( 5 0 ) ) , ' ' )  
 	 	 	 	 	 	 	 + I s N u l l ( ' _ ' + c a s t ( @ o b j e c t   a s   v a r c h a r ( 5 0 ) ) , ' ' ) + ' . x m l '  
  
 	 	 I F   ( @ A p p l i c a t i o n N a m e   =   ' p r o f i l e ' )   A N D   ( @ F i l e   =   @ F i l e R D F )  
 	 	 	 	 - -   D i s p l a y   a s   R D F  
 	 	 	 	 S E L E C T 	 @ R e s p o n s e C o n t e n t T y p e   =   ' a p p l i c a t i o n / r d f + x m l ' ,  
 	 	 	 	 	 	 @ R e s p o n s e U R L   =   @ R e s p o n s e U R L   +   ' & v i e w a s = R D F '  
 	 	 E L S E   I F   ( @ A p p l i c a t i o n N a m e   =   ' p r o f i l e ' )   A N D   ( @ F i l e   =   @ F i l e P r e s e n t a t i o n X M L )  
 	 	 	 	 - -   D i s p l a y   P r e s e n t a t i o n X M L  
 	 	 	 	 S E L E C T 	 @ R e s p o n s e C o n t e n t T y p e   =   ' a p p l i c a t i o n / r d f + x m l ' ,  
 	 	 	 	 	 	 @ R e s p o n s e U R L   =   @ R e s p o n s e U R L   +   ' & v i e w a s = P r e s e n t a t i o n X M L '  
 	 	 E L S E   I F   ( @ A p p l i c a t i o n N a m e   =   ' p r o f i l e ' )   A N D   ( @ C o n t e n t T y p e   =   ' a p p l i c a t i o n / r d f + x m l ' )  
 	 	 	 	 - -   R e d i r e c t   3 0 3   t o   t h e   R D F   U R L  
 	 	 	 	 S E L E C T 	 @ R e s p o n s e C o n t e n t T y p e   =   ' a p p l i c a t i o n / r d f + x m l ' ,  
 	 	 	 	 	 	 @ R e s p o n s e S t a t u s C o d e   =   3 0 3 ,  
 	 	 	 	 	 	 @ R e s p o n s e R e d i r e c t   =   1 ,  
 	 	 	 	 	 	 @ R e s p o n s e I n c l u d e P o s t D a t a   =   1 ,  
 	 	 	 	 	 	 @ R e s p o n s e U R L   =   @ b a s e P a t h   +   ' / p r o f i l e '  
 	 	 	 	 	 	 	 +   I s N u l l ( ' / ' + c a s t ( @ s u b j e c t   a s   v a r c h a r ( 5 0 ) ) , ' ' )  
 	 	 	 	 	 	 	 +   I s N u l l ( ' / ' + c a s t ( @ p r e d i c a t e   a s   v a r c h a r ( 5 0 ) ) , ' ' )  
 	 	 	 	 	 	 	 +   I s N u l l ( ' / ' + c a s t ( @ o b j e c t   a s   v a r c h a r ( 5 0 ) ) , ' ' )  
 	 	 	 	 	 	 	 +   ' / '   +   @ F i l e R D F  
 	 	 E L S E   I F   ( @ A p p l i c a t i o n N a m e   =   ' p r o f i l e ' )  
 	 	 	 	 - -   R e d i r e c t   3 0 3   t o   t h e   H T M L   U R L  
 	 	 	 	 S E L E C T 	 @ R e s p o n s e C o n t e n t T y p e   =   @ C o n t e n t T y p e ,  
 	 	 	 	 	 	 @ R e s p o n s e S t a t u s C o d e   =   3 0 3 ,  
 	 	 	 	 	 	 @ R e s p o n s e R e d i r e c t   =   1 ,  
 	 	 	 	 	 	 @ R e s p o n s e I n c l u d e P o s t D a t a   =   1 ,  
 	 	 	 	 	 	 @ R e s p o n s e U R L   =   @ b a s e P a t h   +   ' / d i s p l a y '  
 	 	 	 	 	 	 	 +   ( C A S E   W H E N   @ S u b j e c t   I S   N U L L   T H E N   ' '  
 	 	 	 	 	 	 	 	 	 E L S E   I s N u l l ( ( S E L E C T   T O P   1   ' / ' + S u b j e c t  
 	 	 	 	 	 	 	 	 	 	 	 F R O M   (  
 	 	 	 	 	 	 	 	 	 	 	 	 S E L E C T   1   k ,   A l i a s T y p e + ' / ' + A l i a s I D   S u b j e c t  
 	 	 	 	 	 	 	 	 	 	 	 	 	 F R O M   [ R D F . ] . A l i a s  
 	 	 	 	 	 	 	 	 	 	 	 	 	 W H E R E   N o d e I D   =   @ S u b j e c t   A N D   P r e f e r r e d   =   1  
 	 	 	 	 	 	 	 	 	 	 	 	 U N I O N   A L L  
 	 	 	 	 	 	 	 	 	 	 	 	 S E L E C T   2 ,   C A S T ( @ S u b j e c t   A S   V A R C H A R ( 5 0 ) )  
 	 	 	 	 	 	 	 	 	 	 	 )   t  
 	 	 	 	 	 	 	 	 	 	 	 O R D E R   B Y   k ,   S u b j e c t ) , ' ' )  
 	 	 	 	 	 	 	 	 	 E N D )  
 	 	 	 	 	 	 	 +   ( C A S E   W H E N   @ P r e d i c a t e   I S   N U L L   T H E N   ' '  
 	 	 	 	 	 	 	 	 	 E L S E   I s N u l l ( ( S E L E C T   T O P   1   ' / ' + S u b j e c t  
 	 	 	 	 	 	 	 	 	 	 	 F R O M   (  
 	 	 	 	 	 	 	 	 	 	 	 	 S E L E C T   1   k ,   A l i a s T y p e + ' / ' + A l i a s I D   S u b j e c t  
 	 	 	 	 	 	 	 	 	 	 	 	 	 F R O M   [ R D F . ] . A l i a s  
 	 	 	 	 	 	 	 	 	 	 	 	 	 W H E R E   N o d e I D   =   @ P r e d i c a t e   A N D   P r e f e r r e d   =   1  
 	 	 	 	 	 	 	 	 	 	 	 	 U N I O N   A L L  
 	 	 	 	 	 	 	 	 	 	 	 	 S E L E C T   2 ,   C A S T ( @ P r e d i c a t e   A S   V A R C H A R ( 5 0 ) )  
 	 	 	 	 	 	 	 	 	 	 	 )   t  
 	 	 	 	 	 	 	 	 	 	 	 O R D E R   B Y   k ,   S u b j e c t ) , ' ' )  
 	 	 	 	 	 	 	 	 	 E N D )  
 	 	 	 	 	 	 	 +   ( C A S E   W H E N   @ O b j e c t   I S   N U L L   T H E N   ' '  
 	 	 	 	 	 	 	 	 	 E L S E   I s N u l l ( ( S E L E C T   T O P   1   ' / ' + S u b j e c t  
 	 	 	 	 	 	 	 	 	 	 	 F R O M   (  
 	 	 	 	 	 	 	 	 	 	 	 	 S E L E C T   1   k ,   A l i a s T y p e + ' / ' + A l i a s I D   S u b j e c t  
 	 	 	 	 	 	 	 	 	 	 	 	 	 F R O M   [ R D F . ] . A l i a s  
 	 	 	 	 	 	 	 	 	 	 	 	 	 W H E R E   N o d e I D   =   @ O b j e c t   A N D   P r e f e r r e d   =   1  
 	 	 	 	 	 	 	 	 	 	 	 	 U N I O N   A L L  
 	 	 	 	 	 	 	 	 	 	 	 	 S E L E C T   2 ,   C A S T ( @ O b j e c t   A S   V A R C H A R ( 5 0 ) )  
 	 	 	 	 	 	 	 	 	 	 	 )   t  
 	 	 	 	 	 	 	 	 	 	 	 O R D E R   B Y   k ,   S u b j e c t ) , ' ' )  
 	 	 	 	 	 	 	 	 	 E N D )  
 	 	 	 	 	 	 	 +   ( C A S E   W H E N   @ M a x P a r a m   > =   1   A N D   @ P o i n t e r   < =   1   T H E N   ' / ' + @ p a r a m 1   E L S E   ' '   E N D )  
 	 	 	 	 	 	 	 +   ( C A S E   W H E N   @ M a x P a r a m   > =   2   A N D   @ P o i n t e r   < =   2   T H E N   ' / ' + @ p a r a m 2   E L S E   ' '   E N D )  
 	 	 	 	 	 	 	 +   ( C A S E   W H E N   @ M a x P a r a m   > =   3   A N D   @ P o i n t e r   < =   3   T H E N   ' / ' + @ p a r a m 3   E L S E   ' '   E N D )  
 	 	 	 	 	 	 	 +   ( C A S E   W H E N   @ M a x P a r a m   > =   4   A N D   @ P o i n t e r   < =   4   T H E N   ' / ' + @ p a r a m 4   E L S E   ' '   E N D )  
 	 	 	 	 	 	 	 +   ( C A S E   W H E N   @ M a x P a r a m   > =   5   A N D   @ P o i n t e r   < =   5   T H E N   ' / ' + @ p a r a m 5   E L S E   ' '   E N D )  
 	 	 	 	 	 	 	 +   ( C A S E   W H E N   @ M a x P a r a m   > =   6   A N D   @ P o i n t e r   < =   6   T H E N   ' / ' + @ p a r a m 6   E L S E   ' '   E N D )  
 	 	 	 	 	 	 	 +   ( C A S E   W H E N   @ M a x P a r a m   > =   7   A N D   @ P o i n t e r   < =   7   T H E N   ' / ' + @ p a r a m 7   E L S E   ' '   E N D )  
 	 	 	 	 	 	 	 +   ( C A S E   W H E N   @ M a x P a r a m   > =   8   A N D   @ P o i n t e r   < =   8   T H E N   ' / ' + @ p a r a m 8   E L S E   ' '   E N D )  
 	 	 	 	 	 	 	 +   ( C A S E   W H E N   @ M a x P a r a m   > =   9   A N D   @ P o i n t e r   < =   9   T H E N   ' / ' + @ p a r a m 9   E L S E   ' '   E N D )  
 	 	 E L S E   I F   ( @ A p p l i c a t i o n N a m e   =   ' p r e s e n t a t i o n ' )  
 	 	 	 	 - -   D i s p l a y   a s   H T M L  
 	 	 	 	 S E L E C T 	 @ R e s p o n s e U R L   =   @ R e s p o n s e U R L   +   ' & v i e w a s = P r e s e n t a t i o n X M L '  
 	 	 E L S E  
 	 	 	 	 - -   D i s p l a y   a s   H T M L  
 	 	 	 	 S E L E C T 	 @ R e s p o n s e U R L   =   r e p l a c e ( @ R e s p o n s e U R L , ' ~ / P r o f i l e / P r o f i l e . a s p x ' , ' ~ / P r o f i l e / D i s p l a y . a s p x ' )   +   ' & v i e w a s = H T M L '  
  
  
 	 	 I F   @ R e s p o n s e R e d i r e c t   =   0  
 	 	 	 S E L E C T   @ R e s p o n s e U R L   =   @ R e s p o n s e U R L   +   ' & C o n t e n t T y p e = ' + I s N u l l ( @ R e s p o n s e C o n t e n t T y p e , ' ' )   +   ' & S t a t u s C o d e = ' + I s N u l l ( c a s t ( @ R e s p o n s e S t a t u s C o d e   a s   v a r c h a r ( 5 0 ) ) , ' ' )  
  
 	 E N D  
  
 	 / *  
 	 	 V a l i d   R e s t   P a t h s   ( T = t e x t ,   N = n u m e r i c ) :  
  
 	 	 T  
 	 	 T / N  
 	 	 	 T / N / N  
 	 	 	 	 T / N / N / N  
 	 	 	 	 	 T / N / N / N / T  
 	 	 	 	 T / N / N / T  
 	 	 	 	 T / N / N / T / T  
 	 	 	 	 	 T / N / N / T / T / T  
 	 	 	 T / N / T  
 	 	 	 T / N / T / T  
 	 	 	 	 T / N / T / T / N  
 	 	 	 	 	 T / N / T / T / N / T  
 	 	 	 	 T / N / T / T / T  
 	 	 	 	 T / N / T / T / T / T  
 	 	 	 	 	 T / N / T / T / T / T / T  
 	 	 T / T / T  
 	 	 	 T / T / T / N  
 	 	 	 	 T / T / T / N / N  
 	 	 	 	 	 T / T / T / N / N / T  
 	 	 	 	 T / T / T / N / T  
 	 	 	 	 T / T / T / N / T / T  
 	 	 	 	 	 T / T / T / N / T / T / T  
 	 	 	 T / T / T / T  
 	 	 	 T / T / T / T / T  
 	 	 	 	 T / T / T / T / T / N  
 	 	 	 	 	 T / T / T / T / T / N / T  
 	 	 	 	 T / T / T / T / T / T  
 	 	 	 	 T / T / T / T / T / T / T  
 	 	 	 	 	 T / T / T / T / T / T / T / T  
 	 * /  
  
 E N D  
  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ F r a m e w o r k . ] . [ R e s o l v e U R L ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ F r a m e w o r k . ] . [ R e s o l v e U R L ]  
 	 @ A p p l i c a t i o n N a m e   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
         @ p a r a m 1   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 2   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 3   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 4   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 5   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 6   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 7   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 8   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 9   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ S e s s i o n I D   u n i q u e i d e n t i f i e r   =   N U L L , 	    
 	 @ R e s t U R L   v a r c h a r ( M A X )   =   N U L L ,  
 	 @ U s e r A g e n t   v a r c h a r ( 2 5 5 )   =   N U L L ,  
 	 @ C o n t e n t T y p e   v a r c h a r ( 2 5 5 )   =   N U L L  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
 	 - -   L o g   r e q u e s t  
 	 D E C L A R E   @ H i s t o r y I D   I N T  
 	 I N S E R T   I N T O   [ U s e r . S e s s i o n ] . [ H i s t o r y . R e s o l v e U R L ] 	 ( R e q u e s t D a t e ,   A p p l i c a t i o n N a m e ,   p a r a m 1 ,   p a r a m 2 ,   p a r a m 3 ,   p a r a m 4 ,   p a r a m 5 ,   p a r a m 6 ,   p a r a m 7 ,   p a r a m 8 ,   p a r a m 9 ,   S e s s i o n I D ,   R e s t U R L ,   U s e r A g e n t ,   C o n t e n t T y p e )  
 	 	 S E L E C T   G e t D a t e ( ) ,   @ A p p l i c a t i o n N a m e ,   @ p a r a m 1 ,   @ p a r a m 2 ,   @ p a r a m 3 ,   @ p a r a m 4 ,   @ p a r a m 5 ,   @ p a r a m 6 ,   @ p a r a m 7 ,   @ p a r a m 8 ,   @ p a r a m 9 ,   @ S e s s i o n I D ,   @ R e s t U R L ,   @ U s e r A g e n t ,   @ C o n t e n t T y p e  
 	 S E L E C T   @ H i s t o r y I D   =   @ @ I D E N T I T Y 	 	    
  
 	 - -   F o r   d y n a m i c   s q l  
 	 D E C L A R E   @ s q l   n v a r c h a r ( m a x )  
  
 	 - -   D e f i n e   v a r i a b l e s   n e e d e d   t o   c o n s t r u c t   t h e   o u t p u t   X M L  
 	 D E C L A R E   @ R e s o l v e d   b i t  
 	 D E C L A R E   @ E r r o r D e s c r i p t i o n   v a r c h a r ( m a x )  
 	 D E C L A R E   @ R e s p o n s e U R L   v a r c h a r ( 1 0 0 0 )  
 	 D E C L A R E   @ R e s p o n s e C o n t e n t T y p e   v a r c h a r ( 2 5 5 )  
 	 D E C L A R E   @ R e s p o n s e S t a t u s C o d e   i n t  
 	 D E C L A R E   @ R e s p o n s e R e d i r e c t   b i t  
 	 D E C L A R E   @ R e s p o n s e I n c l u d e P o s t D a t a   b i t  
  
 	 - -   D e t e r m i n e   i f   t h i s   a p p l i c a t i o n   h a s   a   c u s t o m   r e s o l v e r  
 	 D E C L A R E   @ C u s t o m R e s o l v e r   v a r c h a r ( 1 0 0 0 )  
 	 S E L E C T   @ C u s t o m R e s o l v e r   =   R e s o l v e r  
 	 	 F R O M   [ F r a m e w o r k . ] . R e s t P a t h  
 	 	 W H E R E   A p p l i c a t i o n N a m e   =   @ A p p l i c a t i o n N a m e  
  
 	 - -   R e s o l v e   t h e   U R L  
 	 S E L E C T   @ R e s o l v e d   =   0  
 	 I F   @ C u s t o m R e s o l v e r   I S   N O T   N U L L  
 	 B E G I N  
 	 	 - -   U s e   a   c u s t o m   r e s o l v e r  
 	 	 S E L E C T   @ s q l   =   ' E X E C   '   +   @ C u s t o m R e s o l v e r    
 	 	 	 +   '   @ A p p l i c a t i o n N a m e   =   ' ' '   +   r e p l a c e ( @ A p p l i c a t i o n N a m e , ' ' ' ' , ' ' ' ' ' ' )   +   ' ' ' ,   '  
 	 	 	 +   '   @ p a r a m 1   =   ' ' '   +   r e p l a c e ( @ p a r a m 1 , ' ' ' ' , ' ' ' ' ' ' )   +   ' ' ' ,   '  
 	 	 	 +   '   @ p a r a m 2   =   ' ' '   +   r e p l a c e ( @ p a r a m 2 , ' ' ' ' , ' ' ' ' ' ' )   +   ' ' ' ,   '  
 	 	 	 +   '   @ p a r a m 3   =   ' ' '   +   r e p l a c e ( @ p a r a m 3 , ' ' ' ' , ' ' ' ' ' ' )   +   ' ' ' ,   '  
 	 	 	 +   '   @ p a r a m 4   =   ' ' '   +   r e p l a c e ( @ p a r a m 4 , ' ' ' ' , ' ' ' ' ' ' )   +   ' ' ' ,   '  
 	 	 	 +   '   @ p a r a m 5   =   ' ' '   +   r e p l a c e ( @ p a r a m 5 , ' ' ' ' , ' ' ' ' ' ' )   +   ' ' ' ,   '  
 	 	 	 +   '   @ p a r a m 6   =   ' ' '   +   r e p l a c e ( @ p a r a m 6 , ' ' ' ' , ' ' ' ' ' ' )   +   ' ' ' ,   '  
 	 	 	 +   '   @ p a r a m 7   =   ' ' '   +   r e p l a c e ( @ p a r a m 7 , ' ' ' ' , ' ' ' ' ' ' )   +   ' ' ' ,   '  
 	 	 	 +   '   @ p a r a m 8   =   ' ' '   +   r e p l a c e ( @ p a r a m 8 , ' ' ' ' , ' ' ' ' ' ' )   +   ' ' ' ,   '  
 	 	 	 +   '   @ p a r a m 9   =   ' ' '   +   r e p l a c e ( @ p a r a m 9 , ' ' ' ' , ' ' ' ' ' ' )   +   ' ' ' ,   '  
 	 	 	 +   '   @ S e s s i o n I D   =   '   +   I s N u l l ( ' ' ' '   +   r e p l a c e ( @ S e s s i o n I D , ' ' ' ' , ' ' ' ' ' ' )   +   ' ' ' ' , ' N U L L ' )   +   ' ,   '  
 	 	 	 +   '   @ C o n t e n t T y p e   =   '   +   I s N u l l ( ' ' ' '   +   r e p l a c e ( @ C o n t e n t T y p e , ' ' ' ' , ' ' ' ' ' ' )   +   ' ' ' ' , ' N U L L ' )   +   ' ,   '  
 	 	 	 +   '   @ R e s o l v e d   =   @ R e s o l v e d _ O U T   O U T P U T ,   '  
 	 	 	 +   '   @ E r r o r D e s c r i p t i o n   =   @ E r r o r D e s c r i p t i o n _ O U T   O U T P U T ,   '  
 	 	 	 +   '   @ R e s p o n s e U R L   =   @ R e s p o n s e U R L _ O U T   O U T P U T ,   '  
 	 	 	 +   '   @ R e s p o n s e C o n t e n t T y p e   =   @ R e s p o n s e C o n t e n t T y p e _ O U T   O U T P U T ,   '  
 	 	 	 +   '   @ R e s p o n s e S t a t u s C o d e   =   @ R e s p o n s e S t a t u s C o d e _ O U T   O U T P U T ,   '  
 	 	 	 +   '   @ R e s p o n s e R e d i r e c t   =   @ R e s p o n s e R e d i r e c t _ O U T   O U T P U T ,   '  
 	 	 	 +   '   @ R e s p o n s e I n c l u d e P o s t D a t a   =   @ R e s p o n s e I n c l u d e P o s t D a t a _ O U T   O U T P U T   '  
 	 	 E X E C   s p _ e x e c u t e s q l   @ s q l ,    
 	 	 	 N '  
 	 	 	 	 @ R e s o l v e d _ O U T   b i t   O U T P U T ,  
 	 	 	 	 @ E r r o r D e s c r i p t i o n _ O U T   v a r c h a r ( m a x )   O U T P U T ,  
 	 	 	 	 @ R e s p o n s e U R L _ O U T   v a r c h a r ( 1 0 0 0 )   O U T P U T ,  
 	 	 	 	 @ R e s p o n s e C o n t e n t T y p e _ O U T   v a r c h a r ( 2 5 5 )   O U T P U T ,  
 	 	 	 	 @ R e s p o n s e S t a t u s C o d e _ O U T   i n t   O U T P U T ,  
 	 	 	 	 @ R e s p o n s e R e d i r e c t _ O U T   b i t   O U T P U T ,  
 	 	 	 	 @ R e s p o n s e I n c l u d e P o s t D a t a _ O U T   b i t   O U T P U T ' ,  
 	 	 	 @ R e s o l v e d _ O U T   =   @ R e s o l v e d   O U T P U T ,  
 	 	 	 @ E r r o r D e s c r i p t i o n _ O U T   =   @ E r r o r D e s c r i p t i o n   O U T P U T ,  
 	 	 	 @ R e s p o n s e U R L _ O U T   =   @ R e s p o n s e U R L   O U T P U T ,  
 	 	 	 @ R e s p o n s e C o n t e n t T y p e _ O U T   =   @ R e s p o n s e C o n t e n t T y p e   O U T P U T ,  
 	 	 	 @ R e s p o n s e S t a t u s C o d e _ O U T   =   @ R e s p o n s e S t a t u s C o d e   O U T P U T ,  
 	 	 	 @ R e s p o n s e R e d i r e c t _ O U T   =   @ R e s p o n s e R e d i r e c t   O U T P U T ,  
 	 	 	 @ R e s p o n s e I n c l u d e P o s t D a t a _ O U T   =   @ R e s p o n s e I n c l u d e P o s t D a t a   O U T P U T  
 	 E N D  
 	 E L S E  
 	 B E G I N  
 	 	 - -   U s e   t h e   d e f a u l t   r e s o l v e r  
 	 	 S E L E C T 	 @ R e s o l v e d   =   1 ,  
 	 	 	 	 @ E r r o r D e s c r i p t i o n   =   ' ' ,    
 	 	 	 	 @ R e s p o n s e U R L   =   B a s e U R L ,  
 	 	 	 	 @ R e s p o n s e C o n t e n t T y p e   =   @ C o n t e n t T y p e ,  
 	 	 	 	 @ R e s p o n s e S t a t u s C o d e   =   2 0 0 ,  
 	 	 	 	 @ R e s p o n s e R e d i r e c t   =   0 ,  
 	 	 	 	 @ R e s p o n s e I n c l u d e P o s t D a t a   =   0  
 	 	         F R O M   [ F r a m e w o r k . A l i a s ] . A p p l i c a t i o n B a s e U R L  
 	 	 	 W H E R E   A p p l i c a t i o n N a m e   =   @ A p p l i c a t i o n N a m e  
 	 	 S E L E C T   @ R e s p o n s e U R L   =   @ R e s p o n s e U R L   +   ( C A S E   W H E N   C H A R I N D E X ( ' ? ' , @ R e s p o n s e U R L )   >   0   T H E N   ' '   E L S E   ' ? '   E N D )  
 	 	 	 +   ' & p a r a m 1 = '   +   @ p a r a m 1  
 	 	 	 +   ' & p a r a m 2 = '   +   @ p a r a m 2  
 	 	 	 +   ' & p a r a m 3 = '   +   @ p a r a m 3  
 	 	 	 +   ' & p a r a m 4 = '   +   @ p a r a m 4  
 	 	 	 +   ' & p a r a m 5 = '   +   @ p a r a m 5  
 	 	 	 +   ' & p a r a m 6 = '   +   @ p a r a m 6  
 	 	 	 +   ' & p a r a m 7 = '   +   @ p a r a m 7  
 	 	 	 +   ' & p a r a m 8 = '   +   @ p a r a m 8  
 	 	 	 +   ' & p a r a m 9 = '   +   @ p a r a m 9  
 	 E N D  
 	 - -   A d d   s t a n d a r d   p a r a m e t e r s  
 	 I F   ( @ R e s o l v e d   =   1 )   A N D   ( @ R e s p o n s e R e d i r e c t   =   0 )  
 	 B E G I N  
 	 	 S E L E C T   @ R e s p o n s e U R L   =   @ R e s p o n s e U R L   +   ( C A S E   W H E N   C H A R I N D E X ( ' ? ' , @ R e s p o n s e U R L )   >   0   T H E N   ' '   E L S E   ' ? '   E N D )  
 	 	 S E L E C T   @ R e s p o n s e U R L   =   @ R e s p o n s e U R L   +   ' & S e s s i o n I D = '   +   I s N u l l ( C A S T ( @ S e s s i o n I D   A S   v a r c h a r ( 5 0 ) ) , ' ' )  
 	 E N D  
 	 S E L E C T   @ E r r o r D e s c r i p t i o n   =   I s N u l l ( @ E r r o r D e s c r i p t i o n , ' U R L   c o u l d   n o t   b e   r e s o l v e d . ' )  
  
 	 - -   L o g   r e s u l t s  
 	 U P D A T E   [ U s e r . S e s s i o n ] . [ H i s t o r y . R e s o l v e U R L ]  
 	 	 S E T   C u s t o m R e s o l v e r   =   @ C u s t o m R e s o l v e r ,  
 	 	 	 R e s o l v e d   =   @ R e s o l v e d ,  
 	 	 	 E r r o r D e s c r i p t i o n   =   @ E r r o r D e s c r i p t i o n ,  
 	 	 	 R e s p o n s e U R L   =   @ R e s p o n s e U R L ,  
 	 	 	 R e s p o n s e C o n t e n t T y p e   =   @ R e s p o n s e C o n t e n t T y p e ,  
 	 	 	 R e s p o n s e S t a t u s C o d e   =   @ R e s p o n s e S t a t u s C o d e ,  
 	 	 	 R e s p o n s e R e d i r e c t   =   @ R e s p o n s e R e d i r e c t ,  
 	 	 	 R e s p o n s e I n c l u d e P o s t D a t a   =   @ R e s p o n s e I n c l u d e P o s t D a t a  
 	 	 W H E R E   H i s t o r y I D   =   @ H i s t o r y I D  
  
 	 - -   R e t u r n   r e s u l t s    
 	 S E L E C T 	 @ R e s o l v e d   R e s o l v e d ,    
 	 	 	 @ E r r o r D e s c r i p t i o n   E r r o r D e s c r i p t i o n ,    
 	 	 	 @ R e s p o n s e U R L   R e s p o n s e U R L ,  
 	 	 	 @ R e s p o n s e C o n t e n t T y p e   R e s p o n s e C o n t e n t T y p e ,  
 	 	 	 @ R e s p o n s e S t a t u s C o d e   R e s p o n s e S t a t u s C o d e ,  
 	 	 	 @ R e s p o n s e R e d i r e c t   R e s p o n s e R e d i r e c t ,  
 	 	 	 @ R e s p o n s e I n c l u d e P o s t D a t a   R e s p o n s e I n c l u d e P o s t D a t a ,  
 	 	 	 @ S e s s i o n I D   R e d i r e c t H e a d e r S e s s i o n I D  
  
  
 	 / *  
 	 	 E x a m p l e s :  
  
 	 	 E X E C   [ F r a m e w o r k . ] . [ R e s o l v e U R L ]   @ A p p l i c a t i o n N a m e = ' p r o f i l e ' ,   @ p a r a m 1 = ' 1 2 3 4 5 ' ,   @ C o n t e n t T y p e = ' a p p l i c a t i o n / r d f + x m l '  
 	 	 E X E C   [ F r a m e w o r k . ] . [ R e s o l v e U R L ]   @ A p p l i c a t i o n N a m e = ' p r o f i l e ' ,   @ p a r a m 1 = ' 1 2 3 4 5 ' ,   @ p a r a m 2 = ' 1 2 3 4 5 . r d f '  
 	 	 E X E C   [ F r a m e w o r k . ] . [ R e s o l v e U R L ]   @ A p p l i c a t i o n N a m e = ' p r o f i l e ' ,   @ p a r a m 1 = ' 1 2 3 4 5 '  
 	 	 E X E C   [ F r a m e w o r k . ] . [ R e s o l v e U R L ]   @ A p p l i c a t i o n N a m e = ' d i s p l a y ' ,   @ p a r a m 1 = ' 1 2 3 4 5 ' ,   @ S e s s i o n I D   =   ' 1 6 A 1 9 9 E D - 0 7 C 5 - 4 3 6 F - A B 7 D - 0 2 1 4 7 9 2 6 3 0 A 6 '  
 	 	 E X E C   [ F r a m e w o r k . ] . [ R e s o l v e U R L ]   @ A p p l i c a t i o n N a m e = ' p r o f i l e ' ,   @ p a r a m 1 = ' 1 2 3 4 5 ' ,   @ p a r a m 2 = ' 1 2 3 4 5 . r d f ' ,   @ S e s s i o n I D   =   ' 1 6 A 1 9 9 E D - 0 7 C 5 - 4 3 6 F - A B 7 D - 0 2 1 4 7 9 2 6 3 0 A 6 '  
  
 	 * /  
  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A l t e r i n g   [ P r o f i l e . C a c h e ] . [ P e r s o n ] '  
 G O  
 A L T E R   T A B L E   [ P r o f i l e . C a c h e ] . [ P e r s o n ]   A L T E R   C O L U M N   [ A d d r e s s L i n e 1 ]   [ n v a r c h a r ]   ( 2 5 5 )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N U L L  
 A L T E R   T A B L E   [ P r o f i l e . C a c h e ] . [ P e r s o n ]   A L T E R   C O L U M N   [ A d d r e s s L i n e 2 ]   [ n v a r c h a r ]   ( 2 5 5 )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N U L L  
 A L T E R   T A B L E   [ P r o f i l e . C a c h e ] . [ P e r s o n ]   A L T E R   C O L U M N   [ A d d r e s s L i n e 3 ]   [ n v a r c h a r ]   ( 2 5 5 )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N U L L  
 A L T E R   T A B L E   [ P r o f i l e . C a c h e ] . [ P e r s o n ]   A L T E R   C O L U M N   [ A d d r e s s L i n e 4 ]   [ n v a r c h a r ]   ( 2 5 5 )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N U L L  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A l t e r i n g   [ P r o f i l e . D a t a ] . [ P e r s o n ] '  
 G O  
 A L T E R   T A B L E   [ P r o f i l e . D a t a ] . [ P e r s o n ]   A L T E R   C O L U M N   [ A d d r e s s L i n e 1 ]   [ n v a r c h a r ]   ( 2 5 5 )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N U L L  
 A L T E R   T A B L E   [ P r o f i l e . D a t a ] . [ P e r s o n ]   A L T E R   C O L U M N   [ A d d r e s s L i n e 2 ]   [ n v a r c h a r ]   ( 2 5 5 )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N U L L  
 A L T E R   T A B L E   [ P r o f i l e . D a t a ] . [ P e r s o n ]   A L T E R   C O L U M N   [ A d d r e s s L i n e 3 ]   [ n v a r c h a r ]   ( 2 5 5 )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N U L L  
 A L T E R   T A B L E   [ P r o f i l e . D a t a ] . [ P e r s o n ]   A L T E R   C O L U M N   [ A d d r e s s L i n e 4 ]   [ n v a r c h a r ]   ( 2 5 5 )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N U L L  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A l t e r i n g   [ U s e r . A c c o u n t ] . [ R e l a t i o n s h i p . G e t R e l a t i o n s h i p ] '  
 G O  
 A L T E R   P R O C E D U R E   [ U s e r . A c c o u n t ] . [ R e l a t i o n s h i p . G e t R e l a t i o n s h i p ]  
 	 @ S e s s i o n I D   U N I Q U E I D E N T I F I E R ,  
 	 @ D e t a i l s   B I T   =   0 ,  
 	 @ S u b j e c t   B I G I N T   =   N U L L  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
 	 / * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 T h i s   p r o c e d u r e   d o e s   o n e   o f   f i v e   t h i n g s ,   b a s e d   o n   t h e   i n p u t   p a r a m e t e r s :  
 	  
 	 1 )   I f   t h e   S e s s i o n   i s   n o t   l o g g e d   i n   ( i . e .   n o t   a   u s e r ) ,   t h e n . .  
 	 	 N o t h i n g   i s   r e t u r n e d .  
 	 	  
 	 2 )   I f   a   S u b j e c t   i s   p r o v i d e d   a n d   i t   i s   n o t   a   p e r s o n ,   t h e n . . .  
 	 	 N o t h i n g   i s   r e t u r n e d .  
 	  
 	 3 )   I f   a   S u b j e c t   i s   p r o v i d e d   a n d   i t   i s   a   p e r s o n ,   t h e n . . .  
 	 	 A   l i s t   o f   r e l a t i o n s h i p   t y p e s   i s   r e t u r n e d ,   w i t h   a   f l a g   " D o e s E x i s t "  
 	 	 t h a t   i n d i c a t e s   w h e t h e r   t h e   S e s s i o n   u s e r   h a s   a   r e l a t i o n s h i p   w i t h  
 	 	 t h e   S u b j e c t   p e r s o n .  
 	  
 	 4 )   I f   a   S u b j e c t   i s   n o t   p r o v i d e d   a n d   D e t a i l s   =   0 ,   t h e n . . .  
 	 	 A   l i s t   o f   a l l   p e o p l e   w h o   h a v e   a t   l e a s t   o n e   r e l a t i o n s h i p   w i t h   t h e  
 	 	 S e s s i o n   u s e r   i s   r e t u r n e d .  
 	  
 	 5 )   I f   a   S u b j e c t   i s   n o t   p r o v i d e d   a n d   D e t a i l s   =   1 ,   t h e n . . .  
 	 	 A   l i s t   o f   a l l   p e o p l e   w h o   h a v e   a   r e l a t i o n s h i p   w i t h   t h e   S e s s i o n   u s e r  
 	 	 i s   r e t u r n e d ,   g r o u p e d   b y   r e l a t i o n s h i p   t y p e .  
 	 	  
 	 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * /  
  
 	 - -   G e t   t h e   U s e r I D   o f   t h e   S e s s i o n I D .   E x i t   i f   n o t   f o u n d .  
 	 D E C L A R E   @ S e s s i o n U s e r I D   I N T  
 	 S E L E C T   @ S e s s i o n U s e r I D   =   U s e r I D  
 	 	 F R O M   [ U s e r . S e s s i o n ] . [ S e s s i o n ]  
 	 	 W H E R E   S e s s i o n I D   =   @ S e s s i o n I D  
 	 I F   @ S e s s i o n U s e r I D   I S   N U L L  
 	 	 R E T U R N  
  
  
 	 - -   C o n v e r t   t h e   S u b j e c t   t o   a   P e r s o n I D  
 	 D E C L A R E   @ P e r s o n I D   I N T  
 	 S E L E C T   @ P e r s o n I D   =   N U L L  
 	 S E L E C T   @ P e r s o n I D   =   C A S T ( I n t e r n a l I D   A S   I N T )  
 	 	 F R O M   [ R D F . S t a g e ] . [ I n t e r n a l N o d e M a p ]  
 	 	 W H E R E   @ S u b j e c t   I S   N O T   N U L L  
 	 	 	 A N D   N o d e I D   =   @ S u b j e c t  
 	 	 	 A N D   C l a s s   =   ' h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / P e r s o n '  
 	 	 	 A N D   I n t e r n a l T y p e   =   ' P e r s o n '  
 	 I F   ( @ S u b j e c t   I S   N O T   N U L L )   A N D   ( @ P e r s o n I D   I S   N U L L )  
 	 	 R E T U R N  
  
  
 	 - -   B u i l d   a   l i s t   o f   r e l a t i o n s h i p   t y p e s  
 	 D E C L A R E   @ r   T A B L E   (  
 	 	 R e l a t i o n s h i p T y p e   v a r c h a r ( 5 0 ) ,  
 	 	 R e l a t i o n s h i p N a m e   v a r c h a r ( 5 0 ) ,  
 	 	 S o r t O r d e r   i n t  
 	 )  
 	 I N S E R T   I N T O   @ r   ( R e l a t i o n s h i p T y p e ,   R e l a t i o n s h i p N a m e ,   S o r t O r d e r )  
 	 	 S E L E C T   ' C o l l a b o r a t o r ' ,   ' C o l l a b o r a t o r ' ,   0    
 	 	 U N I O N   A L L  
 	 	 S E L E C T   ' C u r r e n t A d v i s o r ' ,   ' A d v i s o r   ( C u r r e n t ) ' ,   1    
 	 	 U N I O N   A L L  
 	 	 S E L E C T   ' P a s t A d v i s o r ' ,   ' A d v i s o r   ( P a s t ) ' ,   2    
 	 	 U N I O N   A L L    
 	 	 S E L E C T   ' C u r r e n t A d v i s e e ' ,   ' A d v i s e e   ( C u r r e n t ) ' ,   3    
 	 	 U N I O N   A L L  
 	 	 S E L E C T   ' P a s t A d v i s e e ' ,   ' A d v i s e e   ( P a s t ) ' ,   4  
 	  
 	  
 	 - -   R e t u r n   t h e   r e l a t i o n s h i p s   b e t w e e n   t h e   s e s s i o n   u s e r   a n d   t h e   P e r s o n I D  
 	 I F   ( @ P e r s o n I D   I S   N O T   N U L L )  
 	 	 S E L E C T   r . R e l a t i o n s h i p T y p e ,   r . R e l a t i o n s h i p N a m e ,   r . S o r t O r d e r ,    
 	 	 	 	 ( C A S E   W H E N   u . P e r s o n I D   I S   N U L L   T H E N   0   E L S E   1   E N D )   D o e s E x i s t  
 	 	 	 F R O M   @ r   r  
 	 	 	 	 L E F T   O U T E R   J O I N   [ U s e r . A c c o u n t ] . [ R e l a t i o n s h i p ]   u  
 	 	 	 	 	 O N   u . U s e r I D   =   @ S e s s i o n U s e r I D  
 	 	 	 	 	 	 A N D   u . P e r s o n I D   =   @ P e r s o n I D  
 	 	 	 	 	 	 A N D   r . R e l a t i o n s h i p T y p e   =   u . R e l a t i o n s h i p T y p e  
 	 	 	 O R D E R   B Y   r . S o r t O r d e r  
  
 	 - -   C r e a t e   a   t e m p   t a b l e   t o   s t o r e   a   l i s t   o f   P e r s o n I D s   b e f o r e   c o n v e r t i n g   t o   N o d e I D s  
 	 D E C L A R E   @ p   A S   T A B L E   (  
 	 	 R e l a t i o n s h i p T y p e   V A R C H A R ( 5 0 ) ,  
 	 	 R e l a t i o n s h i p N a m e   V A R C H A R ( 1 0 0 ) ,  
 	 	 S o r t O r d e r   I N T ,  
 	 	 P e r s o n I D   I N T ,  
 	 	 N a m e   N V A R C H A R ( 1 0 0 )  
 	 )  
  
 	 - -   R e t u r n   a   l i s t   o f   p e o p l e   w h o   h a v e   a t   l e a s t   o n e   r e l a t i o n s h i p   t o   t h e   s e s s i o n   u s e r  
 	 I F   ( @ P e r s o n I D   I S   N U L L )   A N D   ( @ D e t a i l s   =   0 )  
 	 B E G I N  
 	 	 I N S E R T   I N T O   @ p   ( P e r s o n I D ,   N a m e )  
 	 	 	 S E L E C T   P e r s o n I D ,  
 	 	 	 	 L a s t N a m e   +   ( C A S E   W H E N   L a s t N a m e < > ' '   A N D   F i r s t N a m e < > ' '   T H E N   ' ,   '   E L S E   ' '   E N D )   +   F i r s t N a m e   A S   N a m e  
 	 	 	 F R O M   [ P r o f i l e . D a t a ] . [ P e r s o n ]   p  
 	 	 	 W H E R E   p . P e r s o n I D   I N   (  
 	 	 	 	 	 S E L E C T   P e r s o n I D  
 	 	 	 	 	 	 F R O M   [ U s e r . A c c o u n t ] . [ R e l a t i o n s h i p ]  
 	 	 	 	 	 	 W H E R E   U s e r I D   =   @ S e s s i o n U s e r I D  
 	 	 	 	 )   A N D   p . I s A c t i v e   =   1  
  
 	 	 S E L E C T 	 p . P e r s o n I D ,  
 	 	 	 	 p . N a m e ,  
 	 	 	 	 m . N o d e I D ,  
 	 	 	 	 o . V a l u e   +   C A S T ( m . N o d e I D   A S   V A R C H A R ( 5 0 ) )   U R I  
 	 	 	 F R O M   @ p   p  
 	 	 	 	 I N N E R   J O I N   [ R D F . S t a g e ] . [ I n t e r n a l N o d e M a p ]   m  
 	 	 	 	 	 O N   m . C l a s s   =   ' h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / P e r s o n '  
 	 	 	 	 	 	 A N D   m . I n t e r n a l T y p e   =   ' P e r s o n '  
 	 	 	 	 	 	 A N D   m . I n t e r n a l I D   =   C A S T ( p . P e r s o n I D   a s   V A R C H A R ( 5 0 ) )  
 	 	 	 	 I N N E R   J O I N   [ F r a m e w o r k . ] . [ P a r a m e t e r ]   o  
 	 	 	 	 	 O N   o . P a r a m e t e r I D   =   ' b a s e U R I '  
 	 	 	 O R D E R   B Y   p . N a m e  
 	 E N D  
  
  
 	 - -   R e t u r n   p e o p l e   w h o   h a v e   a   r e l a t i o n s h i p   t o   t h e   s e s s i o n   u s e r ,   g r o u p e d   b y   r e l a t i o n s h i p   t y p e  
 	 I F   ( @ P e r s o n I D   I S   N U L L )   A N D   ( @ D e t a i l s   =   1 )  
 	 B E G I N  
 	 	 ; W I T H   a   A S   (  
 	 	 	 S E L E C T   r . R e l a t i o n s h i p T y p e ,   r . R e l a t i o n s h i p N a m e ,   r . S o r t O r d e r ,  
 	 	 	 	 	 p . P e r s o n I D ,  
 	 	 	 	 	 p . L a s t N a m e   +   ( C A S E   W H E N   p . L a s t N a m e < > ' '   A N D   p . F i r s t N a m e < > ' '   T H E N   ' ,   '   E L S E   ' '   E N D )   +   p . F i r s t N a m e   A S   N a m e  
 	 	 	 	 F R O M   @ r   r  
 	 	 	 	 	 I N N E R   J O I N   [ U s e r . A c c o u n t ] . [ R e l a t i o n s h i p ]   u  
 	 	 	 	 	 	 O N   u . U s e r I D   =   @ S e s s i o n U s e r I D  
 	 	 	 	 	 	 	 A N D   r . R e l a t i o n s h i p T y p e   =   u . R e l a t i o n s h i p T y p e  
 	 	 	 	 	 I N N E R   J O I N   [ P r o f i l e . D a t a ] . [ P e r s o n ]   p  
 	 	 	 	 	 	 O N   u . P e r s o n I D   =   p . P e r s o n I D   A N D   p . I s A c t i v e   =   1  
 	 	 ) ,   b   A S   (  
 	 	 	 S E L E C T   R e l a t i o n s h i p T y p e ,   C O U N T ( * )   N  
 	 	 	 	 F R O M   a  
 	 	 	 	 G R O U P   B Y   R e l a t i o n s h i p T y p e  
 	 	 )  
 	 	 I N S E R T   I N T O   @ p   ( R e l a t i o n s h i p T y p e ,   R e l a t i o n s h i p N a m e ,   S o r t O r d e r ,   P e r s o n I D ,   N a m e )  
 	 	 	 S E L E C T   a . *  
 	 	 	 	 F R O M   a   I N N E R   J O I N   b   O N   a . R e l a t i o n s h i p T y p e   =   b . R e l a t i o n s h i p T y p e  
  
 	 	 S E L E C T 	 p . R e l a t i o n s h i p T y p e ,    
 	 	 	 	 p . R e l a t i o n s h i p N a m e ,    
 	 	 	 	 p . S o r t O r d e r ,    
 	 	 	 	 p . P e r s o n I D ,  
 	 	 	 	 p . N a m e ,  
 	 	 	 	 m . N o d e I D ,  
 	 	 	 	 o . V a l u e   +   C A S T ( m . N o d e I D   A S   V A R C H A R ( 5 0 ) )   U R I  
 	 	 	 F R O M   @ p   p  
 	 	 	 	 I N N E R   J O I N   [ R D F . S t a g e ] . [ I n t e r n a l N o d e M a p ]   m  
 	 	 	 	 	 O N   m . C l a s s   =   ' h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / P e r s o n '  
 	 	 	 	 	 	 A N D   m . I n t e r n a l T y p e   =   ' P e r s o n '  
 	 	 	 	 	 	 A N D   m . I n t e r n a l I D   =   C A S T ( p . P e r s o n I D   a s   V A R C H A R ( 5 0 ) )  
 	 	 	 	 I N N E R   J O I N   [ F r a m e w o r k . ] . [ P a r a m e t e r ]   o  
 	 	 	 	 	 O N   o . P a r a m e t e r I D   =   ' b a s e U R I '  
 	 	 	 O R D E R   B Y   p . S o r t O r d e r ,   p . N a m e ,   p . P e r s o n I D  
 	 E N D  
  
  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A l t e r i n g   [ U s e r . S e s s i o n ] . [ U p d a t e S e s s i o n ] '  
 G O  
 A L T E R   P R O C E D U R E   [ U s e r . S e s s i o n ] . [ U p d a t e S e s s i o n ]  
 	 @ S e s s i o n I D   U N I Q U E I D E N T I F I E R ,    
 	 @ U s e r I D   I N T = N U L L ,    
 	 @ L a s t U s e d D a t e   D A T E T I M E = N U L L ,    
 	 @ L o g o u t D a t e   D A T E T I M E = N U L L ,  
 	 @ S e s s i o n P e r s o n N o d e I D   B I G I N T   =   N U L L   O U T P U T ,  
 	 @ S e s s i o n P e r s o n U R I   V A R C H A R ( 4 0 0 )   =   N U L L   O U T P U T  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
 	  
 	 - -   S e e   i f   t h e r e   i s   a   P e r s o n I D   a s s o c i a t e d   w i t h   t h i s   s e s s i o n 	  
 	 D E C L A R E   @ P e r s o n I D   I N T  
 	 S E L E C T   @ P e r s o n I D   =   P e r s o n I D  
 	 	 F R O M   [ U s e r . S e s s i o n ] . [ S e s s i o n ]  
 	 	 W H E R E   S e s s i o n I D   =   @ S e s s i o n I D  
 	 I F   @ P e r s o n I D   I S   N U L L   A N D   @ U s e r I D   I S   N O T   N U L L  
 	 	 S E L E C T   @ P e r s o n I D   =   P e r s o n I D  
 	 	 	 F R O M   [ U s e r . A c c o u n t ] . [ U s e r ]  
 	 	 	 W H E R E   U s e r I D   =   @ U s e r I D  
  
 	 - -   G e t   t h e   N o d e I D   a n d   U R I   o f   t h e   P e r s o n I D  
 	 I F   @ P e r s o n I D   I S   N O T   N U L L  
 	 B E G I N  
 	 	 S E L E C T   @ S e s s i o n P e r s o n N o d e I D   =   m . N o d e I D ,   @ S e s s i o n P e r s o n U R I   =   p . V a l u e   +   C A S T ( m . N o d e I D   A S   V A R C H A R ( 5 0 ) )  
 	 	 	 F R O M   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   m ,   [ F r a m e w o r k . ] . [ P a r a m e t e r ]   p  
 	 	 	 W H E R E   m . I n t e r n a l I D   =   @ P e r s o n I D  
 	 	 	 	 A N D   m . I n t e r n a l T y p e   =   ' p e r s o n '  
 	 	 	 	 A N D   m . C l a s s   =   ' h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / P e r s o n '  
 	 	 	 	 A N D   p . P a r a m e t e r I D   =   ' b a s e U R I '  
 	 E N D  
  
 	 - -   U p d a t e   t h e   s e s s i o n   d a t a  
         I F   E X I S T S   ( S E L E C T   *   F R O M   [ U s e r . S e s s i o n ] . [ S e s s i o n ]   W H E R E   S e s s i o n I D   =   @ S e s s i o n I D )  
 	 	 U P D A T E   [ U s e r . S e s s i o n ] . [ S e s s i o n ]  
 	 	 	 S E T 	 U s e r I D   =   I s N u l l ( @ U s e r I D , U s e r I D ) ,  
 	 	 	 	 U s e r N o d e   =   I s N u l l ( ( S E L E C T   N o d e I D   F R O M   [ U s e r . A c c o u n t ] . [ U s e r ]   W H E R E   U s e r I D   =   @ U s e r I D   A N D   @ U s e r I D   I S   N O T   N U L L ) , U s e r N o d e ) ,  
 	 	 	 	 P e r s o n I D   =   I s N u l l ( @ P e r s o n I D , P e r s o n I D ) ,  
 	 	 	 	 L a s t U s e d D a t e   =   I s N u l l ( @ L a s t U s e d D a t e , L a s t U s e d D a t e ) ,  
 	 	 	 	 L o g o u t D a t e   =   I s N u l l ( @ L o g o u t D a t e , L o g o u t D a t e )  
 	 	 	 W H E R E   S e s s i o n I D   =   @ S e s s i o n I D  
  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A l t e r i n g   [ O n t o l o g y . ] . [ U p d a t e D e r i v e d F i e l d s ] '  
 G O  
 A L T E R   P R O C E D U R E   [ O n t o l o g y . ] . [ U p d a t e D e r i v e d F i e l d s ]  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
 	 - -   T r i p l e  
 	 U P D A T E   o  
 	 	 S E T 	 _ S u b j e c t N o d e   =   [ R D F . ] . f n U R I 2 N o d e I D ( s u b j e c t ) ,  
 	 	 	 _ P r e d i c a t e N o d e   =   [ R D F . ] . f n U R I 2 N o d e I D ( p r e d i c a t e ) ,  
 	 	 	 _ O b j e c t N o d e   =   [ R D F . ] . f n U R I 2 N o d e I D ( o b j e c t ) ,  
 	 	 	 _ T r i p l e I D   =   N U L L  
 	 	 F R O M   [ O n t o l o g y . I m p o r t ] . [ T r i p l e ]   o  
 	 U P D A T E   o  
 	 	 S E T   o . _ T r i p l e I D   =   r . T r i p l e I D  
 	 	 F R O M   [ O n t o l o g y . I m p o r t ] . [ T r i p l e ]   o ,   [ R D F . ] . T r i p l e   r  
 	 	 W H E R E   o . _ S u b j e c t N o d e   =   r . S u b j e c t   A N D   o . _ P r e d i c a t e N o d e   =   r . P r e d i c a t e   A N D   o . _ O b j e c t N o d e   =   r . O b j e c t  
  
 	 - -   D a t a M a p  
 	 U P D A T E   o  
 	 	 S E T 	 _ C l a s s N o d e   =   [ R D F . ] . f n U R I 2 N o d e I D ( C l a s s ) ,  
 	 	 	 _ N e t w o r k P r o p e r t y N o d e   =   [ R D F . ] . f n U R I 2 N o d e I D ( N e t w o r k P r o p e r t y ) ,  
 	 	 	 _ P r o p e r t y N o d e   =   [ R D F . ] . f n U R I 2 N o d e I D ( p r o p e r t y )  
 	 	 F R O M   [ O n t o l o g y . ] . D a t a M a p   o  
  
 	 - -   C l a s s P r o p e r t y  
 	 U P D A T E   o  
 	 	 S E T 	 _ C l a s s N o d e   =   [ R D F . ] . f n U R I 2 N o d e I D ( C l a s s ) ,  
 	 	 	 _ N e t w o r k P r o p e r t y N o d e   =   [ R D F . ] . f n U R I 2 N o d e I D ( N e t w o r k P r o p e r t y ) ,  
 	 	 	 _ P r o p e r t y N o d e   =   [ R D F . ] . f n U R I 2 N o d e I D ( p r o p e r t y ) ,  
 	 	 	 _ T a g N a m e   =   ( s e l e c t   t o p   1   n . P r e f i x + ' : ' + s u b s t r i n g ( o . p r o p e r t y , l e n ( n . U R I ) + 1 , l e n ( o . p r o p e r t y ) )   t  
 	 	 	 	 	 	 f r o m   [ O n t o l o g y . ] . N a m e s p a c e   n  
 	 	 	 	 	 	 w h e r e   o . p r o p e r t y   l i k e   n . u r i + ' % '  
 	 	 	 	 	 	 )  
 	 	 F R O M   [ O n t o l o g y . ] . C l a s s P r o p e r t y   o  
 	 U P D A T E   e  
 	 	 S E T   e . _ P r o p e r t y L a b e l   =   o . v a l u e  
 	 	 F R O M   [ o n t o l o g y . ] . C l a s s P r o p e r t y   e  
 	 	 	 L E F T   O U T E R   J O I N   [ R D F . ] . [ T r i p l e ]   t  
 	 	 	 	 O N   e . _ P r o p e r t y N o d e   =   t . s u b j e c t   A N D   t . p r e d i c a t e   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # l a b e l ' )    
 	 	 	 L E F T   O U T E R   J O I N   [ R D F . ] . [ N o d e ]   o  
 	 	 	 	 O N   t . o b j e c t   =   o . n o d e i d  
 	 U P D A T E   e  
 	 	 S E T   e . _ O b j e c t T y p e   =   ( C A S E   W H E N   o . v a l u e   =   ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # O b j e c t P r o p e r t y '   T H E N   0   E L S E   1   E N D )  
 	 	 F R O M   [ o n t o l o g y . ] . C l a s s P r o p e r t y   e  
 	 	 	 L E F T   O U T E R   J O I N   [ R D F . ] . [ T r i p l e ]   t  
 	 	 	 	 O N   e . _ P r o p e r t y N o d e   =   t . s u b j e c t   A N D   t . p r e d i c a t e   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # t y p e ' )    
 	 	 	 L E F T   O U T E R   J O I N   [ R D F . ] . [ N o d e ]   o  
 	 	 	 	 O N   t . o b j e c t   =   o . n o d e i d   a n d   o . v a l u e   i n   ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # D a t a t y p e P r o p e r t y ' , ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # O b j e c t P r o p e r t y ' )  
  
 	 - -   C l a s s G r o u p  
 	 U P D A T E   o  
 	 	 S E T 	 _ C l a s s G r o u p N o d e   =   [ R D F . ] . f n U R I 2 N o d e I D ( C l a s s G r o u p U R I )  
 	 	 F R O M   [ O n t o l o g y . ] . C l a s s G r o u p   o  
 	 U P D A T E   e  
 	 	 S E T   e . _ C l a s s G r o u p L a b e l   =   o . v a l u e  
 	 	 F R O M   [ o n t o l o g y . ] . C l a s s G r o u p   e  
 	 	 	 L E F T   O U T E R   J O I N   [ R D F . ] . [ T r i p l e ]   t  
 	 	 	 	 O N   e . _ C l a s s G r o u p N o d e   =   t . s u b j e c t   A N D   t . p r e d i c a t e   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # l a b e l ' )    
 	 	 	 L E F T   O U T E R   J O I N   [ R D F . ] . [ N o d e ]   o  
 	 	 	 	 O N   t . o b j e c t   =   o . n o d e i d  
  
 	 - -   C l a s s G r o u p C l a s s  
 	 U P D A T E   o  
 	 	 S E T 	 _ C l a s s G r o u p N o d e   =   [ R D F . ] . f n U R I 2 N o d e I D ( C l a s s G r o u p U R I ) ,  
 	 	 	 _ C l a s s N o d e   =   [ R D F . ] . f n U R I 2 N o d e I D ( C l a s s U R I )  
 	 	 F R O M   [ O n t o l o g y . ] . C l a s s G r o u p C l a s s   o  
 	 U P D A T E   e  
 	 	 S E T   e . _ C l a s s L a b e l   =   o . v a l u e  
 	 	 F R O M   [ o n t o l o g y . ] . C l a s s G r o u p C l a s s   e  
 	 	 	 L E F T   O U T E R   J O I N   [ R D F . ] . [ T r i p l e ]   t  
 	 	 	 	 O N   e . _ C l a s s N o d e   =   t . s u b j e c t   A N D   t . p r e d i c a t e   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # l a b e l ' )    
 	 	 	 L E F T   O U T E R   J O I N   [ R D F . ] . [ N o d e ]   o  
 	 	 	 	 O N   t . o b j e c t   =   o . n o d e i d  
 	 	 	 	  
 	 - -   C l a s s T r e e D e p t h  
 	 d e c l a r e   @ C l a s s D e p t h s   t a b l e   (  
 	 	 N o d e I D   b i g i n t ,  
 	 	 S u b C l a s s O f   b i g i n t ,  
 	 	 D e p t h   i n t ,  
 	 	 C l a s s U R I   v a r c h a r ( 4 0 0 ) ,  
 	 	 C l a s s N a m e   v a r c h a r ( 4 0 0 )  
 	 )  
 	 ; w i t h   x   a s   (  
 	 	 s e l e c t   t . s u b j e c t   N o d e I D ,    
 	 	 	 m a x ( c a s e   w h e n   w . s u b j e c t   i s   n u l l   t h e n   n u l l   e l s e   v . o b j e c t   e n d )   S u b C l a s s O f  
 	 	 f r o m   [ R D F . ] . T r i p l e   t  
 	 	 	 l e f t   o u t e r   j o i n   [ R D F . ] . T r i p l e   v  
 	 	 	 	 o n   v . s u b j e c t   =   t . s u b j e c t    
 	 	 	 	 a n d   v . p r e d i c a t e   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # s u b C l a s s O f ' )  
 	 	 	 l e f t   o u t e r   j o i n   [ R D F . ] . T r i p l e   w  
 	 	 	 	 o n   w . s u b j e c t   =   v . o b j e c t  
 	 	 	 	 a n d   w . p r e d i c a t e   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # t y p e ' )    
 	 	 	 	 a n d   w . o b j e c t   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # C l a s s ' )  
 	 	 w h e r e   t . p r e d i c a t e   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # t y p e ' )    
 	 	 	 a n d   t . o b j e c t   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # C l a s s ' )    
 	 	 g r o u p   b y   t . s u b j e c t  
 	 )  
 	 i n s e r t   i n t o   @ C l a s s D e p t h s   ( N o d e I D ,   S u b C l a s s O f ,   D e p t h ,   C l a s s U R I )  
 	 	 s e l e c t   x . N o d e I D ,   x . S u b C l a s s O f ,   ( c a s e   w h e n   x . S u b C l a s s O f   i s   n u l l   t h e n   0   e l s e   n u l l   e n d )   D e p t h ,   n . V a l u e  
 	 	 f r o m   x ,   [ R D F . ] . N o d e   n  
 	 	 w h e r e   x . N o d e I D   =   n . N o d e I D  
 	 ; w i t h   a   a s   (  
 	 	 s e l e c t   N o d e I D ,   S u b C l a s s O f ,   D e p t h  
 	 	 	 f r o m   @ C l a s s D e p t h s  
 	 	 u n i o n   a l l  
 	 	 s e l e c t   b . N o d e I D ,   I s N u l l ( a . N o d e I D , b . S u b C l a s s O f ) ,   a . D e p t h + 1  
 	 	 	 f r o m   a ,   @ C l a s s D e p t h s   b  
 	 	 	 w h e r e   b . S u b C l a s s O f   =   a . N o d e I D  
 	 	 	 	 a n d   a . D e p t h   i s   n o t   n u l l  
 	 	 	 	 a n d   b . D e p t h   i s   n u l l  
 	 ) ,   b   a s   (  
 	 	 s e l e c t   N o d e I D ,   S u b C l a s s O f ,   M a x ( D e p t h )   D e p t h  
 	 	 f r o m   a  
 	 	 g r o u p   b y   N o d e I D ,   S u b C l a s s O f  
 	 )  
 	 u p d a t e   c  
 	 	 s e t   c . D e p t h   =   b . D e p t h  
 	 	 f r o m   @ C l a s s D e p t h s   c ,   b  
 	 	 w h e r e   c . N o d e I D   =   b . N o d e I D  
 	 ; w i t h   a   a s   (  
 	 	 s e l e c t   c . N o d e I D ,   m a x ( n . V a l u e )   C l a s s N a m e  
 	 	 	 f r o m   @ C l a s s D e p t h s   c  
 	 	 	 	 i n n e r   j o i n   [ R D F . ] . T r i p l e   t  
 	 	 	 	 	 o n   t . s u b j e c t   =   c . N o d e I D  
 	 	 	 	 	 	 a n d   t . p r e d i c a t e   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # l a b e l ' )  
 	 	 	 	 i n n e r   j o i n   [ R D F . ] . N o d e   n  
 	 	 	 	 	 o n   t . o b j e c t   =   n . N o d e I D  
 	 	 	 g r o u p   b y   c . N o d e I D  
 	 )  
 	 u p d a t e   c  
 	 	 s e t   c . C l a s s N a m e   =   a . C l a s s N a m e  
 	 	 f r o m   @ C l a s s D e p t h s   c ,   a  
 	 	 w h e r e   c . N o d e I D   =   a . N o d e I D  
 	 t r u n c a t e   t a b l e   [ O n t o l o g y . ] . C l a s s T r e e D e p t h  
 	 i n s e r t   i n t o   [ O n t o l o g y . ] . C l a s s T r e e D e p t h   ( C l a s s ,   _ T r e e D e p t h ,   _ C l a s s N o d e ,   _ C l a s s N a m e )  
 	 	 s e l e c t   C l a s s U R I ,   D e p t h ,   N o d e I D ,   C l a s s N a m e  
 	 	 	 f r o m   @ C l a s s D e p t h s  
  
 	 - -   P r o p e r t y G r o u p  
 	 U P D A T E   o  
 	 	 S E T 	 _ P r o p e r t y G r o u p N o d e   =   [ R D F . ] . f n U R I 2 N o d e I D ( P r o p e r t y G r o u p U R I )  
 	 	 F R O M   [ O n t o l o g y . ] . P r o p e r t y G r o u p   o  
 	 U P D A T E   e  
 	 	 S E T   e . _ P r o p e r t y G r o u p L a b e l   =   o . v a l u e  
 	 	 F R O M   [ o n t o l o g y . ] . P r o p e r t y G r o u p   e  
 	 	 	 L E F T   O U T E R   J O I N   [ R D F . ] . [ T r i p l e ]   t  
 	 	 	 	 O N   e . _ P r o p e r t y G r o u p N o d e   =   t . s u b j e c t   A N D   t . p r e d i c a t e   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # l a b e l ' )    
 	 	 	 L E F T   O U T E R   J O I N   [ R D F . ] . [ N o d e ]   o  
 	 	 	 	 O N   t . o b j e c t   =   o . n o d e i d  
  
 	 - -   P r o p e r t y G r o u p P r o p e r t y  
 	 U P D A T E   o  
 	 	 S E T 	 _ P r o p e r t y G r o u p N o d e   =   [ R D F . ] . f n U R I 2 N o d e I D ( P r o p e r t y G r o u p U R I ) ,  
 	 	 	 _ P r o p e r t y N o d e   =   [ R D F . ] . f n U R I 2 N o d e I D ( P r o p e r t y U R I ) ,  
 	 	 	 _ T a g N a m e   =   ( s e l e c t   t o p   1   n . P r e f i x + ' : ' + s u b s t r i n g ( o . P r o p e r t y U R I , l e n ( n . U R I ) + 1 , l e n ( o . P r o p e r t y U R I ) )   t  
 	 	 	 	 	 	 f r o m   [ O n t o l o g y . ] . N a m e s p a c e   n  
 	 	 	 	 	 	 w h e r e   o . P r o p e r t y U R I   l i k e   n . u r i + ' % '  
 	 	 	 	 	 	 )  
 	 	 F R O M   [ O n t o l o g y . ] . P r o p e r t y G r o u p P r o p e r t y   o  
 	 U P D A T E   e  
 	 	 S E T   e . _ P r o p e r t y L a b e l   =   o . v a l u e  
 	 	 F R O M   [ o n t o l o g y . ] . P r o p e r t y G r o u p P r o p e r t y   e  
 	 	 	 L E F T   O U T E R   J O I N   [ R D F . ] . [ T r i p l e ]   t  
 	 	 	 	 O N   e . _ P r o p e r t y N o d e   =   t . s u b j e c t   A N D   t . p r e d i c a t e   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # l a b e l ' )    
 	 	 	 L E F T   O U T E R   J O I N   [ R D F . ] . [ N o d e ]   o  
 	 	 	 	 O N   t . o b j e c t   =   o . n o d e i d  
  
  
 	 - -   P r e s e n t a t i o n  
 	 U P D A T E   o  
 	 	 S E T 	 _ S u b j e c t N o d e   =   [ R D F . ] . f n U R I 2 N o d e I D ( s u b j e c t ) ,  
 	 	 	 _ P r e d i c a t e N o d e   =   [ R D F . ] . f n U R I 2 N o d e I D ( p r e d i c a t e ) ,  
 	 	 	 _ O b j e c t N o d e   =   [ R D F . ] . f n U R I 2 N o d e I D ( o b j e c t )  
 	 	 F R O M   [ O n t o l o g y . P r e s e n t a t i o n ] . [ X M L ]   o  
  
  
 	 - -   s e l e c t   *   f r o m   [ O n t o l o g y . I m p o r t ] . [ T r i p l e ]  
 	 - -   s e l e c t   *   f r o m   [ O n t o l o g y . ] . C l a s s P r o p e r t y  
 	 - -   s e l e c t   *   f r o m   [ O n t o l o g y . ] . C l a s s G r o u p  
 	 - -   s e l e c t   *   f r o m   [ O n t o l o g y . ] . C l a s s G r o u p C l a s s  
 	 - -   s e l e c t   *   f r o m   [ O n t o l o g y . ] . C l a s s T r e e D e p t h  
 	 - -   s e l e c t   *   f r o m   [ O n t o l o g y . ] . P r o p e r t y G r o u p  
 	 - -   s e l e c t   *   f r o m   [ O n t o l o g y . ] . P r o p e r t y G r o u p P r o p e r t y  
 	 - -   s e l e c t   *   f r o m   [ O n t o l o g y . P r e s e n t a t i o n ] . [ X M L ]  
  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A l t e r i n g   [ P r o f i l e . D a t a ] . [ v w P e r s o n . P h o t o ] '  
 G O  
  
  
 A L T E R   V I E W   [ P r o f i l e . D a t a ] . [ v w P e r s o n . P h o t o ]  
 A S  
 S E L E C T   p . * ,   m . N o d e I D ,   o . V a l u e + ' M o d u l e s / C u s t o m V i e w P e r s o n G e n e r a l I n f o / P h o t o H a n d l e r . a s h x ? N o d e I D = ' + C A S T ( m . N o d e I D   a s   v a r c h a r ( 5 0 ) )   U R I  
 F R O M   [ P r o f i l e . D a t a ] . [ P e r s o n . P h o t o ]   p  
 	 I N N E R   J O I N   [ R D F . S t a g e ] . [ I n t e r n a l N o d e M a p ]   m  
 	 	 O N   m . C l a s s   =   ' h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / P e r s o n '  
 	 	 	 A N D   m . I n t e r n a l T y p e   =   ' P e r s o n '  
 	 	 	 A N D   m . I n t e r n a l I D   =   C A S T ( p . P e r s o n I D   a s   v a r c h a r ( 5 0 ) )  
 	 I N N E R   J O I N   [ F r a m e w o r k . ] . [ P a r a m e t e r ]   o  
 	 	 O N   o . P a r a m e t e r I D   =   ' b a s e U R I '  
  
  
  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A l t e r i n g   [ R D F . ] . [ G e t S t o r e N o d e ] '  
 G O  
 A L T E R   p r o c e d u r e   [ R D F . ] . [ G e t S t o r e N o d e ]  
 	 - -   C a t 0  
 	 @ E x i s t i n g N o d e I D   b i g i n t   =   n u l l ,  
 	 - -   C a t 1  
 	 @ V a l u e   n v a r c h a r ( m a x )   =   n u l l ,  
 	 @ L a n g u a g e   n v a r c h a r ( 2 5 5 )   =   n u l l ,  
 	 @ D a t a T y p e   n v a r c h a r ( 2 5 5 )   =   n u l l ,  
 	 @ O b j e c t T y p e   b i t   =   n u l l ,  
 	 - -   C a t 2  
 	 @ C l a s s   n v a r c h a r ( 4 0 0 )   =   n u l l ,  
 	 @ I n t e r n a l T y p e   n v a r c h a r ( 1 0 0 )   =   n u l l ,  
 	 @ I n t e r n a l I D   n v a r c h a r ( 1 0 0 )   =   n u l l ,  
 	 - -   C a t 3  
 	 @ T r i p l e I D   b i g i n t   =   n u l l ,  
 	 - -   C a t 5 ,   C a t 6  
 	 @ S t a r t T i m e   n v a r c h a r ( 1 0 0 )   =   n u l l ,  
 	 @ E n d T i m e   n v a r c h a r ( 1 0 0 )   =   n u l l ,  
 	 @ T i m e P r e c i s i o n   n v a r c h a r ( 1 0 0 )   =   n u l l ,  
 	 - -   C a t 7  
 	 @ D e f a u l t U R I   b i t   =   n u l l ,  
 	 - -   C a t 8  
 	 @ E n t i t y C l a s s I D   b i g i n t   =   n u l l ,  
 	 @ E n t i t y C l a s s U R I   v a r c h a r ( 4 0 0 )   =   n u l l ,  
 	 @ L a b e l   n v a r c h a r ( m a x )   =   n u l l ,  
 	 @ F o r c e N e w E n t i t y   b i t   =   0 ,  
 	 - -   A t t r i b u t e s  
 	 @ V i e w S e c u r i t y G r o u p   b i g i n t   =   n u l l ,  
 	 @ E d i t S e c u r i t y G r o u p   b i g i n t   =   n u l l ,  
 	 - -   S e c u r i t y  
 	 @ S e s s i o n I D   u n i q u e i d e n t i f i e r   =   N U L L ,  
 	 - -   O u t p u t   v a r i a b l e s  
 	 @ E r r o r   b i t   =   N U L L   O U T P U T ,  
 	 @ N o d e I D   b i g i n t   =   N U L L   O U T P U T  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
    
 	 / *    
 	 T h e   n o d e   c a n   b e   d e f i n e d   i n   d i f f e r e n t   w a y s :  
 	 	 C a t   0 :   E x i s t i n g N o d e I D   ( a   N o d e I D   f r o m   [ R D F . ] . N o d e )  
 	 	 C a t   1 :   V a l u e ,   L a n g u a g e ,   D a t a T y p e ,   O b j e c t T y p e   ( s t a n d a r d   R D F   l i t e r a l   [ O b j e c t T y p e = 1 ] ,   o r   j u s t   V a l u e   i f   U R I   [ O b j e c t T y p e = 0 ] )  
 	 	 C a t   2 :   N o d e T y p e   ( p r i m a r y   V I V O   t y p e ,   h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / P e r s o n ) ,   I n t e r n a l T y p e   ( P r o f i l e s 1 0   t y p e ,   s u c h   a s   " P e r s o n " ) ,   I n t e r n a l I D   ( p e r s o n I D = 3 2 2 1 3 )  
 	 	 C a t   3 :   T r i p l e I D   ( f r o m   [ R D F . ] . T r i p l e   - -   a   r e i t i f i c a t i o n )  
 	 	 C a t   5 :   S t a r t T i m e ,   E n d T i m e ,   T i m e P r e c i s i o n   ( V I V O ' s   D a t e T i m e I n t e r v a l ,   D a t e T i m e V a l u e ,   a n d   D a t e T i m e V a l u e P r e c i s i o n   c l a s s e s )  
 	 	 C a t   6 :   S t a r t T i m e ,   T i m e P r e c i s i o n   ( V I V O ' s   D a t e T i m e V a l u e ,   a n d   D a t e T i m e V a l u e P r e c i s i o n   c l a s s e s )  
 	 	 C a t   7 :   T h e   d e f a u l t   U R I :   b a s e U R I + N o d e I D  
 	 	 C a t   8 :   N e w   e n t i t y   w i t h   c l a s s   ( b y   n o d e   I D   o r   U R I )   a n d   l a b e l ;   F o r c e N e w E n t i t y = 1   a l w a y s   c r e a t e s   a   n e w   n o d e  
 	 * /  
  
 	 S E L E C T   @ E r r o r   =   0  
 	  
 	 S E L E C T   @ E x i s t i n g N o d e I D   =   N U L L   W H E R E   @ E x i s t i n g N o d e I D   =   0  
 	 S E L E C T   @ T r i p l e I D   =   N U L L   W H E R E   @ T r i p l e I D   =   0  
    
   	 I F   ( @ E n t i t y C l a s s I D   I S   N U L L )   A N D   ( @ E n t i t y C l a s s U R I   I S   N O T   N U L L )  
 	 	 S E L E C T   @ E n t i t y C l a s s I D   =   [ R D F . ] . f n U R I 2 N o d e I D ( @ E n t i t y C l a s s U R I )  
    
 	 - -   D e t e r m i n e   t h e   c a t e g o r y  
 	 D E C L A R E   @ C a t e g o r y   I N T  
 	 S E L E C T   @ C a t e g o r y   =   (  
 	 	 C A S E  
 	 	 	 W H E N   ( @ E x i s t i n g N o d e I D   I S   N O T   N U L L )   T H E N   0  
 	 	 	 W H E N   ( @ V a l u e   I S   N O T   N U L L )   T H E N   1  
 	 	 	 W H E N   ( ( @ C l a s s   I S   N O T   N U L L )   A N D   ( @ I n t e r n a l T y p e   I S   N O T   N U L L )   A N D   ( @ I n t e r n a l I D   I S   N O T   N U L L ) )   T H E N   2  
 	 	 	 W H E N   ( @ T r i p l e I D   I S   N O T   N U L L )   T H E N   3  
 	 	 	 W H E N   ( ( @ S t a r t T i m e   I S   N O T   N U L L )   A N D   ( @ E n d T i m e   I S   N O T   N U L L )   A N D   ( @ T i m e P r e c i s i o n   I S   N O T   N U L L ) )   T H E N   5  
 	 	 	 W H E N   ( ( @ S t a r t T i m e   I S   N O T   N U L L )   A N D   ( @ T i m e P r e c i s i o n   I S   N O T   N U L L ) )   T H E N   6  
 	 	 	 W H E N   ( @ D e f a u l t U R I   =   1 )   T H E N   7  
 	 	 	 W H E N   ( ( @ E n t i t y C l a s s I D   I S   N O T   N U L L )   A N D   ( I s N u l l ( @ L a b e l , ' ' ) < > ' ' ) )   T H E N   8  
 	 	 	 E L S E   N U L L   E N D )  
  
 	 I F   @ C a t e g o r y   I S   N U L L  
 	 B E G I N  
 	 	 S E L E C T   @ E r r o r   =   1  
 	 	 R E T U R N  
 	 E N D  
 	  
 	 - -   D e t e r m i n e   i f   t h e   n o d e   a l r e a d y   e x i s t s  
 	 S E L E C T   @ N o d e I D   =   ( C A S E  
 	 	 W H E N   @ C a t e g o r y   =   0   T H E N   (  
 	 	 	 	 S E L E C T   N o d e I D  
 	 	 	 	 F R O M   [ R D F . ] . [ N o d e ]  
 	 	 	 	 W H E R E   N o d e I D   =   @ E x i s t i n g N o d e I D  
 	 	 	 )  
 	 	 W H E N   @ C a t e g o r y   =   1   T H E N   (  
 	 	 	 	 S E L E C T   N o d e I D  
 	 	 	 	 F R O M   [ R D F . ] . [ N o d e ]  
 	 	 	 	 W H E R E   V a l u e H a s h   =   [ R D F . ] . [ f n V a l u e H a s h ] ( @ L a n g u a g e , @ D a t a T y p e , @ V a l u e )  
 	 	 	 )  
 	 	 W H E N   @ C a t e g o r y   =   2   T H E N   (  
 	 	 	 	 S E L E C T   N o d e I D  
 	 	 	 	 F R O M   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p  
 	 	 	 	 W H E R E   C l a s s   =   @ C l a s s   A N D   I n t e r n a l T y p e   =   @ I n t e r n a l T y p e   A N D   I n t e r n a l I D   =   @ I n t e r n a l I D  
 	 	 	 )  
 	 	 W H E N   @ C a t e g o r y   =   8   T H E N   (  
 	 	 	 	 S E L E C T   N o d e I D  
 	 	 	 	 F R O M   [ R D F . ] . T r i p l e   t ,   [ R D F . ] . T r i p l e   v ,   [ R D F . ] . N o d e   n  
 	 	 	 	 W H E R E   t . s u b j e c t   =   v . s u b j e c t  
 	 	 	 	 	 A N D   t . p r e d i c a t e   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # t y p e ' )  
 	 	 	 	 	 A N D   t . o b j e c t   =   @ E n t i t y C l a s s I D  
 	 	 	 	 	 A N D   v . p r e d i c a t e   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # l a b e l ' )  
 	 	 	 	 	 A N D   v . o b j e c t   =   n . N o d e I D  
 	 	 	 	 	 A N D   n . V a l u e H a s h   =   [ R D F . ] . [ f n V a l u e H a s h ] ( n u l l , n u l l , @ L a b e l )  
 	 	 	 	 	 A N D   @ F o r c e N e w E n t i t y   =   0  
 	 	 	 )  
 	 	 E L S E   N U L L   E N D )  
  
 	 - -   U p d a t e   a t t r i b u t e s   o f   a n   e x i s t i n g   n o d e  
 	 I F   ( @ N o d e I D   I S   N O T   N U L L )   A N D   ( I s N u l l ( @ V i e w S e c u r i t y G r o u p , @ E d i t S e c u r i t y G r o u p )   I S   N O T   N U L L )  
 	 B E G I N  
 	 	 U P D A T E   [ R D F . ] . N o d e  
 	 	 	 S E T   V i e w S e c u r i t y G r o u p   =   I s N u l l ( @ V i e w S e c u r i t y G r o u p , V i e w S e c u r i t y G r o u p ) ,  
 	 	 	 	 E d i t S e c u r i t y G r o u p   =   I s N u l l ( @ E d i t S e c u r i t y G r o u p , E d i t S e c u r i t y G r o u p )  
 	 	 	 W H E R E   N o d e I D   =   @ N o d e I D  
 	 E N D  
 	  
 	 - -   C h e c k   t h a t   i f   a   n e w   n o d e   i s   n e e d e d ,   t h e n   a l l   a t t r i b u t e s   a r e   d e f i n e d  
 	 I F   ( @ N o d e I D   I S   N U L L )  
 	 B E G I N  
 	 	 S E L E C T 	 @ V i e w S e c u r i t y G r o u p   =   I s N u l l ( @ V i e w S e c u r i t y G r o u p , - 1 ) ,  
 	 	 	 	 @ E d i t S e c u r i t y G r o u p   =   I s N u l l ( @ E d i t S e c u r i t y G r o u p , - 4 0 )  
 	 	 S E L E C T 	 @ O b j e c t T y p e   =   ( C A S E   W H E N   @ V a l u e   L I K E   ' h t t p : / / % '   o r   @ V a l u e   L I K E   ' h t t p s : / / % '   T H E N   0   E L S E   1   E N D )  
 	 	 	 W H E R E   ( @ C a t e g o r y = 1   A N D   @ O b j e c t T y p e   I S   N U L L )  
 	 E N D  
  
 	 - -   C r e a t e   a   n e w   n o d e   i f   n e e d e d  
 	 I F   ( @ N o d e I D   I S   N U L L ) 	  
 	 B E G I N  
 	 	 B E G I N   T R Y    
 	 	 B E G I N   T R A N S A C T I O N  
 	 	  
 	 	 - -   L o o k u p   t h e   b a s e   U R I  
 	 	 D E C L A R E   @ b a s e U R I   N V A R C H A R ( 4 0 0 )  
 	 	 S E L E C T   @ b a s e U R I   =   V a l u e   F R O M   [ F r a m e w o r k . ] . P a r a m e t e r   W H E R E   P a r a m e t e r I D   =   ' b a s e U R I '  
  
 	 	 - -   C r e a t e   n o d e   b a s e d   o n   c a t e g o r y  
 	 	 I F   @ C a t e g o r y   =   1  
 	 	 	 B E G I N  
 	 	 	 	 I N S E R T   I N T O   [ R D F . ] . [ N o d e ]   ( V i e w S e c u r i t y G r o u p ,   E d i t S e c u r i t y G r o u p ,   L a n g u a g e ,   D a t a T y p e ,   V a l u e ,   O b j e c t T y p e ,   V a l u e H a s h )  
 	 	 	 	 	 S E L E C T   @ V i e w S e c u r i t y G r o u p ,   @ E d i t S e c u r i t y G r o u p ,   @ L a n g u a g e ,   @ D a t a T y p e ,   @ V a l u e ,   @ O b j e c t T y p e ,  
 	 	 	 	 	 	 [ R D F . ] . [ f n V a l u e H a s h ] ( @ L a n g u a g e , @ D a t a T y p e , @ V a l u e )  
 	 	 	 	 S E T   @ N o d e I D   =   @ @ I D E N T I T Y  
 	 	 	 E N D  
 	 	 I F   @ C a t e g o r y   =   2  
 	 	 	 B E G I N  
 	 	 	 	 - -   C r e a t e   t h e   I n t e r n a l N o d e M a p   r e c o r d  
 	 	 	 	 D E C L A R E   @ I n t e r n a l N o d e M a p I D   B I G I N T  
 	 	 	 	 I N S E R T   I N T O   [ R D F . S t a g e ] . [ I n t e r n a l N o d e M a p ]   ( I n t e r n a l T y p e ,   I n t e r n a l I D ,   N o d e T y p e ,   S t a t u s ,   I n t e r n a l H a s h )  
 	 	 	 	 	 S E L E C T   @ I n t e r n a l T y p e ,   @ I n t e r n a l I D ,   @ C l a s s ,   4 ,    
 	 	 	 	 	 	 [ R   D F . ] . f n V a l u e H a s h ( n u l l , n u l l , @ C l a s s + ' ^ ^ ' + @ I n t e r n a l T y p e + ' ^ ^ ' + @ I n t e r n a l I D )  
 	 	 	 	 S E T   @ I n t e r n a l N o d e M a p I D   =   @ @ I D E N T I T Y  
 	 	 	 	 - -   C r e a t e   t h e   N o d e  
 	 	 	 	 I N S E R T   I N T O   [ R D F . ] . [ N o d e ]   ( V i e w S e c u r i t y G r o u p ,   E d i t S e c u r i t y G r o u p ,   I n t e r n a l N o d e M a p I D ,   O b j e c t T y p e ,   V a l u e ,   V a l u e H a s h )  
 	 	 	 	 	 S E L E C T   @ V i e w S e c u r i t y G r o u p ,   @ E d i t S e c u r i t y G r o u p ,   @ I n t e r n a l N o d e M a p I D ,   0 ,  
 	 	 	 	 	 	 ' # I N M ' + c a s t ( @ I n t e r n a l N o d e M a p I D   a s   n v a r c h a r ( 5 0 ) ) ,  
 	 	 	 	 	 	 [ R D F . ] . f n V a l u e H a s h ( n u l l , n u l l , ' # I N M ' + c a s t ( @ I n t e r n a l N o d e M a p I D   a s   n v a r c h a r ( 5 0 ) ) )  
 	 	 	 	 S E T   @ N o d e I D   =   @ @ I D E N T I T Y  
 	 	 	 	 - -   U p d a t e   t h e   I n t e r n a l N o d e M a p ,   g i v e n   t h e   N o d e I D  
 	 	 	 	 U P D A T E   [ R D F . S t a g e ] . [ I n t e r n a l N o d e M a p ]  
 	 	 	 	 	 S E T   N o d e I D   =   @ N o d e I D ,   S t a t u s   =   0 ,  
 	 	 	 	 	 	 V a l u e H a s h   =   [ R D F . ] . f n V a l u e H a s h ( n u l l , n u l l , @ b a s e U R I + c a s t ( @ N o d e I D   a s   n v a r c h a r ( 5 0 ) ) )  
 	 	 	 	 	 W H E R E   I n t e r n a l N o d e M a p I D   =   @ I n t e r n a l N o d e M a p I D  
 	 	 	 	 - -   U p d a t e   t h e   N o d e ,   g i v e n   t h e   N o d e I D  
 	 	 	 	 U P D A T E   [ R D F . ] . [ N o d e ]  
 	 	 	 	 	 S E T   V a l u e   =   @ b a s e U R I + c a s t ( @ N o d e I D   a s   n v a r c h a r ( 5 0 ) ) ,  
 	 	 	 	 	 	 V a l u e H a s h   =   [ R D F . ] . f n V a l u e H a s h ( n u l l , n u l l , @ b a s e U R I + c a s t ( @ N o d e I D   a s   n v a r c h a r ( 5 0 ) ) )  
 	 	 	 	 	 W H E R E   N o d e I D   =   @ N o d e I D  
 	 	 	 E N D  
 	 	 I F   @ C a t e g o r y   =   7  
 	 	 	 B E G I N  
 	 	 	 	 - -   C r e a t e   t h e   N o d e  
 	 	 	 	 D E C L A R E   @ T e m p V a l u e   v a r c h a r ( 5 0 )  
 	 	 	 	 S E L E C T   @ T e m p V a l u e   =   ' # N O D E ' + c a s t ( N e w I D ( )   a s   v a r c h a r ( 5 0 ) )  
 	 	 	 	 I N S E R T   I N T O   [ R D F . ] . [ N o d e ]   ( V i e w S e c u r i t y G r o u p ,   E d i t S e c u r i t y G r o u p ,   V a l u e ,   O b j e c t T y p e ,   V a l u e H a s h )  
 	 	 	 	 	 S E L E C T   @ V i e w S e c u r i t y G r o u p ,   @ E d i t S e c u r i t y G r o u p ,   @ T e m p V a l u e ,   0 ,   [ R D F . ] . [ f n V a l u e H a s h ] ( N U L L , N U L L , @ T e m p V a l u e )  
 	 	 	 	 S E T   @ N o d e I D   =   @ @ I D E N T I T Y  
 	 	 	 	 - -   U p d a t e   t h e   N o d e ,   g i v e n   t h e   N o d e I D  
 	 	 	 	 U P D A T E   [ R D F . ] . [ N o d e ]  
 	 	 	 	 	 S E T   V a l u e   =   @ b a s e U R I + c a s t ( @ N o d e I D   a s   n v a r c h a r ( 5 0 ) ) ,  
 	 	 	 	 	 	 V a l u e H a s h   =   [ R D F . ] . f n V a l u e H a s h ( n u l l , n u l l , @ b a s e U R I + c a s t ( @ N o d e I D   a s   n v a r c h a r ( 5 0 ) ) )  
 	 	 	 	 	 W H E R E   N o d e I D   =   @ N o d e I D  
 	 	 	 E N D  
 	 	 I F   @ C a t e g o r y   =   8  
 	 	 	 B E G I N  
 	 	 	 	 - -   C r e a t e   t h e   n e w   n o d e  
 	 	 	 	 E X E C   [ R D F . ] . G e t S t o r e N o d e 	 @ D e f a u l t U R I   =   1 ,  
 	 	 	 	 	 	 	 	 	 	 	 @ V i e w S e c u r i t y G r o u p   =   @ V i e w S e c u r i t y G r o u p ,  
 	 	 	 	 	 	 	 	 	 	 	 @ E d i t S e c u r i t y G r o u p   =   @ E d i t S e c u r i t y G r o u p ,  
 	 	 	 	 	 	 	 	 	 	 	 @ S e s s i o n I D   =   @ S e s s i o n I D ,  
 	 	 	 	 	 	 	 	 	 	 	 @ E r r o r   =   @ E r r o r   O U T P U T ,  
 	 	 	 	 	 	 	 	 	 	 	 @ N o d e I D   =   @ N o d e I D   O U T P U T  
 	 	 	 	 I F   @ E r r o r   =   1  
 	 	 	 	 B E G I N  
 	 	 	 	 	 R E T U R N  
 	 	 	 	 E N D  
 	 	 	 	 - -   C o n v e r t   U R I s   t o   N o d e I D s  
 	 	 	 	 D E C L A R E   @ T y p e I D   B I G I N T  
 	 	 	 	 D E C L A R E   @ L a b e l I D   B I G I N T  
 	 	 	 	 D E C L A R E   @ C l a s s I D   B I G I N T  
 	 	 	 	 D E C L A R E   @ S u b C l a s s I D   B I G I N T  
 	 	 	 	 S E L E C T 	 @ T y p e I D   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # t y p e ' ) ,  
 	 	 	 	 	 	 @ L a b e l I D   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # l a b e l ' ) ,  
 	 	 	 	 	 	 @ C l a s s I D   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # C l a s s ' ) ,  
 	 	 	 	 	 	 @ S u b C l a s s I D   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # s u b C l a s s O f ' )  
 	 	 	 	 - -   A d d   c l a s s ( e s )   t o   n e w   n o d e  
 	 	 	 	 D E C L A R E   @ T e m p C l a s s I D   B I G I N T  
 	 	 	 	 S E L E C T   @ T e m p C l a s s I D   =   @ E n t i t y C l a s s I D  
 	 	 	 	 W H I L E   ( @ T e m p C l a s s I D   I S   N O T   N U L L )  
 	 	 	 	 B E G I N  
 	 	 	 	 	 E X E C   [ R D F . ] . G e t S t o r e T r i p l e 	 @ S u b j e c t I D   =   @ N o d e I D ,  
 	 	 	 	 	 	 	 	 	 	 	 	 @ P r e d i c a t e I D   =   @ T y p e I D ,  
 	 	 	 	 	 	 	 	 	 	 	 	 @ O b j e c t I D   =   @ T e m p C l a s s I D ,  
 	 	 	 	 	 	 	 	 	 	 	 	 @ V i e w S e c u r i t y G r o u p   =   - 1 ,  
 	 	 	 	 	 	 	 	 	 	 	 	 @ W e i g h t   =   1 ,  
 	 	 	 	 	 	 	 	 	 	 	 	 @ S e s s i o n I D   =   @ S e s s i o n I D ,  
 	 	 	 	 	 	 	 	 	 	 	 	 @ E r r o r   =   @ E r r o r   O U T P U T  
 	 	 	 	 	 I F   @ E r r o r   =   1  
 	 	 	 	 	 B E G I N  
 	 	 	 	 	 	 R E T U R N  
 	 	 	 	 	 E N D  
 	 	 	 	 	 - -   D e t e r m i n e   i f   t h e r e   i s   a   p a r e n t   c l a s s  
 	 	 	 	 	 S E L E C T   @ T e m p C l a s s I D   =   (  
 	 	 	 	 	 	 	 S E L E C T   T O P   1   t . o b j e c t  
 	 	 	 	 	 	 	 F R O M   [ R D F . ] . T r i p l e   t ,   [ R D F . ] . T r i p l e   c  
 	 	 	 	 	 	 	 W H E R E   t . s u b j e c t   =   @ T e m p C l a s s I D  
 	 	 	 	 	 	 	 	 A N D   t . p r e d i c a t e   =   @ S u b C l a s s I D  
 	 	 	 	 	 	 	 	 A N D   c . s u b j e c t   =   t . o b j e c t  
 	 	 	 	 	 	 	 	 A N D   c . p r e d i c a t e   =   @ T y p e I D  
 	 	 	 	 	 	 	 	 A N D   c . o b j e c t   =   @ C l a s s I D  
 	 	 	 	 	 	 	 	 A N D   N O T   E X I S T S   (  
 	 	 	 	 	 	 	 	 	 S E L E C T   *  
 	 	 	 	 	 	 	 	 	 F R O M   [ R D F . ] . T r i p l e   v  
 	 	 	 	 	 	 	 	 	 W H E R E   v . s u b j e c t   =   @ N o d e I D  
 	 	 	 	 	 	 	 	 	 	 A N D   v . p r e d i c a t e   =   @ T y p e I D  
 	 	 	 	 	 	 	 	 	 	 A N D   v . o b j e c t   =   t . o b j e c t  
 	 	 	 	 	 	 	 	 )  
 	 	 	 	 	 	 )  
 	 	 	 	 E N D  
 	 	 	 	 - -   G e t   n o d e   I D   f o r   l a b e l  
 	 	 	 	 D E C L A R E   @ L a b e l N o d e I D   B I G I N T  
 	 	 	 	 E X E C   [ R D F . ] . G e t S t o r e N o d e 	 @ V a l u e   =   @ L a b e l ,  
 	 	 	 	 	 	 	 	 	 	 	 @ O b j e c t T y p e   =   1 ,  
 	 	 	 	 	 	 	 	 	 	 	 @ V i e w S e c u r i t y G r o u p   =   - 1 ,  
 	 	 	 	 	 	 	 	 	 	 	 @ E d i t S e c u r i t y G r o u p   =   - 4 0 ,  
 	 	 	 	 	 	 	 	 	 	 	 @ S e s s i o n I D   =   @ S e s s i o n I D ,  
 	 	 	 	 	 	 	 	 	 	 	 @ E r r o r   =   @ E r r o r   O U T P U T ,  
 	 	 	 	 	 	 	 	 	 	 	 @ N o d e I D   =   @ L a b e l N o d e I D   O U T P U T  
 	 	 	 	 I F   @ E r r o r   =   1  
 	 	 	 	 B E G I N  
 	 	 	 	 	 R E T U R N  
 	 	 	 	 E N D  
 	 	 	 	 - -   A d d   l a b e l   t o   n e w   n o d e  
 	 	 	 	 E X E C   [ R D F . ] . G e t S t o r e T r i p l e 	 @ S u b j e c t I D   =   @ N o d e I D ,  
 	 	 	 	 	 	 	 	 	 	 	 @ P r e d i c a t e I D   =   @ L a b e l I D ,  
 	 	 	 	 	 	 	 	 	 	 	 @ O b j e c t I D   =   @ L a b e l N o d e I D ,  
 	 	 	 	 	 	 	 	 	 	 	 @ V i e w S e c u r i t y G r o u p   =   - 1 ,  
 	 	 	 	 	 	 	 	 	 	 	 @ W e i g h t   =   1 ,  
 	 	 	 	 	 	 	 	 	 	 	 @ S o r t O r d e r   =   1 ,  
 	 	 	 	 	 	 	 	 	 	 	 @ S e s s i o n I D   =   @ S e s s i o n I D ,  
 	 	 	 	 	 	 	 	 	 	 	 @ E r r o r   =   @ E r r o r   O U T P U T  
 	 	 	 	 I F   @ E r r o r   =   1  
 	 	 	 	 B E G I N  
 	 	 	 	 	 R E T U R N  
 	 	 	 	 E N D  
 	 	 	 E N D  
  
 	 	 C O M M I T   T R A N S A C T I O N  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 D E C L A R E   @ E r r M s g   n v a r c h a r ( 4 0 0 0 ) ,   @ E r r S e v e r i t y   i n t  
 	 	 - - C h e c k   s u c c e s s  
 	 	 I F   @ @ T R A N C O U N T   >   0     R O L L B A C K  
    
 	 	 - -   R a i s e   a n   e r r o r   w i t h   t h e   d e t a i l s   o f   t h e   e x c e p t i o n  
 	 	 S E L E C T   @ E r r M s g   =     E R R O R _ M E S S A G E ( ) ,  
 	 	 	 	 	   @ E r r S e v e r i t y   =   E R R O R _ S E V E R I T Y ( )  
    
 	 	 R A I S E R R O R ( @ E r r M s g ,   @ E r r S e v e r i t y ,   1 )  
 	 	 	    
 	 E N D   C A T C H 	 	  
 	 E N D  
  
 E N D  
  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A l t e r i n g   [ U s e r . A c c o u n t ] . [ P r o x y . G e t P r o x i e s ] '  
 G O  
 A L T E R   P R O C E D U R E   [ U s e r . A c c o u n t ] . [ P r o x y . G e t P r o x i e s ]    
 	 @ S e s s i o n I D   U N I Q U E I D E N T I F I E R ,  
 	 @ O p e r a t i o n   V A R C H A R ( 5 0 )  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   n o c o u n t     O N ;  
  
  
 	 / * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 T h i s   s t o r e d   p r o c e d u r e   s u p p o r t s   t h r e e   o p e r a t i o n s :  
 	  
 	 1 )   G e t D e f a u l t U s e r s W h o s e N o d e s I C a n E d i t  
 	 2 )   G e t D e s i g n a t e d U s e r s W h o s e N o d e s I C a n E d i t  
 	 3 )   G e t A l l U s e r s W h o C a n E d i t M y N o d e s  
 	  
 	 O p e r a t i o n   # 1   r e t u r n s   a   l i s t   o f   o r g a n i z a t i o n s .  
 	 O p e r a t i o n s   # 2   a n d   # 3   r e t u r n   a   l i s t   o f   u s e r   a c c o u n t s ,   s o m e   o f  
 	     w h i c h   a l s o   h a v e   p e r s o n   p r o f i l e s   ( P e r s o n U R I ) .  
 	 O p e r a t i o n   # 3   a l s o   i n d i c a t e s   w h i c h   p r o x i e s   c a n   b e   d e l e t e d .  
 	 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * /  
 	  
 	  
 	 - -   G e t   t h e   U s e r I D   o f   t h e   S e s s i o n I D .   E x i t   i f   n o t   f o u n d .  
 	 D E C L A R E   @ S e s s i o n U s e r I D   I N T  
 	 S E L E C T   @ S e s s i o n U s e r I D   =   U s e r I D  
 	 	 F R O M   [ U s e r . S e s s i o n ] . [ S e s s i o n ]  
 	 	 W H E R E   S e s s i o n I D   =   @ S e s s i o n I D  
 	 I F   @ S e s s i o n U s e r I D   I S   N U L L  
 	 	 R E T U R N  
  
  
 	 I F   @ O p e r a t i o n   =   ' G e t D e f a u l t U s e r s W h o s e N o d e s I C a n E d i t '  
 	 	 S E L E C T   I n s t i t u t i o n ,   D e p a r t m e n t ,   D i v i s i o n ,   M A X ( I s V i s i b l e * 1 )   I s V i s i b l e  
 	 	 	 F R O M   (  
 	 	 	 	 - -   D e f a u l t   P r o x i e s  
 	 	 	 	 S E L E C T 	 ( c a s e   w h e n   I s N u l l ( P r o x y F o r I n s t i t u t i o n , ' ' ) = ' '   t h e n   ' A l l '   e l s e   P r o x y F o r I n s t i t u t i o n   e n d )   I n s t i t u t i o n ,  
 	 	 	 	 	 	 ( c a s e   w h e n   I s N u l l ( P r o x y F o r D e p a r t m e n t , ' ' ) = ' '   t h e n   ' A l l '   e l s e   P r o x y F o r D e p a r t m e n t   e n d )   D e p a r t m e n t ,  
 	 	 	 	 	 	 ( c a s e   w h e n   I s N u l l ( P r o x y F o r D i v i s i o n , ' ' ) = ' '   t h e n   ' A l l '   e l s e   P r o x y F o r D i v i s i o n   e n d )   D i v i s i o n ,  
 	 	 	 	 	 	 I s V i s i b l e  
 	 	 	 	 	 F R O M   [ U s e r . A c c o u n t ] . [ D e f a u l t P r o x y ]  
 	 	 	 	 	 W H E R E   U s e r I D   =   @ S e s s i o n U s e r I D  
 	 	 	 	 - -   S e c u r i t y   G r o u p s   w i t h   S p e c i a l   E d i t   A c c e s s  
 	 	 	 	 U N I O N   A L L  
 	 	 	 	 S E L E C T   ' A l l '   I n s t i t u t i o n ,   ' A l l '   D e p a r t m e n t ,   ' A l l '   D i v i s i o n ,   m . I s V i s i b l e  
 	 	 	 	 	 F R O M   [ R D F . S e c u r i t y ] . [ M e m b e r ]   m  
 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . S e c u r i t y ] . [ G r o u p ]   g  
 	 	 	 	 	 	 	 O N   m . S e c u r i t y G r o u p I D   =   g . S e c u r i t y G r o u p I D  
 	 	 	 	 	 	 	 A N D   g . H a s S p e c i a l E d i t A c c e s s   =   1  
 	 	 	 )   t  
 	 	 	 G R O U P   B Y   I n s t i t u t i o n ,   D e p a r t m e n t ,   D i v i s i o n  
 	 	 	 O R D E R   B Y 	 ( c a s e   w h e n   I n s t i t u t i o n   =   ' A l l '   t h e n   0   e l s e   1   e n d ) ,   I n s t i t u t i o n ,  
 	 	 	 	 	 	 ( c a s e   w h e n   D e p a r t m e n t   =   ' A l l '   t h e n   0   e l s e   1   e n d ) ,   D e p a r t m e n t ,  
 	 	 	 	 	 	 ( c a s e   w h e n   D i v i s i o n   =   ' A l l '   t h e n   0   e l s e   1   e n d ) ,   D i v i s i o n  
  
  
 	 I F   @ O p e r a t i o n   =   ' G e t D e s i g n a t e d U s e r s W h o s e N o d e s I C a n E d i t '  
 	 	 S E L E C T   u . U s e r I D ,   u . D i s p l a y N a m e ,   u . I n s t i t u t i o n ,   u . D e p a r t m e n t ,   u . E m a i l A d d r ,  
 	 	 	 	 o . V a l u e + c a s t ( p . N o d e I D   a s   v a r c h a r ( 5 0 ) )   P e r s o n U R I  
 	 	 	 F R O M   [ U s e r . A c c o u n t ] . [ U s e r ]   u  
 	 	 	 	 I N N E R   J O I N   (  
 	 	 	 	 	 - -   D e s i g n a t e d   P r o x i e s  
 	 	 	 	 	 S E L E C T   P r o x y F o r U s e r I D  
 	 	 	 	 	 	 F R O M   [ U s e r . A c c o u n t ] . [ D e s i g n a t e d P r o x y ]  
 	 	 	 	 	 	 W H E R E   U s e r I D   =   @ S e s s i o n U s e r I D  
 	 	 	 	 )   x   O N   u . U s e r I D   =   x . P r o x y F o r U s e r I D  
 	 	 	 	 I N N E R   J O I N   [ F r a m e w o r k . ] . P a r a m e t e r   o  
 	 	 	 	 	 O N   o . P a r a m e t e r I D   =   ' b a s e U R I '  
 	 	 	 	 L E F T   O U T E R   J O I N   [ R D F . S t a g e ] . [ I n t e r n a l N o d e M a p ]   p  
 	 	 	 	 	 O N   u . P e r s o n I D   I S   N O T   N U L L  
 	 	 	 	 	 	 A N D   c a s t ( u . P e r s o n I D   a s   v a r c h a r ( 5 0 ) )   =   p . I n t e r n a l I D  
 	 	 	 	 	 	 A N D   p . C l a s s   =   ' h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / P e r s o n '  
 	 	 	 	 	 	 A N D   p . I n t e r n a l T y p e   =   ' P e r s o n '  
 	 	 	 	 	 	 A N D   p . N o d e I D   I S   N O T   N U L L  
 	 	 	 O R D E R   B Y   u . L a s t N a m e ,   u . F i r s t N a m e  
  
  
 	 I F   @ O p e r a t i o n   =   ' G e t A l l U s e r s W h o C a n E d i t M y N o d e s '  
 	 	 S E L E C T   u . U s e r I D ,   u . D i s p l a y N a m e ,   u . I n s t i t u t i o n ,   u . D e p a r t m e n t ,   u . E m a i l A d d r ,    
 	 	 	 	 o . V a l u e + c a s t ( p . N o d e I D   a s   v a r c h a r ( 5 0 ) )   P e r s o n U R I ,   x . C a n D e l e t e  
 	 	 	 F R O M   [ U s e r . A c c o u n t ] . [ U s e r ]   u  
 	 	 	 	 I N N E R   J O I N   (  
 	 	 	 	 	 S E L E C T   U s e r I D ,   M I N ( C a n D e l e t e )   C a n D e l e t e  
 	 	 	 	 	 	 F R O M   (  
 	 	 	 	 	 	 	 - -   D e s i g n a t e d   P r o x i e s  
 	 	 	 	 	 	 	 S E L E C T   U s e r I D ,   1   C a n D e l e t e  
 	 	 	 	 	 	 	 	 F R O M   [ U s e r . A c c o u n t ] . [ D e s i g n a t e d P r o x y ]  
 	 	 	 	 	 	 	 	 W H E R E   P r o x y F o r U s e r I D   =   @ S e s s i o n U s e r I D  
 	 	 	 	 	 	 	 - -   D e f a u l t   P r o x i e s  
 	 	 	 	 	 	 	 U N I O N   A L L  
 	 	 	 	 	 	 	 S E L E C T   x . U s e r I D ,   0   C a n D e l e t e  
 	 	 	 	 	 	 	 	 F R O M   [ U s e r . A c c o u n t ] . [ D e f a u l t P r o x y ]   x  
 	 	 	 	 	 	 	 	 	 I N N E R   J O I N   [ U s e r . A c c o u n t ] . [ U s e r ]   u  
 	 	 	 	 	 	 	 	 	 	 O N   ( ( I s N u l l ( x . P r o x y F o r I n s t i t u t i o n , ' ' )   =   ' ' )    
 	 	 	 	 	 	 	 	 	 	 	 	 O R   ( I s N u l l ( x . P r o x y F o r I n s t i t u t i o n , ' ' )   =   I s N u l l ( u . I n s t i t u t i o n , ' ' ) ) )  
 	 	 	 	 	 	 	 	 	 	 A N D   ( ( I s N u l l ( x . P r o x y F o r D e p a r t m e n t , ' ' )   =   ' ' )    
 	 	 	 	 	 	 	 	 	 	 	 	 O R   ( I s N u l l ( x . P r o x y F o r D e p a r t m e n t , ' ' )   =   I s N u l l ( u . D e p a r t m e n t , ' ' ) ) )  
 	 	 	 	 	 	 	 	 	 	 A N D   ( ( I s N u l l ( x . P r o x y F o r D i v i s i o n , ' ' )   =   ' ' )    
 	 	 	 	 	 	 	 	 	 	 	 	 O R   ( I s N u l l ( x . P r o x y F o r D i v i s i o n , ' ' )   =   I s N u l l ( u . D i v i s i o n , ' ' ) ) )  
 	 	 	 	 	 	 	 	 	 	 A N D   u . U s e r I D   =   @ S e s s i o n U s e r I D  
 	 	 	 	 	 	 	 	 	 	 A N D   x . I s V i s i b l e   =   1  
 	 	 	 	 	 	 	 - -   S e c u r i t y   G r o u p s   w i t h   S p e c i a l   E d i t   A c c e s s  
 	 	 	 	 	 	 	 U N I O N   A L L  
 	 	 	 	 	 	 	 S E L E C T   m . U s e r I D ,   0   C a n D e l e t e  
 	 	 	 	 	 	 	 	 F R O M   [ R D F . S e c u r i t y ] . [ M e m b e r ]   m  
 	 	 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . S e c u r i t y ] . [ G r o u p ]   g  
 	 	 	 	 	 	 	 	 	 	 O N   m . S e c u r i t y G r o u p I D   =   g . S e c u r i t y G r o u p I D  
 	 	 	 	 	 	 	 	 	 	 A N D   m . I s V i s i b l e   =   1  
 	 	 	 	 	 	 	 	 	 	 A N D   g . H a s S p e c i a l E d i t A c c e s s   =   1  
 	 	 	 	 	 	 )   t  
 	 	 	 	 	 	 G R O U P   B Y   U s e r I D  
 	 	 	 	 )   x   O N   u . U s e r I D   =   x . U s e r I D  
 	 	 	 	 I N N E R   J O I N   [ F r a m e w o r k . ] . P a r a m e t e r   o  
 	 	 	 	 	 O N   o . P a r a m e t e r I D   =   ' b a s e U R I '  
 	 	 	 	 L E F T   O U T E R   J O I N   [ R D F . S t a g e ] . [ I n t e r n a l N o d e M a p ]   p  
 	 	 	 	 	 O N   u . P e r s o n I D   I S   N O T   N U L L  
 	 	 	 	 	 	 A N D   c a s t ( u . P e r s o n I D   a s   v a r c h a r ( 5 0 ) )   =   p . I n t e r n a l I D  
 	 	 	 	 	 	 A N D   p . C l a s s   =   ' h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / P e r s o n '  
 	 	 	 	 	 	 A N D   p . I n t e r n a l T y p e   =   ' P e r s o n '  
 	 	 	 	 	 	 A N D   p . N o d e I D   I S   N O T   N U L L  
 	 	 	 O R D E R   B Y   u . L a s t N a m e ,   u . F i r s t N a m e  
  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A l t e r i n g   [ P r o f i l e . I m p o r t ] . [ L o a d P r o f i l e s D a t a ] '  
 G O  
 / *  
  
 C o p y r i g h t   ( c )   2 0 0 8 - 2 0 1 0   b y   t h e   P r e s i d e n t   a n d   F e l l o w s   o f   H a r v a r d   C o l l e g e .   A l l   r i g h t s   r e s e r v e d .     P r o f i l e s   R e s e a r c h   N e t w o r k i n g   S o f t w a r e   w a s   d e v e l o p e d   u n d e r   t h e   s u p e r v i s i o n   o f   G r i f f i n   M   W e b e r ,   M D ,   P h D . ,   a n d   H a r v a r d   C a t a l y s t :   T h e   H a r v a r d   C l i n i c a l   a n d   T r a n s l a t i o n a l   S c i e n c e   C e n t e r ,   w i t h   s u p p o r t   f r o m   t h e   N a t i o n a l   C e n t e r   f o r   R e s e a r c h   R e s o u r c e s   a n d   H a r v a r d   U n i v e r s i t y .  
  
 R e d i s t r i b u t i o n   a n d   u s e   i n   s o u r c e   a n d   b i n a r y   f o r m s ,   w i t h   o r   w i t h o u t   m o d i f i c a t i o n ,   a r e   p e r m i t t e d   p r o v i d e d   t h a t   t h e   f o l l o w i n g   c o n d i t i o n s   a r e   m e t :  
         *   R e d i s t r i b u t i o n s   o f   s o u r c e   c o d e   m u s t   r e t a i n   t h e   a b o v e   c o p y r i g h t   n o t i c e ,   t h i s   l i s t   o f   c o n d i t i o n s   a n d   t h e   f o l l o w i n g   d i s c l a i m e r .  
         *   R e d i s t r i b u t i o n s   i n   b i n a r y   f o r m   m u s t   r e p r o d u c e   t h e   a b o v e   c o p y r i g h t   n o t i c e ,   t h i s   l i s t   o f   c o n d i t i o n s   a n d   t h e   f o l l o w i n g   d i s c l a i m e r   i n   t h e   d o c u m e n t a t i o n   a n d / o r   o t h e r   m a t e r i a l s   p r o v i d e d   w i t h   t h e   d i s t r i b u t i o n .  
         *   N e i t h e r   t h e   n a m e   " H a r v a r d "   n o r   t h e   n a m e s   o f   i t s   c o n t r i b u t o r s   n o r   t h e   n a m e   " H a r v a r d   C a t a l y s t "   m a y   b e   u s e d   t o   e n d o r s e   o r   p r o m o t e   p r o d u c t s   d e r i v e d   f r o m   t h i s   s o f t w a r e   w i t h o u t   s p e c i f i c   p r i o r   w r i t t e n   p e r m i s s i o n .  
  
 T H I S   S O F T W A R E   I S   P R O V I D E D   B Y   T H E   C O P Y R I G H T   H O L D E R   ( P R E S I D E N T   A N D   F E L L O W S   O F   H A R V A R D   C O L L E G E )   A N D   C O N T R I B U T O R S   " A S   I S "   A N D   A N Y   E X P R E S S   O R   I M P L I E D   W A R R A N T I E S ,   I N C L U D I N G ,   B U T   N O T   L I M I T E D   T O ,   T H E   I M P L I E D   W A R R A N T I E S   O F   M E R C H A N T A B I L I T Y   A N D   F I T N E S S   F O R   A   P A R T I C U L A R   P U R P O S E   A R E   D I S C L A I M E D .   I N   N O   E V E N T   S H A L L   T H E   C O P Y R I G H T   H O L D E R   O R   C O N T R I B U T O R S   B E   L I A B L E   F O R   A N Y   D I R E C T ,   I N D I R E C T ,   I N C I D E N T A L ,   S P E C I A L ,   E X E M P L A R Y ,   O R   C O N S E Q U E N T I A L   D A M A G E S   ( I N C L U D I N G ,   B U T   N O T   L I M I T E D   T O ,   P R O C U R E M E N T   O F   S U B S T I T U T E   G O O D S   O R   S E R V I C E S ;   L O S S   O F   U S E ,   D A T A ,   O R   P R O F I T S ;   O R   B U S I N E S S   I N T E R R U P T I O N )   H O W E V E R   C A U S E D   A N D   O N   A N Y   T H E O R Y   O F   L I A B I L I T Y ,   W H E T H E R   I N   C O N T R A C T ,   S T R I C T   L I A B I L I T Y ,   O R   T O R T   ( I N C L U D I N G   N E G L I G E N C E   O R   O T H E R W I S E )   A R I S I N G   I N   A N Y   W A Y   O U T   O F   T H E   U S E   O F   T H I S   S O F T W A R E ,   E V E N   I F   A D V I S E D   O F   T H E   P O S S I B I L I T Y   O F   S U C H   D A M A G E .  
  
  
  
  
 * /  
 A L T E R   p r o c e d u r e   [ P r o f i l e . I m p o r t ] . [ L o a d P r o f i l e s D a t a ] 	 (  
 	 	 	 	 	 	 	 	 	 	 	 	 @ u s e _ i n t e r n a l u s e r n a m e _ a s _ p k e y   B I T = 0 )  
 A S  
 B E G I N  
 	 S E T   N O C O U N T   O N ; 	  
  
 	 	 	 	 	 	 	 	 	 	 	 	  
 	 - -   S t a r t   T r a n s a c t i o n .   L o g   l o a d   f a i l u r e s ,   r o l l   b a c k   t r a n s a c t i o n   o n   e r r o r .  
 	 B E G I N   T R Y  
 	 	 	 	 B E G I N   T R A N 	 	 	 	    
  
 	 	 	 	 	     D E C L A R E   @ E r r M s g   n v a r c h a r ( 4 0 0 0 ) ,   @ E r r S e v e r i t y   i n t  
 	 	 	 	 	 	    
  
 	 	 	 	 	 	 - -   D e p a r t m e n t  
 	 	 	 	 	 	 I N S E R T   I N T O   [ P r o f i l e . D a t a ] . [ O r g a n i z a t i o n . D e p a r t m e n t ] ( d e p a r t m e n t n a m e , v i s i b l e )  
 	 	 	 	 	 	 S E L E C T   D I S T I N C T  
 	 	 	 	 	 	 	 	 	   d e p a r t m e n t n a m e ,    
 	 	 	 	 	 	 	 	 	   1  
 	 	 	 	 	 	 	 F R O M   [ P r o f i l e . I m p o r t ] . P e r s o n A f f i l i a t i o n   a  
 	 	 	 	 	 	   W H E R E   d e p a r t m e n t n a m e   I S   N O T   N U L L    
 	 	 	 	 	 	 	   a n d   d e p a r t m e n t n a m e   N O T   I N   ( S E L E C T   d e p a r t m e n t n a m e   F R O M   [ P r o f i l e . D a t a ] . [ O r g a n i z a t i o n . D e p a r t m e n t ] )  
  
  
 	 	 	 	 	 	 - -   i n s t i t u t i o n  
 	 	 	 	 	 	 I N S E R T   I N T O   [ P r o f i l e . D a t a ] . [ O r g a n i z a t i o n . I n s t i t u t i o n ]  
 	 	 	 	 	 	 	 	 	 	 (   I n s t i t u t i o n N a m e   ,  
 	 	 	 	 	 	 	 	 	 	 	 I n s t i t u t i o n A b b r e v i a t i o n  
 	 	 	 	 	 	 	 	 	 	 ) 	 	 	 	 	    
 	 	 	 	 	 	 S E L E C T 	 I N S T I T U T I O N N A M E ,  
 	 	 	 	 	 	 	 	 	 	 I N S T I T U T I O N A B B R E V I A T I O N  
 	 	 	 	 	 	 	 F R O M   (  
 	 	 	 	 	 	 	 	 	 	 S E L E C T 	 I N S T I T U T I O N N A M E ,  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 I N S T I T U T I O N A B B R E V I A T I O N ,    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 C O U N T ( * ) C N T , 	 	  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 R O W _ N U M B E R ( )   O V E R ( P A R T I T I O N   B Y   i n s t i t u t i o n n a m e   o r d e r   b y   S U M ( C A S E   W H E N   I N S T I T U T I O N A B B R E V I A T I O N = ' '   T H E N   0   E L S E   1   E N D )   d e s c ) r a n k  
 	 	 	 	 	 	 	 	 	 	 	 F R O M     [ P r o f i l e . I m p o r t ] . P e r s o n A f f i l i a t i o n  
 	 	 	 	 	 	 	 	 	 G R O U P   B Y     I N S T I T U T I O N N A M E ,  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 I N S T I T U T I O N A B B R E V I A T I O N  
 	 	 	 	 	 	 	 	 	 	 ) A  
 	 	 	 	 	 	 	 W H E R E   r a n k = 1  
 	 	 	 	 	 	 	 	 A N D   i n s t i t u t i o n n a m e   < > ' '  
 	 	 	 	 	 	 	 	 A N D   N O T   E X I S T S ( S E L E C T   b . i n s t i t u t i o n n a m e    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 F R O M   [ P r o f i l e . D a t a ] . [ O r g a n i z a t i o n . I n s t i t u t i o n ]   b  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   W H E R E   b . i n s t i t u t i o n n a m e = a . i n s t i t u t i o n n a m e )  
    
 	 	 	 	 	  
 	 	 	 	 	 	 - -   d i v i s i o n  
 	 	 	 	 	 	 I N S E R T   I N T O   [ P r o f i l e . D a t a ] . [ O r g a n i z a t i o n . D i v i s i o n ]  
 	 	 	 	 	 	 	 	 	 	 (   D i v i s i o n N a m e      
 	 	 	 	 	 	 	 	 	 	 )  
 	 	 	 	 	 	 S E L E C T   D I S T I N C T    
 	 	 	 	 	 	 	 	 	   d i v i s i o n n a m e    
 	 	 	 	 	 	 	 F R O M   [ P r o f i l e . I m p o r t ] . P e r s o n A f f i l i a t i o n   a  
 	 	 	 	 	 	   W H E R E   d i v i s i o n n a m e   I S   N O T   N U L L  
 	 	 	 	 	 	 	   A N D   N O T   E X I S T S ( S E L E C T   b . d i v i s i o n n a m e    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 F R O M   [ P r o f i l e . D a t a ] . [ O r g a n i z a t i o n . D i v i s i o n ]   b  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   W H E R E   b . d i v i s i o n n a m e = a . d i v i s i o n n a m e )  
    
 	 	 	 	 	 	 - -   F l a g   d e l e t e d   p e o p l e  
 	 	 	 	 	 	 U P D A T E   [ P r o f i l e . D a t a ] . P e r s o n  
 	 	 	 	 	 	 	   S E T   I S a c t i v e = 0  
 	 	 	 	 	 	   W H E R E   i n t e r n a l u s e r n a m e   N O T   I N ( S E L E C T   i n t e r n a l u s e r n a m e   F R O M   [ P r o f i l e . I m p o r t ] . P e r s o n )  
 	 	 	 	  
 	 	 	 	 	 - -   U p d a t e   p e r s o n / u s e r   r e c o r d s   w h e r e   d a t a   h a s   c h a n g e d .    
 	 	 	 	 	 	 U P D A T E   p  
 	 	 	 	 	 	       S E T   p . f i r s t n a m e = l p . f i r s t n a m e ,  
 	 	 	 	 	 	 	 	 	   p . l a s t n a m e = l p . l a s t n a m e ,  
 	 	 	 	 	 	 	 	 	   p . m i d d l e n a m e = l p . m i d d l e n a m e ,  
 	 	 	 	 	 	 	 	 	   p . d i s p l a y n a m e = l p . d i s p l a y n a m e ,    
 	 	 	 	 	 	 	 	 	   p . s u f f i x = l p . s u f f i x ,  
 	 	 	 	 	 	 	 	 	   p . a d d r e s s l i n e 1 = l p . a d d r e s s l i n e 1 ,  
 	 	 	 	 	 	 	 	 	   p . a d d r e s s l i n e 2 = l p . a d d r e s s l i n e 2 ,  
 	 	 	 	 	 	 	 	 	   p . a d d r e s s l i n e 3 = l p . a d d r e s s l i n e 3 ,  
 	 	 	 	 	 	 	 	 	   p . a d d r e s s l i n e 4 = l p . a d d r e s s l i n e 4 ,    
 	 	 	 	 	 	 	 	 	   p . c i t y = l p . c i t y ,  
 	 	 	 	 	 	 	 	 	   p . s t a t e = l p . s t a t e ,  
 	 	 	 	 	 	 	 	 	   p . z i p = l p . z i p ,    
 	 	 	 	 	 	 	 	 	   p . b u i l d i n g = l p . b u i l d i n g ,  
 	 	 	 	 	 	 	 	 	   p . r o o m = l p . r o o m ,  
 	 	 	 	 	 	 	 	 	   p . p h o n e = l p . p h o n e ,  
 	 	 	 	 	 	 	 	 	   p . f a x = l p . f a x ,    
 	 	 	 	 	 	 	 	 	   p . E m a i l A d d r = l p . E m a i l A d d r ,  
 	 	 	 	 	 	 	 	 	   p . A d d r e s s S t r i n g = l p . A d d r e s s S t r i n g ,          
 	 	 	 	 	 	 	 	 	   p . i s a c t i v e = l p . i s a c t i v e ,  
 	 	 	 	 	 	 	 	 	   p . v i s i b l e = l p . i s v i s i b l e  
 	 	 	 	 	     F R O M   [ P r o f i l e . D a t a ] . P e r s o n   p  
 	                     J O I N   [ P r o f i l e . I m p o r t ] . P e r s o n   l p   o n   l p . i n t e r n a l u s e r n a m e   =   p . i n t e r n a l u s e r n a m e  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	     a n d   ( I S N U L L ( l p . f i r s t n a m e , ' ' ) < > I S N U L L ( p . f i r s t n a m e , ' ' )  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   o r   I S N U L L ( l p . l a s t n a m e , ' ' ) < > I S N U L L ( p . l a s t n a m e , ' ' )  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   o r   I S N U L L ( l p . m i d d l e n a m e , ' ' ) < > I S N U L L ( p . m i d d l e n a m e , ' ' )  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   o r   I S N U L L ( l p . d i s p l a y n a m e , ' ' ) < > I S N U L L ( p . d i s p l a y n a m e , ' ' )    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   o r   I S N U L L ( l p . s u f f i x , ' ' ) < > I S N U L L ( p . s u f f i x , ' ' )  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   o r   I S N U L L ( l p . a d d r e s s l i n e 1 , ' ' ) < > I S N U L L ( p . a d d r e s s l i n e 1 , ' ' )  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   o r   I S N U L L ( l p . a d d r e s s l i n e 2 , ' ' ) < > I S N U L L ( p . a d d r e s s l i n e 2 , ' ' )  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   o r   I S N U L L ( l p . a d d r e s s l i n e 3 , ' ' ) < > I S N U L L ( p . a d d r e s s l i n e 3 , ' ' )  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   o r   I S N U L L ( l p . a d d r e s s l i n e 4 , ' ' ) < > I S N U L L ( p . a d d r e s s l i n e 4 , ' ' )    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   o r   I S N U L L ( l p . c i t y , ' ' ) < > I S N U L L ( p . c i t y , ' ' )    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   o r   I S N U L L ( l p . s t a t e , ' ' ) < > I S N U L L ( p . s t a t e , ' ' )    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   o r   I S N U L L ( l p . z i p , ' ' ) < > I S N U L L ( p . z i p , ' ' )    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   o r   I S N U L L ( l p . b u i l d i n g , ' ' ) < > I S N U L L ( p . b u i l d i n g , ' ' )  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   o r   I S N U L L ( l p . r o o m , ' ' ) < > I S N U L L ( p . r o o m , ' ' )  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   o r   I S N U L L ( l p . p h o n e , ' ' ) < > I S N U L L ( p . p h o n e , ' ' )  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   o r   I S N U L L ( l p . f a x , ' ' ) < > I S N U L L ( p . f a x , ' ' )    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   o r   I S N U L L ( l p . E m a i l A d d r , ' ' ) < > I S N U L L ( p . E m a i l A d d r , ' ' )  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   o r   I S N U L L ( l p . A d d r e s s S t r i n g , ' ' ) < > I S N U L L ( p . A d d r e s s S t r i n g , ' ' )      
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   o r   I S N U L L ( l p . I s a c t i v e , ' ' ) < > I S N U L L ( p . I s a c t i v e , ' ' )  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   o r   I S N U L L ( l p . i s v i s i b l e , ' ' ) < > I S N U L L ( p . v i s i b l e , ' ' ) )    
 	 	 	 	 	 	 - -   U p d a t e   c h a n g e d   u s e r   i n f o  
 	 	 	 	 	 	 U P D A T E 	   u  
 	 	 	 	 	 	       S E T 	   u . f i r s t n a m e = u p . f i r s t n a m e ,  
 	 	 	 	 	 	 	 	   u . l a s t n a m e = u p . l a s t n a m e ,  
 	 	 	 	 	 	 	 	   u . d i s p l a y n a m e = u p . d i s p l a y n a m e ,        
 	 	 	 	 	 	 	 	   u . i n s t i t u t i o n = u p . i n s t i t u t i o n ,  
 	 	 	 	 	 	 	 	   u . d e p a r t m e n t = u p . d e p a r t m e n t   ,  
 	 	 	 	 	 	 	 	   u . e m a i l a d d r   =   u p . e m a i l a d d r  
 	 	 	 	 	     F R O M   [ U s e r . A c c o u n t ] . [ U s e r ]   u  
 	                     J O I N   [ P r o f i l e . I m p o r t ] . [ U s e r ]   u p   o n   u p . i n t e r n a l u s e r n a m e   =   u . i n t e r n a l u s e r n a m e  
 	 	 	 	 	 	 	 	 	 	 	 	 	   a n d   ( I S N U L L ( u p . f i r s t n a m e , ' ' ) < > I S N U L L ( u . f i r s t n a m e , ' ' )  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	   o r   I S N U L L ( u p . l a s t n a m e , ' ' ) < > I S N U L L ( u . l a s t n a m e , ' ' )  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	   o r   I S N U L L ( u p . d i s p l a y n a m e , ' ' ) < > I S N U L L ( u . d i s p l a y n a m e , ' ' )      
 	 	 	 	 	 	 	 	 	 	 	 	 	 	   o r   I S N U L L ( u p . i n s t i t u t i o n , ' ' ) < > I S N U L L ( u . i n s t i t u t i o n , ' ' )  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	   o r   I S N U L L ( u p . d e p a r t m e n t , ' ' ) < > I S N U L L ( u . d e p a r t m e n t , ' ' )    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	   o r   I S N U L L ( u p . e m a i l a d d r , ' ' ) < > I S N U L L ( u . e m a i l a d d r , ' ' )   )  
 	 	 	 	      
 	 	 	 	 	 - -   R e m o v e   A f f i l i a t i o n s   t h a t   h a v e   c h a n g e d ,   s o   t h e y ' l l   b e   r e - a d d e d  
 	 	 	 	   S E L E C T   D I S T I N C T   C O A L E S C E (     p . i n t e r n a l u s e r n a m e , p . i n t e r n a l u s e r n a m e   ) i n t e r n a l u s e r n a m e  
 	 	 	 	 	   I N T O   # a f f i l i a t i o n s  
 	 	 	 	 	   F R O M   [ P r o f i l e . C a c h e ] . [ P e r s o n . A f f i l i a t i o n ]   c p a    
 	 	 	           J O I N   [ P r o f i l e . D a t a ] . P e r s o n   p   O N   p . p e r s o n i d   =   c p a . p e r s o n i d  
 	 	 	 F U L L   j o i n   [ P r o f i l e . I m p o r t ] . P e r s o n A f f i l i a t i o n   p a   o n   p a . i n t e r n a l u s e r n a m e   =   p . i n t e r n a l u s e r n a m e  
 	 	 	 	 	 	 	 	 	 	 	 	 	 a n d   I S N U L L ( p a . a f f i l i a t i o n o r d e r , ' ' ) = I S N U L L ( c p a . s o r t o r d e r , ' ' )  
 	 	 	 	 	 	 	 	 	 	 	 	 	 a n d   I S N U L L ( p a . p r i m a r y a f f i l i a t i o n , ' ' )   =   I S N U L L ( c p a . i s p r i m a r y , ' ' )  
 	 	 	 	 	 	 	 	 	 	 	 	 	 a n d   I S N U L L ( p a . t i t l e , ' ' )   =   I S N U L L ( c p a . t i t l e , ' ' )    
 	 	 	 	 	 	 	 	 	 	 	 	 	 a n d   I S N U L L ( p a . i n s t i t u t i o n a b b r e v i a t i o n , ' ' )   =   I S N U L L ( c p a . i n s t i t u t i o n a b b r e v i a t i o n , ' ' )  
 	 	 	 	 	 	 	 	 	 	 	 	 	 a n d   I S N U L L ( p a . d e p a r t m e n t n a m e , ' ' )   =   I S N U L L ( c p a . d e p a r t m e n t n a m e , ' ' )  
 	 	 	 	 	 	 	 	 	 	 	 	 	 a n d   I S N U L L ( p a . d i v i s i o n n a m e , ' ' )   =   I S N U L L ( c p a . d i v i s i o n n a m e , ' ' )  
 	 	 	 	 	 	 	 	 	 	 	 	 	 a n d   I S N U L L ( p a . f a c u l t y r a n k , ' ' )   =   I S N U L L ( c p a . f a c u l t y r a n k , ' ' )  
 	 	 	 	 	 W H E R E     p a . i n t e r n a l u s e r n a m e   I S   N U L L   O R   c p a . p e r s o n i d   I S   N U L L  
 	 	 	 	 	  
 	 	 	 	 	 D E L E T E   F R O M   [ P r o f i l e . D a t a ] . [ P e r s o n . A f f i l i a t i o n ]   w h e r e   p e r s o n i d   i n   ( S E L E C T   p e r s o n i d   F R O M   [ P r o f i l e . D a t a ] . P e r s o n   W H E R E   i n t e r n a l u s e r n a m e   I N   (   S E L E C T   i n t e r n a l u s e r n a m e   F R O M   # a f f i l i a t i o n s 	 ) )  
 	 	 	 	 	  
 	 	 	 	 	 - -   R e m o v e   F i l t e r s   t h a t   h a v e   c h a n g e d ,   s o   t h e y ' l l   b e   r e - a d d e d  
 	 	 	 	 	 D E L E T E    
 	 	 	 	 	     F R O M   [ P r o f i l e . D a t a ] . [ P e r s o n . F i l t e r R e l a t i o n s h i p ]    
 	 	 	 	 	   W H E R E   p e r s o n i d   I N   ( S E L E C T   p e r s o n i d    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	         F R O M   [ P r o f i l e . D a t a ] . P e r s o n      
 	 	 	 	 	 	 	 	 	 	 	 	 	 	       W H E R E   I n t e r n a l U s e r n a m e   I N    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 (  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 S E L E C T     c o a l e s c e (   a . i n t e r n a l u s e r n a m e ,   p . i n t e r n a l u s e r n a m e   )  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 F R O M   [ P r o f i l e . I m p o r t ] . P e r s o n F i l t e r F l a g   p f  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 J O I N   [ P r o f i l e . I m p o r t ] . P e r s o n   p   o n   p . i n t e r n a l u s e r n a m e   =   p f . i n t e r n a l u s e r n a m e  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   F U L L   J O I N   ( s e l e c t   i n t e r n a l u s e r n a m e , p e r s o n f i l t e r    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 f r o m   [ P r o f i l e . D a t a ] . [ P e r s o n . F i l t e r R e l a t i o n s h i p ]   p f r  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 J O I N   [ P r o f i l e . D a t a ] . P e r s o n     p   O N   p . p e r s o n i d   =   p f r . p e r s o n i d    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 j o i n   [ P r o f i l e . D a t a ] . [ P e r s o n . F i l t e r ]   p f   o n   p f . p e r s o n f i l t e r i d   =   p f r . p e r s o n f i l t e r i d ) a   O N   a . i n t e r n a l u s e r n a m e   =   p . i n t e r n a l u s e r n a m e    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 A N D   a . p e r s o n f i l t e r   =   p f . p e r s o n f i l t e r  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 W H E R E   a . i n t e r n a l u s e r n a m e   i s   n u l l   o r   p . i n t e r n a l u s e r n a m e   i s   n u l l  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 ) )  
    
 	 	 	 	     	 	 	    
 	 	 	 	 	 	 	 	    
 	 	 	 	 	 	    
 	 	 	 	 	 	 	 	    
 	 	 	 	 	 	 	 	 	    
 	 	 	 	 	 - -   u s e r  
 	 	 	 	 	 I F   @ u s e _ i n t e r n a l u s e r n a m e _ a s _ p k e y = 0  
 	 	 	 	 	 B E G I N  
 	 	 	 	 	 	 I N S E R T   I N T O   [ U s e r . A c c o u n t ] . [ U s e r ]  
 	 	 	 	 	 	                 (   I s A c t i v e   ,  
 	 	 	 	 	 	                     C a n B e P r o x y   ,  
 	 	 	 	 	 	                     F i r s t N a m e   ,  
 	 	 	 	 	 	                     L a s t N a m e   ,  
 	 	 	 	 	 	                     D i s p l a y N a m e   ,  
 	 	 	 	 	 	                     I n s t i t u t i o n   ,  
 	 	 	 	 	 	                     D e p a r t m e n t   ,  
 	 	 	 	 	 	                     I n t e r n a l U s e r N a m e   ,  
 	 	 	 	 	 	                     e m a i l a d d r    
 	 	 	 	 	 	                 )    
 	 	 	 	 	 	 	 S E L E C T   1 ,  
 	 	 	 	 	 	 	 	 	 	   c a n b e p r o x y ,  
 	 	 	 	 	 	 	 	 	 	   I S N U L L ( f i r s t n a m e , ' ' ) ,  
 	 	 	 	 	 	 	 	 	 	   I S N U L L ( l a s t n a m e , ' ' ) ,  
 	 	 	 	 	 	 	 	 	 	   I S N U L L ( d i s p l a y n a m e , ' ' ) ,      
 	 	 	 	 	 	 	 	 	 	   i n s t i t u t i o n ,    
 	 	 	 	 	 	 	 	 	 	   d e p a r t m e n t ,  
 	 	 	 	 	 	                   I n t e r n a l U s e r N a m e   	 ,  
 	 	 	 	 	 	                   e m a i l a d d r 	 	 	 	 	 	 	 	    
 	 	 	 	 	 	 	 	 F R O M   [ P r o f i l e . I m p o r t ] . [ U s e r ]   u    
 	 	 	 	 	 	 	   W H E R E   N O T   E X I S T S   ( S E L E C T   *    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   F R O M   [ U s e r . A c c o u n t ] . [ U s e r ]   b  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 W H E R E   b . i n t e r n a l u s e r n a m e = u . i n t e r n a l u s e r n a m e )  
 	 	 	 	 	   U N I O N  
 	 	 	 	 	 	   S E L E C T     1 ,  
 	 	 	 	 	 	 	 	 	 	   1 ,  
 	 	 	 	 	 	 	 	 	 	   I S N U L L ( f i r s t n a m e , ' ' ) ,  
 	 	 	 	 	 	 	 	 	 	   I S N U L L ( l a s t n a m e , ' ' ) ,  
 	 	 	 	 	 	 	 	 	 	   I S N U L L ( d i s p l a y n a m e , ' ' ) ,    
 	 	 	 	 	 	 	 	 	 	   i n s t i t u t i o n n a m e ,    
 	 	 	 	 	 	 	 	 	 	   d e p a r t m e n t n a m e ,  
 	 	 	 	 	 	                   u . I n t e r n a l U s e r N a m e ,  
 	 	 	 	 	 	                   u . e m a i l a d d r    
 	 	 	 	 	 	 	 	 F R O M   [ P r o f i l e . I m p o r t ] . P e r s o n   u    
 	 	 	 	 	   L E F T   J O I N   [ P r o f i l e . I m p o r t ] . P e r s o n A f f i l i a t i o n   p a   o n   p a . i n t e r n a l u s e r n a m e   =   u . i n t e r n a l u s e r n a m e    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 a n d   p a . p r i m a r y a f f i l i a t i o n = 1  
 	 	 	 	 	 	 	   W H E R E   N O T   E X I S T S   ( S E L E C T   *    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   F R O M   [ U s e r . A c c o u n t ] . [ U s e r ]   b  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 W H E R E   b . i n t e r n a l u s e r n a m e = u . i n t e r n a l u s e r n a m e )  
 	 	 	 	 	 	 E N D  
 	 	 	 	 	 E L S E  
 	 	 	 	 	 	 B E G I N  
 	 	 	 	 	 	 	 S E T   I D E N T I T Y _ I N S E R T   [ U s e r . A c c o u n t ] . [ U s e r ]   O N    
  
 	 	 	 	 	 	 	 I N S E R T   I N T O   [ U s e r . A c c o u n t ] . [ U s e r ]  
 	 	 	 	 	 	                 (   u s e r i d ,  
 	 	 	 	 	 	 	 	 	 	 	 I s A c t i v e   ,  
 	 	 	 	 	 	                     C a n B e P r o x y   ,  
 	 	 	 	 	 	                     F i r s t N a m e   ,  
 	 	 	 	 	 	                     L a s t N a m e   ,  
 	 	 	 	 	 	                     D i s p l a y N a m e   ,  
 	 	 	 	 	 	                     I n s t i t u t i o n   ,  
 	 	 	 	 	 	                     D e p a r t m e n t     ,  
 	 	 	 	 	 	                     I n t e r n a l U s e r N a m e     ,  
 	 	 	 	 	 	                     e m a i l a d d r    
 	 	 	 	 	 	                 )    
 	 	 	 	 	 	 	 S E L E C T   u . i n t e r n a l u s e r n a m e ,  
 	 	 	 	 	 	 	 	 	 	 	 1 ,  
 	 	 	 	 	 	 	 	 	 	   c a n b e p r o x y ,  
 	 	 	 	 	 	 	 	 	 	   I S N U L L ( f i r s t n a m e , ' ' ) ,  
 	 	 	 	 	 	 	 	 	 	   I S N U L L ( l a s t n a m e , ' ' ) ,  
 	 	 	 	 	 	 	 	 	 	   I S N U L L ( d i s p l a y n a m e , ' ' ) ,      
 	 	 	 	 	 	 	 	 	 	   i n s t i t u t i o n ,    
 	 	 	 	 	 	 	 	 	 	   d e p a r t m e n t ,  
 	 	 	 	 	 	                     I n t e r n a l U s e r N a m e   	 ,  
 	 	 	 	 	 	                     e m a i l a d d r   	 	 	 	 	 	 	 	    
 	 	 	 	 	 	 	 	 F R O M   [ P r o f i l e . I m p o r t ] . [ U s e r ]   u    
 	 	 	 	 	 	 	   W H E R E   N O T   E X I S T S   ( S E L E C T   *    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   F R O M   [ U s e r . A c c o u n t ] . [ U s e r ]   b  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 W H E R E   b . i n t e r n a l u s e r n a m e = u . i n t e r n a l u s e r n a m e )  
 	 	 	 	 	   U N I O N   A L L  
 	 	 	 	 	 	   S E L E C T     u . i n t e r n a l u s e r n a m e ,  
 	 	 	 	 	 	 	 	 	 	 	 1 ,  
 	 	 	 	 	 	 	 	 	 	   1 ,  
 	 	 	 	 	 	 	 	 	 	   I S N U L L ( f i r s t n a m e , ' ' ) ,  
 	 	 	 	 	 	 	 	 	 	   I S N U L L ( l a s t n a m e , ' ' ) ,  
 	 	 	 	 	 	 	 	 	 	   I S N U L L ( d i s p l a y n a m e , ' ' ) ,    
 	 	 	 	 	 	 	 	 	 	   i n s t i t u t i o n n a m e ,    
 	 	 	 	 	 	 	 	 	 	   d e p a r t m e n t n a m e ,  
 	 	 	 	 	 	                     u . I n t e r n a l U s e r N a m e   ,  
 	 	 	 	 	 	                     u . e m a i l a d d r    
 	 	 	 	 	 	 	 	 F R O M   [ P r o f i l e . I m p o r t ] . P e r s o n   u    
 	 	 	 	 	   L E F T   J O I N   [ P r o f i l e . I m p o r t ] . P e r s o n A f f i l i a t i o n   p a   o n   p a . i n t e r n a l u s e r n a m e   =   u . i n t e r n a l u s e r n a m e    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 a n d   p a . p r i m a r y a f f i l i a t i o n = 1  
 	 	 	 	 	 	 	   W H E R E   N O T   E X I S T S   ( S E L E C T   *    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   F R O M   [ U s e r . A c c o u n t ] . [ U s e r ]   b  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 W H E R E   b . i n t e r n a l u s e r n a m e = u . i n t e r n a l u s e r n a m e )  
 	 	 	 	 	 	       A N D   N O T   E X I S T S   ( S E L E C T   *   F R O M   [ P r o f i l e . I m p o r t ] . [ U s e r ]   b   W H E R E   b . i n t e r n a l u s e r n a m e   = u . i n t e r n a l u s e r n a m e )  
 	 	 	 	 	 	        
 	 	 	 	 	 	 	 S E T   I D E N T I T Y _ I N S E R T   [ U s e r . A c c o u n t ] . [ U s e r ]   O F F  
 	 	 	 	 	 	 E N D  
  
 	 	 	 	 	 - -   f a c u l t y   r a n k s  
 	 	 	 	 	 I N S E R T   I N T O   [ P r o f i l e . D a t a ] . [ P e r s o n . F a c u l t y R a n k ]  
 	 	 	 	 	                 (   F a c u l t y R a n k   ,  
 	 	 	 	 	                     F a c u l t y R a n k S o r t   ,  
 	 	 	 	 	                     V i s i b l e  
 	 	 	 	 	                 )    
 	 	 	 	 	 S E L E C T   D I S T I N C T    
 	 	 	 	 	 	 	 	   f a c u l t y r a n k ,  
 	 	 	 	 	 	 	 	   f a c u l t y r a n k o r d e r ,  
 	 	 	 	 	 	 	 	   1    
 	 	 	 	 	 	 F R O M   [ P r o f i l e . I m p o r t ] . P e r s o n A f f i l i a t i o n   p  
 	 	 	 	 	   W H E R E       N O T   E X I S T S   ( S E L E C T   *    
 	 	 	 	 	 	 	 	 	 	   F R O M   [ P r o f i l e . D a t a ] . [ P e r s o n . F a c u l t y R a n k ]   a  
 	 	 	 	 	 	 	 	 	 	 W H E R E   a . f a c u l t y r a n k = p . f a c u l t y r a n k )  
  
 	 	 	 	 	 - -   p e r s o n  
 	 	 	 	 	 I F   @ u s e _ i n t e r n a l u s e r n a m e _ a s _ p k e y = 0  
 	 	 	 	 	 B E G I N 	 	 	 	  
 	 	 	 	 	 	 I N S E R T   I N T O   [ P r o f i l e . D a t a ] . P e r s o n  
 	 	 	 	 	 	                 (   U s e r I D   ,  
 	 	 	 	 	 	                     F i r s t N a m e   ,  
 	 	 	 	 	 	                     L a s t N a m e   ,  
 	 	 	 	 	 	                     M i d d l e N a m e   ,  
 	 	 	 	 	 	                     D i s p l a y N a m e   ,  
 	 	 	 	 	 	                     S u f f i x   ,  
 	 	 	 	 	 	                     I s A c t i v e   ,  
 	 	 	 	 	 	                     E m a i l A d d r   ,  
 	 	 	 	 	 	                     P h o n e   ,  
 	 	 	 	 	 	                     F a x   ,  
 	 	 	 	 	 	                     A d d r e s s L i n e 1   ,  
 	 	 	 	 	 	                     A d d r e s s L i n e 2   ,  
 	 	 	 	 	 	                     A d d r e s s L i n e 3   ,  
 	 	 	 	 	 	                     A d d r e s s L i n e 4   ,  
 	 	 	 	 	 	                     c i t y   ,  
 	 	 	 	 	 	                     s t a t e   ,  
 	 	 	 	 	 	                     z i p   ,  
 	 	 	 	 	 	                     B u i l d i n g   ,  
 	 	 	 	 	 	                     F l o o r   ,  
 	 	 	 	 	 	                     R o o m   ,  
 	 	 	 	 	 	                     A d d r e s s S t r i n g   ,  
 	 	 	 	 	 	                     L a t i t u d e   ,  
 	 	 	 	 	 	                     L o n g i t u d e   ,  
 	 	 	 	 	 	                     F a c u l t y R a n k I D   ,  
 	 	 	 	 	 	                     I n t e r n a l U s e r n a m e   ,  
 	 	 	 	 	 	                     V i s i b l e  
 	 	 	 	 	 	                 )  
 	 	 	 	 	     S E L E C T     U s e r I D ,  
 	 	 	 	 	 	 	 	 	 	 I S N U L L ( p . F i r s t N a m e , ' ' ) ,  
 	 	 	 	 	 	 	 	 	 	 I S N U L L ( p . L a s t N a m e , ' ' ) ,  
 	 	 	 	 	 	 	 	 	 	 I S N U L L ( p . M i d d l e N a m e , ' ' ) ,  
 	 	 	 	 	 	 	 	 	 	 I S N U L L ( p . D i s p l a y N a m e , ' ' ) ,    
 	 	 	 	 	 	 	 	 	 	 I S N U L L ( S u f f i x , ' ' ) ,  
 	 	 	 	 	 	 	 	 	 	 p . I s A c t i v e ,  
 	 	 	 	 	 	 	 	 	 	 p . E m a i l A d d r ,  
 	 	 	 	 	 	 	 	 	 	 P h o n e ,  
 	 	 	 	 	 	 	 	 	 	 F a x ,  
 	 	 	 	 	 	 	 	 	 	 A d d r e s s L i n e 1 ,  
 	 	 	 	 	 	 	 	 	 	 A d d r e s s L i n e 2 ,  
 	 	 	 	 	 	 	 	 	 	 A d d r e s s L i n e 3 ,  
 	 	 	 	 	 	 	 	 	 	 A d d r e s s L i n e 4 ,  
 	 	 	 	 	                     c i t y   ,  
 	 	 	 	 	                     s t a t e   ,  
 	 	 	 	 	                     z i p   ,  
 	 	 	 	 	 	 	 	 	 	 B u i l d i n g ,  
 	 	 	 	 	 	 	 	 	 	 F l o o r ,  
 	 	 	 	 	 	 	 	 	 	 R o o m ,  
 	 	 	 	 	 	 	 	 	 	 A d d r e s s S t r i n g ,  
 	 	 	 	 	 	 	 	 	 	 L a t i t u d e ,  
 	 	 	 	 	 	 	 	 	 	 L o n g i t u d e ,  
 	 	 	 	 	 	 	 	 	 	 F a c u l t y R a n k I D   ,  
 	 	 	 	 	 	 	 	 	 	 p . I n t e r n a l U s e r n a m e ,  
 	 	 	 	 	 	 	 	 	 	 p . i s v i s i b l e  
 	 	 	 	 	 	   F R O M     [ P r o f i l e . I m p o r t ] . P e r s o n   p  
 	 	 	 	 L E F T   J O I N     [ P r o f i l e . I m p o r t ] . P e r s o n A f f i l i a t i o n   p a   o n   p a . i n t e r n a l u s e r n a m e   =   p . i n t e r n a l u s e r n a m e    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 a n d   p a . p r i m a r y a f f i l i a t i o n = 1  
 	 	 	 	 L E F T   J O I N     [ P r o f i l e . D a t a ] . [ P e r s o n . F a c u l t y R a n k ]   f r   o n   f r . f a c u l t y r a n k = p a . f a c u l t y r a n k  
 	 	 	 	 	 	   J O I N     [ U s e r . A c c o u n t ] . [ U s e r ]   u   O N   u . i n t e r n a l u s e r n a m e   =   p . i n t e r n a l u s e r n a m e    
 	 	 	 	 	 	 W H E R E     N O T   E X I S T S   ( S E L E C T   *    
 	 	 	 	 	 	 	 	 	 	   F R O M   [ P r o f i l e . D a t a ] . P e r s o n   b  
 	 	 	 	 	 	 	 	   	 	 W H E R E   b . i n t e r n a l u s e r n a m e = p . i n t e r n a l u s e r n a m e )      
 	 	 	 	 	 	 E N D  
 	 	 	 	 	 E L S E  
 	 	 	 	 	 	 B E G I N  
 	 	 	 	 	 	 	 S E T   I D E N T I T Y _ I N S E R T   [ P r o f i l e . D a t a ] . P e r s o n   O N  
 	 	 	 	 	 	 	 I N S E R T   I N T O   [ P r o f i l e . D a t a ] . P e r s o n  
 	 	 	 	 	 	                 (   p e r s o n i d ,  
 	 	 	 	 	 	 	 	 	 	 	 U s e r I D   ,  
 	 	 	 	 	 	                     F i r s t N a m e   ,  
 	 	 	 	 	 	                     L a s t N a m e   ,  
 	 	 	 	 	 	                     M i d d l e N a m e   ,  
 	 	 	 	 	 	                     D i s p l a y N a m e   ,  
 	 	 	 	 	 	                     S u f f i x   ,  
 	 	 	 	 	 	                     I s A c t i v e   ,  
 	 	 	 	 	 	                     E m a i l A d d r   ,  
 	 	 	 	 	 	                     P h o n e   ,  
 	 	 	 	 	 	                     F a x   ,  
 	 	 	 	 	 	                     A d d r e s s L i n e 1   ,  
 	 	 	 	 	 	                     A d d r e s s L i n e 2   ,  
 	 	 	 	 	 	                     A d d r e s s L i n e 3   ,  
 	 	 	 	 	 	                     A d d r e s s L i n e 4   ,  
 	 	 	 	 	 	                     B u i l d i n g   ,  
 	 	 	 	 	 	                     F l o o r   ,  
 	 	 	 	 	 	                     R o o m   ,  
 	 	 	 	 	 	                     A d d r e s s S t r i n g   ,  
 	 	 	 	 	 	                     L a t i t u d e   ,  
 	 	 	 	 	 	                     L o n g i t u d e   ,  
 	 	 	 	 	 	                     F a c u l t y R a n k I D   ,  
 	 	 	 	 	 	                     I n t e r n a l U s e r n a m e   ,  
 	 	 	 	 	 	                     V i s i b l e  
 	 	 	 	 	 	                 )  
 	 	 	 	 	     S E L E C T     p . i n t e r n a l u s e r n a m e ,  
 	 	 	 	 	 	 	 	 	 	 u s e r i d ,  
 	 	 	 	 	 	 	 	 	 	 I S N U L L ( p . F i r s t N a m e , ' ' ) ,  
 	 	 	 	 	 	 	 	 	 	 I S N U L L ( p . L a s t N a m e , ' ' ) ,  
 	 	 	 	 	 	 	 	 	 	 I S N U L L ( p . M i d d l e N a m e , ' ' ) ,  
 	 	 	 	 	 	 	 	 	 	 I S N U L L ( p . D i s p l a y N a m e , ' ' ) ,    
 	 	 	 	 	 	 	 	 	 	 I S N U L L ( S u f f i x , ' ' ) ,  
 	 	 	 	 	 	 	 	 	 	 p . I s A c t i v e ,  
 	 	 	 	 	 	 	 	 	 	 p . E m a i l A d d r ,  
 	 	 	 	 	 	 	 	 	 	 P h o n e ,  
 	 	 	 	 	 	 	 	 	 	 F a x ,  
 	 	 	 	 	 	 	 	 	 	 A d d r e s s L i n e 1 ,  
 	 	 	 	 	 	 	 	 	 	 A d d r e s s L i n e 2 ,  
 	 	 	 	 	 	 	 	 	 	 A d d r e s s L i n e 3 ,  
 	 	 	 	 	 	 	 	 	 	 A d d r e s s L i n e 4 ,  
 	 	 	 	 	 	 	 	 	 	 B u i l d i n g ,  
 	 	 	 	 	 	 	 	 	 	 F l o o r ,  
 	 	 	 	 	 	 	 	 	 	 R o o m ,  
 	 	 	 	 	 	 	 	 	 	 A d d r e s s S t r i n g ,  
 	 	 	 	 	 	 	 	 	 	 L a t i t u d e ,  
 	 	 	 	 	 	 	 	 	 	 L o n g i t u d e ,  
 	 	 	 	 	 	 	 	 	 	 F a c u l t y R a n k I D   ,  
 	 	 	 	 	 	 	 	 	 	 p . I n t e r n a l U s e r n a m e ,  
 	 	 	 	 	 	 	 	 	 	 p . i s v i s i b l e  
 	 	 	 	 	 	   F R O M     [ P r o f i l e . I m p o r t ] . P e r s o n   p  
 	 	 	 	 L E F T   J O I N     [ P r o f i l e . I m p o r t ] . P e r s o n A f f i l i a t i o n   p a   o n   p a . i n t e r n a l u s e r n a m e   =   p . i n t e r n a l u s e r n a m e    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 a n d   p a . p r i m a r y a f f i l i a t i o n = 1  
 	 	 	 	 L E F T   J O I N     [ P r o f i l e . D a t a ] . [ P e r s o n . F a c u l t y R a n k ]   f r   o n   f r . f a c u l t y r a n k = p a . f a c u l t y r a n k  
 	 	 	 	 	 	   J O I N     [ U s e r . A c c o u n t ] . [ U s e r ]   u   O N   u . i n t e r n a l u s e r n a m e   =   p . i n t e r n a l u s e r n a m e    
 	 	 	 	 	 	 W H E R E     N O T   E X I S T S   ( S E L E C T   *    
 	 	 	 	 	 	 	 	 	 	   F R O M   [ P r o f i l e . D a t a ] . P e r s o n   b  
 	 	 	 	 	 	 	 	   	 	 W H E R E   b . i n t e r n a l u s e r n a m e = p . i n t e r n a l u s e r n a m e )      
 	 	 	 	 	 	 	 S E T   I D E N T I T Y _ I N S E R T   [ P r o f i l e . D a t a ] . P e r s o n   O F F  
  
 	 	 	 	 	 	 E N D  
    
 	 	 	 	 	 	 - -   a d d   p e r s o n i d   t o   u s e r  
 	 	 	 	 	 	 U P D A T E   u  
 	 	 	 	 	 	 	   S E T   u . p e r s o n i d   =   p . p e r s o n i d  
 	 	 	 	 	 	 	 F R O M   [ P r o f i l e . D a t a ] . P e r s o n   p  
 	 	 	 	 	 	     J O I N   [ U s e r . A c c o u n t ] . [ U s e r ]   u     O N   u . u s e r i d   =   p . u s e r i d  
 	 	 	 	 	 	    
 	 	 	 	    
 	 	 	 	 	 - -   p e r s o n   a f f i l i a t i o n  
 	 	 	 	 	 I N S E R T   I N T O   [ P r o f i l e . D a t a ] . [ P e r s o n . A f f i l i a t i o n ]  
 	 	 	 	 	                 (   P e r s o n I D   ,  
 	 	 	 	 	                     S o r t O r d e r   ,  
 	 	 	 	 	                     I s A c t i v e   ,  
 	 	 	 	 	                     I s P r i m a r y   ,  
 	 	 	 	 	                     I n s t i t u t i o n I D   ,  
 	 	 	 	 	                     D e p a r t m e n t I D   ,  
 	 	 	 	 	                     D i v i s i o n I D   ,  
 	 	 	 	 	                     T i t l e   ,  
 	 	 	 	 	                     E m a i l A d d r e s s   ,  
 	 	 	 	 	                     F a c u l t y R a n k I D  
 	 	 	 	 	                 )    
 	 	 	 	 	 S E L E C T   p . p e r s o n i d ,  
 	 	 	 	 	 	 	 	   a f f i l i a t i o n o r d e r ,  
 	 	 	 	 	 	 	 	   1 ,  
 	 	 	 	 	 	 	 	   p r i m a r y a f f i l i a t i o n   ,  
 	 	 	 	 	 	 	 	   I n s t i t u t i o n I D ,  
 	 	 	 	 	 	 	 	   D e p a r t m e n t I D ,  
 	 	 	 	 	 	 	 	   D i v i s i o n I D ,  
 	 	 	 	 	 	 	 	   c . t i t l e ,  
 	 	 	 	 	 	 	 	   c . e m a i l a d d r ,  
 	 	 	 	 	 	 	 	   f r . f a c u l t y r a n k i d  
 	 	 	 	 	 	 f r o m   [ P r o f i l e . I m p o r t ] . P e r s o n A f f i l i a t i o n   c    
 	 	 	 	 	 	 J O I N   [ P r o f i l e . D a t a ] . P e r s o n   p   o n   c . i n t e r n a l u s e r n a m e = p . i n t e r n a l u s e r n a m e  
 	 	 	   L E F T   J O I N   [ P r o f i l e . D a t a ] . [ O r g a n i z a t i o n . I n s t i t u t i o n ]   i   O N   i . i n s t i t u t i o n n a m e   =   c . i n s t i t u t i o n n a m e    
 	 	 	   L E F T   J O I N   [ P r o f i l e . D a t a ] . [ O r g a n i z a t i o n . D e p a r t m e n t ]   d     O N   d . d e p a r t m e n t n a m e   =   c . d e p a r t m e n t n a m e  
 	 	 	   L E F T   J O I N   [ P r o f i l e . D a t a ] . [ O r g a n i z a t i o n . D i v i s i o n ]   d i   O N   d i . d i v i s i o n n a m e   =   c . d i v i s i o n n a m e  
 	 	 	   L E F T   J O I N   [ P r o f i l e . D a t a ] . [ P e r s o n . F a c u l t y R a n k ]   f r   o n   f r . f a c u l t y r a n k   =   c . f a c u l t y r a n k    
 	 	 	 	 	   W H E R E   N O T   E X I S T S   ( S E L E C T   *  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   F R O M   [ P r o f i l e . D a t a ] . [ P e r s o n . A f f i l i a t i o n ]   a  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 W H E R E   a . p e r s o n i d = p . p e r s o n i d  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	         A N D   I S N U L L ( a . I n s t i t u t i o n I D , ' ' ) = I S N U L L ( i . I n s t i t u t i o n I D , ' ' )  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 A N D   I S N U L L ( a . D e p a r t m e n t I D , ' ' )   =   I S N U L L ( d . D e p a r t m e n t I D , ' ' )  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 A N D   I S N U L L ( a . D i v i s i o n I D , ' ' ) = I S N U L L ( d i . D i v i s i o n I D , ' ' ) )  
 	 	 	 	    
  
 	 	 	 	 	 - -   p e r s o n _ f i l t e r s  
 	 	 	 	 	 I N S E R T   I N T O   [ P r o f i l e . D a t a ] . [ P e r s o n . F i l t e r ]  
 	 	 	 	 	                 (   P e r s o n F i l t e r    
 	 	 	 	 	                 )    
 	 	 	 	 	    
 	 	 	 	 	 S E L E C T   D I S T I N C T    
 	 	 	 	 	 	 	 	   p e r s o n f i l t e r  
 	 	 	 	 	 	 F R O M   [ P r o f i l e . I m p o r t ] . P e r s o n F i l t e r F l a g   b  
 	 	 	 	       W H E R E   N O T   E X I S T S   ( S E L E C T   *    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   F R O M   [ P r o f i l e . D a t a ] . [ P e r s o n . F i l t e r ]   a  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 W H E R E   a . p e r s o n f i l t e r   =   b . p e r s o n f i l t e r )  
  
  
 	 	 	 	 - -   p e r s o n _ f i l t e r _ r e l a t i o n s h i p s  
 	 	 	 	 	 I N S E R T   I N T O   [ P r o f i l e . D a t a ] . [ P e r s o n . F i l t e r R e l a t i o n s h i p ]  
 	 	 	 	 	                 (   P e r s o n I D   ,  
 	 	 	 	 	                     P e r s o n F i l t e r i d  
 	 	 	 	 	                 )    
 	 	 	 	 	 	     S E L E C T   D I S T I N C T  
 	 	 	 	 	 	 	 	   p . p e r s o n i d ,  
 	 	 	 	 	 	 	 	   p e r s o n f i l t e r i d    
 	 	 	 	 	 	 F R O M   [ P r o f i l e . I m p o r t ] . P e r s o n F i l t e r F l a g   p t f  
 	 	 	   	 	 	 J O I N   [ P r o f i l e . D a t a ] . [ P e r s o n . F i l t e r ]   p t   o n   p t . p e r s o n f i l t e r = p t f . p e r s o n f i l t e r  
 	 	 	 	   	 	 J O I N   [ P r o f i l e . D a t a ] . P e r s o n   p   o n   p . i n t e r n a l u s e r n a m e   =   p t f . i n t e r n a l u s e r n a m e    
 	 	 	 	       W H E R E   N O T   E X I S T S   ( S E L E C T   *    
 	 	 	 	 	 	 	 	 	 	   F R O M   [ P r o f i l e . D a t a ] . [ P e r s o n . F i l t e r R e l a t i o n s h i p ]   p t f  
 	 	 	 	 	 	 	 	 	 	   J O I N   [ P r o f i l e . D a t a ] . [ P e r s o n . F i l t e r ]   p t 2   o n   p t 2 . p e r s o n f i l t e r i d = p t f . p e r s o n f i l t e r i d  
 	 	 	 	 	 	 	 	 	 	   J O I N   [ P r o f i l e . D a t a ] . P e r s o n   p 2   o n   p 2 . p e r s o n i d = p t f . p e r s o n i d    
 	 	 	 	 	 	 	 	 	     W H E R E   ( p 2 . p e r s o n i d = p . p e r s o n i d    
 	 	 	 	 	 	 	 	 	 	   a n d   p t . p e r s o n f i l t e r i d = p t 2 . p e r s o n f i l t e r i d      
 	 	 	 	 	 	 	 	 	 	   )  
 	 	 	 	 	 	 	 	 	 	   ) 	 	 	 	 	 	 	 	 	 	 	 	           	 	 	 	 	 	 	 	 	 	            
    
 	 	 	 	    
 	 	 	 - -   H i d e / S h o w   D e p a r t m e n t s  
 	 	 	 u p d a t e   d  
 	 	 	 s e t   d . v i s i b l e   =   i s n u l l ( t . v , 0 )  
 	 	 	 f r o m   [ P r o f i l e . D a t a ] . [ O r g a n i z a t i o n . D e p a r t m e n t ]   d   l e f t   o u t e r   j o i n   (  
 	 	 	 	 s e l e c t   a . d e p a r t m e n t n a m e ,   m a x ( c a s t ( a . d e p a r t m e n t v i s i b l e   a s   i n t ) )   v  
 	 	 	 	 f r o m   [ P r o f i l e . I m p o r t ] . P e r s o n A f f i l i a t i o n   a ,   [ P r o f i l e . I m p o r t ] . P e r s o n   p  
 	 	 	 	 w h e r e   a . i n t e r n a l u s e r n a m e   =   p . i n t e r n a l u s e r n a m e   a n d   p . i s a c t i v e   =   1  
 	 	 	 	 g r o u p   b y   a . d e p a r t m e n t n a m e  
 	 	 	 )   t   o n   d . d e p a r t m e n t n a m e   =   t . d e p a r t m e n t n a m e  
  
    
 	 	 C O M M I T  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 	 - - C h e c k   s u c c e s s  
 	 	 	 I F   @ @ T R A N C O U N T   >   0     R O L L B A C K  
  
 	 	 	 - -   R a i s e   a n   e r r o r   w i t h   t h e   d e t a i l s   o f   t h e   e x c e p t i o n  
 	 	 	 S E L E C T   @ E r r M s g   =     E R R O R _ M E S S A G E ( ) ,  
 	 	 	 	 	 	   @ E r r S e v e r i t y   =   E R R O R _ S E V E R I T Y ( )  
  
 	 	 	 R A I S E R R O R ( @ E r r M s g ,   @ E r r S e v e r i t y ,   1 )  
 	 E N D   C A T C H 	  
 	 	 	 	  
 	 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' R e f r e s h i n g   [ P r o f i l e . D a t a ] . [ v w P e r s o n ] '  
 G O  
 E X E C   s p _ r e f r e s h v i e w   N ' [ P r o f i l e . D a t a ] . [ v w P e r s o n ] '  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ P r o f i l e . M o d u l e ] . [ N e t w o r k M a p . G e t C o a u t h o r s ] '  
 G O  
 C R E A T E   p r o c e d u r e   [ P r o f i l e . M o d u l e ] . [ N e t w o r k M a p . G e t C o a u t h o r s ]  
 	 @ N o d e I D   B I G I N T ,  
 	 @ w h i c h   I N T = 0 ,  
 	 @ S e s s i o n I D   U N I Q U E I D E N T I F I E R = N U L L  
 A S  
 B E G I N  
    
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   n o c o u n t     O N ;  
    
    
 	 D E C L A R E   @ P e r s o n I D   I N T  
    
 	 S E L E C T   @ P e r s o n I D   =   C A S T ( m . I n t e r n a l I D   A S   I N T )  
 	 	 F R O M   [ R D F . S t a g e ] . [ I n t e r n a l N o d e M a p ]   m ,   [ R D F . ] . N o d e   n  
 	 	 W H E R E   m . S t a t u s   =   3   A N D   m . V a l u e H a s h   =   n . V a l u e H a s h   A N D   n . N o d e I D   =   @ N o d e I D  
    
 	 D E C L A R E     @ f     T A B L E (  
 	 	 P e r s o n I D   I N T ,  
 	 	 d i s p l a y _ n a m e   N V A R C H A R ( 2 5 5 ) ,  
 	 	 l a t i t u d e   F L O A T ,  
 	 	 l o n g i t u d e   F L O A T ,  
 	 	 a d d r e s s 1   N V A R C H A R ( 1 0 0 0 ) ,  
 	 	 a d d r e s s 2   N V A R C H A R ( 1 0 0 0 ) ,  
 	 	 U R I   V A R C H A R ( 4 0 0 )  
 	 )  
    
 	 I N S E R T   I N T O   @ f   ( 	 P e r s o n I D ,  
 	 	 	 	 	 	 d i s p l a y _ n a m e ,  
 	 	 	 	 	 	 l a t i t u d e ,  
 	 	 	 	 	 	 l o n g i t u d e ,  
 	 	 	 	 	 	 a d d r e s s 1 ,  
 	 	 	 	 	 	 a d d r e s s 2  
 	 	 	 	 	 )  
 	 	 S E L E C T 	 p . P e r s o n I D ,  
 	 	 	 	 p . d i s p l a y n a m e ,  
 	 	 	 	 l . l a t i t u d e ,  
 	 	 	 	 l . l o n g i t u d e ,  
 	 	 	 	 C A S E   W H E N   p . a d d r e s s s t r i n g   l i k e   ' % , % '   T H E N   L E F T ( p . a d d r e s s s t r i n g , C H A R I N D E X ( ' , ' , p . a d d r e s s s t r i n g )   -   1 ) E L S E   P . a d d r e s s s t r i n g   E N D   a d d r e s s 1 ,  
 	 	 	 	 C A S E   W H E N   p . a d d r e s s s t r i n g   l i k e   ' % , % '   T H E N   R E P L A C E ( S U B S T R I N G ( p . a d d r e s s s t r i n g , C H A R I N D E X ( ' , ' , p . a d d r e s s s t r i n g )   +   1 , L E N ( p . a d d r e s s s t r i n g ) ) , ' ,   U S A ' , ' ' )   E L S E   p . a d d r e s s s t r i n g   E N D   a d d r e s s 2  
 	 	 F R O M   [ P r o f i l e . D a t a ] . v w p e r s o n   p ,  
 	 	 	 	 ( S E L E C T   D I S T I N C T   P e r s o n I D  
 	 	 	 	 	 F R O M     [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P e r s o n . I n c l u d e ]  
 	 	 	 	 	 W H E R E   p m i d   I N   ( S E L E C T   p m i d  
 	 	 	 	 	 	 	 	 	 	 F R O M   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P e r s o n . I n c l u d e ]  
 	 	 	 	 	 	 	 	 	 	 W H E R E   P e r s o n I D   =   @ P e r s o n I D  
 	 	 	 	 	 	 	 	 	 	 	 A N D   p m i d   I S   N O T   N U L L  
 	 	 	 	 	 	 	 	 	 )  
 	 	 	 	 )   t ,  
 	 	 	 	 [ P r o f i l e . D a t a ] . v w p e r s o n   l  
 	 	   W H E R E   p . P e r s o n I D   =   t . P e r s o n I D  
 	 	 	   A N D   p . P e r s o n I D   =   l . P e r s o n I D  
 	 	 	   A N D   l . l a t i t u d e   I S   N O T   N U L L  
 	 	 	   A N D   l . l o n g i t u d e   I S   N O T   N U L L  
 	 	   O R D E R   B Y   p . l a s t n a m e ,   p . f i r s t n a m e  
    
 	 U P D A T E   @ f  
 	 	 S E T   U R I   =   p . V a l u e   +   c a s t ( m . N o d e I D   a s   v a r c h a r ( 5 0 ) )  
 	 	 F R O M   @ f ,   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   m ,   [ F r a m e w o r k . ] . P a r a m e t e r   p  
 	 	 W H E R E   p . P a r a m e t e r I D   =   ' b a s e U R I '   A N D   m . I n t e r n a l H a s h   =   [ R D F . ] . f n V a l u e H a s h ( n u l l , n u l l , ' h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / P e r s o n ^ ^ P e r s o n ^ ^ ' + c a s t ( P e r s o n I D   a s   v a r c h a r ( 5 0 ) ) )  
    
 	 D E L E T E   F R O M   @ f   W H E R E   U R I   I S   N U L L  
    
 	 I F   ( S E L E C T   C O U N T ( * )   F R O M   @ f )   =   1  
 	 	 I F   ( S E L E C T   p e r s o n i d   f r o m   @ f ) = @ P e r s o n I D  
 	 	 	 D E L E T E   F R O M   @ f  
    
    
 	 I F   @ w h i c h   =   0  
 	 B E G I N  
 	 	 S E L E C T   P e r s o n I D ,    
 	 	 	 d i s p l a y _ n a m e ,  
 	 	 	 l a t i t u d e ,  
 	 	 	 l o n g i t u d e ,  
 	 	 	 a d d r e s s 1 ,  
 	 	 	 a d d r e s s 2 ,  
 	 	 	 U R I  
 	 	 F R O M   @ f  
 	 	 O R D E R   B Y   a d d r e s s 1 ,  
 	 	 	 a d d r e s s 2 ,  
 	 	 	 d i s p l a y _ n a m e  
 	 E N D  
 	 E L S E  
 	 B E G I N  
 	 	 S E L E C T   D I S T I N C T 	 a . l a t i t u d e 	 x 1 ,  
 	 	 	 	 	 	 a . l o n g i t u d e 	 y 1 ,  
 	 	 	 	 	 	 d . l a t i t u d e 	 x 2 ,  
 	 	 	 	 	 	 d . l o n g i t u d e 	 y 2 ,  
 	 	 	 	 	 	 a . P e r s o n I D 	 a ,  
 	 	 	 	 	 	 d . P e r s o n I D 	 b ,  
 	 	 	 	 	 	 ( C A S E    
 	 	 	 	 	 	 	   W H E N   a . P e r s o n I D   =   @ P e r s o n I D  
 	 	 	 	 	 	 	 	 O R   d . P e r s o n I D   =   @ P e r s o n I D   T H E N   1  
 	 	 	 	 	 	 	   E L S E   0  
 	 	 	 	 	 	   E N D )   i s _ p e r s o n ,  
 	 	 	 	 	 	 a . U R I   u 1 ,  
 	 	 	 	 	 	 d . U R I   u 2  
 	 	 	 F R O M   @ f   a ,  
 	 	 	 	 	   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P e r s o n . I n c l u d e ]   b ,  
 	 	 	 	 	   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P e r s o n . I n c l u d e ]   c ,  
 	 	 	 	 	   @ f   d  
 	 	   W H E R E   a . P e r s o n I D   =   b . P e r s o n I D  
 	 	 	   A N D   b . p m i d   =   c . p m i d  
 	 	 	   A N D   b . P e r s o n I D   <   c . P e r s o n I D  
 	 	 	   A N D   c . P e r s o n I D   =   d . P e r s o n I D  
 	 E N D  
 	 	  
 E N D  
  
  
  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ S e a r c h . C a c h e ] . [ P u b l i c . U p d a t e C a c h e ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ S e a r c h . C a c h e ] . [ P u b l i c . U p d a t e C a c h e ]  
  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
  
 	 d e c l a r e   @ t y p e I D   b i g i n t  
 	 s e l e c t   @ t y p e I D   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # t y p e ' )  
  
 	 d e c l a r e   @ l a b e l I D   b i g i n t  
 	 s e l e c t   @ l a b e l I D   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # l a b e l ' )  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   N o d e M a p  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 s e l e c t   t . S u b j e c t   N o d e I D ,   c . _ P r o p e r t y N o d e   P r o p e r t y ,   m a x ( S e a r c h W e i g h t )   S e a r c h W e i g h t  
 	 	 i n t o   # n  
 	 	 f r o m   [ O n t o l o g y . ] . C l a s s P r o p e r t y   c ,   [ R D F . ] . T r i p l e   t ,   [ R D F . ] . N o d e   n  
 	 	 w h e r e   t . P r e d i c a t e   =   @ t y p e I D   a n d   t . o b j e c t   =   c . _ C l a s s N o d e   a n d   c . S e a r c h W e i g h t   >   0  
 	 	 	 a n d   t . S u b j e c t   =   n . N o d e I D  
 	 	 	 a n d   t . V i e w S e c u r i t y G r o u p   =   - 1  
 	 	 	 a n d   n . V i e w S e c u r i t y G r o u p   =   - 1  
 	 	 g r o u p   b y   t . S u b j e c t ,   c . _ P r o p e r t y N o d e  
 	 c r e a t e   u n i q u e   c l u s t e r e d   i n d e x   i d x _ n p   o n   # n ( N o d e I D , P r o p e r t y )  
  
 	 c r e a t e   t a b l e   # s   (  
 	 	 N o d e I D   b i g i n t   n o t   n u l l ,  
 	 	 M a t c h e d B y N o d e I D   b i g i n t   n o t   n u l l ,  
 	 	 D i s t a n c e   i n t ,  
 	 	 P a t h s   i n t ,  
 	 	 W e i g h t   f l o a t  
 	 )  
 	 a l t e r   t a b l e   # s   a d d   p r i m a r y   k e y   ( N o d e I D ,   M a t c h e d B y N o d e I D )  
  
 	 i n s e r t   i n t o   # s   ( N o d e I D ,   M a t c h e d B y N o d e I D ,   D i s t a n c e ,   P a t h s ,   W e i g h t )  
 	 	 s e l e c t   x . N o d e I D ,   t . O b j e c t ,   1 ,   c o u n t ( * ) ,   1 - e x p ( s u m ( l o g ( c a s e   w h e n   x . S e a r c h W e i g h t * t . W e i g h t   >   0 . 9 9 9 9 9 9   t h e n   0 . 0 0 0 0 0 1   e l s e   1 - x . S e a r c h W e i g h t * t . W e i g h t   e n d ) ) )  
 	 	 	 f r o m   # n   x ,   [ R D F . ] . T r i p l e   t ,   [ R D F . ] . N o d e   n  
 	 	 	 w h e r e   x . N o d e I D   =   t . s u b j e c t   a n d   x . P r o p e r t y   =   t . p r e d i c a t e   a n d   x . S e a r c h W e i g h t * t . W e i g h t   >   0  
 	 	 	 	 a n d   t . O b j e c t   =   n . N o d e I D  
 	 	 	 	 a n d   t . V i e w S e c u r i t y G r o u p   =   - 1  
 	 	 	 	 a n d   n . V i e w S e c u r i t y G r o u p   =   - 1  
 	 	 	 g r o u p   b y   x . N o d e I D ,   t . O b j e c t  
  
 	 d e c l a r e   @ i   i n t  
 	 s e l e c t   @ i   =   1  
 	 w h i l e   @ i   <   1 0  
 	 b e g i n  
 	 	 i n s e r t   i n t o   # s   ( N o d e I D ,   M a t c h e d B y N o d e I D ,   D i s t a n c e ,   P a t h s ,   W e i g h t )  
 	 	 	 s e l e c t   s . N o d e I D ,   t . M a t c h e d B y N o d e I D ,   @ i + 1 ,   c o u n t ( * ) ,   1 - e x p ( s u m ( l o g ( c a s e   w h e n   s . W e i g h t * t . W e i g h t   >   0 . 9 9 9 9 9 9   t h e n   0 . 0 0 0 0 0 1   e l s e   1 - s . W e i g h t * t . W e i g h t   e n d ) ) )  
 	 	 	 	 f r o m   # s   s ,   # s   t  
 	 	 	 	 w h e r e   s . M a t c h e d B y N o d e I D   =   t . N o d e I D  
 	 	 	 	 	 a n d   s . D i s t a n c e   =   @ i  
 	 	 	 	 	 a n d   t . D i s t a n c e   =   1  
 	 	 	 	 	 a n d   t . N o d e I D   < >   s . N o d e I D  
 	 	 	 	 	 a n d   n o t   e x i s t s   (  
 	 	 	 	 	 	 s e l e c t   *  
 	 	 	 	 	 	 f r o m   # s   u  
 	 	 	 	 	 	 w h e r e   u . N o d e I D   =   s . N o d e I D   a n d   u . M a t c h e d B y N o d e I D   =   t . M a t c h e d B y N o d e I D  
 	 	 	 	 	 )  
 	 	 	 	 g r o u p   b y   s . N o d e I D ,   t . M a t c h e d B y N o d e I D  
 	 	 i f   @ @ R O W C O U N T   =   0  
 	 	 	 s e l e c t   @ i   =   1 0  
 	 	 s e l e c t   @ i   =   @ i   +   1  
 	 e n d  
  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   N o d e S u m m a r y   ( P a r t   1 )  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 s e l e c t   t . s u b j e c t   N o d e I D ,   m i n ( c a s e   w h e n   l e n ( n . V a l u e ) > 5 0 0   t h e n   l e f t ( n . V a l u e , 4 9 7 ) + ' . . . '   e l s e   n . V a l u e   e n d )   L a b e l  
 	 	 i n t o   # l  
 	 	 f r o m   [ R D F . ] . T r i p l e   t ,   [ R D F . ] . N o d e   n  
 	 	 w h e r e   t . p r e d i c a t e   =   @ l a b e l I D   a n d   t . o b j e c t   =   n . N o d e I D  
 	 	 	 a n d   t . s u b j e c t   i n   ( s e l e c t   N o d e I D   f r o m   # s )  
 	 	 	 a n d   t . V i e w S e c u r i t y G r o u p   =   - 1  
 	 	 	 a n d   n . V i e w S e c u r i t y G r o u p   =   - 1  
 	 	 g r o u p   b y   t . s u b j e c t  
  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   N o d e C l a s s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 s e l e c t   d i s t i n c t   l . N o d e I D ,   t . O b j e c t  
 	 	 i n t o   # c  
 	 	 f r o m   [ R D F . ] . N o d e   l ,   [ R D F . ] . T r i p l e   t ,   [ R D F . ] . N o d e   n  
 	 	 w h e r e   l . N o d e I D   =   t . s u b j e c t   a n d   t . p r e d i c a t e   =   @ t y p e I D   a n d   t . o b j e c t   =   n . N o d e I D  
 	 	 	 a n d   t . V i e w S e c u r i t y G r o u p   =   - 1  
 	 	 	 a n d   n . V i e w S e c u r i t y G r o u p   =   - 1  
 	 	 	 a n d   l . V i e w S e c u r i t y G r o u p   =   - 1  
  
 	 c r e a t e   u n i q u e   c l u s t e r e d   i n d e x   i d x _ n o   o n   # c ( N o d e I D ,   O b j e c t )  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   N o d e S u m m a r y   ( P a r t   2 )  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 C R E A T E   I N D E X   i d x _ c   O N   # c   ( [ O b j e c t ] )   I N C L U D E   ( [ N o d e I D ] ) 	 	 	 	 	 	 	  
 	 C R E A T E   I N D E X   i d x _ l   O N   # l   ( [ N o d e I D ] )   I N C L U D E   ( [ L a b e l ] ) 	  
  
 	 s e l e c t   N o d e I D ,   L a b e l ,   C l a s s N a m e ,   r o w _ n u m b e r ( )   o v e r   ( o r d e r   b y   L a b e l ,   N o d e I D )   S o r t O r d e r  
 	 	 i n t o   # l 2  
 	 	 f r o m   (  
 	 	 	 s e l e c t   l . N o d e I D ,   l . L a b e l ,   d . _ C l a s s N a m e   C l a s s N a m e ,  
 	 	 	 	 r o w _ n u m b e r ( )   o v e r   ( p a r t i t i o n   b y   l . N o d e I D   o r d e r   b y   I s N u l l ( d . _ T r e e D e p t h , 0 )   d e s c ,   d . _ C l a s s N a m e )   k  
 	 	 	 f r o m   # l   l  
 	 	 	 	 i n n e r   j o i n   # c   c   o n   l . N o d e I D   =   c . N o d e I D  
 	 	 	 	 i n n e r   j o i n   [ O n t o l o g y . ] . C l a s s G r o u p C l a s s   g   o n   c . O b j e c t   =   g . _ C l a s s N o d e  
 	 	 	 	 l e f t   o u t e r   j o i n   [ O n t o l o g y . ] . C l a s s T r e e D e p t h   d   o n   c . O b j e c t   =   d . _ C l a s s N o d e  
 	 	 )   t  
 	 	 w h e r e   k   =   1  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   N o d e R D F  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 s e l e c t   n . N o d e I D ,   c . _ P r o p e r t y N o d e   P r o p e r t y N o d e ,   m a x ( L i m i t )   L i m i t ,   m a x ( c a s t ( c . I n c l u d e D e s c r i p t i o n   a s   t i n y i n t ) )   I n c l u d e D e s c r i p t i o n ,   m a x ( _ T a g N a m e )   T a g N a m e  
 	 	 i n t o   # N o d e P r o p e r t y E x p a n d  
 	 	 f r o m   # c   n ,   [ O n t o l o g y . ] . C l a s s P r o p e r t y   c ,   [ R D F . ] . N o d e   p  
 	 	 w h e r e   n . O b j e c t   =   c . _ C l a s s N o d e  
 	 	 	 a n d   c . _ N e t w o r k P r o p e r t y N o d e   i s   n u l l  
 	 	 	 a n d   c . I s D e t a i l   =   0  
 	 	 	 a n d   c . _ P r o p e r t y N o d e   =   p . N o d e I D  
 	 	 	 a n d   p . V i e w S e c u r i t y G r o u p   =   - 1  
 	 	 g r o u p   b y   n . N o d e I D ,   c . _ P r o p e r t y N o d e  
 	 - - [ 1 0 7 4 0 3 1 2   i n   0 0 : 0 0 : 3 1 ]  
  
 	 s e l e c t   e . N o d e I D ,   o . N o d e I D   E x p a n d N o d e I D ,   e . I n c l u d e D e s c r i p t i o n ,   e . T a g N a m e ,   o . O b j e c t T y p e ,   o . V a l u e ,   o . L a n g u a g e ,   o . D a t a T y p e  
 	 	 i n t o   # N o d e P r o p e r t y V a l u e  
 	 	 f r o m   # N o d e P r o p e r t y E x p a n d   e ,   [ R D F . ] . T r i p l e   t ,   [ R D F . ] . N o d e   o  
 	 	 w h e r e   t . s u b j e c t   =   e . N o d e I D  
 	 	 	 a n d   t . p r e d i c a t e   =   e . P r o p e r t y N o d e  
 	 	 	 a n d   t . o b j e c t   =   o . N o d e I D  
 	 	 	 a n d   t . V i e w S e c u r i t y G r o u p   =   - 1  
 	 	 	 a n d   o . V i e w S e c u r i t y G r o u p   =   - 1  
 	 	 	 a n d   ( ( e . L i m i t   i s   n u l l )   o r   ( t . S o r t O r d e r   < =   e . L i m i t ) )  
 	 - - [ 8 6 4 6 8 4 9   i n   0 0 : 0 1 : 3 1 ]  
  
 	 s e l e c t   N o d e I D ,   E x p a n d N o d e I D ,  
 	 	 	 ' _ T A G L T _ ' + t a g N a m e  
 	 	 	 + ( c a s e   w h e n   O b j e c t T y p e   =   0   t h e n   '   r d f : r e s o u r c e = " ' + V a l u e + ' " / _ T A G G T _ '    
 	 	 	 	 	 e l s e   ' _ T A G G T _ ' + V a l u e + ' _ T A G L T _ / ' + t a g N a m e + ' _ T A G G T _ '   e n d )  
 	 	 	 T a g V a l u e  
 	 	 i n t o   # N o d e P r o p e r t y T a g T e m p  
 	 	 f r o m   (  
 	 	 	 s e l e c t   N o d e I D ,   E x p a n d N o d e I D ,   T a g N a m e ,   O b j e c t T y p e ,   L a n g u a g e ,   D a t a T y p e ,  
 	 	 	 	 ( c a s e   w h e n   c h a r i n d e x ( c h a r ( 0 ) , c a s t ( V a l u e   a s   v a r c h a r ( m a x ) ) )   >   0  
 	 	 	 	 	 	 t h e n   r e p l a c e ( r e p l a c e ( r e p l a c e ( r e p l a c e ( c a s t ( V a l u e   a s   v a r c h a r ( m a x ) ) , c h a r ( 0 ) , ' ' ) , ' & ' , ' & a m p ; ' ) , ' < ' , ' & l t ; ' ) , ' > ' , ' & g t ; ' )  
 	 	 	 	 	 	 e l s e   r e p l a c e ( r e p l a c e ( r e p l a c e ( V a l u e , ' & ' , ' & a m p ; ' ) , ' < ' , ' & l t ; ' ) , ' > ' , ' & g t ; ' )  
 	 	 	 	 	 	 e n d )   V a l u e  
 	 	 	 	 f r o m   # N o d e P r o p e r t y V a l u e  
 	 	 )   t  
 	 - - [ 9 1 6 2 1 7 7   i n   0 0 : 0 3 : 3 9 ]  
  
 	 c r e a t e   n o n c l u s t e r e d   i n d e x   i d x _ n   o n   # N o d e P r o p e r t y T a g T e m p ( N o d e I D )  
 	 - - [ 0 0 : 0 0 : 0 7 ]  
  
 	 s e l e c t   N o d e I D ,   E x p a n d N o d e I D ,   T a g V a l u e ,   r o w _ n u m b e r ( )   o v e r   ( p a r t i t i o n   b y   N o d e I D   o r d e r   b y   T a g V a l u e )   k  
 	 	 i n t o   # N o d e P r o p e r t y T a g  
 	 	 f r o m   # N o d e P r o p e r t y T a g T e m p  
 	 - - [ 9 1 6 2 1 7 7   i n   0 0 : 0 0 : 3 4 ]  
 	  
 	 c r e a t e   n o n c l u s t e r e d   i n d e x   i d x _ n k   o n   # N o d e P r o p e r t y T a g ( N o d e I D , k )  
 	 - - [ 0 0 : 0 0 : 0 7 ]  
 	 c r e a t e   n o n c l u s t e r e d   i n d e x   i d x _ k n   o n   # N o d e P r o p e r t y T a g ( k , N o d e I D )  
 	 - - [ 0 0 : 0 0 : 1 0 ]  
  
 	 s e l e c t   N o d e I D ,   T a g V a l u e   T a g s  
 	 	 i n t o   # N o d e T a g s  
 	 	 f r o m   # N o d e P r o p e r t y T a g  
 	 	 w h e r e   k   =   1  
 	 d e c l a r e   @ k   i n t  
 	 s e l e c t   @ k   =   2  
 	 w h i l e   ( @ k   >   0 )   a n d   ( @ k   <   2 5 )  
 	 b e g i n  
 	 	 u p d a t e   t  
 	 	 	 s e t   t . T a g s   =   t . T a g s   +   p . T a g V a l u e  
 	 	 	 f r o m   # N o d e T a g s   t  
 	 	 	 	 i n n e r   j o i n   # N o d e P r o p e r t y T a g   p  
 	 	 	 	 	 o n   t . N o d e I D   =   p . N o d e I D   a n d   p . k   =   @ k  
 	 	 i f   @ @ R O W C O U N T   =   0  
 	 	 	 s e l e c t   @ k   =   - 1  
 	 	 e l s e  
 	 	 	 s e l e c t   @ k   =   @ k   +   1 	 	 	  
 	 e n d  
 	 - - [ 4 1 6 2 6 5 9   i n   0 0 : 0 5 : 0 1 ]  
  
 	 c r e a t e   u n i q u e   c l u s t e r e d   i n d e x   i d x _ n   o n   # N o d e T a g s ( N o d e I D )  
 	 - - [ 0 0 : 0 0 : 1 6 ]  
 	 	  
 	 / * 	  
 	 s e l e c t   N o d e I D ,  
 	 	 	 c a s t ( (  
 	 	 	 	 s e l e c t   b . T a g V a l u e + ' ' 	  
 	 	 	 	 	 f r o m   # N o d e P r o p e r t y T a g   b  
 	 	 	 	 	 w h e r e   b . N o d e I D   =   a . N o d e I D  
 	 	 	 	 	 o r d e r   b y   b . T a g V a l u e  
 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 )   a s   n v a r c h a r ( m a x ) )  
 	 	 	 T a g s  
 	 	 i n t o   # N o d e T a g s  
 	 	 f r o m   # N o d e P r o p e r t y T a g   a  
 	 	 g r o u p   b y   N o d e I D  
 	 - - [ 3 7 6 4 7 8 3   i n   0 0 : 1 3 : 1 8 ]  
 	 * /  
 	  
 	 s e l e c t   t . N o d e I D ,    
 	 	 	 ' _ T A G L T _ r d f : D e s c r i p t i o n   r d f : a b o u t = " '   +   r e p l a c e ( r e p l a c e ( r e p l a c e ( n . V a l u e , ' & ' , ' & a m p ; ' ) , ' < ' , ' & l t ; ' ) , ' > ' , ' & g t ; ' )   +   ' " _ T A G G T _ '  
 	 	 	 +   t . T a g s  
 	 	 	 +   ' _ T A G L T _ / r d f : D e s c r i p t i o n _ T A G G T _ '  
 	 	 	 R D F  
 	 	 i n t o   # N o d e R D F  
 	 	 f r o m   # N o d e T a g s   t ,   [ R D F . ] . N o d e   n  
 	 	 w h e r e   t . N o d e I D   =   n . N o d e I D  
 	 - - [ 4 1 6 2 6 5 9   i n   0 0 : 0 1 : 4 0 ]  
  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   N o d e E x p a n d  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 s e l e c t   d i s t i n c t   N o d e I D ,   E x p a n d N o d e I D  
 	 	 i n t o   # N o d e E x p a n d  
 	 	 f r o m   # N o d e P r o p e r t y V a l u e  
 	 	 w h e r e   I n c l u d e D e s c r i p t i o n   =   1  
 	 - - [ 5 3 7 0 8 0 3   i n   0 0 : 0 0 : 0 6 ]  
  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   N o d e P r e f i x  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 c r e a t e   t a b l e   # N o d e P r e f i x   (  
 	 	 P r e f i x   v a r c h a r ( 8 0 0 )   n o t   n u l l ,  
 	 	 N o d e I D   b i g i n t   n o t   n u l l  
 	 )  
 	 i n s e r t   i n t o   # N o d e P r e f i x   ( P r e f i x , N o d e I D )  
 	 	 s e l e c t   l e f t ( V a l u e , 8 0 0 ) ,   N o d e I D  
 	 	 	 f r o m   [ R D F . ] . N o d e  
 	 	 	 w h e r e   V i e w S e c u r i t y G r o u p   =   - 1  
 	 - - [ 5 7 1 0 7 7 5   i n   0 0 : 0 0 : 0 9 ]  
 	 a l t e r   t a b l e   # N o d e P r e f i x   a d d   p r i m a r y   k e y   ( P r e f i x ,   N o d e I D )  
 	 - - [ 0 0 : 0 0 : 1 3 ]  
  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   U p d a t e   a c t u a l   t a b l e s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 B E G I N   T R Y  
 	 	 B E G I N   T R A N  
 	 	  
 	 	 	 t r u n c a t e   t a b l e   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e M a p ]  
 	 	 	 i n s e r t   i n t o   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e M a p ]  
 	 	 	 	 s e l e c t   *   f r o m   # s  
 	 	 	 t r u n c a t e   t a b l e   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e S u m m a r y ]  
 	 	 	 i n s e r t   i n t o   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e S u m m a r y ]  
 	 	 	 	 s e l e c t   *   f r o m   # l 2  
 	 	 	 t r u n c a t e   t a b l e   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e C l a s s ]  
 	 	 	 i n s e r t   i n t o   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e C l a s s ]  
 	 	 	 	 s e l e c t   *   f r o m   # c  
 	 	 	 	 	  
  
 	 	 	 t r u n c a t e   t a b l e   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e E x p a n d ]  
 	 	 	 i n s e r t   i n t o   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e E x p a n d ]   ( N o d e I D ,   E x p a n d N o d e I D )  
 	 	 	 	 s e l e c t   N o d e I D ,   E x p a n d N o d e I D  
 	 	 	 	 	 f r o m   # N o d e E x p a n d  
 	 	 	 - - [ 5 3 7 0 8 0 3   i n   0 0 : 0 0 : 1 7 ]  
  
 	 	 	 t r u n c a t e   t a b l e   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e R D F ]  
 	 	 	 i n s e r t   i n t o   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e R D F ]   ( N o d e I D ,   R D F )  
 	 	 	 	 s e l e c t   N o d e I D ,   R D F  
 	 	 	 	 	 f r o m   # N o d e R D F  
 	 	 	 - - [ 3 7 6 4 7 8 3   i n   0 0 : 0 0 : 3 0 ]  
  
 	 	 	 t r u n c a t e   t a b l e   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e P r e f i x ]  
 	 	 	 i n s e r t   i n t o   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e P r e f i x ]   ( P r e f i x ,   N o d e I D )  
 	 	 	 	 s e l e c t   P r e f i x ,   N o d e I D  
 	 	 	 	 	 f r o m   # N o d e P r e f i x  
 	 	 	 - - [ 8 0 0 1 2 3 8   i n   0 0 : 0 0 : 5 7 ]  
  
 	 	 C O M M I T  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 - - C h e c k   s u c c e s s  
 	 	 I F   @ @ T R A N C O U N T   >   0     R O L L B A C K  
 	 	 - - R a i s e   a n   e r r o r   w i t h   t h e   d e t a i l s   o f   t h e   e x c e p t i o n  
 	 	 D E C L A R E   @ E r r M s g   n v a r c h a r ( 4 0 0 0 ) ,   @ E r r S e v e r i t y   i n t  
 	 	 S E L E C T   @ E r r M s g   =   E R R O R _ M E S S A G E ( ) ,   @ E r r S e v e r i t y   =   E R R O R _ S E V E R I T Y ( )  
 	 	 R A I S E R R O R ( @ E r r M s g ,   @ E r r S e v e r i t y ,   1 )  
 	 E N D   C A T C H  
    
  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ P r o f i l e . M o d u l e ] . [ N e t w o r k R a d i a l . G e t C o a u t h o r s ] '  
 G O  
 C R E A T E   p r o c e d u r e   [ P r o f i l e . M o d u l e ] . [ N e t w o r k R a d i a l . G e t C o a u t h o r s ]  
 	 @ N o d e I D   B I G I N T ,  
 	 @ S e s s i o n I D   U N I Q U E I D E N T I F I E R = N U L L  
 A S  
 B E G I N  
 	 S E T   N O C O U N T   O N ; 	  
 	  
 	 D E C L A R E   @ P e r s o n I D 1   I N T  
    
 	 S E L E C T   @ P e r s o n I D 1   =   C A S T ( m . I n t e r n a l I D   A S   I N T )  
 	 	 F R O M   [ R D F . S t a g e ] . [ I n t e r n a l N o d e M a p ]   m ,   [ R D F . ] . N o d e   n  
 	 	 W H E R E   m . S t a t u s   =   3   A N D   m . V a l u e H a s h   =   n . V a l u e H a s h   A N D   n . N o d e I D   =   @ N o d e I D  
    
 	 	  
 	 S E L E C T   T O P   1 2 0  
 	 	 	 	 	 	 p e r s o n i d ,  
 	 	 	 	 	 	 d i s t a n c e ,  
 	 	 	 	 	 	 n u m b e r o f p a t h s ,  
 	 	 	 	 	 	 w e i g h t ,  
 	 	 	 	 	 	 w 2 ,  
 	 	 	 	 	 	 l a s t n a m e ,  
 	 	 	 	 	 	 f i r s t n a m e ,  
 	 	 	 	 	 	 p ,  
 	 	 	 	 	 	 k ,  
 	 	 	 	 	 	 c a s t ( - 1   a s   b i g i n t )   n o d e i d ,  
 	 	 	 	 	 	 c a s t ( ' '   a s   v a r c h a r ( 4 0 0 ) )   u r i  
 	 	 	   I N T O   # n e t w o r k    
 	 	 	   F R O M   (    
 	 	 	 	 	 	 	 S E L E C T   p e r s o n i d ,    
 	 	 	 	 	 	 	 	 	 	   d i s t a n c e ,    
 	 	 	 	 	 	 	 	 	 	   n u m b e r o f p a t h s ,    
 	 	 	 	 	 	 	 	 	 	   w e i g h t ,    
 	 	 	 	 	 	 	 	 	 	   w 2 ,    
 	 	 	 	 	 	 	 	 	 	   p . l a s t n a m e ,    
 	 	 	 	 	 	 	 	 	 	   p . f i r s t n a m e ,    
 	 	 	 	 	 	 	 	 	 	   p . n u m p u b l i c a t i o n s   p ,    
 	 	 	 	 	 	 	 	 	 	   R O W _ N U M B E R ( )   O V E R   ( P A R T I T I O N   B Y   d i s t a n c e   O R D E R   B Y   w 2   D E S C )   k    
 	 	 	 	 	 	 	     F R O M   [ P r o f i l e . C a c h e ] . P e r s o n   p  
 	 	 	 	 	 	 	     J O I N   (   S E L E C T   * ,   R O W _ N U M B E R ( )   O V E R   ( P A R T I T I O N   B Y   p e r s o n i d 2   O R D E R   B Y   d i s t a n c e ,   w 2   D E S C )   k    
 	 	 	 	 	 	 	 	 	 	 F R O M   (  
 	 	 	 	 	 	 	 	 	 	 	 S E L E C T   p e r s o n i d 2 ,   1   d i s t a n c e ,   n   n u m b e r o f p a t h s ,   w   w e i g h t ,   w   w 2    
 	 	 	 	 	 	 	 	 	 	 	 	 F R O M   [ P r o f i l e . C a c h e ] . [ S N A . C o a u t h o r ]      
 	 	 	 	 	 	 	 	 	 	 	 	 W H E R E   p e r s o n i d 1   =   @ p e r s o n i d 1  
 	 	 	 	 	 	 	 	 	 	 	 U N I O N   A L L    
 	 	 	 	 	 	 	 	 	 	 	 	 S E L E C T   b . p e r s o n i d 2 ,   2   d i s t a n c e ,   b . n   n u m b e r o f p a t h s ,   b . w   w e i g h t , a . w * b . w   w 2    
 	 	 	 	 	 	 	 	 	 	 	 	 F R O M   [ P r o f i l e . C a c h e ] . [ S N A . C o a u t h o r ]   a   J O I N   [ P r o f i l e . C a c h e ] . [ S N A . C o a u t h o r ]   b   O N   a . p e r s o n i d 2   =   b . p e r s o n i d 1    
 	 	 	 	 	 	 	 	 	 	 	 	 W H E R E   a . p e r s o n i d 1   =   @ p e r s o n i d 1      
 	 	 	 	 	 	 	 	 	 	 	 U N I O N   A L L    
 	 	 	 	 	 	 	 	 	 	 	 	 S E L E C T   @ p e r s o n i d 1   p e r s o n i d 2 ,   0   d i s t a n c e ,   1   n u m b e r o f p a t h s ,   1   w e i g h t ,   1   w 2    
 	 	 	 	 	 	 	 	 	 	 )   t    
 	 	 	 	 	 	 	 	 	 )   t   O N   p . p e r s o n i d   =   t . p e r s o n i d 2    
 	 	 	 	 	 	 	     W H E R E   k   =   1     A N D   p . I s A c t i v e   =   1  
 	 	 	 	 	 	 )   t    
 	 	 	 W H E R E   k   < =   8 0    
 	 O R D E R   B Y   d i s t a n c e ,   k  
 	  
 	 U P D A T E   n  
 	 	 S E T   n . N o d e I D   =   m . N o d e I D ,   n . U R I   =   p . V a l u e   +   c a s t ( m . N o d e I D   a s   v a r c h a r ( 5 0 ) )  
 	 	 F R O M   # n e t w o r k   n ,   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   m ,   [ F r a m e w o r k . ] . P a r a m e t e r   p  
 	 	 W H E R E   p . P a r a m e t e r I D   =   ' b a s e U R I '   A N D   m . I n t e r n a l H a s h   =   [ R D F . ] . f n V a l u e H a s h ( n u l l , n u l l , ' h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / P e r s o n ^ ^ P e r s o n ^ ^ ' + c a s t ( n . P e r s o n I D   a s   v a r c h a r ( 5 0 ) ) )  
    
 	 D E L E T E   F R O M   # n e t w o r k   W H E R E   I s N u l l ( U R I , ' ' )   =   ' ' 	  
 	  
    
 	 S E L E C T   c . p e r s o n i d 1   i d 1 ,   c . p e r s o n i d 2 	 i d 2 ,   c . n ,   C A S T ( c . w   A S   V A R C H A R )   w ,    
 	 	 	 ( C A S E   W H E N   Y E A R ( f i r s t p u b d a t e ) < 1 9 8 0   T H E N   1 9 8 0   E L S E   Y E A R ( f i r s t p u b d a t e )   E N D )   y 1 ,    
 	 	 	 ( C A S E   W H E N   Y E A R ( l a s t p u b d a t e ) < 1 9 8 0   T H E N   1 9 8 0   E L S E   Y E A R ( l a s t p u b d a t e )   E N D )   y 2 ,  
 	 	 	 ( c a s e   w h e n   c . p e r s o n i d 1   =   @ p e r s o n i d 1   o r   c . p e r s o n i d 2   =   @ p e r s o n i d 1   t h e n   1   e l s e   0   e n d )   k ,  
 	 	 	 a . n o d e i d   n 1 ,   b . n o d e i d   n 2 ,   a . u r i   u 1 ,   b . u r i   u 2  
 	 	 i n t o   # n e t w o r k 2  
 	 	 f r o m   # n e t w o r k   a  
 	 	 	 J O I N   # n e t w o r k   b   o n   a . p e r s o n i d   <   b . p e r s o n i d      
 	 	 	 J O I N   [ P r o f i l e . C a c h e ] . [ S N A . C o a u t h o r ]   c   O N   a . p e r s o n i d   =   c . p e r s o n i d 1   a n d   b . p e r s o n i d   =   c . p e r s o n i d 2      
    
 	 ; w i t h   a   a s   (  
 	 	 s e l e c t   i d 1 ,   i d 2 ,   w ,   k   f r o m   # n e t w o r k 2  
 	 	 u n i o n   a l l  
 	 	 s e l e c t   i d 2 ,   i d 1 ,   w ,   k   f r o m   # n e t w o r k 2  
 	 ) ,   b   a s   (  
 	 	 s e l e c t   a . * ,   r o w _ n u m b e r ( )   o v e r   ( p a r t i t i o n   b y   a . i d 1   o r d e r   b y   a . w   d e s c ,   a . i d 2 )   s  
 	 	 f r o m   a ,    
 	 	 	 ( s e l e c t   i d 1   f r o m   a   g r o u p   b y   i d 1   h a v i n g   m a x ( k )   =   0 )   b ,  
 	 	 	 ( s e l e c t   i d 1   f r o m   a   g r o u p   b y   i d 1   h a v i n g   m a x ( k )   >   0 )   c  
 	 	 w h e r e   a . i d 1   =   b . i d 1   a n d   a . i d 2   =   c . i d 1  
 	 )  
 	 u p d a t e   n  
 	 	 s e t   n . k   =   2  
 	 	 f r o m   # n e t w o r k 2   n ,   b  
 	 	 w h e r e   ( n . i d 1   =   b . i d 1   a n d   n . i d 2   =   b . i d 2   a n d   b . s   =   1 )   o r   ( n . i d 1   =   b . i d 2   a n d   n . i d 2   =   b . i d 1   a n d   b . s   =   1 )  
    
 	 u p d a t e   n  
 	 	 s e t   n . k   =   3  
 	 	 f r o m   # n e t w o r k 2   n ,   (  
 	 	 	 s e l e c t   * ,   r o w _ n u m b e r ( )   o v e r   ( o r d e r   b y   k   d e s c ,   w   d e s c )   r    
 	 	 	 f r o m   # n e t w o r k 2    
 	 	 )   r  
 	 	 w h e r e   n . i d 1 = r . i d 1   a n d   n . i d 2 = r . i d 2   a n d   n . k = 0   a n d   r . r < = 3 6 0  
    
 	 S E L E C T   (  
 	 	 S E L E C T   p e r s o n i d   " @ i d " ,   n o d e i d   " @ n o d e i d " ,   u r i   " @ u r i " ,   d i s t a n c e   " @ d " ,   p   " @ p u b s " ,   f i r s t n a m e   " @ f n " ,   l a s t n a m e   " @ l n " ,   c a s t ( w 2   a s   v a r c h a r ( 5 0 ) )   " @ w 2 "  
 	 	 F R O M   # n e t w o r k  
 	 	 F O R   X M L   P A T H ( ' N e t w o r k P e r s o n ' ) , R O O T ( ' N e t w o r k P e o p l e ' ) , T Y P E  
 	 ) ,   (  
 	 	 S E L E C T   i d 1   " @ i d 1 " ,   i d 2   " @ i d 2 " ,   n   " @ n " ,   c a s t ( w   a s   v a r c h a r ( 5 0 ) )   " @ w " ,   y 1   " @ y 1 " ,   y 2   " @ y 2 " ,  
 	 	 	 n 1   " @ n o d e i d 1 " ,   n 2   " @ n o d e i d 2 " ,   u 1   " @ u r i 1 " ,   u 2   " @ u r i 2 "  
 	 	 F R O M   # n e t w o r k 2  
 	 	 W H E R E   k   >   0  
 	 	 F O R   X M L   P A T H ( ' N e t w o r k C o A u t h o r ' ) , R O O T ( ' N e t w o r k C o A u t h o r s ' ) , T Y P E  
 	 )  
 	 F O R   X M L   P A T H ( ' L o c a l N e t w o r k ' )  
    
    
    
 E N D  
  
  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ P r o f i l e . M o d u l e ] . [ C u s t o m V i e w P e r s o n S a m e D e p a r t m e n t . G e t L i s t ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ P r o f i l e . M o d u l e ] . [ C u s t o m V i e w P e r s o n S a m e D e p a r t m e n t . G e t L i s t ]  
 	 @ N o d e I D   B I G I N T ,  
 	 @ S e s s i o n I D   U N I Q U E I D E N T I F I E R   =   N U L L  
 A S  
 B E G I N  
    
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
    
 	 d e c l a r e   @ l a b e l I D   b i g i n t  
 	 s e l e c t   @ l a b e l I D   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # l a b e l ' )  
  
 	 d e c l a r e   @ b a s e U R I   n v a r c h a r ( 4 0 0 )  
 	 s e l e c t   @ b a s e U R I   =   v a l u e   f r o m   [ F r a m e w o r k . ] . P a r a m e t e r   w h e r e   P a r a m e t e r I D   =   ' b a s e U R I '  
  
 	 D E C L A R E   @ P e r s o n I D   I N T  
   	 S E L E C T   @ P e r s o n I D   =   C A S T ( m . I n t e r n a l I D   A S   I N T )  
 	 	 F R O M   [ R D F . S t a g e ] . [ I n t e r n a l N o d e M a p ]   m ,   [ R D F . ] . N o d e   n  
 	 	 W H E R E   m . S t a t u s   =   3   A N D   m . V a l u e H a s h   =   n . V a l u e H a s h   A N D   n . N o d e I D   =   @ N o d e I D  
  
 	 d e c l a r e   @ i   n v a r c h a r ( 5 0 0 )  
 	 d e c l a r e   @ d   n v a r c h a r ( 5 0 0 )  
 	 d e c l a r e   @ v   n v a r c h a r ( 5 0 0 )  
  
 	 s e l e c t   @ i   =   i n s t i t u t i o n n a m e ,   @ d   =   d e p a r t m e n t n a m e ,   @ v   =   d i v i s i o n f u l l n a m e  
 	 	 f r o m   [ P r o f i l e . C a c h e ] . [ P e r s o n ]  
 	 	 w h e r e   p e r s o n i d   =   @ p e r s o n i d  
  
 	 d e c l a r e   @ I n s t i t u t i o n U R I   v a r c h a r ( 4 0 0 )  
 	 d e c l a r e   @ D e p a r t m e n t U R I   v a r c h a r ( 4 0 0 )  
  
 	 s e l e c t 	 @ I n s t i t u t i o n U R I   =   @ b a s e U R I   +   c a s t ( j . N o d e I D   a s   v a r c h a r ( 5 0 ) ) ,  
 	 	 	 @ D e p a r t m e n t U R I   =   @ b a s e U R I   +   c a s t ( e . N o d e I D   a s   v a r c h a r ( 5 0 ) )  
 	 	 f r o m   [ P r o f i l e . D a t a ] . [ O r g a n i z a t i o n . I n s t i t u t i o n ]   i ,  
 	 	 	 [ P r o f i l e . D a t a ] . [ O r g a n i z a t i o n . D e p a r t m e n t ]   d ,  
 	 	 	 [ R D F . S t a g e ] . [ I n t e r n a l N o d e M a p ]   j ,  
 	 	 	 [ R D F . S t a g e ] . [ I n t e r n a l N o d e M a p ]   e  
 	 	 w h e r e   i . I n s t i t u t i o n N a m e   =   @ i   a n d   d . D e p a r t m e n t N a m e   =   @ d  
 	 	 	 a n d   j . I n t e r n a l T y p e   =   ' I n s t i t u t i o n '   a n d   j . C l a s s   =   ' h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / O r g a n i z a t i o n '   a n d   j . I n t e r n a l I D   =   c a s t ( i . I n s t i t u t i o n I D   a s   v a r c h a r ( 5 0 ) )  
 	 	 	 a n d   e . I n t e r n a l T y p e   =   ' D e p a r t m e n t '   a n d   e . C l a s s   =   ' h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / O r g a n i z a t i o n '   a n d   e . I n t e r n a l I D   =   c a s t ( d . D e p a r t m e n t I D   a s   v a r c h a r ( 5 0 ) )  
  
 	 d e c l a r e   @ x   x m l  
  
 	 ; w i t h   a   a s   (  
 	 	 s e l e c t   a . p e r s o n i d ,    
 	 	 	 m a x ( c a s e   w h e n   a . d i v i s i o n n a m e   =   @ v   t h e n   1   e l s e   0   e n d )   v ,  
 	 	 	 m a x ( c a s e   w h e n   s . n u m p u b l i c a t i o n s   >   0   t h e n   1   e l s e   0   e n d )   p  
 	 	 	 - - r o w _ n u m b e r ( )   o v e r   ( o r d e r   b y   n e w i d ( ) )   k  
 	 	 f r o m   [ P r o f i l e . C a c h e ] . [ P e r s o n . A f f i l i a t i o n ]   a ,   [ P r o f i l e . C a c h e ] . [ P e r s o n ]   s  
 	 	 w h e r e   a . p e r s o n i d   < >   @ p e r s o n i d  
 	 	 	 a n d   a . i n s t i t i t u t i o n n a m e   =   @ i   a n d   a . d e p a r t m e n t n a m e   =   @ d  
 	 	 	 a n d   a . p e r s o n i d   =   s . p e r s o n i d  
 	 	 g r o u p   b y   a . p e r s o n i d  
 	 ) ,   b   a s   (  
 	 	 s e l e c t   t o p ( 5 )   *  
 	 	 f r o m   a  
 	 	 o r d e r   b y   v   d e s c ,   p   d e s c ,   n e w i d ( )  
 	 ) ,   c   a s   (  
 	 	 s e l e c t   m . N o d e I D ,   n . V a l u e   U R I ,   l . V a l u e   L a b e l  
 	 	 f r o m   b  
 	 	 	 i n n e r   j o i n   [ R D F . S t a g e ] . [ I n t e r n a l N o d e M a p ]   m  
 	 	 	 	 o n   m . I n t e r n a l T y p e   =   ' P e r s o n '   a n d   m . C l a s s   =   ' h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / P e r s o n '   a n d   m . I n t e r n a l I D   =   c a s t ( b . p e r s o n i d   a s   v a r c h a r ( 5 0 ) )  
 	 	 	 i n n e r   j o i n   [ R D F . ] . [ N o d e ]   n  
 	 	 	 	 o n   n . N o d e I D   =   m . N o d e I D   a n d   n . V i e w S e c u r i t y G r o u p   =   - 1  
 	 	 	 i n n e r   j o i n   [ R D F . ] . [ T r i p l e ]   t  
 	 	 	 	 o n   t . s u b j e c t   =   n . N o d e I D   a n d   t . p r e d i c a t e   =   @ l a b e l I D   a n d   t . V i e w S e c u r i t y G r o u p   =   - 1  
 	 	 	 i n n e r   j o i n   [ R D F . ] . [ N o d e ]   l  
 	 	 	 	 o n   l . N o d e I D   =   t . o b j e c t   a n d   l . V i e w S e c u r i t y G r o u p   =   - 1  
 	 )  
 	 s e l e c t   @ x   =   (  
 	 	 	 s e l e c t 	 ( s e l e c t   c o u n t ( * )   f r o m   a )   " N u m b e r O f C o n n e c t i o n s " ,  
 	 	 	 	 	 @ I n s t i t u t i o n U R I   " I n s t i t u t i o n U R I " ,  
 	 	 	 	 	 @ D e p a r t m e n t U R I   " D e p a r t m e n t U R I " ,  
 	 	 	 	 	 ( s e l e c t 	 N o d e I D   " C o n n e c t i o n / @ N o d e I D " ,  
 	 	 	 	 	 	 	 U R I   " C o n n e c t i o n / @ U R I " ,  
 	 	 	 	 	 	 	 L a b e l   " C o n n e c t i o n "  
 	 	 	 	 	 	 f r o m   c  
 	 	 	 	 	 	 o r d e r   b y   L a b e l  
 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 	 )  
 	 	 	 f o r   x m l   p a t h ( ' N e t w o r k ' ) ,   t y p e  
 	 	 )  
  
 	 s e l e c t   @ x   X M L  
  
 E N D  
  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ P r o f i l e . M o d u l e ] . [ N e t w o r k M a p . G e t S i m i l a r P e o p l e ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ P r o f i l e . M o d u l e ] . [ N e t w o r k M a p . G e t S i m i l a r P e o p l e ]  
 	 @ N o d e I D   B I G I N T ,  
 	 @ s h o w _ c o n n e c t i o n s   B I T = 0 ,  
 	 @ S e s s i o n I D   U N I Q U E I D E N T I F I E R = N U L L  
 A S  
 B E G I N  
    
    
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   n o c o u n t     O N ;  
    
    
    
 	 D E C L A R E   @ P e r s o n I D   I N T  
    
 	 S E L E C T   @ P e r s o n I D   =   C A S T ( m . I n t e r n a l I D   A S   I N T )  
 	 	 F R O M   [ R D F . S t a g e ] . [ I n t e r n a l N o d e M a p ]   m ,   [ R D F . ] . N o d e   n  
 	 	 W H E R E   m . S t a t u s   =   3   A N D   m . V a l u e H a s h   =   n . V a l u e H a s h   A N D   n . N o d e I D   =   @ N o d e I D  
    
    
 	 D E C L A R E     @ f     T A B L E (  
 	 	 p e r s o n i d   I N T ,  
 	 	 i n t e r n a l l d a p u s e r n a m e   N V A R C H A R ( 5 0 ) ,  
 	 	 d i s p l a y _ n a m e   N V A R C H A R ( 2 5 5 ) ,  
 	 	 l a t i t u d e   F L O A T ,  
 	 	 l o n g i t u d e   F L O A T ,  
 	 	 a d d r e s s 1   N V A R C H A R ( 1 0 0 0 ) ,  
 	 	 a d d r e s s 2   N V A R C H A R ( 1 0 0 0 ) ,  
 	 	 U R I   V A R C H A R ( 4 0 0 )  
 	 )  
    
 	 I N S E R T   I N T O   @ f  
 	 	 	 	 	 	   ( p e r s o n i d ,    
 	 	 	 	 	 	 	 d i s p l a y _ n a m e ,  
 	 	 	 	 	 	 	 l a t i t u d e ,  
 	 	 	 	 	 	 	 l o n g i t u d e ,  
 	 	 	 	 	 	 	 a d d r e s s 1 ,  
 	 	 	 	 	 	 	 a d d r e s s 2 )  
 	 S E L E C T   p . p e r s o n i d ,    
 	 	 	 	   p . d i s p l a y n a m e ,  
 	 	 	 	   l . l a t i t u d e ,  
 	 	 	 	   l . l o n g i t u d e ,  
 	 	 	 	   C A S E   W H E N   p . a d d r e s s s t r i n g   L I K E   ' % , % '   T H E N   L E F T ( p . a d d r e s s s t r i n g , C H A R I N D E X ( ' , ' , p . a d d r e s s s t r i n g )   -   1 ) E L S E   p . a d d r e s s s t r i n g   E N D     a d d r e s s 1 ,  
 	 	 	 	   R E P L A C E ( S U B S T R I N G ( p . a d d r e s s s t r i n g , C H A R I N D E X ( ' , ' , p . a d d r e s s s t r i n g )   +   1 ,  
 	 	 	 	 	 	 	 	 	 	 	 	 	   L E N ( p . a d d r e s s s t r i n g ) ) , ' ,   U S A ' , ' ' )   a d d r e s s 2  
 	 	 F R O M   [ P r o f i l e . C a c h e ] . P e r s o n   p ,      
 	 	 	 	   ( S E L E C T   @ P e r s o n I D   p e r s o n i d ,  
 	 	 	 	 	 	 	 	   0                   l a t i t u d e  
 	 	 	 	 	 U N I O N   A L L  
 	 	 	 	 	 S E L E C T   S i m i l a r P e r s o n I D ,   0   F R O M   [ P r o f i l e . C a c h e ] . [ P e r s o n . S i m i l a r P e r s o n ]   W H E R E   P e r s o n I D   =   @ P e r s o n I D  
 	 	 	 	 	 - - S E L E C T   *  
 	 	 	 	 	 - - F R O M   f n _ G e t T o p S i m i l a r P e o p l e ( @ P e r s o n I D )   s  
 	 	 	 	 	 )   t ,  
 	 	 	 	 [ P r o f i l e . C a c h e ] . P e r s o n   l      
 	   W H E R E   p . p e r s o n i d   =   t . p e r s o n i d  
 	 	   A N D   p . p e r s o n i d   =   l . p e r s o n i d    
 	 	   A N D   l . l a t i t u d e   I S   N O T   N U L L  
 	 	   A N D   l . l o n g i t u d e   I S   N O T   N U L L  
 	   O R D E R   B Y   l a t i t u d e   D E S C ,  
 	 	 	 	   p . l a s t n a m e ,  
 	 	 	 	   p . f i r s t n a m e  
    
    
 	 U P D A T E   @ f  
 	 	 S E T   U R I   =   p . V a l u e   +   c a s t ( m . N o d e I D   a s   v a r c h a r ( 5 0 ) )  
 	 	 F R O M   @ f ,   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   m ,   [ F r a m e w o r k . ] . P a r a m e t e r   p  
 	 	 W H E R E   p . P a r a m e t e r I D   =   ' b a s e U R I '   A N D   m . I n t e r n a l H a s h   =   [ R D F . ] . f n V a l u e H a s h ( n u l l , n u l l , ' h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / P e r s o n ^ ^ P e r s o n ^ ^ ' + c a s t ( P e r s o n I D   a s     v a r c h a r ( 5 0 ) ) )  
    
 	 D E L E T E   F R O M   @ f   W H E R E   U R I   I S   N U L L  
    
    
 	 I F   @ s h o w _ c o n n e c t i o n s   =   0  
 	 B E G I N  
 	 	 S E L E C T   p e r s o n i d ,  
 	 	 	 	 	   i n t e r n a l l d a p u s e r n a m e ,  
 	 	 	 	 	   d i s p l a y _ n a m e ,  
 	 	 	 	 	   l a t i t u d e ,  
 	 	 	 	 	   l o n g i t u d e ,  
 	 	 	 	 	   a d d r e s s 1 ,  
 	 	 	 	 	   a d d r e s s 2 ,  
 	 	 	 	 	   u r i  
 	 	 	 F R O M   @ f  
 	 	   O R D E R   B Y   a d d r e s s 1 ,  
 	 	 	 	 	   a d d r e s s 2 ,  
 	 	 	 	 	   d i s p l a y _ n a m e  
 	 E N D  
 	 E L S E  
 	 B E G I N  
 	 	 S E L E C T   D I S T I N C T   a . l a t i t u d e                 x 1 ,  
 	 	 	 	 	 	 a . l o n g i t u d e                 y 1 ,  
 	 	 	 	 	 	 d . l a t i t u d e                 x 2 ,  
 	 	 	 	 	 	 d . l o n g i t u d e                 y 2 ,  
 	 	 	 	 	 	 a . p e r s o n i d   a ,  
 	 	 	 	 	 	 d . p e r s o n i d   b ,  
 	 	 	 	 	 	 ( C A S E    
 	 	 	 	 	 	 	   W H E N   a . p e r s o n i d   =   @ P e r s o n I D  
 	 	 	 	 	 	 	 	 	 	   O R   d . p e r s o n i d =   @ P e r s o n I D   T H E N   1  
 	 	 	 	 	 	 	   E L S E   0  
 	 	 	 	 	 	   E N D )   i s _ p e r s o n ,  
 	 	 	 	 	 	 a . U R I   u 1 ,  
 	 	 	 	 	 	 d . U R I   u 2  
 	 	 	 F R O M   @ f   a ,  
 	 	 	 	 	   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P e r s o n . I n c l u d e ]   b ,  
 	 	 	 	 	   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P e r s o n . I n c l u d e ]   c ,  
 	 	 	 	 	   @ f   d  
 	 	   W H E R E   a . p e r s o n i d   =   b . p e r s o n i d  
 	 	 	   A N D   b . p m i d   =   c . p m i d  
 	 	 	   A N D   b . p e r s o n i d   <   c . p e r s o n i d  
 	 	 	   A N D   c . p e r s o n i d   =   d . p e r s o n i d  
 	 E N D  
 	 	  
    
 E N D  
  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ E d i t . M o d u l e ] . [ C u s t o m E d i t A w a r d O r H o n o r . S t o r e I t e m ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ E d i t . M o d u l e ] . [ C u s t o m E d i t A w a r d O r H o n o r . S t o r e I t e m ]  
 	 - -   R e q u i r e d   f o r   u p d a t i n g   a n   e x i s t i n g   A w a r d R e c e i p t  
 	 @ E x i s t i n g A w a r d R e c e i p t I D   B I G I N T   =   N U L L ,  
 	 @ E x i s t i n g A w a r d R e c e i p t U R I   V A R C H A R ( 4 0 0 )   =   N U L L ,  
 	 - -   R e q u i r e d   f o r   c r e a t i n g   a   n e w   A w a r d R e c e i p t  
 	 @ a w a r d O r H o n o r F o r I D   B I G I N T   =   N U L L ,  
 	 @ a w a r d O r H o n o r F o r U R I   B I G I N T   =   N U L L ,  
 	 - -   A l w a y s   r e q u i r e d  
 	 @ l a b e l   V A R C H A R ( M A X ) ,  
 	 - -   O p t i o n a l  
 	 @ a w a r d C o n f e r r e d B y   V A R C H A R ( M A X )   =   N U L L ,  
 	 @ s t a r t D a t e   V A R C H A R ( M A X )   =   N U L L ,  
 	 @ e n d D a t e   V A R C H A R ( M A X )   =   N U L L ,  
 	 - -   S e c u r i t y  
 	 @ S e s s i o n I D   U N I Q U E I D E N T I F I E R   =   N U L L ,  
 	 - -   O u t p u t   v a r i a b l e s  
 	 @ E r r o r   B I T   =   N U L L   O U T P U T ,  
 	 @ N o d e I D   B I G I N T   =   N U L L   O U T P U T  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
 	 / *  
 	  
 	 T h i s   s t o r e d   p r o c e d u r e   e i t h e r   c r e a t e s   o r   u p d a t e s   a n  
 	 A w a r d R e c e i p t .   I n   b o t h   c a s e s   a   l a b e l   i s   r e q u i r e d .  
 	 N o d e s   c a n   b e   s p e c i f i e d   e i t h e r   b y   I D   o r   U R I .  
 	  
 	 * /  
 	  
 	 S E L E C T   @ E r r o r   =   0  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   V a l i d a t e   a n d   p r e p a r e   v a r i a b l e s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	  
 	 - -   C o n v e r t   U R I s   t o   N o d e I D s  
   	 I F   ( @ E x i s t i n g A w a r d R e c e i p t I D   I S   N U L L )   A N D   ( @ E x i s t i n g A w a r d R e c e i p t U R I   I S   N O T   N U L L )  
 	 	 S E L E C T   @ E x i s t i n g A w a r d R e c e i p t I D   =   [ R D F . ] . f n U R I 2 N o d e I D ( @ E x i s t i n g A w a r d R e c e i p t U R I )  
   	 I F   ( @ a w a r d O r H o n o r F o r I D   I S   N U L L )   A N D   ( @ a w a r d O r H o n o r F o r U R I   I S   N O T   N U L L )  
 	 	 S E L E C T   @ a w a r d O r H o n o r F o r I D   =   [ R D F . ] . f n U R I 2 N o d e I D ( @ a w a r d O r H o n o r F o r U R I )  
  
 	 - -   C h e c k   t h a t   s o m e   o p e r a t i o n   w i l l   b e   p e r f o r m e d  
 	 I F   ( ( @ E x i s t i n g A w a r d R e c e i p t I D   I S   N U L L )   A N D   ( @ a w a r d O r H o n o r F o r I D   I S   N U L L ) )   O R   ( I s N u l l ( @ l a b e l , ' ' )   =   ' ' )  
 	 B E G I N  
 	 	 S E L E C T   @ E r r o r   =   1  
 	 	 R E T U R N  
 	 E N D  
  
 	 - -   C o n v e r t   p r o p e r t i e s   t o   N o d e I D s  
 	 D E C L A R E   @ a w a r d C o n f e r r e d B y N o d e I D   B I G I N T  
 	 D E C L A R E   @ s t a r t D a t e N o d e I D   B I G I N T  
 	 D E C L A R E   @ e n d D a t e N o d e I D   B I G I N T  
 	  
 	 S E L E C T   @ a w a r d C o n f e r r e d B y N o d e I D   =   N U L L ,   @ s t a r t D a t e N o d e I D   =   N U L L ,   @ e n d D a t e N o d e I D   =   N U L L  
 	  
 	 I F   I s N u l l ( @ a w a r d C o n f e r r e d B y , ' ' ) < > ' '  
 	 	 E X E C   [ R D F . ] . G e t S t o r e N o d e   @ V a l u e   =   @ a w a r d C o n f e r r e d B y ,   @ L a n g u a g e   =   N U L L ,   @ D a t a T y p e   =   N U L L ,  
 	 	 	 @ S e s s i o n I D   =   @ S e s s i o n I D ,   @ E r r o r   =   @ E r r o r   O U T P U T ,   @ N o d e I D   =   @ a w a r d C o n f e r r e d B y N o d e I D   O U T P U T  
 	 I F   I s N u l l ( @ s t a r t D a t e , ' ' ) < > ' '  
 	 	 E X E C   [ R D F . ] . G e t S t o r e N o d e   @ V a l u e   =   @ s t a r t D a t e ,   @ L a n g u a g e   =   N U L L ,   @ D a t a T y p e   =   N U L L ,  
 	 	 	 @ S e s s i o n I D   =   @ S e s s i o n I D ,   @ E r r o r   =   @ E r r o r   O U T P U T ,   @ N o d e I D   =   @ s t a r t D a t e N o d e I D   O U T P U T  
 	 I F   I s N u l l ( @ e n d D a t e , ' ' ) < > ' '  
 	 	 E X E C   [ R D F . ] . G e t S t o r e N o d e   @ V a l u e   =   @ e n d D a t e ,   @ L a n g u a g e   =   N U L L ,   @ D a t a T y p e   =   N U L L ,  
 	 	 	 @ S e s s i o n I D   =   @ S e s s i o n I D ,   @ E r r o r   =   @ E r r o r   O U T P U T ,   @ N o d e I D   =   @ e n d D a t e N o d e I D   O U T P U T  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   H a n d l e   r e q u i r e d   n o d e s   a n d   p r o p e r t i e s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 - -   G e t   a n   A w a r d R e c e i p t   w i t h   j u s t   a   l a b e l  
 	 I F   ( @ E x i s t i n g A w a r d R e c e i p t I D   I S   N O T   N U L L )  
 	 B E G I N  
 	 	 - -   T h e   A w a r d R e c e i p t   N o d e I D   i s   t h e   E x i s t i n g A w a r d R e c e i p t  
 	 	 S E L E C T   @ N o d e I D   =   @ E x i s t i n g A w a r d R e c e i p t I D  
 	 	 - -   D e l e t e   a n y   e x i s t i n g   p r o p e r t i e s  
 	 	 E X E C   [ R D F . ] . D e l e t e T r i p l e 	 @ S u b j e c t I D   =   @ N o d e I D ,  
 	 	 	 	 	 	 	 	 	 @ P r e d i c a t e U R I   =   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # a w a r d C o n f e r r e d B y ' ,  
 	 	 	 	 	 	 	 	 	 @ S e s s i o n I D   =   @ S e s s i o n I D ,  
 	 	 	 	 	 	 	 	 	 @ E r r o r   =   @ E r r o r   O U T P U T  
 	 	 E X E C   [ R D F . ] . D e l e t e T r i p l e 	 @ S u b j e c t I D   =   @ N o d e I D ,  
 	 	 	 	 	 	 	 	 	 @ P r e d i c a t e U R I   =   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # s t a r t D a t e ' ,  
 	 	 	 	 	 	 	 	 	 @ S e s s i o n I D   =   @ S e s s i o n I D ,  
 	 	 	 	 	 	 	 	 	 @ E r r o r   =   @ E r r o r   O U T P U T  
 	 	 E X E C   [ R D F . ] . D e l e t e T r i p l e 	 @ S u b j e c t I D   =   @ N o d e I D ,  
 	 	 	 	 	 	 	 	 	 @ P r e d i c a t e U R I   =   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # e n d D a t e ' ,  
 	 	 	 	 	 	 	 	 	 @ S e s s i o n I D   =   @ S e s s i o n I D ,  
 	 	 	 	 	 	 	 	 	 @ E r r o r   =   @ E r r o r   O U T P U T  
 	 	 E X E C   [ R D F . ] . D e l e t e T r i p l e 	 @ S u b j e c t I D   =   @ N o d e I D ,  
 	 	 	 	 	 	 	 	 	 @ P r e d i c a t e U R I   =   ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # l a b e l ' ,  
 	 	 	 	 	 	 	 	 	 @ S e s s i o n I D   =   @ S e s s i o n I D ,  
 	 	 	 	 	 	 	 	 	 @ E r r o r   =   @ E r r o r   O U T P U T  
 	 	 - -   A d d   t h e   l a b e l  
 	 	 D E C L A R E   @ l a b e l N o d e I D   B I G I N T  
 	 	 E X E C   [ R D F . ] . G e t S t o r e N o d e 	 @ V a l u e   =   @ l a b e l ,    
 	 	 	 	 	 	 	 	 	 @ L a n g u a g e   =   N U L L ,  
 	 	 	 	 	 	 	 	 	 @ D a t a T y p e   =   N U L L ,  
 	 	 	 	 	 	 	 	 	 @ S e s s i o n I D   =   @ S e s s i o n I D ,    
 	 	 	 	 	 	 	 	 	 @ E r r o r   =   @ E r r o r   O U T P U T ,    
 	 	 	 	 	 	 	 	 	 @ N o d e I D   =   @ l a b e l N o d e I D   O U T P U T  
 	 	 E X E C   [ R D F . ] . G e t S t o r e T r i p l e 	 @ S u b j e c t I D   =   @ N o d e I D ,  
 	 	 	 	 	 	 	 	 	 @ P r e d i c a t e U R I   =   ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # l a b e l ' ,  
 	 	 	 	 	 	 	 	 	 @ O b j e c t I D   =   @ l a b e l N o d e I D ,  
 	 	 	 	 	 	 	 	 	 @ S e s s i o n I D   =   @ S e s s i o n I D ,  
 	 	 	 	 	 	 	 	 	 @ E r r o r   =   @ E r r o r   O U T P U T  
 	 E N D  
 	 E L S E  
 	 B E G I N  
 	 	 - -   C r e a t e   a   n e w   A w a r d R e c e i p t  
 	 	 E X E C   [ R D F . ] . G e t S t o r e N o d e 	 @ E n t i t y C l a s s U R I   =   ' h t t p : / / v i v o w e b . o r g / o n t o l o g y / c o r e # A w a r d R e c e i p t ' ,  
 	 	 	 	 	 	 	 	 	 @ L a b e l   =   @ l a b e l ,  
 	 	 	 	 	 	 	 	 	 @ F o r c e N e w E n t i t y   =   1 ,  
 	 	 	 	 	 	 	 	 	 @ S e s s i o n I D   =   @ S e s s i o n I D ,    
 	 	 	 	 	 	 	 	 	 @ E r r o r   =   @ E r r o r   O U T P U T ,    
 	 	 	 	 	 	 	 	 	 @ N o d e I D   =   @ N o d e I D   O U T P U T  
 	 	 - -   L i n k   t h e   A w a r d R e c e i p t   t o   t h e   a w a r d O r H o n o r F o r  
 	 	 E X E C   [ R D F . ] . G e t S t o r e T r i p l e 	 @ S u b j e c t I D   =   @ N o d e I D ,  
 	 	 	 	 	 	 	 	 	 @ P r e d i c a t e U R I   =   ' h t t p : / / v i v o w e b . o r g / o n t o l o g y / c o r e # a w a r d O r H o n o r F o r ' ,  
 	 	 	 	 	 	 	 	 	 @ O b j e c t I D   =   @ a w a r d O r H o n o r F o r I D ,  
 	 	 	 	 	 	 	 	 	 @ S e s s i o n I D   =   @ S e s s i o n I D ,  
 	 	 	 	 	 	 	 	 	 @ E r r o r   =   @ E r r o r   O U T P U T  
 	 	 - -   L i n k   t h e   a w a r d O r H o n o r F o r   t o   t h e   A w a r d R e c e i p t  
 	 	 E X E C   [ R D F . ] . G e t S t o r e T r i p l e 	 @ S u b j e c t I D   =   @ a w a r d O r H o n o r F o r I D ,  
 	 	 	 	 	 	 	 	 	 @ P r e d i c a t e U R I   =   ' h t t p : / / v i v o w e b . o r g / o n t o l o g y / c o r e # a w a r d O r H o n o r ' ,  
 	 	 	 	 	 	 	 	 	 @ O b j e c t I D   =   @ N o d e I D ,  
 	 	 	 	 	 	 	 	 	 @ S e s s i o n I D   =   @ S e s s i o n I D ,  
 	 	 	 	 	 	 	 	 	 @ E r r o r   =   @ E r r o r   O U T P U T  
 	 E N D  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   H a n d l e   o p t i o n a l   p r o p e r t i e s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 - -   A d d   o p t i o n a l   p r o p e r t i e s   t o   t h e   A w a r d R e c e i p t  
 	 I F   ( @ N o d e I D   I S   N O T   N U L L )   A N D   ( @ E r r o r   =   0 )  
 	 B E G I N  
 	 	 I F   @ a w a r d C o n f e r r e d B y N o d e I D   I S   N O T   N U L L  
 	 	 	 E X E C   [ R D F . ] . G e t S t o r e T r i p l e 	 @ S u b j e c t I D   =   @ N o d e I D ,  
 	 	 	 	 	 	 	 	 	 	 @ P r e d i c a t e U R I   =   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # a w a r d C o n f e r r e d B y ' ,  
 	 	 	 	 	 	 	 	 	 	 @ O b j e c t I D   =   @ a w a r d C o n f e r r e d B y N o d e I D ,  
 	 	 	 	 	 	 	 	 	 	 @ S e s s i o n I D   =   @ S e s s i o n I D ,  
 	 	 	 	 	 	 	 	 	 	 @ E r r o r   =   @ E r r o r   O U T P U T  
 	 	 I F   @ s t a r t D a t e N o d e I D   I S   N O T   N U L L  
 	 	 	 E X E C   [ R D F . ] . G e t S t o r e T r i p l e 	 @ S u b j e c t I D   =   @ N o d e I D ,  
 	 	 	 	 	 	 	 	 	 	 @ P r e d i c a t e U R I   =   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # s t a r t D a t e ' ,  
 	 	 	 	 	 	 	 	 	 	 @ O b j e c t I D   =   @ s t a r t D a t e N o d e I D ,  
 	 	 	 	 	 	 	 	 	 	 @ S e s s i o n I D   =   @ S e s s i o n I D ,  
 	 	 	 	 	 	 	 	 	 	 @ E r r o r   =   @ E r r o r   O U T P U T  
 	 	 I F   @ e n d D a t e N o d e I D   I S   N O T   N U L L  
 	 	 	 E X E C   [ R D F . ] . G e t S t o r e T r i p l e 	 @ S u b j e c t I D   =   @ N o d e I D ,  
 	 	 	 	 	 	 	 	 	 	 @ P r e d i c a t e U R I   =   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # e n d D a t e ' ,  
 	 	 	 	 	 	 	 	 	 	 @ O b j e c t I D   =   @ e n d D a t e N o d e I D ,  
 	 	 	 	 	 	 	 	 	 	 @ S e s s i o n I D   =   @ S e s s i o n I D ,  
 	 	 	 	 	 	 	 	 	 	 @ E r r o r   =   @ E r r o r   O U T P U T  
 	 E N D  
  
 E N D  
  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ E d i t . M o d u l e ] . [ C u s t o m E d i t A u t h o r I n A u t h o r s h i p . G e t L i s t ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ E d i t . M o d u l e ] . [ C u s t o m E d i t A u t h o r I n A u t h o r s h i p . G e t L i s t ]  
 	 @ N o d e I D   b i g i n t   =   N U L L ,  
 	 @ S e s s i o n I D   u n i q u e i d e n t i f i e r   =   N U L L  
 A S  
 B E G I N  
  
 	 D E C L A R E   @ P e r s o n I D   I N T  
    
 	 S E L E C T   @ P e r s o n I D   =   C A S T ( m . I n t e r n a l I D   A S   I N T )  
 	 	 F R O M   [ R D F . S t a g e ] . [ I n t e r n a l N o d e M a p ]   m ,   [ R D F . ] . N o d e   n  
 	 	 W H E R E   m . S t a t u s   =   3   A N D   m . V a l u e H a s h   =   n . V a l u e H a s h   A N D   n . N o d e I D   =   @ N o d e I D  
    
 	 S E L E C T   r . R e f e r e n c e ,   ( C A S E   W H E N   r . P M I D   I S   N O T   N U L L   T H E N   1   E L S E   0   E N D )   F r o m P u b M e d ,   i . P u b I D ,   r . P M I D ,   r . M P I D ,   N U L L   C a t e g o r y ,   r . U R L ,   r . E n t i t y D a t e   P u b D a t e ,   r . E n t i t y I D ,   r . S o u r c e ,   r . I s A c t i v e ,   i . P e r s o n I D  
 	 	 F R O M   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P e r s o n . I n c l u d e ]   i  
 	 	 	 I N N E R   J O I N   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . E n t i t y . I n f o r m a t i o n R e s o u r c e ]   r  
 	 	 	 	 O N   i . P M I D   =   r . P M I D   A N D   i . P M I D   I S   N O T   N U L L  
 	 	 	 	 A N D   i . P e r s o n I D   =   @ P e r s o n I D  
 	 U N I O N   A L L  
 	 S E L E C T   r . R e f e r e n c e ,   ( C A S E   W H E N   r . P M I D   I S   N O T   N U L L   T H E N   1   E L S E   0   E N D )   F r o m P u b M e d ,   i . P u b I D ,   r . P M I D ,   r . M P I D ,   g . H m s P u b C a t e g o r y   C a t e g o r y ,   r . U R L ,   r . E n t i t y D a t e   P u b D a t e ,   r . E n t i t y I D ,   r . S o u r c e ,   r . I s A c t i v e ,   i . P e r s o n I D  
 	 	 F R O M   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P e r s o n . I n c l u d e ]   i  
 	 	 	 I N N E R   J O I N   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . E n t i t y . I n f o r m a t i o n R e s o u r c e ]   r  
 	 	 	 	 O N   i . M P I D   =   r . M P I D   A N D   i . P M I D   I S   N U L L   A N D   i . M P I D   I S   N O T   N U L L  
 	 	 	 	 A N D   i . P e r s o n I D   =   @ P e r s o n I D  
 	 	 	 I N N E R   J O I N   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . M y P u b . G e n e r a l ]   g  
 	 	 	 	 O N   i . M P I D   =   g . M P I D  
 	 O R D E R   B Y   E n t i t y D a t e   D E S C ,   E n t i t y I D  
  
 E N D  
  
  
  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ O n t o l o g y . I m p o r t ] . [ v w O w l T r i p l e ] '  
 G O  
  
 C R E A T E   V I E W   [ O n t o l o g y . I m p o r t ] . [ v w O w l T r i p l e ]   A S  
 	 W I T H   x m l n a m e s p a c e s   (  
 	 	 ' h t t p : / / a i m s . f a o . o r g / a o s / g e o p o l i t i c a l . o w l # '   A S   g e o ,  
 	 	 ' h t t p : / / w w w . w 3 . o r g / 2 0 0 4 / 0 2 / s k o s / c o r e # '   A S   s k c o ,  
 	 	 ' h t t p : / / p u r l . o r g / N E T / c 4 d m / e v e n t . o w l # '   A S   e v e n t ,  
 	 	 ' h t t p : / / v i v o w e b . o r g / o n t o l o g y / p r o v e n a n c e - s u p p o r t # '   A S   p v s ,  
 	 	 ' h t t p : / / p u r l . o r g / d c / e l e m e n t s / 1 . 1 / '   A S   d c e l e m ,  
 	 	 ' h t t p : / / w w w . w 3 . o r g / 2 0 0 6 / 1 2 / o w l 2 - x m l # '   A S   o w l 2 ,  
 	 	 ' h t t p : / / v i v o w e b . o r g / o n t o l o g y / s c i e n t i f i c - r e s e a r c h - r e s o u r c e # '   A S   s c i r r ,  
 	 	 ' h t t p : / / v i v o w e b . o r g / o n t o l o g y / c o r e # '   A S   v i v o ,  
 	 	 ' h t t p : / / p u r l . o r g / v o c a b / v a n n / '   A S   v a n n ,  
 	 	 ' h t t p : / / v i t r o . m a n n l i b . c o r n e l l . e d u / n s / v i t r o / 0 . 7 # '   A S   v i t r o ,  
 	 	 ' h t t p : / / w w w . w 3 . o r g / 2 0 0 8 / 0 5 / s k o s # '   A S   s k o s ,  
 	 	 ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # '   A S   r d f ,  
 	 	 ' h t t p : / / j e n a . h p l . h p . c o m / A R Q / f u n c t i o n # '   A S   a f n ,  
 	 	 ' h t t p : / / p u r l . o r g / o n t o l o g y / b i b o / '   A S   b i b o ,  
 	 	 ' h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / '   A S   f o a f ,  
 	 	 ' h t t p : / / w w w . w 3 . o r g / 2 0 0 3 / 0 6 / s w - v o c a b - s t a t u s / n s # '   A S   s w v s ,  
 	 	 ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # '   A S   o w l ,  
 	 	 ' h t t p : / / p u r l . o r g / d c / t e r m s / '   A S   d c t e r m s ,  
 	 	 ' h t t p : / / w w w . w 3 . o r g / 2 0 0 1 / X M L S c h e m a # '   A S   x s d ,  
 	 	 ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # '   A S   r d f s  
 	 ) ,   d   a s   (  
 	 	 S E L E C T   x . n a m e   O W L ,   x . G r a p h ,   d . q u e r y ( ' . ' )   d ,   i s n u l l ( d . v a l u e ( ' @ r d f : a b o u t ' , ' n v a r c h a r ( m a x ) ' ) , ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / n o d e I D # ' + d . v a l u e ( ' @ r d f : n o d e I D ' , ' n v a r c h a r ( m a x ) ' ) )   a  
 	 	 F R O M   [ O n t o l o g y . I m p o r t ] . [ O W L ]   x   C R O S S   A P P L Y   d a t a . n o d e s ( ' / / r d f : D e s c r i p t i o n ' )   A S   R ( d )  
 	 )  
 	 S E L E C T   d . O W L ,  
 	 	 d . G r a p h ,  
 	 	 d . a   S u b j e c t ,  
 	 	 d . d . v a l u e ( ' n a m e s p a c e - u r i ( ( / r d f : D e s c r i p t i o n / * [ s q l : c o l u m n ( " n . n " ) ] ) [ 1 ] ) ' , ' n v a r c h a r ( m a x ) ' )    
 	 	 	 	 +   d . d . v a l u e ( ' l o c a l - n a m e ( ( / r d f : D e s c r i p t i o n / * [ s q l : c o l u m n ( " n . n " ) ] ) [ 1 ] ) ' , ' n v a r c h a r ( m a x ) ' )   P r e d i c a t e ,  
 	 	 c o a l e s c e ( d . d . v a l u e ( ' ( / r d f : D e s c r i p t i o n / * [ s q l : c o l u m n ( " n . n " ) ] / @ r d f : r e s o u r c e ) [ 1 ] ' , ' n v a r c h a r ( m a x ) ' ) ,    
 	 	 	 	 ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / n o d e I D # '  
 	 	 	 	 	 + d . d . v a l u e ( ' ( / r d f : D e s c r i p t i o n / * [ s q l : c o l u m n ( " n . n " ) ] / @ r d f : n o d e I D ) [ 1 ] ' , ' n v a r c h a r ( m a x ) ' ) ,    
 	 	 	 	 d . d . v a l u e ( ' ( / r d f : D e s c r i p t i o n / * [ s q l : c o l u m n ( " n . n " ) ] ) [ 1 ] ' , ' n v a r c h a r ( m a x ) ' ) )   O b j e c t ,  
 	 	 d . d . v a l u e ( ' c o u n t ( r d f : D e s c r i p t i o n / * ) ' , ' n v a r c h a r ( m a x ) ' )   n ,    
 	 	 n . n   i  
 	 F R O M   d ,   [ U t i l i t y . M a t h ] . N   n  
 	 W H E R E   n . n   b e t w e e n   1   a n d   c a s t ( d . d . v a l u e ( ' c o u n t ( r d f : D e s c r i p t i o n / * ) ' , ' n v a r c h a r ( m a x ) ' )   a s   i n t )  
  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ O n t o l o g y . I m p o r t ] . [ C o n v e r t O W L 2 T r i p l e ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ O n t o l o g y . I m p o r t ] . [ C o n v e r t O W L 2 T r i p l e ]  
 	 @ O W L   v a r c h a r ( 5 0 )  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
 B E G I N   T R Y    
         b e g i n   t r a n s a c t i o n  
  
 	 	 d e l e t e    
 	 	 	 f r o m   [ O n t o l o g y . I m p o r t ] . T r i p l e  
 	 	 	 w h e r e   O W L   =   @ O W L  
  
 	 	 i n s e r t   i n t o   [ O n t o l o g y . I m p o r t ] . T r i p l e   ( O W L ,   G r a p h ,   S u b j e c t ,   P r e d i c a t e ,   O b j e c t )  
 	 	 	 s e l e c t   O W L ,   G r a p h ,   S u b j e c t ,   P r e d i c a t e ,   O b j e c t    
 	 	 	 f r o m   [ O n t o l o g y . I m p o r t ] . v w O w l T r i p l e  
 	 	 	 w h e r e   O W L   =   @ O W L  
  
 	 c o m m i t   t r a n s a c t i o n  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 D E C L A R E   @ E r r M s g   n v a r c h a r ( 4 0 0 0 ) ,   @ E r r S e v e r i t y   i n t  
 	 	 - - C h e c k   s u c c e s s  
 	 	 I F   @ @ T R A N C O U N T   >   0     R O L L B A C K  
    
 	 	 - -   R a i s e   a n   e r r o r   w i t h   t h e   d e t a i l s   o f   t h e   e x c e p t i o n  
 	 	 S E L E C T   @ E r r M s g   =     E R R O R _ M E S S A G E ( ) ,  
 	 	 	 	 	   @ E r r S e v e r i t y   =   E R R O R _ S E V E R I T Y ( )  
    
 	 	 R A I S E R R O R ( @ E r r M s g ,   @ E r r S e v e r i t y ,   1 )  
 	 	 	    
 	 E N D   C A T C H 	 	  
  
 	 - -   s e l e c t   *   f r o m   [ O n t o l o g y . I m p o r t ] . T r i p l e  
 	 - -   s e l e c t   *   f r o m   [ O n t o l o g y . I m p o r t ] . v w O w l T r i p l e  
 	 - -   e x e c   [ O n t o l o g y . I m p o r t ] . [ C o n v e r t O W L 2 T r i p l e ]   @ O W L   =   ' V I V O _ 1 . 4 '  
  
 E N D  
  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ P r o f i l e . M o d u l e ] . [ C u s t o m V i e w A u t h o r I n A u t h o r s h i p . G e t L i s t ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ P r o f i l e . M o d u l e ] . [ C u s t o m V i e w A u t h o r I n A u t h o r s h i p . G e t L i s t ]  
 	 @ N o d e I D   b i g i n t   =   N U L L ,  
 	 @ S e s s i o n I D   u n i q u e i d e n t i f i e r   =   N U L L  
 A S  
 B E G I N  
  
 	 D E C L A R E   @ S e c u r i t y G r o u p I D   B I G I N T ,   @ H a s S p e c i a l V i e w A c c e s s   B I T  
 	 E X E C   [ R D F . S e c u r i t y ] . G e t S e s s i o n S e c u r i t y G r o u p   @ S e s s i o n I D ,   @ S e c u r i t y G r o u p I D   O U T P U T ,   @ H a s S p e c i a l V i e w A c c e s s   O U T P U T  
 	 C R E A T E   T A B L E   # S e c u r i t y G r o u p N o d e s   ( S e c u r i t y G r o u p N o d e   B I G I N T   P R I M A R Y   K E Y )  
 	 I N S E R T   I N T O   # S e c u r i t y G r o u p N o d e s   ( S e c u r i t y G r o u p N o d e )   E X E C   [ R D F . S e c u r i t y ] . G e t S e s s i o n S e c u r i t y G r o u p N o d e s   @ S e s s i o n I D ,   @ N o d e I D  
  
  
 	 d e c l a r e   @ A u t h o r I n A u t h o r s h i p   b i g i n t  
 	 s e l e c t   @ A u t h o r I n A u t h o r s h i p   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / v i v o w e b . o r g / o n t o l o g y / c o r e # a u t h o r I n A u t h o r s h i p ' )    
 	 d e c l a r e   @ L i n k e d I n f o r m a t i o n R e s o u r c e   b i g i n t  
 	 s e l e c t   @ L i n k e d I n f o r m a t i o n R e s o u r c e   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / v i v o w e b . o r g / o n t o l o g y / c o r e # l i n k e d I n f o r m a t i o n R e s o u r c e ' )    
  
  
 	 s e l e c t   i . N o d e I D ,   p . E n t i t y I D ,   i . V a l u e   r d f _ a b o u t ,   p . E n t i t y N a m e   r d f s _ l a b e l ,    
 	 	 p . R e f e r e n c e   p r n s _ i n f o r m a t i o n R e s o u r c e R e f e r e n c e ,   p . E n t i t y D a t e   p r n s _ p u b l i c a t i o n D a t e ,  
 	 	 y e a r ( p . E n t i t y D a t e )   p r n s _ y e a r ,   p . p m i d   b i b o _ p m i d ,   p . m p i d   p r n s _ m p i d  
 	 f r o m   [ R D F . ] . [ T r i p l e ]   t  
 	 	 i n n e r   j o i n   [ R D F . ] . [ N o d e ]   a  
 	 	 	 o n   t . s u b j e c t   =   @ N o d e I D   a n d   t . p r e d i c a t e   =   @ A u t h o r I n A u t h o r s h i p  
 	 	 	 	 a n d   t . o b j e c t   =   a . N o d e I D  
 	 	 	 	 a n d   ( ( t . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( t . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( t . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) ) )  
 	 	 	 	 a n d   ( ( a . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( a . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( a . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) ) )  
 	 	 i n n e r   j o i n   [ R D F . ] . [ N o d e ]   i  
 	 	 	 o n   t . o b j e c t   =   i . N o d e I D  
 	 	 	 	 a n d   ( ( i . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( i . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( i . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) ) )  
 	 	 i n n e r   j o i n   [ R D F . S t a g e ] . [ I n t e r n a l N o d e M a p ]   m  
 	 	 	 o n   i . N o d e I D   =   m . N o d e I D  
 	 	 i n n e r   j o i n   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . E n t i t y . A u t h o r s h i p ]   e  
 	 	 	 o n   m . I n t e r n a l I D   =   e . E n t i t y I D  
 	 	 i n n e r   j o i n   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . E n t i t y . I n f o r m a t i o n R e s o u r c e ]   p  
 	 	 	 o n   e . I n f o r m a t i o n R e s o u r c e I D   =   p . E n t i t y I D  
 	 o r d e r   b y   p . E n t i t y D a t e   d e s c  
  
 / *  
 	 s e l e c t   i . N o d e I D ,   p . E n t i t y I D ,   i . V a l u e   r d f _ a b o u t ,   p . E n t i t y N a m e   r d f s _ l a b e l ,    
 	 	 p . R e f e r e n c e   p r n s _ i n f o r m a t i o n R e s o u r c e R e f e r e n c e ,   p . E n t i t y D a t e   p r n s _ p u b l i c a t i o n D a t e ,  
 	 	 y e a r ( p . E n t i t y D a t e )   p r n s _ y e a r ,   p . p m i d   b i b o _ p m i d ,   p . m p i d   p r n s _ m p i d  
 	 f r o m   [ R D F . ] . [ T r i p l e ]   t  
 	 	 i n n e r   j o i n   [ R D F . ] . [ T r i p l e ]   v  
 	 	 	 o n   t . s u b j e c t   =   @ N o d e I D   a n d   t . p r e d i c a t e   =   @ A u t h o r I n A u t h o r s h i p  
 	 	 	 a n d   t . o b j e c t   =   v . s u b j e c t   a n d   v . p r e d i c a t e   =   @ L i n k e d I n f o r m a t i o n R e s o u r c e  
 	 	 	 a n d   ( ( t . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( t . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( t . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) ) )  
 	 	 	 a n d   ( ( v . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( v . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( v . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) ) )  
 	 	 i n n e r   j o i n   [ R D F . ] . [ N o d e ]   a  
 	 	 	 o n   t . o b j e c t   =   a . N o d e I D  
 	 	 	 a n d   ( ( a . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( a . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( a . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) ) )  
 	 	 i n n e r   j o i n   [ R D F . ] . [ N o d e ]   i  
 	 	 	 o n   v . o b j e c t   =   i . N o d e I D  
 	 	 	 a n d   ( ( i . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( i . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( i . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) ) )  
 	 	 i n n e r   j o i n   [ R D F . S t a g e ] . [ I n t e r n a l N o d e M a p ]   m  
 	 	 	 o n   i . N o d e I D   =   m . N o d e I D  
 	 	 i n n e r   j o i n   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . E n t i t y . I n f o r m a t i o n R e s o u r c e ]   p  
 	 	 	 o n   m . I n t e r n a l I D   =   p . E n t i t y I D  
 	 o r d e r   b y   p . E n t i t y D a t e   d e s c  
 * /  
  
 E N D  
  
  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ O n t o l o g y . I m p o r t ] . [ f n G e t P r o p e r t y T r e e ] '  
 G O  
 C R E A T E   F U N C T I O N   [ O n t o l o g y . I m p o r t ] . [ f n G e t P r o p e r t y T r e e ]  
 (  
 	 - -   A d d   t h e   p a r a m e t e r s   f o r   t h e   f u n c t i o n   h e r e  
 	 @ p r o p e r t y   n v a r c h a r ( 1 0 0 0 )   =   N U L L ,  
 	 @ d e p t h   i n t   =   0  
 )  
 R E T U R N S   x m l  
 A S  
 B E G I N  
 	 - -   D e c l a r e   t h e   r e t u r n   v a r i a b l e   h e r e  
 	 D E C L A R E   @ x   x m l  
  
 	 - -   s e l e c t   [ O n t o l o g y . I m p o r t ] . [ f n G e t P r o p e r t y T r e e ] ( n u l l , 0 )  
  
 	 i f   @ p r o p e r t y   i s   n u l l  
 	 	 s e l e c t   @ x   =   (  
 	 	 	 	 s e l e c t   S u b j e c t   a s   " p r o p e r t y / @ n a m e " ,   @ d e p t h   a s   " p r o p e r t y / @ d e p t h " ,   O b j e c t   a s   " p r o p e r t y / @ t y p e " ,  
 	 	 	 	 	 [ O n t o l o g y . I m p o r t ] . [ f n G e t P r o p e r t y T r e e ] ( S u b j e c t , @ d e p t h + 1 )   a s   " p r o p e r t y "  
 	 	 	 	 f r o m   (  
 	 	 	 	 	 s e l e c t   S u b j e c t ,   O b j e c t  
 	 	 	 	 	 	 f r o m   [ O n t o l o g y . I m p o r t ] . [ T r i p l e ]   a  
 	 	 	 	 	 	 w h e r e   O b j e c t   i n   ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # D a t a t y p e P r o p e r t y ' , ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # O b j e c t P r o p e r t y ' )  
 	 	 	 	 	 	 	 a n d   n o t   e x i s t s   (  
 	 	 	 	 	 	 	 	 s e l e c t   *    
 	 	 	 	 	 	 	 	 f r o m   [ O n t o l o g y . I m p o r t ] . [ T r i p l e ]   b    
 	 	 	 	 	 	 	 	 w h e r e   b . P r e d i c a t e   =   ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # s u b P r o p e r t y O f '  
 	 	 	 	 	 	 	 	 	 a n d   b . S u b j e c t   =   a . S u b j e c t  
 	 	 	 	 	 	 	 )  
 	 	 	 	 	 u n i o n   a l l  
 	 	 	 	 	 s e l e c t   O b j e c t ,   ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # D a t a t y p e P r o p e r t y '  
 	 	 	 	 	 	 f r o m   [ O n t o l o g y . I m p o r t ] . [ T r i p l e ]   a  
 	 	 	 	 	 	 w h e r e   a . P r e d i c a t e   =   ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # s u b P r o p e r t y O f '  
 	 	 	 	 	 	 	 a n d   n o t   e x i s t s   (  
 	 	 	 	 	 	 	 	 s e l e c t   *   f r o m   [ O n t o l o g y . I m p o r t ] . [ T r i p l e ]   b  
 	 	 	 	 	 	 	 	 w h e r e   b . O b j e c t   i n   ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # D a t a t y p e P r o p e r t y ' , ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # O b j e c t P r o p e r t y ' )  
 	 	 	 	 	 	 	 	 	 a n d   a . O b j e c t   =   b . S u b j e c t  
 	 	 	 	 	 	 	 )  
 	 	 	 	 )   t  
 	 	 	 	 o r d e r   b y   S u b j e c t  
 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 )  
 	 e l s e  
 	 	 s e l e c t   @ x   =   (  
 	 	 	 	 s e l e c t   S u b j e c t   a s   " p r o p e r t y / @ n a m e " ,   @ d e p t h   a s   " p r o p e r t y / @ d e p t h " ,   O b j e c t   a s   " p r o p e r t y / @ t y p e " ,  
 	 	 	 	 	 [ O n t o l o g y . I m p o r t ] . [ f n G e t P r o p e r t y T r e e ] ( S u b j e c t , @ d e p t h + 1 )   a s   " p r o p e r t y "  
 	 	 	 	 f r o m   [ O n t o l o g y . I m p o r t ] . [ T r i p l e ]   a  
 	 	 	 	 w h e r e   O b j e c t   i n   ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # D a t a t y p e P r o p e r t y ' , ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # O b j e c t P r o p e r t y ' )  
 	 	 	 	 	 a n d   e x i s t s   (  
 	 	 	 	 	 	 s e l e c t   *    
 	 	 	 	 	 	 f r o m   [ O n t o l o g y . I m p o r t ] . [ T r i p l e ]   b    
 	 	 	 	 	 	 w h e r e   b . P r e d i c a t e   =   ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # s u b P r o p e r t y O f '  
 	 	 	 	 	 	 	 a n d   b . O b j e c t   =   @ p r o p e r t y  
 	 	 	 	 	 	 	 a n d   b . S u b j e c t   =   a . S u b j e c t  
 	 	 	 	 	 )  
 	 	 	 	 o r d e r   b y   S u b j e c t  
 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 )  
  
 	 - -   R e t u r n   t h e   r e s u l t   o f   t h e   f u n c t i o n  
 	 R E T U R N   @ x  
  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ O n t o l o g y . I m p o r t ] . [ f n G e t C l a s s T r e e ] '  
 G O  
 C R E A T E   F U N C T I O N   [ O n t o l o g y . I m p o r t ] . [ f n G e t C l a s s T r e e ]  
 (  
 	 - -   A d d   t h e   p a r a m e t e r s   f o r   t h e   f u n c t i o n   h e r e  
 	 @ c l a s s   n v a r c h a r ( 1 0 0 0 )   =   N U L L ,  
 	 @ d e p t h   i n t   =   0  
 )  
 R E T U R N S   x m l  
 A S  
 B E G I N  
 	 - -   D e c l a r e   t h e   r e t u r n   v a r i a b l e   h e r e  
 	 D E C L A R E   @ x   x m l  
  
 	 - -   s e l e c t   [ O n t o l o g y . I m p o r t ] . f n G e t C l a s s T r e e ( n u l l , 0 )  
  
 	 i f   @ c l a s s   i s   n u l l  
 	 	 s e l e c t   @ x   =   (  
 	 	 	 	 s e l e c t   S u b j e c t   a s   " c l a s s / @ n a m e " ,   @ d e p t h   a s   " c l a s s / @ d e p t h " ,   @ c l a s s   a s   " c l a s s / @ p a r e n t " ,  
 	 	 	 	 	 [ O n t o l o g y . I m p o r t ] . f n G e t C l a s s T r e e ( S u b j e c t , @ d e p t h + 1 )   a s   " c l a s s "  
 	 	 	 	 f r o m   (  
 	 	 	 	 	 s e l e c t   S u b j e c t  
 	 	 	 	 	 	 f r o m   [ O n t o l o g y . I m p o r t ] . [ T r i p l e ]   a  
 	 	 	 	 	 	 w h e r e   O b j e c t   =   ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # C l a s s '  
 	 	 	 	 	 	 	 a n d   n o t   e x i s t s   (  
 	 	 	 	 	 	 	 	 s e l e c t   *    
 	 	 	 	 	 	 	 	 f r o m   [ O n t o l o g y . I m p o r t ] . [ T r i p l e ]   b    
 	 	 	 	 	 	 	 	 w h e r e   b . P r e d i c a t e   =   ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # s u b C l a s s O f '  
 	 	 	 	 	 	 	 	 	 a n d   b . O b j e c t   n o t   l i k e   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / n o d e I D # % '  
 	 	 	 	 	 	 	 	 	 a n d   b . S u b j e c t   =   a . S u b j e c t  
 	 	 	 	 	 	 	 )  
 	 	 	 	 	 u n i o n   a l l  
 	 	 	 	 	 s e l e c t   O b j e c t  
 	 	 	 	 	 	 f r o m   [ O n t o l o g y . I m p o r t ] . [ T r i p l e ]   a  
 	 	 	 	 	 	 w h e r e   a . P r e d i c a t e   =   ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # s u b C l a s s O f '  
 	 	 	 	 	 	 	 a n d   n o t   e x i s t s   (  
 	 	 	 	 	 	 	 	 s e l e c t   *   f r o m   [ O n t o l o g y . I m p o r t ] . [ T r i p l e ]   b  
 	 	 	 	 	 	 	 	 w h e r e   b . O b j e c t   =   ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # C l a s s '  
 	 	 	 	 	 	 	 	 	 a n d   a . O b j e c t   =   b . S u b j e c t  
 	 	 	 	 	 	 	 )  
 	 	 	 	 	 	 	 a n d   a . O b j e c t   n o t   l i k e   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / n o d e I D # % '  
 	 	 	 	 )   t  
 	 	 	 	 o r d e r   b y   S u b j e c t  
 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 )  
 	 e l s e  
 	 	 s e l e c t   @ x   =   (  
 	 	 	 	 s e l e c t   S u b j e c t   a s   " c l a s s / @ n a m e " ,   @ d e p t h   a s   " c l a s s / @ d e p t h " ,   @ c l a s s   a s   " c l a s s / @ p a r e n t " ,  
 	 	 	 	 	 [ O n t o l o g y . I m p o r t ] . f n G e t C l a s s T r e e ( S u b j e c t , @ d e p t h + 1 )   a s   " c l a s s "  
 	 	 	 	 f r o m   [ O n t o l o g y . I m p o r t ] . [ T r i p l e ]   a  
 	 	 	 	 w h e r e   O b j e c t   =   ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # C l a s s '  
 	 	 	 	 	 a n d   e x i s t s   (  
 	 	 	 	 	 	 s e l e c t   *    
 	 	 	 	 	 	 f r o m   [ O n t o l o g y . I m p o r t ] . [ T r i p l e ]   b    
 	 	 	 	 	 	 w h e r e   b . P r e d i c a t e   =   ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # s u b C l a s s O f '  
 	 	 	 	 	 	 	 a n d   b . O b j e c t   =   @ c l a s s  
 	 	 	 	 	 	 	 a n d   b . S u b j e c t   =   a . S u b j e c t  
 	 	 	 	 	 )  
 	 	 	 	 o r d e r   b y   S u b j e c t  
 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 )  
  
 	 - -   R e t u r n   t h e   r e s u l t   o f   t h e   f u n c t i o n  
 	 R E T U R N   @ x  
  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ S e a r c h . ] . [ P a r s e S e a r c h S t r i n g ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ S e a r c h . ] . [ P a r s e S e a r c h S t r i n g ]  
 	 @ S e a r c h S t r i n g   V A R C H A R ( 5 0 0 )   =   N U L L ,  
 	 @ N u m b e r O f P h r a s e s   I N T   =   0   O U T P U T ,  
 	 @ C o m b i n e d S e a r c h S t r i n g   V A R C H A R ( 8 0 0 0 )   =   ' '   O U T P U T ,  
 	 @ S e a r c h P h r a s e X M L   X M L   =   N U L L   O U T P U T ,  
 	 @ S e a r c h P h r a s e F o r m s X M L   X M L   =   N U L L   O U T P U T ,  
 	 @ P r o c e s s T i m e   I N T   =   0   O U T P U T  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 	 S E T   N O C O U N T   O N ;  
  
 	 - -   S t a r t   t i m e r  
 	 d e c l a r e   @ d   d a t e t i m e  
 	 s e l e c t   @ d   =   G e t D a t e ( )  
  
  
 	 - -   R e m o v e   b a d   c h a r a c t e r s  
 	 d e c l a r e   @ S e a r c h S t r i n g N o r m a l i z e d   v a r c h a r ( m a x )  
 	 s e l e c t   @ S e a r c h S t r i n g N o r m a l i z e d   =   ' '  
 	 d e c l a r e   @ S t r i n g P o s   i n t  
 	 s e l e c t   @ S t r i n g P o s   =   1  
 	 d e c l a r e   @ I n Q u o t e s   t i n y i n t  
 	 s e l e c t   @ I n Q u o t e s   =   0  
 	 d e c l a r e   @ C h a r   c h a r ( 1 )  
 	 w h i l e   @ S t r i n g P o s   < =   l e n ( @ S e a r c h S t r i n g )  
 	 b e g i n  
 	 	 s e l e c t   @ C h a r   =   s u b s t r i n g ( @ S e a r c h S t r i n g , @ S t r i n g P o s , 1 )  
 	 	 s e l e c t   @ I n Q u o t e s   =   1   -   @ I n Q u o t e s   w h e r e   @ C h a r   =   ' " '  
 	 	 i f   @ C h a r   l i k e   ' [ 0 - 9 A - Z a - z ] '  
 	 	 	 s e l e c t   @ S e a r c h S t r i n g N o r m a l i z e d   =   @ S e a r c h S t r i n g N o r m a l i z e d   +   @ C h a r  
 	 	 e l s e   i f   @ C h a r   =   ' " '  
 	 	 	 s e l e c t   @ S e a r c h S t r i n g N o r m a l i z e d   =   @ S e a r c h S t r i n g N o r m a l i z e d   +   '   '  
 	 	 e l s e   i f   r i g h t ( @ S e a r c h S t r i n g N o r m a l i z e d , 1 )   n o t   i n   ( '   ' , ' _ ' )  
 	 	 	 s e l e c t   @ S e a r c h S t r i n g N o r m a l i z e d   =   @ S e a r c h S t r i n g N o r m a l i z e d   +   ( c a s e   w h e n   @ I n Q u o t e s   =   1   t h e n   ' _ '   e l s e   '   '   e n d )  
 	 	 s e l e c t   @ S t r i n g P o s   =   @ S t r i n g P o s   +   1  
 	 e n d  
 	 s e l e c t   @ S e a r c h S t r i n g N o r m a l i z e d   =   r e p l a c e ( @ S e a r c h S t r i n g N o r m a l i z e d , '     ' , '   ' )  
 	 s e l e c t   @ S e a r c h S t r i n g N o r m a l i z e d   =   '   '   +   l t r i m ( r t r i m ( r e p l a c e ( r e p l a c e ( '   ' + @ S e a r c h S t r i n g N o r m a l i z e d + '   ' , '   _ ' , '   ' ) , ' _   ' , '   ' ) ) )   +   '   | '  
  
  
 	 - -   F i n d   p h r a s e   p o s i t i o n s  
 	 d e c l a r e   @ P h r a s e B r e a k P o s i t i o n s   t a b l e   ( z   i n t ,   n   i n t ,   m   i n t ,   i   i n t )  
 	 ; w i t h   a   a s   (  
 	 	 s e l e c t   n . n ,   r o w _ n u m b e r ( )   o v e r   ( o r d e r   b y   n . n )   -   1   i  
 	 	 	 f r o m   [ U t i l i t y . M a t h ] . N   n  
 	 	 	 w h e r e   n . n   b e t w e e n   1   a n d   l e n ( @ S e a r c h S t r i n g N o r m a l i z e d )   a n d   s u b s t r i n g ( @ S e a r c h S t r i n g N o r m a l i z e d , n . n , 1 )   =   '   '  
 	 ) ,   b   a s   (  
 	 	 s e l e c t   c o u n t ( * ) - 1   j   f r o m   a  
 	 )  
 	 i n s e r t   i n t o   @ P h r a s e B r e a k P o s i t i o n s  
 	 	 s e l e c t   n . n   z ,   a . n ,   a . i   m ,   r o w _ n u m b e r ( )   o v e r   ( p a r t i t i o n   b y   n . n   o r d e r   b y   a . n )   i  
 	 	 	 f r o m   a ,   b ,   [ U t i l i t y . M a t h ] . N   n  
 	 	 	 w h e r e   n . n   <   P o w e r ( 2 , b . j - 1 )  
 	 	 	 	 a n d   1   =   ( c a s e   w h e n   a . i = 0   t h e n   1   w h e n   a . i = b . j   t h e n   1   w h e n   P o w e r ( 2 , a . i - 1 )   &   n . n   >   0   t h e n   1   e l s e   0   e n d )  
 	 s e l e c t   @ S e a r c h S t r i n g N o r m a l i z e d   =   r e p l a c e ( @ S e a r c h S t r i n g N o r m a l i z e d , ' _ ' , '   ' )  
  
  
 	 - -   E x t r a c t   p h r a s e s  
 	 d e c l a r e   @ T e m p P h r a s e L i s t   t a b l e   ( i   i n t ,   w   v a r c h a r ( m a x ) ,   x   i n t )    
 	 ; w i t h   d   a s   (  
 	 	 s e l e c t   c . * ,   s u b s t r i n g ( @ S e a r c h S t r i n g N o r m a l i z e d , c . n + 1 , d . n - c . n - 1 )   w ,   d . m - c . m   l  
 	 	 	 f r o m   @ P h r a s e B r e a k P o s i t i o n s   c ,   @ P h r a s e B r e a k P o s i t i o n s   d  
 	 	 	 w h e r e   c . z = d . z   a n d   c . i = d . i - 1  
 	 ) ,   e   a s   (  
 	 	 s e l e c t   d . * ,   I s N u l l ( t . x , 0 )   x  
 	 	 f r o m   d   o u t e r   a p p l y   ( s e l e c t   t o p   1   1   x   f r o m   [ U t i l i t y . N L P ] . T h e s a u r u s   t   w h e r e   d . w   =   t . T e r m N a m e )   t  
 	 ) ,   f   a s   (  
 	 	 s e l e c t   t o p   1   z  
 	 	 f r o m   e  
 	 	 g r o u p   b y   z    
 	 	 o r d e r   b y   s u m ( l * l * x )   d e s c ,   z   d e s c  
 	 )  
 	 i n s e r t   i n t o   @ T e m p P h r a s e L i s t  
 	 	 s e l e c t   r o w _ n u m b e r ( )   o v e r   ( o r d e r   b y   e . i )   i ,   e . w ,   e . x  
 	 	 	 f r o m   e ,   f  
 	 	 	 w h e r e   e . z   =   f . z  
 	 	 	 	 a n d   e . w   n o t   i n   ( s e l e c t   w o r d   f r o m   [ U t i l i t y . N L P ] . S t o p W o r d   w h e r e   s c o p e   =   0 )  
 	 	 	 	 a n d   e . w   < >   ' '  
 	 d e c l a r e   @ P h r a s e L i s t   t a b l e   ( P h r a s e I D   i n t ,   P h r a s e   v a r c h a r ( m a x ) ,   T h e s a u r u s M a t c h   b i t ,   F o r m s   v a r c h a r ( m a x ) )  
 	 i n s e r t   i n t o   @ P h r a s e L i s t   ( P h r a s e I D ,   P h r a s e ,   T h e s a u r u s M a t c h ,   F o r m s )  
 	 	 s e l e c t   i ,   w ,   x ,   ( c a s e   w h e n   x   =   0   t h e n   ' " ' + [ U t i l i t y . N L P ] . f n P o r t e r A l g o r i t h m ( p . w ) + ' * " '  
 	 	 	 	 	 	 e l s e   s u b s t r i n g ( c a s t (   (  
 	 	 	 	 	 	 	 	 	 s e l e c t   d i s t i n c t   '   O R   " ' + v . T e r m N a m e + ' " '  
 	 	 	 	 	 	 	 	 	 	 f r o m   [ U t i l i t y . N L P ] . T h e s a u r u s   t ,   [ U t i l i t y . N L P ] . T h e s a u r u s   v  
 	 	 	 	 	 	 	 	 	 	 w h e r e   p . w = t . T e r m N a m e   a n d   t . S o u r c e = v . S o u r c e   a n d   t . C o n c e p t I D = v . C o n c e p t I D  
 	 	 	 	 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 	 	 	 	 )   a s   v a r c h a r ( m a x ) ) , 5 , 9 9 9 9 9 9 )  
 	 	 	 	 	 	 e n d )  
 	 	 f r o m   @ T e m p P h r a s e L i s t   p  
 	 s e l e c t   @ N u m b e r O f P h r a s e s   =   ( s e l e c t   m a x ( P h r a s e I D )   f r o m   @ P h r a s e L i s t )  
 	 s e l e c t   @ S e a r c h S t r i n g N o r m a l i z e d   =   s u b s t r i n g ( @ S e a r c h S t r i n g N o r m a l i z e d , 2 , l e n ( @ S e a r c h S t r i n g N o r m a l i z e d ) - 3 )  
  
  
 	 - -   C r e a t e   a   c o m b i n e d   s t r i n g   f o r   f u l l t e x t   s e a r c h  
 	 s e l e c t   @ C o m b i n e d S e a r c h S t r i n g   =    
 	 	 	 ( c a s e   w h e n   @ N u m b e r O f P h r a s e s   =   0   t h e n   ' '  
 	 	 	 	 w h e n   @ N u m b e r O f P h r a s e s   =   1   t h e n  
 	 	 	 	 	 ' " ' + @ S e a r c h S t r i n g N o r m a l i z e d + ' "   O R   '   +   ( s e l e c t   F o r m s   f r o m   @ P h r a s e L i s t )  
 	 	 	 	 e l s e  
 	 	 	 	 	 ' " ' + @ S e a r c h S t r i n g N o r m a l i z e d + ' " '  
 	 	 	 	 	 +   '   O R   '  
 	 	 	 	 	 +   ' ( '   +   r e p l a c e ( @ S e a r c h S t r i n g N o r m a l i z e d , '   ' , '   N E A R   ' )   +   ' ) '  
 	 	 	 	 	 +   '   O R   '  
 	 	 	 	 	 +   ' ( '   +   s u b s t r i n g ( c a s t ( ( s e l e c t   '   A N D   ( ' + F o r m s + ' ) '   f r o m   @ P h r a s e L i s t   o r d e r   b y   P h r a s e I D   f o r   x m l   p a t h ( ' ' ) ,   t y p e )   a s   v a r c h a r ( m a x ) ) , 6 , 9 9 9 9 9 9 )   +   ' ) '  
 	 	 	 	 e n d )  
 	 	 	 	  
 	  
 	 - -   C r e a t e   a n   X M L   m e s s a g e   l i s t i n g   t h e   p a r s e d   p h r a s e s  
 	 s e l e c t   @ S e a r c h P h r a s e X M L   = 	 	 ( s e l e c t  
 	 	 	 	 	 	 	 	 	 	 ( s e l e c t   P h r a s e I D   " S e a r c h P h r a s e / @ I D " ,    
 	 	 	 	 	 	 	 	 	 	 	 ( c a s e   w h e n   T h e s a u r u s M a t c h = ' 1 '   t h e n   ' t r u e '   e l s e   ' f a l s e '   e n d )   " S e a r c h P h r a s e / @ T h e s a u r u s M a t c h " ,  
 	 	 	 	 	 	 	 	 	 	 	 P h r a s e   " S e a r c h P h r a s e "  
 	 	 	 	 	 	 	 	 	 	 f r o m   @ P h r a s e L i s t  
 	 	 	 	 	 	 	 	 	 	 o r d e r   b y   P h r a s e I D  
 	 	 	 	 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e )   " S e a r c h P h r a s e L i s t "  
 	 	 	 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e )  
 	 s e l e c t   @ S e a r c h P h r a s e F o r m s X M L   = 	 ( s e l e c t  
 	 	 	 	 	 	 	 	 	 	 ( s e l e c t   P h r a s e I D   " S e a r c h P h r a s e / @ I D " ,    
 	 	 	 	 	 	 	 	 	 	 	 ( c a s e   w h e n   T h e s a u r u s M a t c h = ' 1 '   t h e n   ' t r u e '   e l s e   ' f a l s e '   e n d )   " S e a r c h P h r a s e / @ T h e s a u r u s M a t c h " ,  
 	 	 	 	 	 	 	 	 	 	 	 F o r m s   " S e a r c h P h r a s e / @ F o r m s " ,  
 	 	 	 	 	 	 	 	 	 	 	 P h r a s e   " S e a r c h P h r a s e "  
 	 	 	 	 	 	 	 	 	 	 f r o m   @ P h r a s e L i s t  
 	 	 	 	 	 	 	 	 	 	 o r d e r   b y   P h r a s e I D  
 	 	 	 	 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e )   " S e a r c h P h r a s e L i s t "  
 	 	 	 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e )  
  
 	 	 	 	 	  
 	 - -   E n d   t i m e r  
 	 s e l e c t   @ P r o c e s s T i m e   =   d a t e d i f f ( m s , @ d , G e t D a t e ( ) )  
  
 E N D  
  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ S e a r c h . C a c h e ] . [ P u b l i c . G e t N o d e s ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ S e a r c h . C a c h e ] . [ P u b l i c . G e t N o d e s ]  
 	 @ S e a r c h O p t i o n s   X M L ,  
 	 @ S e s s i o n I D   U N I Q U E I D E N T I F I E R   =   N U L L  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 	 S E T   N O C O U N T   O N ;  
  
 	 / *  
 	  
 	 E X E C   [ S e a r c h . ] . [ G e t N o d e s ]   @ S e a r c h O p t i o n s   =   '  
 	 < S e a r c h O p t i o n s >  
 	 	 < M a t c h O p t i o n s >  
 	 	 	 < S e a r c h S t r i n g   E x a c t M a t c h = " f a l s e " > o p t i o n s   f o r   " l u n g   c a n c e r "   t r e a t m e n t < / S e a r c h S t r i n g >  
 	 	 	 < C l a s s U R I > h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / P e r s o n < / C l a s s U R I >  
 	 	 	 < S e a r c h F i l t e r s L i s t >  
 	 	 	 	 < S e a r c h F i l t e r   P r o p e r t y = " h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / l a s t N a m e "   M a t c h T y p e = " L e f t " > S m i t < / S e a r c h F i l t e r >  
 	 	 	 < / S e a r c h F i l t e r s L i s t >  
 	 	 < / M a t c h O p t i o n s >  
 	 	 < O u t p u t O p t i o n s >  
 	 	 	 < O f f s e t > 0 < / O f f s e t >  
 	 	 	 < L i m i t > 5 < / L i m i t >  
 	 	 	 < S o r t B y L i s t >  
 	 	 	 	 < S o r t B y   I s D e s c = " 1 "   P r o p e r t y = " h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / f i r s t N a m e "   / >  
 	 	 	 	 < S o r t B y   I s D e s c = " 0 "   P r o p e r t y = " h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / l a s t N a m e "   / >  
 	 	 	 < / S o r t B y L i s t >  
 	 	 < / O u t p u t O p t i o n s > 	  
 	 < / S e a r c h O p t i o n s >  
 	 '  
 	 	  
 	 * /  
  
 	 d e c l a r e   @ M a t c h O p t i o n s   x m l  
 	 d e c l a r e   @ O u t p u t O p t i o n s   x m l  
 	 d e c l a r e   @ S e a r c h S t r i n g   v a r c h a r ( 5 0 0 )  
 	 d e c l a r e   @ C l a s s G r o u p U R I   v a r c h a r ( 4 0 0 )  
 	 d e c l a r e   @ C l a s s U R I   v a r c h a r ( 4 0 0 )  
 	 d e c l a r e   @ S e a r c h F i l t e r s X M L   x m l  
 	 d e c l a r e   @ o f f s e t   b i g i n t  
 	 d e c l a r e   @ l i m i t   b i g i n t  
 	 d e c l a r e   @ S o r t B y X M L   x m l  
 	 d e c l a r e   @ D o E x p a n d e d S e a r c h   b i t  
 	  
 	 s e l e c t 	 @ M a t c h O p t i o n s   =   @ S e a r c h O p t i o n s . q u e r y ( ' S e a r c h O p t i o n s [ 1 ] / M a t c h O p t i o n s [ 1 ] ' ) ,  
 	 	 	 @ O u t p u t O p t i o n s   =   @ S e a r c h O p t i o n s . q u e r y ( ' S e a r c h O p t i o n s [ 1 ] / O u t p u t O p t i o n s [ 1 ] ' )  
 	  
 	 s e l e c t 	 @ S e a r c h S t r i n g   =   @ M a t c h O p t i o n s . v a l u e ( ' M a t c h O p t i o n s [ 1 ] / S e a r c h S t r i n g [ 1 ] ' , ' v a r c h a r ( 5 0 0 ) ' ) ,  
 	 	 	 @ D o E x p a n d e d S e a r c h   =   ( c a s e   w h e n   @ M a t c h O p t i o n s . v a l u e ( ' M a t c h O p t i o n s [ 1 ] / S e a r c h S t r i n g [ 1 ] / @ E x a c t M a t c h ' , ' v a r c h a r ( 5 0 ) ' )   =   ' t r u e '   t h e n   0   e l s e   1   e n d ) ,  
 	 	 	 @ C l a s s G r o u p U R I   =   @ M a t c h O p t i o n s . v a l u e ( ' M a t c h O p t i o n s [ 1 ] / C l a s s G r o u p U R I [ 1 ] ' , ' v a r c h a r ( 4 0 0 ) ' ) ,  
 	 	 	 @ C l a s s U R I   =   @ M a t c h O p t i o n s . v a l u e ( ' M a t c h O p t i o n s [ 1 ] / C l a s s U R I [ 1 ] ' , ' v a r c h a r ( 4 0 0 ) ' ) ,  
 	 	 	 @ S e a r c h F i l t e r s X M L   =   @ M a t c h O p t i o n s . q u e r y ( ' M a t c h O p t i o n s [ 1 ] / S e a r c h F i l t e r s L i s t [ 1 ] ' ) ,  
 	 	 	 @ o f f s e t   =   @ O u t p u t O p t i o n s . v a l u e ( ' O u t p u t O p t i o n s [ 1 ] / O f f s e t [ 1 ] ' , ' b i g i n t ' ) ,  
 	 	 	 @ l i m i t   =   @ O u t p u t O p t i o n s . v a l u e ( ' O u t p u t O p t i o n s [ 1 ] / L i m i t [ 1 ] ' , ' b i g i n t ' ) ,  
 	 	 	 @ S o r t B y X M L   =   @ O u t p u t O p t i o n s . q u e r y ( ' O u t p u t O p t i o n s [ 1 ] / S o r t B y L i s t [ 1 ] ' )  
  
 	 d e c l a r e   @ b a s e U R I   n v a r c h a r ( 4 0 0 )  
 	 s e l e c t   @ b a s e U R I   =   v a l u e   f r o m   [ F r a m e w o r k . ] . P a r a m e t e r   w h e r e   P a r a m e t e r I D   =   ' b a s e U R I '  
  
 	 d e c l a r e   @ d   d a t e t i m e  
 	 s e l e c t   @ d   =   G e t D a t e ( )  
 	  
 	 d e c l a r e   @ I s B o t   b i t  
 	 i f   @ S e s s i o n I D   i s   n o t   n u l l  
 	 	 s e l e c t   @ I s B o t   =   I s B o t  
 	 	 	 f r o m   [ U s e r . S e s s i o n ] . [ S e s s i o n ]  
 	 	 	 w h e r e   S e s s i o n I D   =   @ S e s s i o n I D  
 	 s e l e c t   @ I s B o t   =   I s N u l l ( @ I s B o t , 0 )  
 	  
 	 d e c l a r e   @ S e a r c h H i s t o r y Q u e r y I D   i n t  
 	 i n s e r t   i n t o   [ S e a r c h . ] . [ H i s t o r y . Q u e r y ]   ( S t a r t D a t e ,   S e s s i o n I D ,   I s B o t ,   S e a r c h O p t i o n s )  
 	 	 s e l e c t   G e t D a t e ( ) ,   @ S e s s i o n I D ,   @ I s B o t ,   @ S e a r c h O p t i o n s  
 	 s e l e c t   @ S e a r c h H i s t o r y Q u e r y I D   =   @ @ I D E N T I T Y  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   P a r s e   s e a r c h   s t r i n g   a n d   c o n v e r t   t o   f u l l t e x t   q u e r y  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 d e c l a r e   @ N u m b e r O f P h r a s e s   I N T  
 	 d e c l a r e   @ C o m b i n e d S e a r c h S t r i n g   V A R C H A R ( 8 0 0 0 )  
 	 d e c l a r e   @ S e a r c h P h r a s e X M L   X M L  
 	 d e c l a r e   @ S e a r c h P h r a s e F o r m s X M L   X M L  
 	 d e c l a r e   @ P a r s e P r o c e s s T i m e   I N T  
  
 	 E X E C   [ S e a r c h . ] . [ P a r s e S e a r c h S t r i n g ] 	 @ S e a r c h S t r i n g   =   @ S e a r c h S t r i n g ,  
 	 	 	 	 	 	 	 	 	 	 @ N u m b e r O f P h r a s e s   =   @ N u m b e r O f P h r a s e s   O U T P U T ,  
 	 	 	 	 	 	 	 	 	 	 @ C o m b i n e d S e a r c h S t r i n g   =   @ C o m b i n e d S e a r c h S t r i n g   O U T P U T ,  
 	 	 	 	 	 	 	 	 	 	 @ S e a r c h P h r a s e X M L   =   @ S e a r c h P h r a s e X M L   O U T P U T ,  
 	 	 	 	 	 	 	 	 	 	 @ S e a r c h P h r a s e F o r m s X M L   =   @ S e a r c h P h r a s e F o r m s X M L   O U T P U T ,  
 	 	 	 	 	 	 	 	 	 	 @ P r o c e s s T i m e   =   @ P a r s e P r o c e s s T i m e   O U T P U T  
  
 	 d e c l a r e   @ P h r a s e L i s t   t a b l e   ( P h r a s e I D   i n t ,   P h r a s e   v a r c h a r ( m a x ) ,   T h e s a u r u s M a t c h   b i t ,   F o r m s   v a r c h a r ( m a x ) )  
 	 i n s e r t   i n t o   @ P h r a s e L i s t   ( P h r a s e I D ,   P h r a s e ,   T h e s a u r u s M a t c h ,   F o r m s )  
 	 s e l e c t 	 x . v a l u e ( ' @ I D ' , ' I N T ' ) ,  
 	 	 	 x . v a l u e ( ' . ' , ' V A R C H A R ( M A X ) ' ) ,  
 	 	 	 x . v a l u e ( ' @ T h e s a u r u s M a t c h ' , ' B I T ' ) ,  
 	 	 	 x . v a l u e ( ' @ F o r m s ' , ' V A R C H A R ( M A X ) ' )  
 	 	 f r o m   @ S e a r c h P h r a s e F o r m s X M L . n o d e s ( ' / / S e a r c h P h r a s e ' )   a s   p ( x )  
  
 	 - - S E L E C T   @ N u m b e r O f P h r a s e s ,   @ C o m b i n e d S e a r c h S t r i n g ,   @ S e a r c h P h r a s e X M L ,   @ S e a r c h P h r a s e F o r m s X M L ,   @ P a r s e P r o c e s s T i m e  
 	 - - S E L E C T   *   F R O M   @ P h r a s e L i s t  
 	 - - s e l e c t   d a t e d i f f ( m s , @ d , G e t D a t e ( ) )  
  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   P a r s e   s e a r c h   f i l t e r s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 c r e a t e   t a b l e   # S e a r c h F i l t e r s   (  
 	 	 S e a r c h F i l t e r I D   i n t   i d e n t i t y ( 0 , 1 )   p r i m a r y   k e y ,  
 	 	 I s E x c l u d e   b i t ,  
 	 	 P r o p e r t y U R I   v a r c h a r ( 4 0 0 ) ,  
 	 	 P r o p e r t y U R I 2   v a r c h a r ( 4 0 0 ) ,  
 	 	 V a l u e   v a r c h a r ( 7 5 0 ) ,  
 	 	 P r e d i c a t e   b i g i n t ,  
 	 	 P r e d i c a t e 2   b i g i n t  
 	 )  
 	  
 	 i n s e r t   i n t o   # S e a r c h F i l t e r s   ( I s E x c l u d e ,   P r o p e r t y U R I ,   P r o p e r t y U R I 2 ,   V a l u e ,   P r e d i c a t e ,   P r e d i c a t e 2 ) 	  
 	 	 s e l e c t   t . I s E x c l u d e ,   t . P r o p e r t y U R I ,   t . P r o p e r t y U R I 2 ,    
 	 	 	 	 l e f t ( t . V a l u e , 7 5 0 ) + ( c a s e   w h e n   t . M a t c h T y p e = ' L e f t '   t h e n   ' % '   e l s e   ' '   e n d ) ,  
 	 	 	 	 t . P r e d i c a t e ,   t . P r e d i c a t e 2  
 	 	 	 f r o m   (  
 	 	 	 	 s e l e c t   I s N u l l ( I s E x c l u d e , 0 )   I s E x c l u d e ,   P r o p e r t y U R I ,   P r o p e r t y U R I 2 ,   M a t c h T y p e ,   V a l u e ,  
 	 	 	 	 	 [ R D F . ] . f n U R I 2 N o d e I D ( P r o p e r t y U R I )   P r e d i c a t e ,  
 	 	 	 	 	 [ R D F . ] . f n U R I 2 N o d e I D ( P r o p e r t y U R I 2 )   P r e d i c a t e 2  
 	 	 	 	 f r o m   (  
 	 	 	 	 	 s e l e c t   d i s t i n c t   S . x . v a l u e ( ' @ I s E x c l u d e ' , ' b i t ' )   I s E x c l u d e ,  
 	 	 	 	 	 	 	 S . x . v a l u e ( ' @ P r o p e r t y ' , ' v a r c h a r ( 4 0 0 ) ' )   P r o p e r t y U R I ,  
 	 	 	 	 	 	 	 S . x . v a l u e ( ' @ P r o p e r t y 2 ' , ' v a r c h a r ( 4 0 0 ) ' )   P r o p e r t y U R I 2 ,  
 	 	 	 	 	 	 	 S . x . v a l u e ( ' @ M a t c h T y p e ' , ' v a r c h a r ( 1 0 0 ) ' )   M a t c h T y p e ,  
 	 	 	 	 	 	 	 S . x . v a l u e ( ' . ' , ' n v a r c h a r ( m a x ) ' )   V a l u e  
 	 	 	 	 	 f r o m   @ S e a r c h F i l t e r s X M L . n o d e s ( ' / / S e a r c h F i l t e r ' )   a s   S ( x )  
 	 	 	 	 )   t  
 	 	 	 )   t  
 	 	 	 w h e r e   t . V a l u e   I S   N O T   N U L L   a n d   t . V a l u e   < >   ' '  
 	 	 	  
 	 d e c l a r e   @ N u m b e r O f I n c l u d e F i l t e r s   i n t  
 	 s e l e c t   @ N u m b e r O f I n c l u d e F i l t e r s   =   I s N u l l ( ( s e l e c t   c o u n t ( * )   f r o m   # S e a r c h F i l t e r s   w h e r e   I s E x c l u d e = 0 ) , 0 )  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   P a r s e   s o r t   b y   o p t i o n s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 c r e a t e   t a b l e   # S o r t B y   (  
 	 	 S o r t B y I D   i n t   i d e n t i t y ( 1 , 1 )   p r i m a r y   k e y ,  
 	 	 I s D e s c   b i t ,  
 	 	 P r o p e r t y U R I   v a r c h a r ( 4 0 0 ) ,  
 	 	 P r o p e r t y U R I 2   v a r c h a r ( 4 0 0 ) ,  
 	 	 P r o p e r t y U R I 3   v a r c h a r ( 4 0 0 ) ,  
 	 	 P r e d i c a t e   b i g i n t ,  
 	 	 P r e d i c a t e 2   b i g i n t ,  
 	 	 P r e d i c a t e 3   b i g i n t  
 	 )  
 	  
 	 i n s e r t   i n t o   # S o r t B y   ( I s D e s c ,   P r o p e r t y U R I ,   P r o p e r t y U R I 2 ,   P r o p e r t y U R I 3 ,   P r e d i c a t e ,   P r e d i c a t e 2 ,   P r e d i c a t e 3 ) 	  
 	 	 s e l e c t   I s N u l l ( I s D e s c , 0 ) ,   P r o p e r t y U R I ,   P r o p e r t y U R I 2 ,   P r o p e r t y U R I 3 ,  
 	 	 	 	 [ R D F . ] . f n U R I 2 N o d e I D ( P r o p e r t y U R I )   P r e d i c a t e ,  
 	 	 	 	 [ R D F . ] . f n U R I 2 N o d e I D ( P r o p e r t y U R I 2 )   P r e d i c a t e 2 ,  
 	 	 	 	 [ R D F . ] . f n U R I 2 N o d e I D ( P r o p e r t y U R I 3 )   P r e d i c a t e 3  
 	 	 	 f r o m   (  
 	 	 	 	 s e l e c t   S . x . v a l u e ( ' @ I s D e s c ' , ' b i t ' )   I s D e s c ,  
 	 	 	 	 	 	 S . x . v a l u e ( ' @ P r o p e r t y ' , ' v a r c h a r ( 4 0 0 ) ' )   P r o p e r t y U R I ,  
 	 	 	 	 	 	 S . x . v a l u e ( ' @ P r o p e r t y 2 ' , ' v a r c h a r ( 4 0 0 ) ' )   P r o p e r t y U R I 2 ,  
 	 	 	 	 	 	 S . x . v a l u e ( ' @ P r o p e r t y 3 ' , ' v a r c h a r ( 4 0 0 ) ' )   P r o p e r t y U R I 3  
 	 	 	 	 f r o m   @ S o r t B y X M L . n o d e s ( ' / / S o r t B y ' )   a s   S ( x )  
 	 	 	 )   t  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   G e t   i n i t i a l   l i s t   o f   m a t c h i n g   n o d e s   ( b e f o r e   f i l t e r s )  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 c r e a t e   t a b l e   # F u l l N o d e M a t c h   (  
 	 	 N o d e I D   b i g i n t   n o t   n u l l ,  
 	 	 P a t h s   b i g i n t ,  
 	 	 W e i g h t   f l o a t  
 	 )  
  
 	 i f   @ C o m b i n e d S e a r c h S t r i n g   < >   ' '  
 	 b e g i n  
  
 	 	 - -   G e t   n o d e s   t h a t   m a t c h   s e p a r a t e   p h r a s e s  
 	 	 c r e a t e   t a b l e   # P h r a s e N o d e M a t c h   (  
 	 	 	 P h r a s e I D   i n t   n o t   n u l l ,  
 	 	 	 N o d e I D   b i g i n t   n o t   n u l l ,  
 	 	 	 P a t h s   b i g i n t ,  
 	 	 	 W e i g h t   f l o a t  
 	 	 )  
 	 	 i f   ( @ N u m b e r O f P h r a s e s   >   1 )   a n d   ( @ D o E x p a n d e d S e a r c h   =   1 )  
 	 	 b e g i n  
 	 	 	 d e c l a r e   @ P h r a s e S e a r c h S t r i n g   v a r c h a r ( 8 0 0 0 )  
 	 	 	 d e c l a r e   @ l o o p   i n t  
 	 	 	 s e l e c t   @ l o o p   =   1  
 	 	 	 w h i l e   @ l o o p   < =   @ N u m b e r O f P h r a s e s  
 	 	 	 b e g i n  
 	 	 	 	 s e l e c t   @ P h r a s e S e a r c h S t r i n g   =   F o r m s  
 	 	 	 	 	 f r o m   @ P h r a s e L i s t  
 	 	 	 	 	 w h e r e   P h r a s e I D   =   @ l o o p  
 	 	 	 	 i n s e r t   i n t o   # P h r a s e N o d e M a t c h   ( P h r a s e I D ,   N o d e I D ,   P a t h s ,   W e i g h t )  
 	 	 	 	 	 s e l e c t   @ l o o p ,   s . N o d e I D ,   c o u n t ( * )   P a t h s ,   1 - e x p ( s u m ( l o g ( c a s e   w h e n   s . W e i g h t * m . W e i g h t   >   0 . 9 9 9 9 9 9   t h e n   0 . 0 0 0 0 0 1   e l s e   1 - s . W e i g h t * m . W e i g h t   e n d ) ) )   W e i g h t  
 	 	 	 	 	 	 f r o m   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e M a p ]   s ,   (  
 	 	 	 	 	 	 	 s e l e c t   [ K e y ]   N o d e I D ,   [ R a n k ] * 0 . 0 0 1   W e i g h t  
 	 	 	 	 	 	 	 	 f r o m   C o n t a i n s t a b l e   ( [ R D F . ] . N o d e ,   v a l u e ,   @ P h r a s e S e a r c h S t r i n g )   n  
 	 	 	 	 	 	 )   m  
 	 	 	 	 	 	 w h e r e   s . M a t c h e d B y N o d e I D   =   m . N o d e I D  
 	 	 	 	 	 	 g r o u p   b y   s . N o d e I D  
 	 	 	 	 s e l e c t   @ l o o p   =   @ l o o p   +   1  
 	 	 	 e n d  
 	 	 	 - - c r e a t e   c l u s t e r e d   i n d e x   i d x _ n   o n   # P h r a s e N o d e M a t c h ( N o d e I D )  
 	 	 e n d  
  
 	 	 c r e a t e   t a b l e   # T e m p M a t c h N o d e s   (  
 	 	 	 N o d e I D   b i g i n t ,  
 	 	 	 M a t c h e d B y N o d e I D   b i g i n t ,  
 	 	 	 D i s t a n c e   i n t ,  
 	 	 	 P a t h s   i n t ,  
 	 	 	 W e i g h t   f l o a t ,  
 	 	 	 m W e i g h t   f l o a t  
 	 	 )  
 	 	 i n s e r t   i n t o   # T e m p M a t c h N o d e s   ( N o d e I D ,   M a t c h e d B y N o d e I D ,   D i s t a n c e ,   P a t h s ,   W e i g h t ,   m W e i g h t )  
 	 	 	 s e l e c t   s . * ,   m . W e i g h t   m W e i g h t  
 	 	 	 	 f r o m   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e M a p ]   s ,   (  
 	 	 	 	 	 s e l e c t   [ K e y ]   N o d e I D ,   [ R a n k ] * 0 . 0 0 1   W e i g h t  
 	 	 	 	 	 	 f r o m   C o n t a i n s t a b l e   ( [ R D F . ] . N o d e ,   v a l u e ,   @ C o m b i n e d S e a r c h S t r i n g )   n  
 	 	 	 	 )   m  
 	 	 	 	 w h e r e   s . M a t c h e d B y N o d e I D   =   m . N o d e I D  
  
 	 	 i n s e r t   i n t o   # F u l l N o d e M a t c h   ( N o d e I D ,   P a t h s ,   W e i g h t )  
 	 	 	 s e l e c t   I s N u l l ( a . N o d e I D , b . N o d e I D )   N o d e I D ,   I s N u l l ( a . P a t h s , b . P a t h s )   P a t h s ,  
 	 	 	 	 	 ( c a s e   w h e n   a . w e i g h t   i s   n u l l   o r   b . w e i g h t   i s   n u l l   t h e n   I s N u l l ( a . W e i g h t , b . W e i g h t )   e l s e   1 - ( 1 - a . W e i g h t ) * ( 1 - b . W e i g h t )   e n d )   W e i g h t  
 	 	 	 	 f r o m   (  
 	 	 	 	 	 s e l e c t   N o d e I D ,   e x p ( s u m ( l o g ( P a t h s ) ) )   P a t h s ,   e x p ( s u m ( l o g ( W e i g h t ) ) )   W e i g h t  
 	 	 	 	 	 	 f r o m   # P h r a s e N o d e M a t c h  
 	 	 	 	 	 	 g r o u p   b y   N o d e I D  
 	 	 	 	 	 	 h a v i n g   c o u n t ( * )   =   @ N u m b e r O f P h r a s e s  
 	 	 	 	 )   a   f u l l   o u t e r   j o i n   (  
 	 	 	 	 	 s e l e c t   N o d e I D ,   c o u n t ( * )   P a t h s ,   1 - e x p ( s u m ( l o g ( c a s e   w h e n   W e i g h t * m W e i g h t   >   0 . 9 9 9 9 9 9   t h e n   0 . 0 0 0 0 0 1   e l s e   1 - W e i g h t * m W e i g h t   e n d ) ) )   W e i g h t  
 	 	 	 	 	 	 f r o m   # T e m p M a t c h N o d e s  
 	 	 	 	 	 	 g r o u p   b y   N o d e I D  
 	 	 	 	 )   b   o n   a . N o d e I D   =   b . N o d e I D  
 	 	 - - s e l e c t   ' T e x t   M a t c h e s   F o u n d ' ,   d a t e d i f f ( m s , @ d , g e t d a t e ( ) )  
 	 e n d  
 	 e l s e   i f   ( @ N u m b e r O f I n c l u d e F i l t e r s   >   0 )  
 	 b e g i n  
 	 	 i n s e r t   i n t o   # F u l l N o d e M a t c h   ( N o d e I D ,   P a t h s ,   W e i g h t )  
 	 	 	 s e l e c t   t 1 . S u b j e c t ,   1 ,   1  
 	 	 	 	 f r o m   # S e a r c h F i l t e r s   f  
 	 	 	 	 	 i n n e r   j o i n   [ R D F . ] . T r i p l e   t 1  
 	 	 	 	 	 	 o n   f . P r e d i c a t e   i s   n o t   n u l l  
 	 	 	 	 	 	 	 a n d   t 1 . P r e d i c a t e   =   f . P r e d i c a t e    
 	 	 	 	 	 	 	 a n d   t 1 . V i e w S e c u r i t y G r o u p   =   - 1  
 	 	 	 	 	 l e f t   o u t e r   j o i n   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e P r e f i x ]   n 1  
 	 	 	 	 	 	 o n   n 1 . N o d e I D   =   t 1 . O b j e c t  
 	 	 	 	 	 l e f t   o u t e r   j o i n   [ R D F . ] . T r i p l e   t 2  
 	 	 	 	 	 	 o n   f . P r e d i c a t e 2   i s   n o t   n u l l  
 	 	 	 	 	 	 	 a n d   t 2 . S u b j e c t   =   n 1 . N o d e I D  
 	 	 	 	 	 	 	 a n d   t 2 . P r e d i c a t e   =   f . P r e d i c a t e 2  
 	 	 	 	 	 	 	 a n d   t 2 . V i e w S e c u r i t y G r o u p   =   - 1  
 	 	 	 	 	 l e f t   o u t e r   j o i n   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e P r e f i x ]   n 2  
 	 	 	 	 	 	 o n   n 2 . N o d e I D   =   t 2 . O b j e c t  
 	 	 	 	 w h e r e   f . I s E x c l u d e   =   0  
 	 	 	 	 	 a n d   ( c a s e   w h e n   f . P r e d i c a t e 2   i s   n o t   n u l l   t h e n   n 2 . P r e f i x   e l s e   n 1 . P r e f i x   e n d )  
 	 	 	 	 	 	 l i k e   f . V a l u e  
 	 	 	 	 g r o u p   b y   t 1 . S u b j e c t  
 	 	 	 	 h a v i n g   c o u n t ( d i s t i n c t   f . S e a r c h F i l t e r I D )   =   @ N u m b e r O f I n c l u d e F i l t e r s  
 	 	 d e l e t e   f r o m   # S e a r c h F i l t e r s   w h e r e   I s E x c l u d e   =   0  
 	 	 s e l e c t   @ N u m b e r O f I n c l u d e F i l t e r s   =   0  
 	 e n d  
 	 e l s e   i f   ( I s N u l l ( @ C l a s s G r o u p U R I , ' ' )   < >   ' '   o r   I s N u l l ( @ C l a s s U R I , ' ' )   < >   ' ' )  
 	 b e g i n  
 	 	 i n s e r t   i n t o   # F u l l N o d e M a t c h   ( N o d e I D ,   P a t h s ,   W e i g h t )  
 	 	 	 s e l e c t   n . N o d e I D ,   1 ,   1  
 	 	 	 	 f r o m   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e C l a s s ]   n ,   [ O n t o l o g y . ] . C l a s s G r o u p C l a s s   c  
 	 	 	 	 w h e r e   n . C l a s s   =   c . _ C l a s s N o d e  
 	 	 	 	 	 a n d   ( ( @ C l a s s G r o u p U R I   i s   n u l l )   o r   ( c . C l a s s G r o u p U R I   =   @ C l a s s G r o u p U R I ) )  
 	 	 	 	 	 a n d   ( ( @ C l a s s U R I   i s   n u l l )   o r   ( c . C l a s s U R I   =   @ C l a s s U R I ) )  
 	 	 s e l e c t   @ C l a s s G r o u p U R I   =   n u l l ,   @ C l a s s U R I   =   n u l l  
 	 e n d  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   R u n   t h e   a c t u a l   s e a r c h  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 c r e a t e   t a b l e   # N o d e   (  
 	 	 S o r t O r d e r   b i g i n t   i d e n t i t y ( 0 , 1 )   p r i m a r y   k e y ,  
 	 	 N o d e I D   b i g i n t ,  
 	 	 P a t h s   b i g i n t ,  
 	 	 W e i g h t   f l o a t  
 	 )  
  
 	 i n s e r t   i n t o   # N o d e   ( N o d e I D ,   P a t h s ,   W e i g h t )  
 	 	 s e l e c t   s . N o d e I D ,   s . P a t h s ,   s . W e i g h t  
 	 	 	 f r o m   # F u l l N o d e M a t c h   s  
 	 	 	 	 i n n e r   j o i n   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e S u m m a r y ]   n   o n  
 	 	 	 	 	 s . N o d e I D   =   n . N o d e I D  
 	 	 	 	 	 a n d   (   I s N u l l ( @ C l a s s G r o u p U R I , @ C l a s s U R I )   i s   n u l l   o r   s . N o d e I D   i n   (  
 	 	 	 	 	 	 	 s e l e c t   N o d e I D  
 	 	 	 	 	 	 	 	 f r o m   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e C l a s s ]   x ,   [ O n t o l o g y . ] . C l a s s G r o u p C l a s s   c  
 	 	 	 	 	 	 	 	 w h e r e   x . C l a s s   =   c . _ C l a s s N o d e  
 	 	 	 	 	 	 	 	 	 a n d   c . C l a s s G r o u p U R I   =   I s N u l l ( @ C l a s s G r o u p U R I , c . C l a s s G r o u p U R I )  
 	 	 	 	 	 	 	 	 	 a n d   c . C l a s s U R I   =   I s N u l l ( @ C l a s s U R I , c . C l a s s U R I )  
 	 	 	 	 	 	 )   )  
 	 	 	 	 	 a n d   (   @ N u m b e r O f I n c l u d e F i l t e r s   =  
 	 	 	 	 	 	 	 ( s e l e c t   c o u n t ( d i s t i n c t   f . S e a r c h F i l t e r I D )  
 	 	 	 	 	 	 	 	 f r o m   # S e a r c h F i l t e r s   f  
 	 	 	 	 	 	 	 	 	 i n n e r   j o i n   [ R D F . ] . T r i p l e   t 1  
 	 	 	 	 	 	 	 	 	 	 o n   f . P r e d i c a t e   i s   n o t   n u l l  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 1 . S u b j e c t   =   s . N o d e I D  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 1 . P r e d i c a t e   =   f . P r e d i c a t e    
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 1 . V i e w S e c u r i t y G r o u p   =   - 1  
 	 	 	 	 	 	 	 	 	 l e f t   o u t e r   j o i n   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e P r e f i x ]   n 1  
 	 	 	 	 	 	 	 	 	 	 o n   n 1 . N o d e I D   =   t 1 . O b j e c t  
 	 	 	 	 	 	 	 	 	 l e f t   o u t e r   j o i n   [ R D F . ] . T r i p l e   t 2  
 	 	 	 	 	 	 	 	 	 	 o n   f . P r e d i c a t e 2   i s   n o t   n u l l  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 2 . S u b j e c t   =   n 1 . N o d e I D  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 2 . P r e d i c a t e   =   f . P r e d i c a t e 2  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 2 . V i e w S e c u r i t y G r o u p   =   - 1  
 	 	 	 	 	 	 	 	 	 l e f t   o u t e r   j o i n   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e P r e f i x ]   n 2  
 	 	 	 	 	 	 	 	 	 	 o n   n 2 . N o d e I D   =   t 2 . O b j e c t  
 	 	 	 	 	 	 	 	 w h e r e   f . I s E x c l u d e   =   0  
 	 	 	 	 	 	 	 	 	 a n d   ( c a s e   w h e n   f . P r e d i c a t e 2   i s   n o t   n u l l   t h e n   n 2 . P r e f i x   e l s e   n 1 . P r e f i x   e n d )  
 	 	 	 	 	 	 	 	 	 	 l i k e   f . V a l u e  
 	 	 	 	 	 	 	 )  
 	 	 	 	 	 	 )  
 	 	 	 	 	 a n d   n o t   e x i s t s   (  
 	 	 	 	 	 	 	 s e l e c t   *  
 	 	 	 	 	 	 	 	 f r o m   # S e a r c h F i l t e r s   f  
 	 	 	 	 	 	 	 	 	 i n n e r   j o i n   [ R D F . ] . T r i p l e   t 1  
 	 	 	 	 	 	 	 	 	 	 o n   f . P r e d i c a t e   i s   n o t   n u l l  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 1 . S u b j e c t   =   s . N o d e I D  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 1 . P r e d i c a t e   =   f . P r e d i c a t e    
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 1 . V i e w S e c u r i t y G r o u p   =   - 1  
 	 	 	 	 	 	 	 	 	 l e f t   o u t e r   j o i n   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e P r e f i x ]   n 1  
 	 	 	 	 	 	 	 	 	 	 o n   n 1 . N o d e I D   =   t 1 . O b j e c t  
 	 	 	 	 	 	 	 	 	 l e f t   o u t e r   j o i n   [ R D F . ] . T r i p l e   t 2  
 	 	 	 	 	 	 	 	 	 	 o n   f . P r e d i c a t e 2   i s   n o t   n u l l  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 2 . S u b j e c t   =   n 1 . N o d e I D  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 2 . P r e d i c a t e   =   f . P r e d i c a t e 2  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 2 . V i e w S e c u r i t y G r o u p   =   - 1  
 	 	 	 	 	 	 	 	 	 l e f t   o u t e r   j o i n   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e P r e f i x ]   n 2  
 	 	 	 	 	 	 	 	 	 	 o n   n 2 . N o d e I D   =   t 2 . O b j e c t  
 	 	 	 	 	 	 	 	 w h e r e   f . I s E x c l u d e   =   1  
 	 	 	 	 	 	 	 	 	 a n d   ( c a s e   w h e n   f . P r e d i c a t e 2   i s   n o t   n u l l   t h e n   n 2 . P r e f i x   e l s e   n 1 . P r e f i x   e n d )  
 	 	 	 	 	 	 	 	 	 	 l i k e   f . V a l u e  
 	 	 	 	 	 	 )  
 	 	 	 	 o u t e r   a p p l y   (  
 	 	 	 	 	 s e l e c t 	 m a x ( c a s e   w h e n   S o r t B y I D = 1   t h e n   A s c S o r t B y   e l s e   n u l l   e n d )   A s c S o r t B y 1 ,  
 	 	 	 	 	 	 	 m a x ( c a s e   w h e n   S o r t B y I D = 2   t h e n   A s c S o r t B y   e l s e   n u l l   e n d )   A s c S o r t B y 2 ,  
 	 	 	 	 	 	 	 m a x ( c a s e   w h e n   S o r t B y I D = 3   t h e n   A s c S o r t B y   e l s e   n u l l   e n d )   A s c S o r t B y 3 ,  
 	 	 	 	 	 	 	 m a x ( c a s e   w h e n   S o r t B y I D = 1   t h e n   D e s c S o r t B y   e l s e   n u l l   e n d )   D e s c S o r t B y 1 ,  
 	 	 	 	 	 	 	 m a x ( c a s e   w h e n   S o r t B y I D = 2   t h e n   D e s c S o r t B y   e l s e   n u l l   e n d )   D e s c S o r t B y 2 ,  
 	 	 	 	 	 	 	 m a x ( c a s e   w h e n   S o r t B y I D = 3   t h e n   D e s c S o r t B y   e l s e   n u l l   e n d )   D e s c S o r t B y 3  
 	 	 	 	 	 	 f r o m   (  
 	 	 	 	 	 	 	 s e l e c t 	 S o r t B y I D ,  
 	 	 	 	 	 	 	 	 	 ( c a s e   w h e n   f . I s D e s c   =   1   t h e n   n u l l  
 	 	 	 	 	 	 	 	 	 	 	 w h e n   f . P r e d i c a t e 3   i s   n o t   n u l l   t h e n   n 3 . V a l u e  
 	 	 	 	 	 	 	 	 	 	 	 w h e n   f . P r e d i c a t e 2   i s   n o t   n u l l   t h e n   n 2 . V a l u e  
 	 	 	 	 	 	 	 	 	 	 	 e l s e   n 1 . V a l u e   e n d )   A s c S o r t B y ,  
 	 	 	 	 	 	 	 	 	 ( c a s e   w h e n   f . I s D e s c   =   0   t h e n   n u l l  
 	 	 	 	 	 	 	 	 	 	 	 w h e n   f . P r e d i c a t e 3   i s   n o t   n u l l   t h e n   n 3 . V a l u e  
 	 	 	 	 	 	 	 	 	 	 	 w h e n   f . P r e d i c a t e 2   i s   n o t   n u l l   t h e n   n 2 . V a l u e  
 	 	 	 	 	 	 	 	 	 	 	 e l s e   n 1 . V a l u e   e n d )   D e s c S o r t B y  
 	 	 	 	 	 	 	 	 f r o m   # S o r t B y   f  
 	 	 	 	 	 	 	 	 	 i n n e r   j o i n   [ R D F . ] . T r i p l e   t 1  
 	 	 	 	 	 	 	 	 	 	 o n   f . P r e d i c a t e   i s   n o t   n u l l  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 1 . S u b j e c t   =   s . N o d e I D  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 1 . P r e d i c a t e   =   f . P r e d i c a t e    
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 1 . V i e w S e c u r i t y G r o u p   =   - 1  
 	 	 	 	 	 	 	 	 	 l e f t   o u t e r   j o i n   [ R D F . ] . N o d e   n 1  
 	 	 	 	 	 	 	 	 	 	 o n   n 1 . N o d e I D   =   t 1 . O b j e c t  
 	 	 	 	 	 	 	 	 	 	 	 a n d   n 1 . V i e w S e c u r i t y G r o u p   =   - 1  
 	 	 	 	 	 	 	 	 	 l e f t   o u t e r   j o i n   [ R D F . ] . T r i p l e   t 2  
 	 	 	 	 	 	 	 	 	 	 o n   f . P r e d i c a t e 2   i s   n o t   n u l l  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 2 . S u b j e c t   =   n 1 . N o d e I D  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 2 . P r e d i c a t e   =   f . P r e d i c a t e 2  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 2 . V i e w S e c u r i t y G r o u p   =   - 1  
 	 	 	 	 	 	 	 	 	 l e f t   o u t e r   j o i n   [ R D F . ] . N o d e   n 2  
 	 	 	 	 	 	 	 	 	 	 o n   n 2 . N o d e I D   =   t 2 . O b j e c t  
 	 	 	 	 	 	 	 	 	 	 	 a n d   n 2 . V i e w S e c u r i t y G r o u p   =   - 1  
 	 	 	 	 	 	 	 	 	 l e f t   o u t e r   j o i n   [ R D F . ] . T r i p l e   t 3  
 	 	 	 	 	 	 	 	 	 	 o n   f . P r e d i c a t e 3   i s   n o t   n u l l  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 3 . S u b j e c t   =   n 2 . N o d e I D  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 3 . P r e d i c a t e   =   f . P r e d i c a t e 3  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 3 . V i e w S e c u r i t y G r o u p   =   - 1  
 	 	 	 	 	 	 	 	 	 l e f t   o u t e r   j o i n   [ R D F . ] . N o d e   n 3  
 	 	 	 	 	 	 	 	 	 	 o n   n 3 . N o d e I D   =   t 3 . O b j e c t  
 	 	 	 	 	 	 	 	 	 	 	 a n d   n 3 . V i e w S e c u r i t y G r o u p   =   - 1  
 	 	 	 	 	 	 	 )   t  
 	 	 	 	 	 )   o  
 	 	 	 o r d e r   b y 	 ( c a s e   w h e n   o . A s c S o r t B y 1   i s   n u l l   t h e n   1   e l s e   0   e n d ) ,  
 	 	 	 	 	 	 o . A s c S o r t B y 1 ,  
 	 	 	 	 	 	 ( c a s e   w h e n   o . D e s c S o r t B y 1   i s   n u l l   t h e n   1   e l s e   0   e n d ) ,  
 	 	 	 	 	 	 o . D e s c S o r t B y 1   d e s c ,  
 	 	 	 	 	 	 ( c a s e   w h e n   o . A s c S o r t B y 2   i s   n u l l   t h e n   1   e l s e   0   e n d ) ,  
 	 	 	 	 	 	 o . A s c S o r t B y 2 ,  
 	 	 	 	 	 	 ( c a s e   w h e n   o . D e s c S o r t B y 2   i s   n u l l   t h e n   1   e l s e   0   e n d ) ,  
 	 	 	 	 	 	 o . D e s c S o r t B y 2   d e s c ,  
 	 	 	 	 	 	 ( c a s e   w h e n   o . A s c S o r t B y 3   i s   n u l l   t h e n   1   e l s e   0   e n d ) ,  
 	 	 	 	 	 	 o . A s c S o r t B y 3 ,  
 	 	 	 	 	 	 ( c a s e   w h e n   o . D e s c S o r t B y 3   i s   n u l l   t h e n   1   e l s e   0   e n d ) ,  
 	 	 	 	 	 	 o . D e s c S o r t B y 3   d e s c ,  
 	 	 	 	 	 	 s . W e i g h t   d e s c ,  
 	 	 	 	 	 	 n . S h o r t L a b e l ,  
 	 	 	 	 	 	 n . N o d e I D  
  
  
 	 - - s e l e c t   ' S e a r c h   N o d e s   F o u n d ' ,   d a t e d i f f ( m s , @ d , G e t D a t e ( ) )  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   G e t   n e t w o r k   c o u n t s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 d e c l a r e   @ N u m b e r O f C o n n e c t i o n s   a s   b i g i n t  
 	 d e c l a r e   @ M a x W e i g h t   a s   f l o a t  
 	 d e c l a r e   @ M i n W e i g h t   a s   f l o a t  
  
 	 s e l e c t   @ N u m b e r O f C o n n e c t i o n s   =   c o u n t ( * ) ,   @ M a x W e i g h t   =   m a x ( W e i g h t ) ,   @ M i n W e i g h t   =   m i n ( W e i g h t )    
 	 	 f r o m   # N o d e  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   G e t   m a t c h i n g   c l a s s   g r o u p s   a n d   c l a s s e s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 d e c l a r e   @ M a t c h e s C l a s s G r o u p s   n v a r c h a r ( m a x )  
  
 	 s e l e c t   c . C l a s s G r o u p U R I ,   c . C l a s s U R I ,   n . N o d e I D  
 	 	 i n t o   # N o d e C l a s s  
 	 	 f r o m   # N o d e   n ,   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e C l a s s ]   s ,   [ O n t o l o g y . ] . C l a s s G r o u p C l a s s   c  
 	 	 w h e r e   n . N o d e I D   =   s . N o d e I D   a n d   s . C l a s s   =   c . _ C l a s s N o d e  
  
 	 ; w i t h   a   a s   (  
 	 	 s e l e c t   C l a s s G r o u p U R I ,   c o u n t ( d i s t i n c t   N o d e I D )   N u m b e r O f N o d e s  
 	 	 	 f r o m   # N o d e C l a s s   s  
 	 	 	 g r o u p   b y   C l a s s G r o u p U R I  
 	 ) ,   b   a s   (  
 	 	 s e l e c t   C l a s s G r o u p U R I ,   C l a s s U R I ,   c o u n t ( d i s t i n c t   N o d e I D )   N u m b e r O f N o d e s  
 	 	 	 f r o m   # N o d e C l a s s   s  
 	 	 	 g r o u p   b y   C l a s s G r o u p U R I ,   C l a s s U R I  
 	 )  
 	 s e l e c t   @ M a t c h e s C l a s s G r o u p s   =   r e p l a c e ( c a s t ( (  
 	 	 	 s e l e c t 	 g . C l a s s G r o u p U R I   " @ r d f _ . . _ r e s o u r c e " ,    
 	 	 	 	 g . _ C l a s s G r o u p L a b e l   " r d f s _ . . _ l a b e l " ,  
 	 	 	 	 ' h t t p : / / w w w . w 3 . o r g / 2 0 0 1 / X M L S c h e m a # i n t '   " p r n s _ . . _ n u m b e r O f C o n n e c t i o n s / @ r d f _ . . _ d a t a t y p e " ,  
 	 	 	 	 a . N u m b e r O f N o d e s   " p r n s _ . . _ n u m b e r O f C o n n e c t i o n s " ,  
 	 	 	 	 g . S o r t O r d e r   " p r n s _ . . _ s o r t O r d e r " ,  
 	 	 	 	 (  
 	 	 	 	 	 s e l e c t 	 c . C l a s s U R I   " @ r d f _ . . _ r e s o u r c e " ,  
 	 	 	 	 	 	 	 c . _ C l a s s L a b e l   " r d f s _ . . _ l a b e l " ,  
 	 	 	 	 	 	 	 ' h t t p : / / w w w . w 3 . o r g / 2 0 0 1 / X M L S c h e m a # i n t '   " p r n s _ . . _ n u m b e r O f C o n n e c t i o n s / @ r d f _ . . _ d a t a t y p e " ,  
 	 	 	 	 	 	 	 b . N u m b e r O f N o d e s   " p r n s _ . . _ n u m b e r O f C o n n e c t i o n s " ,  
 	 	 	 	 	 	 	 c . S o r t O r d e r   " p r n s _ . . _ s o r t O r d e r "  
 	 	 	 	 	 	 f r o m   b ,   [ O n t o l o g y . ] . C l a s s G r o u p C l a s s   c  
 	 	 	 	 	 	 w h e r e   b . C l a s s G r o u p U R I   =   c . C l a s s G r o u p U R I   a n d   b . C l a s s U R I   =   c . C l a s s U R I  
 	 	 	 	 	 	 	 a n d   c . C l a s s G r o u p U R I   =   g . C l a s s G r o u p U R I  
 	 	 	 	 	 	 o r d e r   b y   c . S o r t O r d e r  
 	 	 	 	 	 	 f o r   x m l   p a t h ( ' p r n s _ . . _ m a t c h e s C l a s s ' ) ,   t y p e  
 	 	 	 	 )  
 	 	 	 f r o m   a ,   [ O n t o l o g y . ] . C l a s s G r o u p   g  
 	 	 	 w h e r e   a . C l a s s G r o u p U R I   =   g . C l a s s G r o u p U R I  
 	 	 	 o r d e r   b y   g . S o r t O r d e r  
 	 	 	 f o r   x m l   p a t h ( ' p r n s _ . . _ m a t c h e s C l a s s G r o u p ' ) ,   t y p e  
 	 	 )   a s   n v a r c h a r ( m a x ) ) , ' _ . . _ ' , ' : ' )  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   G e t   R D F   o f   s e a r c h   r e s u l t s   o b j e c t s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 d e c l a r e   @ O b j e c t N o d e s R D F   n v a r c h a r ( m a x )  
  
 	 i f   @ N u m b e r O f C o n n e c t i o n s   >   0  
 	 b e g i n  
 	 	 / *  
 	 	 	 - -   A l t e r n a t i v e   m e t h o d s   t h a t   u s e s   G e t D a t a R D F   t o   g e t   t h e   R D F  
 	 	 	 d e c l a r e   @ N o d e L i s t X M L   x m l  
 	 	 	 s e l e c t   @ N o d e L i s t X M L   =   (  
 	 	 	 	 	 s e l e c t   (  
 	 	 	 	 	 	 	 s e l e c t   N o d e I D   " @ I D "  
 	 	 	 	 	 	 	 f r o m   # N o d e  
 	 	 	 	 	 	 	 w h e r e   S o r t O r d e r   > =   I s N u l l ( @ o f f s e t , 0 )   a n d   S o r t O r d e r   <   I s N u l l ( I s N u l l ( @ o f f s e t , 0 ) + @ l i m i t , S o r t O r d e r + 1 )  
 	 	 	 	 	 	 	 o r d e r   b y   S o r t O r d e r  
 	 	 	 	 	 	 	 f o r   x m l   p a t h ( ' N o d e ' ) ,   t y p e  
 	 	 	 	 	 	 	 )  
 	 	 	 	 	 f o r   x m l   p a t h ( ' N o d e L i s t ' ) ,   t y p e  
 	 	 	 	 )  
 	 	 	 e x e c   [ R D F . ] . G e t D a t a R D F   @ N o d e L i s t X M L   =   @ N o d e L i s t X M L ,   @ e x p a n d   =   1 ,   @ s h o w D e t a i l s   =   0 ,   @ r e t u r n X M L   =   0 ,   @ d a t a S t r   =   @ O b j e c t N o d e s R D F   O U T P U T  
 	 	 * /  
 	 	 c r e a t e   t a b l e   # O u t p u t N o d e s   (  
 	 	 	 N o d e I D   b i g i n t   p r i m a r y   k e y ,  
 	 	 	 k   i n t  
 	 	 )  
 	 	 i n s e r t   i n t o   # O u t p u t N o d e s   ( N o d e I D , k )  
 	 	 	 s e l e c t   N o d e I D , 0  
 	 	 	 f r o m   # N o d e  
 	 	 	 w h e r e   S o r t O r d e r   > =   I s N u l l ( @ o f f s e t , 0 )   a n d   S o r t O r d e r   <   I s N u l l ( I s N u l l ( @ o f f s e t , 0 ) + @ l i m i t , S o r t O r d e r + 1 )  
 	 	 d e c l a r e   @ k   i n t  
 	 	 s e l e c t   @ k   =   0  
 	 	 w h i l e   @ k   <   1 0  
 	 	 b e g i n  
 	 	 	 i n s e r t   i n t o   # O u t p u t N o d e s   ( N o d e I D , k )  
 	 	 	 	 s e l e c t   d i s t i n c t   e . E x p a n d N o d e I D ,   @ k + 1  
 	 	 	 	 f r o m   # O u t p u t N o d e s   o ,   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e E x p a n d ]   e  
 	 	 	 	 w h e r e   o . k   =   @ k   a n d   o . N o d e I D   =   e . N o d e I D  
 	 	 	 	 	 a n d   e . E x p a n d N o d e I D   n o t   i n   ( s e l e c t   N o d e I D   f r o m   # O u t p u t N o d e s )  
 	 	 	 i f   @ @ R O W C O U N T   =   0  
 	 	 	 	 s e l e c t   @ k   =   1 0  
 	 	 	 e l s e  
 	 	 	 	 s e l e c t   @ k   =   @ k   +   1  
 	 	 e n d  
 	 	 s e l e c t   @ O b j e c t N o d e s R D F   =   r e p l a c e ( r e p l a c e ( c a s t ( (  
 	 	 	 	 s e l e c t   r . R D F   +   ' '  
 	 	 	 	 f r o m   # O u t p u t N o d e s   n ,   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e R D F ]   r  
 	 	 	 	 w h e r e   n . N o d e I D   =   r . N o d e I D  
 	 	 	 	 o r d e r   b y   n . N o d e I D  
 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 )   a s   n v a r c h a r ( m a x ) ) , ' _ T A G L T _ ' , ' < ' ) , ' _ T A G G T _ ' , ' > ' )  
 	 e n d  
  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   F o r m   s e a r c h   r e s u l t s   R D F  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 d e c l a r e   @ r e s u l t s   n v a r c h a r ( m a x )  
  
 	 s e l e c t   @ r e s u l t s   =   ' '  
 	 	 	 + ' < r d f : D e s c r i p t i o n   r d f : n o d e I D = " S e a r c h R e s u l t s " > '  
 	 	 	 + ' < r d f : t y p e   r d f : r e s o u r c e = " h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # N e t w o r k "   / > '  
 	 	 	 + ' < r d f s : l a b e l > S e a r c h   R e s u l t s < / r d f s : l a b e l > '  
 	 	 	 + ' < p r n s : n u m b e r O f C o n n e c t i o n s   r d f : d a t a t y p e = " h t t p : / / w w w . w 3 . o r g / 2 0 0 1 / X M L S c h e m a # i n t " > ' + c a s t ( I s N u l l ( @ N u m b e r O f C o n n e c t i o n s , 0 )   a s   n v a r c h a r ( 5 0 ) ) + ' < / p r n s : n u m b e r O f C o n n e c t i o n s > '  
 	 	 	 + ' < p r n s : o f f s e t   r d f : d a t a t y p e = " h t t p : / / w w w . w 3 . o r g / 2 0 0 1 / X M L S c h e m a # i n t " '   +   I s N u l l ( ' > ' + c a s t ( @ o f f s e t   a s   n v a r c h a r ( 5 0 ) ) + ' < / p r n s : o f f s e t > ' , '   / > ' )  
 	 	 	 + ' < p r n s : l i m i t   r d f : d a t a t y p e = " h t t p : / / w w w . w 3 . o r g / 2 0 0 1 / X M L S c h e m a # i n t " '   +   I s N u l l ( ' > ' + c a s t ( @ l i m i t   a s   n v a r c h a r ( 5 0 ) ) + ' < / p r n s : l i m i t > ' , '   / > ' )  
 	 	 	 + ' < p r n s : m a x W e i g h t   r d f : d a t a t y p e = " h t t p : / / w w w . w 3 . o r g / 2 0 0 1 / X M L S c h e m a # f l o a t " '   +   I s N u l l ( ' > ' + c a s t ( @ M a x W e i g h t   a s   n v a r c h a r ( 5 0 ) ) + ' < / p r n s : m a x W e i g h t > ' , '   / > ' )  
 	 	 	 + ' < p r n s : m i n W e i g h t   r d f : d a t a t y p e = " h t t p : / / w w w . w 3 . o r g / 2 0 0 1 / X M L S c h e m a # f l o a t " '   +   I s N u l l ( ' > ' + c a s t ( @ M i n W e i g h t   a s   n v a r c h a r ( 5 0 ) ) + ' < / p r n s : m i n W e i g h t > ' , '   / > ' )  
 	 	 	 + ' < v i v o : o v e r v i e w   r d f : p a r s e T y p e = " L i t e r a l " > '  
 	 	 	 + I s N u l l ( c a s t ( @ S e a r c h O p t i o n s   a s   n v a r c h a r ( m a x ) ) , ' ' )  
 	 	 	 + ' < S e a r c h D e t a i l s > ' + I s N u l l ( c a s t ( @ S e a r c h P h r a s e X M L   a s   n v a r c h a r ( m a x ) ) , ' ' ) + ' < / S e a r c h D e t a i l s > '  
 	 	 	 + I s N u l l ( ' < p r n s : m a t c h e s C l a s s G r o u p s L i s t > ' + @ M a t c h e s C l a s s G r o u p s + ' < / p r n s : m a t c h e s C l a s s G r o u p s L i s t > ' , ' ' )  
 	 	 	 + ' < / v i v o : o v e r v i e w > '  
 	 	 	 + I s N u l l ( ( s e l e c t   r e p l a c e ( r e p l a c e ( c a s t ( (  
 	 	 	 	 	 s e l e c t   ' _ T A G L T _ p r n s : h a s C o n n e c t i o n   r d f : n o d e I D = " C ' + c a s t ( S o r t O r d e r   a s   n v a r c h a r ( 5 0 ) ) + ' "   / _ T A G G T _ '  
 	 	 	 	 	 f r o m   # N o d e  
 	 	 	 	 	 w h e r e   S o r t O r d e r   > =   I s N u l l ( @ o f f s e t , 0 )   a n d   S o r t O r d e r   <   I s N u l l ( I s N u l l ( @ o f f s e t , 0 ) + @ l i m i t , S o r t O r d e r + 1 )  
 	 	 	 	 	 o r d e r   b y   S o r t O r d e r  
 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 )   a s   n v a r c h a r ( m a x ) ) , ' _ T A G L T _ ' , ' < ' ) , ' _ T A G G T _ ' , ' > ' ) ) , ' ' )  
 	 	 	 + ' < / r d f : D e s c r i p t i o n > '  
 	 	 	 + I s N u l l ( ( s e l e c t   r e p l a c e ( r e p l a c e ( c a s t ( (  
 	 	 	 	 	 s e l e c t   ' '  
 	 	 	 	 	 	 + ' _ T A G L T _ r d f : D e s c r i p t i o n   r d f : n o d e I D = " C ' + c a s t ( x . S o r t O r d e r   a s   n v a r c h a r ( 5 0 ) ) + ' " _ T A G G T _ '  
 	 	 	 	 	 	 + ' _ T A G L T _ p r n s : c o n n e c t i o n W e i g h t _ T A G G T _ ' + c a s t ( x . W e i g h t   a s   n v a r c h a r ( 5 0 ) ) + ' _ T A G L T _ / p r n s : c o n n e c t i o n W e i g h t _ T A G G T _ '  
 	 	 	 	 	 	 + ' _ T A G L T _ p r n s : s o r t O r d e r _ T A G G T _ ' + c a s t ( x . S o r t O r d e r   a s   n v a r c h a r ( 5 0 ) ) + ' _ T A G L T _ / p r n s : s o r t O r d e r _ T A G G T _ '  
 	 	 	 	 	 	 + ' _ T A G L T _ r d f : o b j e c t   r d f : r e s o u r c e = " ' + r e p l a c e ( n . V a l u e , ' " ' , ' ' ) + ' " / _ T A G G T _ '  
 	 	 	 	 	 	 + ' _ T A G L T _ r d f : t y p e   r d f : r e s o u r c e = " h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # C o n n e c t i o n "   / _ T A G G T _ '  
 	 	 	 	 	 	 + ' _ T A G L T _ r d f s : l a b e l _ T A G G T _ ' + ( c a s e   w h e n   s . S h o r t L a b e l < > ' '   t h e n   l t r i m ( r t r i m ( s . S h o r t L a b e l ) )   e l s e   ' U n t i t l e d '   e n d ) + ' _ T A G L T _ / r d f s : l a b e l _ T A G G T _ '  
 	 	 	 	 	 	 + I s N u l l ( + ' _ T A G L T _ v i v o : o v e r v i e w _ T A G G T _ ' + s . C l a s s N a m e + ' _ T A G L T _ / v i v o : o v e r v i e w _ T A G G T _ ' , ' ' )  
 	 	 	 	 	 	 + ' _ T A G L T _ / r d f : D e s c r i p t i o n _ T A G G T _ '  
 	 	 	 	 	 f r o m   # N o d e   x ,   [ R D F . ] . N o d e   n ,   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e S u m m a r y ]   s  
 	 	 	 	 	 w h e r e   x . S o r t O r d e r   > =   I s N u l l ( @ o f f s e t , 0 )   a n d   x . S o r t O r d e r   <   I s N u l l ( I s N u l l ( @ o f f s e t , 0 ) + @ l i m i t , x . S o r t O r d e r + 1 )  
 	 	 	 	 	 	 a n d   x . N o d e I D   =   n . N o d e I D  
 	 	 	 	 	 	 a n d   x . N o d e I D   =   s . N o d e I D  
 	 	 	 	 	 o r d e r   b y   x . S o r t O r d e r  
 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 )   a s   n v a r c h a r ( m a x ) ) , ' _ T A G L T _ ' , ' < ' ) , ' _ T A G G T _ ' , ' > ' ) ) , ' ' )  
 	 	 	 + I s N u l l ( @ O b j e c t N o d e s R D F , ' ' )  
  
 	 d e c l a r e   @ x   a s   v a r c h a r ( m a x )  
 	 s e l e c t   @ x   =   ' < r d f : R D F '  
 	 s e l e c t   @ x   =   @ x   +   '   x m l n s : ' + P r e f i x + ' = " ' + U R I + ' " '    
 	 	 f r o m   [ O n t o l o g y . ] . N a m e s p a c e  
 	 s e l e c t   @ x   =   @ x   +   '   > '   +   @ r e s u l t s   +   ' < / r d f : R D F > '  
 	 s e l e c t   c a s t ( @ x   a s   x m l )   R D F  
  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   L o g   r e s u l t s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 u p d a t e   [ S e a r c h . ] . [ H i s t o r y . Q u e r y ]  
 	 	 s e t   E n d D a t e   =   G e t D a t e ( ) ,  
 	 	 	 D u r a t i o n M S   =   d a t e d i f f ( m s , S t a r t D a t e , G e t D a t e ( ) ) ,  
 	 	 	 N u m b e r O f C o n n e c t i o n s   =   I s N u l l ( @ N u m b e r O f C o n n e c t i o n s , 0 )  
 	 	 w h e r e   S e a r c h H i s t o r y Q u e r y I D   =   @ S e a r c h H i s t o r y Q u e r y I D  
 	  
 	 i n s e r t   i n t o   [ S e a r c h . ] . [ H i s t o r y . P h r a s e ]   ( S e a r c h H i s t o r y Q u e r y I D ,   P h r a s e I D ,   T h e s a u r u s M a t c h ,   P h r a s e ,   E n d D a t e ,   I s B o t ,   N u m b e r O f C o n n e c t i o n s )  
 	 	 s e l e c t 	 @ S e a r c h H i s t o r y Q u e r y I D ,  
 	 	 	 	 P h r a s e I D ,  
 	 	 	 	 T h e s a u r u s M a t c h ,  
 	 	 	 	 P h r a s e ,  
 	 	 	 	 G e t D a t e ( ) ,  
 	 	 	 	 @ I s B o t ,  
 	 	 	 	 I s N u l l ( @ N u m b e r O f C o n n e c t i o n s , 0 )  
 	 	 	 f r o m   @ P h r a s e L i s t  
  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ S e a r c h . C a c h e ] . [ P r i v a t e . G e t N o d e s ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ S e a r c h . C a c h e ] . [ P r i v a t e . G e t N o d e s ]  
 @ S e a r c h O p t i o n s   X M L ,   @ S e s s i o n I D   U N I Q U E I D E N T I F I E R = N U L L  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 	 S E T   N O C O U N T   O N ;  
  
 	 / *  
 	  
 	 E X E C   [ S e a r c h . ] . [ P r i v a t e . G e t N o d e s ]   @ S e a r c h O p t i o n s   =   '  
 	 < S e a r c h O p t i o n s >  
 	 	 < M a t c h O p t i o n s >  
 	 	 	 < S e a r c h S t r i n g   E x a c t M a t c h = " f a l s e " > o p t i o n s   f o r   " l u n g   c a n c e r "   t r e a t m e n t < / S e a r c h S t r i n g >  
 	 	 	 < C l a s s U R I > h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / P e r s o n < / C l a s s U R I >  
 	 	 	 < S e a r c h F i l t e r s L i s t >  
 	 	 	 	 < S e a r c h F i l t e r   P r o p e r t y = " h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / l a s t N a m e "   M a t c h T y p e = " L e f t " > S m i t < / S e a r c h F i l t e r >  
 	 	 	 < / S e a r c h F i l t e r s L i s t >  
 	 	 < / M a t c h O p t i o n s >  
 	 	 < O u t p u t O p t i o n s >  
 	 	 	 < O f f s e t > 0 < / O f f s e t >  
 	 	 	 < L i m i t > 5 < / L i m i t >  
 	 	 	 < S o r t B y L i s t >  
 	 	 	 	 < S o r t B y   I s D e s c = " 1 "   P r o p e r t y = " h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / f i r s t N a m e "   / >  
 	 	 	 	 < S o r t B y   I s D e s c = " 0 "   P r o p e r t y = " h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / l a s t N a m e "   / >  
 	 	 	 < / S o r t B y L i s t >  
 	 	 < / O u t p u t O p t i o n s > 	  
 	 < / S e a r c h O p t i o n s >  
 	 '  
 	 	  
 	 * /  
  
 	 d e c l a r e   @ M a t c h O p t i o n s   x m l  
 	 d e c l a r e   @ O u t p u t O p t i o n s   x m l  
 	 d e c l a r e   @ S e a r c h S t r i n g   v a r c h a r ( 5 0 0 )  
 	 d e c l a r e   @ C l a s s G r o u p U R I   v a r c h a r ( 4 0 0 )  
 	 d e c l a r e   @ C l a s s U R I   v a r c h a r ( 4 0 0 )  
 	 d e c l a r e   @ S e a r c h F i l t e r s X M L   x m l  
 	 d e c l a r e   @ o f f s e t   b i g i n t  
 	 d e c l a r e   @ l i m i t   b i g i n t  
 	 d e c l a r e   @ S o r t B y X M L   x m l  
 	 d e c l a r e   @ D o E x p a n d e d S e a r c h   b i t  
 	  
 	 s e l e c t 	 @ M a t c h O p t i o n s   =   @ S e a r c h O p t i o n s . q u e r y ( ' S e a r c h O p t i o n s [ 1 ] / M a t c h O p t i o n s [ 1 ] ' ) ,  
 	 	 	 @ O u t p u t O p t i o n s   =   @ S e a r c h O p t i o n s . q u e r y ( ' S e a r c h O p t i o n s [ 1 ] / O u t p u t O p t i o n s [ 1 ] ' )  
 	  
 	 s e l e c t 	 @ S e a r c h S t r i n g   =   @ M a t c h O p t i o n s . v a l u e ( ' M a t c h O p t i o n s [ 1 ] / S e a r c h S t r i n g [ 1 ] ' , ' v a r c h a r ( 5 0 0 ) ' ) ,  
 	 	 	 @ D o E x p a n d e d S e a r c h   =   ( c a s e   w h e n   @ M a t c h O p t i o n s . v a l u e ( ' M a t c h O p t i o n s [ 1 ] / S e a r c h S t r i n g [ 1 ] / @ E x a c t M a t c h ' , ' v a r c h a r ( 5 0 ) ' )   =   ' t r u e '   t h e n   0   e l s e   1   e n d ) ,  
 	 	 	 @ C l a s s G r o u p U R I   =   @ M a t c h O p t i o n s . v a l u e ( ' M a t c h O p t i o n s [ 1 ] / C l a s s G r o u p U R I [ 1 ] ' , ' v a r c h a r ( 4 0 0 ) ' ) ,  
 	 	 	 @ C l a s s U R I   =   @ M a t c h O p t i o n s . v a l u e ( ' M a t c h O p t i o n s [ 1 ] / C l a s s U R I [ 1 ] ' , ' v a r c h a r ( 4 0 0 ) ' ) ,  
 	 	 	 @ S e a r c h F i l t e r s X M L   =   @ M a t c h O p t i o n s . q u e r y ( ' M a t c h O p t i o n s [ 1 ] / S e a r c h F i l t e r s L i s t [ 1 ] ' ) ,  
 	 	 	 @ o f f s e t   =   @ O u t p u t O p t i o n s . v a l u e ( ' O u t p u t O p t i o n s [ 1 ] / O f f s e t [ 1 ] ' , ' b i g i n t ' ) ,  
 	 	 	 @ l i m i t   =   @ O u t p u t O p t i o n s . v a l u e ( ' O u t p u t O p t i o n s [ 1 ] / L i m i t [ 1 ] ' , ' b i g i n t ' ) ,  
 	 	 	 @ S o r t B y X M L   =   @ O u t p u t O p t i o n s . q u e r y ( ' O u t p u t O p t i o n s [ 1 ] / S o r t B y L i s t [ 1 ] ' )  
  
 	 d e c l a r e   @ b a s e U R I   n v a r c h a r ( 4 0 0 )  
 	 s e l e c t   @ b a s e U R I   =   v a l u e   f r o m   [ F r a m e w o r k . ] . P a r a m e t e r   w h e r e   P a r a m e t e r I D   =   ' b a s e U R I '  
  
 	 d e c l a r e   @ d   d a t e t i m e  
 	 s e l e c t   @ d   =   G e t D a t e ( )  
 	  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   P a r s e   s e a r c h   s t r i n g   a n d   c o n v e r t   t o   f u l l t e x t   q u e r y  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 d e c l a r e   @ N u m b e r O f P h r a s e s   I N T  
 	 d e c l a r e   @ C o m b i n e d S e a r c h S t r i n g   V A R C H A R ( 8 0 0 0 )  
 	 d e c l a r e   @ S e a r c h P h r a s e X M L   X M L  
 	 d e c l a r e   @ S e a r c h P h r a s e F o r m s X M L   X M L  
 	 d e c l a r e   @ P a r s e P r o c e s s T i m e   I N T  
  
 	 E X E C   [ S e a r c h . ] . [ P a r s e S e a r c h S t r i n g ] 	 @ S e a r c h S t r i n g   =   @ S e a r c h S t r i n g ,  
 	 	 	 	 	 	 	 	 	 	 @ N u m b e r O f P h r a s e s   =   @ N u m b e r O f P h r a s e s   O U T P U T ,  
 	 	 	 	 	 	 	 	 	 	 @ C o m b i n e d S e a r c h S t r i n g   =   @ C o m b i n e d S e a r c h S t r i n g   O U T P U T ,  
 	 	 	 	 	 	 	 	 	 	 @ S e a r c h P h r a s e X M L   =   @ S e a r c h P h r a s e X M L   O U T P U T ,  
 	 	 	 	 	 	 	 	 	 	 @ S e a r c h P h r a s e F o r m s X M L   =   @ S e a r c h P h r a s e F o r m s X M L   O U T P U T ,  
 	 	 	 	 	 	 	 	 	 	 @ P r o c e s s T i m e   =   @ P a r s e P r o c e s s T i m e   O U T P U T  
  
 	 d e c l a r e   @ P h r a s e L i s t   t a b l e   ( P h r a s e I D   i n t ,   P h r a s e   v a r c h a r ( m a x ) ,   T h e s a u r u s M a t c h   b i t ,   F o r m s   v a r c h a r ( m a x ) )  
 	 i n s e r t   i n t o   @ P h r a s e L i s t   ( P h r a s e I D ,   P h r a s e ,   T h e s a u r u s M a t c h ,   F o r m s )  
 	 s e l e c t 	 x . v a l u e ( ' @ I D ' , ' I N T ' ) ,  
 	 	 	 x . v a l u e ( ' . ' , ' V A R C H A R ( M A X ) ' ) ,  
 	 	 	 x . v a l u e ( ' @ T h e s a u r u s M a t c h ' , ' B I T ' ) ,  
 	 	 	 x . v a l u e ( ' @ F o r m s ' , ' V A R C H A R ( M A X ) ' )  
 	 	 f r o m   @ S e a r c h P h r a s e F o r m s X M L . n o d e s ( ' / / S e a r c h P h r a s e ' )   a s   p ( x )  
  
 	 - - S E L E C T   @ N u m b e r O f P h r a s e s ,   @ C o m b i n e d S e a r c h S t r i n g ,   @ S e a r c h P h r a s e X M L ,   @ S e a r c h P h r a s e F o r m s X M L ,   @ P a r s e P r o c e s s T i m e  
 	 - - S E L E C T   *   F R O M   @ P h r a s e L i s t  
 	 - - s e l e c t   d a t e d i f f ( m s , @ d , G e t D a t e ( ) )  
  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   P a r s e   s e a r c h   f i l t e r s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 c r e a t e   t a b l e   # S e a r c h F i l t e r s   (  
 	 	 S e a r c h F i l t e r I D   i n t   i d e n t i t y ( 0 , 1 )   p r i m a r y   k e y ,  
 	 	 I s E x c l u d e   b i t ,  
 	 	 P r o p e r t y U R I   v a r c h a r ( 4 0 0 ) ,  
 	 	 P r o p e r t y U R I 2   v a r c h a r ( 4 0 0 ) ,  
 	 	 V a l u e   v a r c h a r ( 7 5 0 ) ,  
 	 	 P r e d i c a t e   b i g i n t ,  
 	 	 P r e d i c a t e 2   b i g i n t  
 	 )  
 	  
 	 i n s e r t   i n t o   # S e a r c h F i l t e r s   ( I s E x c l u d e ,   P r o p e r t y U R I ,   P r o p e r t y U R I 2 ,   V a l u e ,   P r e d i c a t e ,   P r e d i c a t e 2 ) 	  
 	 	 s e l e c t   t . I s E x c l u d e ,   t . P r o p e r t y U R I ,   t . P r o p e r t y U R I 2 ,    
 	 	 	 	 l e f t ( t . V a l u e , 7 5 0 ) + ( c a s e   w h e n   t . M a t c h T y p e = ' L e f t '   t h e n   ' % '   e l s e   ' '   e n d ) ,  
 	 	 	 	 t . P r e d i c a t e ,   t . P r e d i c a t e 2  
 	 	 	 f r o m   (  
 	 	 	 	 s e l e c t   I s N u l l ( I s E x c l u d e , 0 )   I s E x c l u d e ,   P r o p e r t y U R I ,   P r o p e r t y U R I 2 ,   M a t c h T y p e ,   V a l u e ,  
 	 	 	 	 	 [ R D F . ] . f n U R I 2 N o d e I D ( P r o p e r t y U R I )   P r e d i c a t e ,  
 	 	 	 	 	 [ R D F . ] . f n U R I 2 N o d e I D ( P r o p e r t y U R I 2 )   P r e d i c a t e 2  
 	 	 	 	 f r o m   (  
 	 	 	 	 	 s e l e c t   d i s t i n c t   S . x . v a l u e ( ' @ I s E x c l u d e ' , ' b i t ' )   I s E x c l u d e ,  
 	 	 	 	 	 	 	 S . x . v a l u e ( ' @ P r o p e r t y ' , ' v a r c h a r ( 4 0 0 ) ' )   P r o p e r t y U R I ,  
 	 	 	 	 	 	 	 S . x . v a l u e ( ' @ P r o p e r t y 2 ' , ' v a r c h a r ( 4 0 0 ) ' )   P r o p e r t y U R I 2 ,  
 	 	 	 	 	 	 	 S . x . v a l u e ( ' @ M a t c h T y p e ' , ' v a r c h a r ( 1 0 0 ) ' )   M a t c h T y p e ,  
 	 	 	 	 	 	 	 S . x . v a l u e ( ' . ' , ' n v a r c h a r ( m a x ) ' )   V a l u e  
 	 	 	 	 	 f r o m   @ S e a r c h F i l t e r s X M L . n o d e s ( ' / / S e a r c h F i l t e r ' )   a s   S ( x )  
 	 	 	 	 )   t  
 	 	 	 )   t  
 	 	 	 w h e r e   t . V a l u e   I S   N O T   N U L L   a n d   t . V a l u e   < >   ' '  
 	 	 	  
 	 d e c l a r e   @ N u m b e r O f I n c l u d e F i l t e r s   i n t  
 	 s e l e c t   @ N u m b e r O f I n c l u d e F i l t e r s   =   I s N u l l ( ( s e l e c t   c o u n t ( * )   f r o m   # S e a r c h F i l t e r s   w h e r e   I s E x c l u d e = 0 ) , 0 )  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   P a r s e   s o r t   b y   o p t i o n s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 c r e a t e   t a b l e   # S o r t B y   (  
 	 	 S o r t B y I D   i n t   i d e n t i t y ( 1 , 1 )   p r i m a r y   k e y ,  
 	 	 I s D e s c   b i t ,  
 	 	 P r o p e r t y U R I   v a r c h a r ( 4 0 0 ) ,  
 	 	 P r o p e r t y U R I 2   v a r c h a r ( 4 0 0 ) ,  
 	 	 P r o p e r t y U R I 3   v a r c h a r ( 4 0 0 ) ,  
 	 	 P r e d i c a t e   b i g i n t ,  
 	 	 P r e d i c a t e 2   b i g i n t ,  
 	 	 P r e d i c a t e 3   b i g i n t  
 	 )  
 	  
 	 i n s e r t   i n t o   # S o r t B y   ( I s D e s c ,   P r o p e r t y U R I ,   P r o p e r t y U R I 2 ,   P r o p e r t y U R I 3 ,   P r e d i c a t e ,   P r e d i c a t e 2 ,   P r e d i c a t e 3 ) 	  
 	 	 s e l e c t   I s N u l l ( I s D e s c , 0 ) ,   P r o p e r t y U R I ,   P r o p e r t y U R I 2 ,   P r o p e r t y U R I 3 ,  
 	 	 	 	 [ R D F . ] . f n U R I 2 N o d e I D ( P r o p e r t y U R I )   P r e d i c a t e ,  
 	 	 	 	 [ R D F . ] . f n U R I 2 N o d e I D ( P r o p e r t y U R I 2 )   P r e d i c a t e 2 ,  
 	 	 	 	 [ R D F . ] . f n U R I 2 N o d e I D ( P r o p e r t y U R I 3 )   P r e d i c a t e 3  
 	 	 	 f r o m   (  
 	 	 	 	 s e l e c t   S . x . v a l u e ( ' @ I s D e s c ' , ' b i t ' )   I s D e s c ,  
 	 	 	 	 	 	 S . x . v a l u e ( ' @ P r o p e r t y ' , ' v a r c h a r ( 4 0 0 ) ' )   P r o p e r t y U R I ,  
 	 	 	 	 	 	 S . x . v a l u e ( ' @ P r o p e r t y 2 ' , ' v a r c h a r ( 4 0 0 ) ' )   P r o p e r t y U R I 2 ,  
 	 	 	 	 	 	 S . x . v a l u e ( ' @ P r o p e r t y 3 ' , ' v a r c h a r ( 4 0 0 ) ' )   P r o p e r t y U R I 3  
 	 	 	 	 f r o m   @ S o r t B y X M L . n o d e s ( ' / / S o r t B y ' )   a s   S ( x )  
 	 	 	 )   t  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   G e t   i n i t i a l   l i s t   o f   m a t c h i n g   n o d e s   ( b e f o r e   f i l t e r s )  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 c r e a t e   t a b l e   # F u l l N o d e M a t c h   (  
 	 	 N o d e I D   b i g i n t   n o t   n u l l ,  
 	 	 P a t h s   b i g i n t ,  
 	 	 W e i g h t   f l o a t  
 	 )  
  
 	 i f   @ C o m b i n e d S e a r c h S t r i n g   < >   ' '  
 	 b e g i n  
  
 	 	 - -   G e t   n o d e s   t h a t   m a t c h   s e p a r a t e   p h r a s e s  
 	 	 c r e a t e   t a b l e   # P h r a s e N o d e M a t c h   (  
 	 	 	 P h r a s e I D   i n t   n o t   n u l l ,  
 	 	 	 N o d e I D   b i g i n t   n o t   n u l l ,  
 	 	 	 P a t h s   b i g i n t ,  
 	 	 	 W e i g h t   f l o a t  
 	 	 )  
 	 	 i f   ( @ N u m b e r O f P h r a s e s   >   1 )   a n d   ( @ D o E x p a n d e d S e a r c h   =   1 )  
 	 	 b e g i n  
 	 	 	 d e c l a r e   @ P h r a s e S e a r c h S t r i n g   v a r c h a r ( 8 0 0 0 )  
 	 	 	 d e c l a r e   @ l o o p   i n t  
 	 	 	 s e l e c t   @ l o o p   =   1  
 	 	 	 w h i l e   @ l o o p   < =   @ N u m b e r O f P h r a s e s  
 	 	 	 b e g i n  
 	 	 	 	 s e l e c t   @ P h r a s e S e a r c h S t r i n g   =   F o r m s  
 	 	 	 	 	 f r o m   @ P h r a s e L i s t  
 	 	 	 	 	 w h e r e   P h r a s e I D   =   @ l o o p  
 	 	 	 	 i n s e r t   i n t o   # P h r a s e N o d e M a t c h   ( P h r a s e I D ,   N o d e I D ,   P a t h s ,   W e i g h t )  
 	 	 	 	 	 s e l e c t   @ l o o p ,   s . N o d e I D ,   c o u n t ( * )   P a t h s ,   1 - e x p ( s u m ( l o g ( c a s e   w h e n   s . W e i g h t * m . W e i g h t   >   0 . 9 9 9 9 9 9   t h e n   0 . 0 0 0 0 0 1   e l s e   1 - s . W e i g h t * m . W e i g h t   e n d ) ) )   W e i g h t  
 	 	 	 	 	 	 f r o m   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e M a p ]   s ,   (  
 	 	 	 	 	 	 	 s e l e c t   [ K e y ]   N o d e I D ,   [ R a n k ] * 0 . 0 0 1   W e i g h t  
 	 	 	 	 	 	 	 	 f r o m   C o n t a i n s t a b l e   ( [ R D F . ] . N o d e ,   v a l u e ,   @ P h r a s e S e a r c h S t r i n g )   n  
 	 	 	 	 	 	 )   m  
 	 	 	 	 	 	 w h e r e   s . M a t c h e d B y N o d e I D   =   m . N o d e I D  
 	 	 	 	 	 	 g r o u p   b y   s . N o d e I D  
 	 	 	 	 s e l e c t   @ l o o p   =   @ l o o p   +   1  
 	 	 	 e n d  
 	 	 	 - - c r e a t e   c l u s t e r e d   i n d e x   i d x _ n   o n   # P h r a s e N o d e M a t c h ( N o d e I D )  
 	 	 e n d  
  
 	 	 c r e a t e   t a b l e   # T e m p M a t c h N o d e s   (  
 	 	 	 N o d e I D   b i g i n t ,  
 	 	 	 M a t c h e d B y N o d e I D   b i g i n t ,  
 	 	 	 D i s t a n c e   i n t ,  
 	 	 	 P a t h s   i n t ,  
 	 	 	 W e i g h t   f l o a t ,  
 	 	 	 m W e i g h t   f l o a t  
 	 	 )  
 	 	 i n s e r t   i n t o   # T e m p M a t c h N o d e s   ( N o d e I D ,   M a t c h e d B y N o d e I D ,   D i s t a n c e ,   P a t h s ,   W e i g h t ,   m W e i g h t )  
 	 	 	 s e l e c t   s . * ,   m . W e i g h t   m W e i g h t  
 	 	 	 	 f r o m   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e M a p ]   s ,   (  
 	 	 	 	 	 s e l e c t   [ K e y ]   N o d e I D ,   [ R a n k ] * 0 . 0 0 1   W e i g h t  
 	 	 	 	 	 	 f r o m   C o n t a i n s t a b l e   ( [ R D F . ] . N o d e ,   v a l u e ,   @ C o m b i n e d S e a r c h S t r i n g )   n  
 	 	 	 	 )   m  
 	 	 	 	 w h e r e   s . M a t c h e d B y N o d e I D   =   m . N o d e I D  
  
 	 	 i n s e r t   i n t o   # F u l l N o d e M a t c h   ( N o d e I D ,   P a t h s ,   W e i g h t )  
 	 	 	 s e l e c t   I s N u l l ( a . N o d e I D , b . N o d e I D )   N o d e I D ,   I s N u l l ( a . P a t h s , b . P a t h s )   P a t h s ,  
 	 	 	 	 	 ( c a s e   w h e n   a . w e i g h t   i s   n u l l   o r   b . w e i g h t   i s   n u l l   t h e n   I s N u l l ( a . W e i g h t , b . W e i g h t )   e l s e   1 - ( 1 - a . W e i g h t ) * ( 1 - b . W e i g h t )   e n d )   W e i g h t  
 	 	 	 	 f r o m   (  
 	 	 	 	 	 s e l e c t   N o d e I D ,   e x p ( s u m ( l o g ( P a t h s ) ) )   P a t h s ,   e x p ( s u m ( l o g ( W e i g h t ) ) )   W e i g h t  
 	 	 	 	 	 	 f r o m   # P h r a s e N o d e M a t c h  
 	 	 	 	 	 	 g r o u p   b y   N o d e I D  
 	 	 	 	 	 	 h a v i n g   c o u n t ( * )   =   @ N u m b e r O f P h r a s e s  
 	 	 	 	 )   a   f u l l   o u t e r   j o i n   (  
 	 	 	 	 	 s e l e c t   N o d e I D ,   c o u n t ( * )   P a t h s ,   1 - e x p ( s u m ( l o g ( c a s e   w h e n   W e i g h t * m W e i g h t   >   0 . 9 9 9 9 9 9   t h e n   0 . 0 0 0 0 0 1   e l s e   1 - W e i g h t * m W e i g h t   e n d ) ) )   W e i g h t  
 	 	 	 	 	 	 f r o m   # T e m p M a t c h N o d e s  
 	 	 	 	 	 	 g r o u p   b y   N o d e I D  
 	 	 	 	 )   b   o n   a . N o d e I D   =   b . N o d e I D  
 	 	 - - s e l e c t   ' T e x t   M a t c h e s   F o u n d ' ,   d a t e d i f f ( m s , @ d , g e t d a t e ( ) )  
 	 e n d  
 	 e l s e   i f   ( @ N u m b e r O f I n c l u d e F i l t e r s   >   0 )  
 	 b e g i n  
 	 	 i n s e r t   i n t o   # F u l l N o d e M a t c h   ( N o d e I D ,   P a t h s ,   W e i g h t )  
 	 	 	 s e l e c t   t 1 . S u b j e c t ,   1 ,   1  
 	 	 	 	 f r o m   # S e a r c h F i l t e r s   f  
 	 	 	 	 	 i n n e r   j o i n   [ R D F . ] . T r i p l e   t 1  
 	 	 	 	 	 	 o n   f . P r e d i c a t e   i s   n o t   n u l l  
 	 	 	 	 	 	 	 a n d   t 1 . P r e d i c a t e   =   f . P r e d i c a t e    
 	 	 	 	 	 	 	 a n d   t 1 . V i e w S e c u r i t y G r o u p   b e t w e e n   - 3 0   a n d   - 1  
 	 	 	 	 	 l e f t   o u t e r   j o i n   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e P r e f i x ]   n 1  
 	 	 	 	 	 	 o n   n 1 . N o d e I D   =   t 1 . O b j e c t  
 	 	 	 	 	 l e f t   o u t e r   j o i n   [ R D F . ] . T r i p l e   t 2  
 	 	 	 	 	 	 o n   f . P r e d i c a t e 2   i s   n o t   n u l l  
 	 	 	 	 	 	 	 a n d   t 2 . S u b j e c t   =   n 1 . N o d e I D  
 	 	 	 	 	 	 	 a n d   t 2 . P r e d i c a t e   =   f . P r e d i c a t e 2  
 	 	 	 	 	 	 	 a n d   t 2 . V i e w S e c u r i t y G r o u p   b e t w e e n   - 3 0   a n d   - 1  
 	 	 	 	 	 l e f t   o u t e r   j o i n   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e P r e f i x ]   n 2  
 	 	 	 	 	 	 o n   n 2 . N o d e I D   =   t 2 . O b j e c t  
 	 	 	 	 w h e r e   f . I s E x c l u d e   =   0  
 	 	 	 	 	 a n d   ( c a s e   w h e n   f . P r e d i c a t e 2   i s   n o t   n u l l   t h e n   n 2 . P r e f i x   e l s e   n 1 . P r e f i x   e n d )  
 	 	 	 	 	 	 l i k e   f . V a l u e  
 	 	 	 	 g r o u p   b y   t 1 . S u b j e c t  
 	 	 	 	 h a v i n g   c o u n t ( d i s t i n c t   f . S e a r c h F i l t e r I D )   =   @ N u m b e r O f I n c l u d e F i l t e r s  
 	 	 d e l e t e   f r o m   # S e a r c h F i l t e r s   w h e r e   I s E x c l u d e   =   0  
 	 	 s e l e c t   @ N u m b e r O f I n c l u d e F i l t e r s   =   0  
 	 e n d  
 	 e l s e   i f   ( I s N u l l ( @ C l a s s G r o u p U R I , ' ' )   < >   ' '   o r   I s N u l l ( @ C l a s s U R I , ' ' )   < >   ' ' )  
 	 b e g i n  
 	 	 i n s e r t   i n t o   # F u l l N o d e M a t c h   ( N o d e I D ,   P a t h s ,   W e i g h t )  
 	 	 	 s e l e c t   n . N o d e I D ,   1 ,   1  
 	 	 	 	 f r o m   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e C l a s s ]   n ,   [ O n t o l o g y . ] . C l a s s G r o u p C l a s s   c  
 	 	 	 	 w h e r e   n . C l a s s   =   c . _ C l a s s N o d e  
 	 	 	 	 	 a n d   ( ( @ C l a s s G r o u p U R I   i s   n u l l )   o r   ( c . C l a s s G r o u p U R I   =   @ C l a s s G r o u p U R I ) )  
 	 	 	 	 	 a n d   ( ( @ C l a s s U R I   i s   n u l l )   o r   ( c . C l a s s U R I   =   @ C l a s s U R I ) )  
 	 	 s e l e c t   @ C l a s s G r o u p U R I   =   n u l l ,   @ C l a s s U R I   =   n u l l  
 	 e n d  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   R u n   t h e   a c t u a l   s e a r c h  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 c r e a t e   t a b l e   # N o d e   (  
 	 	 S o r t O r d e r   b i g i n t   i d e n t i t y ( 0 , 1 )   p r i m a r y   k e y ,  
 	 	 N o d e I D   b i g i n t ,  
 	 	 P a t h s   b i g i n t ,  
 	 	 W e i g h t   f l o a t  
 	 )  
  
 	 i n s e r t   i n t o   # N o d e   ( N o d e I D ,   P a t h s ,   W e i g h t )  
 	 	 s e l e c t   s . N o d e I D ,   s . P a t h s ,   s . W e i g h t  
 	 	 	 f r o m   # F u l l N o d e M a t c h   s  
 	 	 	 	 i n n e r   j o i n   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e S u m m a r y ]   n   o n  
 	 	 	 	 	 s . N o d e I D   =   n . N o d e I D  
 	 	 	 	 	 a n d   (   I s N u l l ( @ C l a s s G r o u p U R I , @ C l a s s U R I )   i s   n u l l   o r   s . N o d e I D   i n   (  
 	 	 	 	 	 	 	 s e l e c t   N o d e I D  
 	 	 	 	 	 	 	 	 f r o m   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e C l a s s ]   x ,   [ O n t o l o g y . ] . C l a s s G r o u p C l a s s   c  
 	 	 	 	 	 	 	 	 w h e r e   x . C l a s s   =   c . _ C l a s s N o d e  
 	 	 	 	 	 	 	 	 	 a n d   c . C l a s s G r o u p U R I   =   I s N u l l ( @ C l a s s G r o u p U R I , c . C l a s s G r o u p U R I )  
 	 	 	 	 	 	 	 	 	 a n d   c . C l a s s U R I   =   I s N u l l ( @ C l a s s U R I , c . C l a s s U R I )  
 	 	 	 	 	 	 )   )  
 	 	 	 	 	 a n d   (   @ N u m b e r O f I n c l u d e F i l t e r s   =  
 	 	 	 	 	 	 	 ( s e l e c t   c o u n t ( d i s t i n c t   f . S e a r c h F i l t e r I D )  
 	 	 	 	 	 	 	 	 f r o m   # S e a r c h F i l t e r s   f  
 	 	 	 	 	 	 	 	 	 i n n e r   j o i n   [ R D F . ] . T r i p l e   t 1  
 	 	 	 	 	 	 	 	 	 	 o n   f . P r e d i c a t e   i s   n o t   n u l l  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 1 . S u b j e c t   =   s . N o d e I D  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 1 . P r e d i c a t e   =   f . P r e d i c a t e    
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 1 . V i e w S e c u r i t y G r o u p   b e t w e e n   - 3 0   a n d   - 1  
 	 	 	 	 	 	 	 	 	 l e f t   o u t e r   j o i n   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e P r e f i x ]   n 1  
 	 	 	 	 	 	 	 	 	 	 o n   n 1 . N o d e I D   =   t 1 . O b j e c t  
 	 	 	 	 	 	 	 	 	 l e f t   o u t e r   j o i n   [ R D F . ] . T r i p l e   t 2  
 	 	 	 	 	 	 	 	 	 	 o n   f . P r e d i c a t e 2   i s   n o t   n u l l  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 2 . S u b j e c t   =   n 1 . N o d e I D  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 2 . P r e d i c a t e   =   f . P r e d i c a t e 2  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 2 . V i e w S e c u r i t y G r o u p   b e t w e e n   - 3 0   a n d   - 1  
 	 	 	 	 	 	 	 	 	 l e f t   o u t e r   j o i n   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e P r e f i x ]   n 2  
 	 	 	 	 	 	 	 	 	 	 o n   n 2 . N o d e I D   =   t 2 . O b j e c t  
 	 	 	 	 	 	 	 	 w h e r e   f . I s E x c l u d e   =   0  
 	 	 	 	 	 	 	 	 	 a n d   ( c a s e   w h e n   f . P r e d i c a t e 2   i s   n o t   n u l l   t h e n   n 2 . P r e f i x   e l s e   n 1 . P r e f i x   e n d )  
 	 	 	 	 	 	 	 	 	 	 l i k e   f . V a l u e  
 	 	 	 	 	 	 	 )  
 	 	 	 	 	 	 )  
 	 	 	 	 	 a n d   n o t   e x i s t s   (  
 	 	 	 	 	 	 	 s e l e c t   *  
 	 	 	 	 	 	 	 	 f r o m   # S e a r c h F i l t e r s   f  
 	 	 	 	 	 	 	 	 	 i n n e r   j o i n   [ R D F . ] . T r i p l e   t 1  
 	 	 	 	 	 	 	 	 	 	 o n   f . P r e d i c a t e   i s   n o t   n u l l  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 1 . S u b j e c t   =   s . N o d e I D  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 1 . P r e d i c a t e   =   f . P r e d i c a t e    
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 1 . V i e w S e c u r i t y G r o u p   b e t w e e n   - 3 0   a n d   - 1  
 	 	 	 	 	 	 	 	 	 l e f t   o u t e r   j o i n   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e P r e f i x ]   n 1  
 	 	 	 	 	 	 	 	 	 	 o n   n 1 . N o d e I D   =   t 1 . O b j e c t  
 	 	 	 	 	 	 	 	 	 l e f t   o u t e r   j o i n   [ R D F . ] . T r i p l e   t 2  
 	 	 	 	 	 	 	 	 	 	 o n   f . P r e d i c a t e 2   i s   n o t   n u l l  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 2 . S u b j e c t   =   n 1 . N o d e I D  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 2 . P r e d i c a t e   =   f . P r e d i c a t e 2  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 2 . V i e w S e c u r i t y G r o u p   b e t w e e n   - 3 0   a n d   - 1  
 	 	 	 	 	 	 	 	 	 l e f t   o u t e r   j o i n   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e P r e f i x ]   n 2  
 	 	 	 	 	 	 	 	 	 	 o n   n 2 . N o d e I D   =   t 2 . O b j e c t  
 	 	 	 	 	 	 	 	 w h e r e   f . I s E x c l u d e   =   1  
 	 	 	 	 	 	 	 	 	 a n d   ( c a s e   w h e n   f . P r e d i c a t e 2   i s   n o t   n u l l   t h e n   n 2 . P r e f i x   e l s e   n 1 . P r e f i x   e n d )  
 	 	 	 	 	 	 	 	 	 	 l i k e   f . V a l u e  
 	 	 	 	 	 	 )  
 	 	 	 	 o u t e r   a p p l y   (  
 	 	 	 	 	 s e l e c t 	 m a x ( c a s e   w h e n   S o r t B y I D = 1   t h e n   A s c S o r t B y   e l s e   n u l l   e n d )   A s c S o r t B y 1 ,  
 	 	 	 	 	 	 	 m a x ( c a s e   w h e n   S o r t B y I D = 2   t h e n   A s c S o r t B y   e l s e   n u l l   e n d )   A s c S o r t B y 2 ,  
 	 	 	 	 	 	 	 m a x ( c a s e   w h e n   S o r t B y I D = 3   t h e n   A s c S o r t B y   e l s e   n u l l   e n d )   A s c S o r t B y 3 ,  
 	 	 	 	 	 	 	 m a x ( c a s e   w h e n   S o r t B y I D = 1   t h e n   D e s c S o r t B y   e l s e   n u l l   e n d )   D e s c S o r t B y 1 ,  
 	 	 	 	 	 	 	 m a x ( c a s e   w h e n   S o r t B y I D = 2   t h e n   D e s c S o r t B y   e l s e   n u l l   e n d )   D e s c S o r t B y 2 ,  
 	 	 	 	 	 	 	 m a x ( c a s e   w h e n   S o r t B y I D = 3   t h e n   D e s c S o r t B y   e l s e   n u l l   e n d )   D e s c S o r t B y 3  
 	 	 	 	 	 	 f r o m   (  
 	 	 	 	 	 	 	 s e l e c t 	 S o r t B y I D ,  
 	 	 	 	 	 	 	 	 	 ( c a s e   w h e n   f . I s D e s c   =   1   t h e n   n u l l  
 	 	 	 	 	 	 	 	 	 	 	 w h e n   f . P r e d i c a t e 3   i s   n o t   n u l l   t h e n   n 3 . V a l u e  
 	 	 	 	 	 	 	 	 	 	 	 w h e n   f . P r e d i c a t e 2   i s   n o t   n u l l   t h e n   n 2 . V a l u e  
 	 	 	 	 	 	 	 	 	 	 	 e l s e   n 1 . V a l u e   e n d )   A s c S o r t B y ,  
 	 	 	 	 	 	 	 	 	 ( c a s e   w h e n   f . I s D e s c   =   0   t h e n   n u l l  
 	 	 	 	 	 	 	 	 	 	 	 w h e n   f . P r e d i c a t e 3   i s   n o t   n u l l   t h e n   n 3 . V a l u e  
 	 	 	 	 	 	 	 	 	 	 	 w h e n   f . P r e d i c a t e 2   i s   n o t   n u l l   t h e n   n 2 . V a l u e  
 	 	 	 	 	 	 	 	 	 	 	 e l s e   n 1 . V a l u e   e n d )   D e s c S o r t B y  
 	 	 	 	 	 	 	 	 f r o m   # S o r t B y   f  
 	 	 	 	 	 	 	 	 	 i n n e r   j o i n   [ R D F . ] . T r i p l e   t 1  
 	 	 	 	 	 	 	 	 	 	 o n   f . P r e d i c a t e   i s   n o t   n u l l  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 1 . S u b j e c t   =   s . N o d e I D  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 1 . P r e d i c a t e   =   f . P r e d i c a t e    
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 1 . V i e w S e c u r i t y G r o u p   b e t w e e n   - 3 0   a n d   - 1  
 	 	 	 	 	 	 	 	 	 l e f t   o u t e r   j o i n   [ R D F . ] . N o d e   n 1  
 	 	 	 	 	 	 	 	 	 	 o n   n 1 . N o d e I D   =   t 1 . O b j e c t  
 	 	 	 	 	 	 	 	 	 	 	 a n d   n 1 . V i e w S e c u r i t y G r o u p   b e t w e e n   - 3 0   a n d   - 1  
 	 	 	 	 	 	 	 	 	 l e f t   o u t e r   j o i n   [ R D F . ] . T r i p l e   t 2  
 	 	 	 	 	 	 	 	 	 	 o n   f . P r e d i c a t e 2   i s   n o t   n u l l  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 2 . S u b j e c t   =   n 1 . N o d e I D  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 2 . P r e d i c a t e   =   f . P r e d i c a t e 2  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 2 . V i e w S e c u r i t y G r o u p   b e t w e e n   - 3 0   a n d   - 1  
 	 	 	 	 	 	 	 	 	 l e f t   o u t e r   j o i n   [ R D F . ] . N o d e   n 2  
 	 	 	 	 	 	 	 	 	 	 o n   n 2 . N o d e I D   =   t 2 . O b j e c t  
 	 	 	 	 	 	 	 	 	 	 	 a n d   n 2 . V i e w S e c u r i t y G r o u p   b e t w e e n   - 3 0   a n d   - 1  
 	 	 	 	 	 	 	 	 	 l e f t   o u t e r   j o i n   [ R D F . ] . T r i p l e   t 3  
 	 	 	 	 	 	 	 	 	 	 o n   f . P r e d i c a t e 3   i s   n o t   n u l l  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 3 . S u b j e c t   =   n 2 . N o d e I D  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 3 . P r e d i c a t e   =   f . P r e d i c a t e 3  
 	 	 	 	 	 	 	 	 	 	 	 a n d   t 3 . V i e w S e c u r i t y G r o u p   b e t w e e n   - 3 0   a n d   - 1  
 	 	 	 	 	 	 	 	 	 l e f t   o u t e r   j o i n   [ R D F . ] . N o d e   n 3  
 	 	 	 	 	 	 	 	 	 	 o n   n 3 . N o d e I D   =   t 3 . O b j e c t  
 	 	 	 	 	 	 	 	 	 	 	 a n d   n 3 . V i e w S e c u r i t y G r o u p   b e t w e e n   - 3 0   a n d   - 1  
 	 	 	 	 	 	 	 )   t  
 	 	 	 	 	 )   o  
 	 	 	 o r d e r   b y 	 ( c a s e   w h e n   o . A s c S o r t B y 1   i s   n u l l   t h e n   1   e l s e   0   e n d ) ,  
 	 	 	 	 	 	 o . A s c S o r t B y 1 ,  
 	 	 	 	 	 	 ( c a s e   w h e n   o . D e s c S o r t B y 1   i s   n u l l   t h e n   1   e l s e   0   e n d ) ,  
 	 	 	 	 	 	 o . D e s c S o r t B y 1   d e s c ,  
 	 	 	 	 	 	 ( c a s e   w h e n   o . A s c S o r t B y 2   i s   n u l l   t h e n   1   e l s e   0   e n d ) ,  
 	 	 	 	 	 	 o . A s c S o r t B y 2 ,  
 	 	 	 	 	 	 ( c a s e   w h e n   o . D e s c S o r t B y 2   i s   n u l l   t h e n   1   e l s e   0   e n d ) ,  
 	 	 	 	 	 	 o . D e s c S o r t B y 2   d e s c ,  
 	 	 	 	 	 	 ( c a s e   w h e n   o . A s c S o r t B y 3   i s   n u l l   t h e n   1   e l s e   0   e n d ) ,  
 	 	 	 	 	 	 o . A s c S o r t B y 3 ,  
 	 	 	 	 	 	 ( c a s e   w h e n   o . D e s c S o r t B y 3   i s   n u l l   t h e n   1   e l s e   0   e n d ) ,  
 	 	 	 	 	 	 o . D e s c S o r t B y 3   d e s c ,  
 	 	 	 	 	 	 s . W e i g h t   d e s c ,  
 	 	 	 	 	 	 n . S h o r t L a b e l ,  
 	 	 	 	 	 	 n . N o d e I D  
  
  
 	 - - s e l e c t   ' S e a r c h   N o d e s   F o u n d ' ,   d a t e d i f f ( m s , @ d , G e t D a t e ( ) )  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   G e t   n e t w o r k   c o u n t s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 d e c l a r e   @ N u m b e r O f C o n n e c t i o n s   a s   b i g i n t  
 	 d e c l a r e   @ M a x W e i g h t   a s   f l o a t  
 	 d e c l a r e   @ M i n W e i g h t   a s   f l o a t  
  
 	 s e l e c t   @ N u m b e r O f C o n n e c t i o n s   =   c o u n t ( * ) ,   @ M a x W e i g h t   =   m a x ( W e i g h t ) ,   @ M i n W e i g h t   =   m i n ( W e i g h t )    
 	 	 f r o m   # N o d e  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   G e t   m a t c h i n g   c l a s s   g r o u p s   a n d   c l a s s e s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 d e c l a r e   @ M a t c h e s C l a s s G r o u p s   n v a r c h a r ( m a x )  
  
 	 s e l e c t   c . C l a s s G r o u p U R I ,   c . C l a s s U R I ,   n . N o d e I D  
 	 	 i n t o   # N o d e C l a s s  
 	 	 f r o m   # N o d e   n ,   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e C l a s s ]   s ,   [ O n t o l o g y . ] . C l a s s G r o u p C l a s s   c  
 	 	 w h e r e   n . N o d e I D   =   s . N o d e I D   a n d   s . C l a s s   =   c . _ C l a s s N o d e  
  
 	 ; w i t h   a   a s   (  
 	 	 s e l e c t   C l a s s G r o u p U R I ,   c o u n t ( d i s t i n c t   N o d e I D )   N u m b e r O f N o d e s  
 	 	 	 f r o m   # N o d e C l a s s   s  
 	 	 	 g r o u p   b y   C l a s s G r o u p U R I  
 	 ) ,   b   a s   (  
 	 	 s e l e c t   C l a s s G r o u p U R I ,   C l a s s U R I ,   c o u n t ( d i s t i n c t   N o d e I D )   N u m b e r O f N o d e s  
 	 	 	 f r o m   # N o d e C l a s s   s  
 	 	 	 g r o u p   b y   C l a s s G r o u p U R I ,   C l a s s U R I  
 	 )  
 	 s e l e c t   @ M a t c h e s C l a s s G r o u p s   =   r e p l a c e ( c a s t ( (  
 	 	 	 s e l e c t 	 g . C l a s s G r o u p U R I   " @ r d f _ . . _ r e s o u r c e " ,    
 	 	 	 	 g . _ C l a s s G r o u p L a b e l   " r d f s _ . . _ l a b e l " ,  
 	 	 	 	 ' h t t p : / / w w w . w 3 . o r g / 2 0 0 1 / X M L S c h e m a # i n t '   " p r n s _ . . _ n u m b e r O f C o n n e c t i o n s / @ r d f _ . . _ d a t a t y p e " ,  
 	 	 	 	 a . N u m b e r O f N o d e s   " p r n s _ . . _ n u m b e r O f C o n n e c t i o n s " ,  
 	 	 	 	 g . S o r t O r d e r   " p r n s _ . . _ s o r t O r d e r " ,  
 	 	 	 	 (  
 	 	 	 	 	 s e l e c t 	 c . C l a s s U R I   " @ r d f _ . . _ r e s o u r c e " ,  
 	 	 	 	 	 	 	 c . _ C l a s s L a b e l   " r d f s _ . . _ l a b e l " ,  
 	 	 	 	 	 	 	 ' h t t p : / / w w w . w 3 . o r g / 2 0 0 1 / X M L S c h e m a # i n t '   " p r n s _ . . _ n u m b e r O f C o n n e c t i o n s / @ r d f _ . . _ d a t a t y p e " ,  
 	 	 	 	 	 	 	 b . N u m b e r O f N o d e s   " p r n s _ . . _ n u m b e r O f C o n n e c t i o n s " ,  
 	 	 	 	 	 	 	 c . S o r t O r d e r   " p r n s _ . . _ s o r t O r d e r "  
 	 	 	 	 	 	 f r o m   b ,   [ O n t o l o g y . ] . C l a s s G r o u p C l a s s   c  
 	 	 	 	 	 	 w h e r e   b . C l a s s G r o u p U R I   =   c . C l a s s G r o u p U R I   a n d   b . C l a s s U R I   =   c . C l a s s U R I  
 	 	 	 	 	 	 	 a n d   c . C l a s s G r o u p U R I   =   g . C l a s s G r o u p U R I  
 	 	 	 	 	 	 o r d e r   b y   c . S o r t O r d e r  
 	 	 	 	 	 	 f o r   x m l   p a t h ( ' p r n s _ . . _ m a t c h e s C l a s s ' ) ,   t y p e  
 	 	 	 	 )  
 	 	 	 f r o m   a ,   [ O n t o l o g y . ] . C l a s s G r o u p   g  
 	 	 	 w h e r e   a . C l a s s G r o u p U R I   =   g . C l a s s G r o u p U R I  
 	 	 	 o r d e r   b y   g . S o r t O r d e r  
 	 	 	 f o r   x m l   p a t h ( ' p r n s _ . . _ m a t c h e s C l a s s G r o u p ' ) ,   t y p e  
 	 	 )   a s   n v a r c h a r ( m a x ) ) , ' _ . . _ ' , ' : ' )  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   G e t   R D F   o f   s e a r c h   r e s u l t s   o b j e c t s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 d e c l a r e   @ O b j e c t N o d e s R D F   n v a r c h a r ( m a x )  
  
 	 i f   @ N u m b e r O f C o n n e c t i o n s   >   0  
 	 b e g i n  
 	 	 / *  
 	 	 	 - -   A l t e r n a t i v e   m e t h o d s   t h a t   u s e s   G e t D a t a R D F   t o   g e t   t h e   R D F  
 	 	 	 d e c l a r e   @ N o d e L i s t X M L   x m l  
 	 	 	 s e l e c t   @ N o d e L i s t X M L   =   (  
 	 	 	 	 	 s e l e c t   (  
 	 	 	 	 	 	 	 s e l e c t   N o d e I D   " @ I D "  
 	 	 	 	 	 	 	 f r o m   # N o d e  
 	 	 	 	 	 	 	 w h e r e   S o r t O r d e r   > =   I s N u l l ( @ o f f s e t , 0 )   a n d   S o r t O r d e r   <   I s N u l l ( I s N u l l ( @ o f f s e t , 0 ) + @ l i m i t , S o r t O r d e r + 1 )  
 	 	 	 	 	 	 	 o r d e r   b y   S o r t O r d e r  
 	 	 	 	 	 	 	 f o r   x m l   p a t h ( ' N o d e ' ) ,   t y p e  
 	 	 	 	 	 	 	 )  
 	 	 	 	 	 f o r   x m l   p a t h ( ' N o d e L i s t ' ) ,   t y p e  
 	 	 	 	 )  
 	 	 	 e x e c   [ R D F . ] . G e t D a t a R D F   @ N o d e L i s t X M L   =   @ N o d e L i s t X M L ,   @ e x p a n d   =   1 ,   @ s h o w D e t a i l s   =   0 ,   @ r e t u r n X M L   =   0 ,   @ d a t a S t r   =   @ O b j e c t N o d e s R D F   O U T P U T  
 	 	 * /  
 	 	 c r e a t e   t a b l e   # O u t p u t N o d e s   (  
 	 	 	 N o d e I D   b i g i n t   p r i m a r y   k e y ,  
 	 	 	 k   i n t  
 	 	 )  
 	 	 i n s e r t   i n t o   # O u t p u t N o d e s   ( N o d e I D , k )  
 	 	 	 s e l e c t   N o d e I D , 0  
 	 	 	 f r o m   # N o d e  
 	 	 	 w h e r e   S o r t O r d e r   > =   I s N u l l ( @ o f f s e t , 0 )   a n d   S o r t O r d e r   <   I s N u l l ( I s N u l l ( @ o f f s e t , 0 ) + @ l i m i t , S o r t O r d e r + 1 )  
 	 	 d e c l a r e   @ k   i n t  
 	 	 s e l e c t   @ k   =   0  
 	 	 w h i l e   @ k   <   1 0  
 	 	 b e g i n  
 	 	 	 i n s e r t   i n t o   # O u t p u t N o d e s   ( N o d e I D , k )  
 	 	 	 	 s e l e c t   d i s t i n c t   e . E x p a n d N o d e I D ,   @ k + 1  
 	 	 	 	 f r o m   # O u t p u t N o d e s   o ,   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e E x p a n d ]   e  
 	 	 	 	 w h e r e   o . k   =   @ k   a n d   o . N o d e I D   =   e . N o d e I D  
 	 	 	 	 	 a n d   e . E x p a n d N o d e I D   n o t   i n   ( s e l e c t   N o d e I D   f r o m   # O u t p u t N o d e s )  
 	 	 	 i f   @ @ R O W C O U N T   =   0  
 	 	 	 	 s e l e c t   @ k   =   1 0  
 	 	 	 e l s e  
 	 	 	 	 s e l e c t   @ k   =   @ k   +   1  
 	 	 e n d  
 	 	 s e l e c t   @ O b j e c t N o d e s R D F   =   r e p l a c e ( r e p l a c e ( c a s t ( (  
 	 	 	 	 s e l e c t   r . R D F   +   ' '  
 	 	 	 	 f r o m   # O u t p u t N o d e s   n ,   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e R D F ]   r  
 	 	 	 	 w h e r e   n . N o d e I D   =   r . N o d e I D  
 	 	 	 	 o r d e r   b y   n . N o d e I D  
 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 )   a s   n v a r c h a r ( m a x ) ) , ' _ T A G L T _ ' , ' < ' ) , ' _ T A G G T _ ' , ' > ' )  
 	 e n d  
  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   F o r m   s e a r c h   r e s u l t s   R D F  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 d e c l a r e   @ r e s u l t s   n v a r c h a r ( m a x )  
  
 	 s e l e c t   @ r e s u l t s   =   ' '  
 	 	 	 + ' < r d f : D e s c r i p t i o n   r d f : n o d e I D = " S e a r c h R e s u l t s " > '  
 	 	 	 + ' < r d f : t y p e   r d f : r e s o u r c e = " h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # N e t w o r k "   / > '  
 	 	 	 + ' < r d f s : l a b e l > S e a r c h   R e s u l t s < / r d f s : l a b e l > '  
 	 	 	 + ' < p r n s : n u m b e r O f C o n n e c t i o n s   r d f : d a t a t y p e = " h t t p : / / w w w . w 3 . o r g / 2 0 0 1 / X M L S c h e m a # i n t " > ' + c a s t ( I s N u l l ( @ N u m b e r O f C o n n e c t i o n s , 0 )   a s   n v a r c h a r ( 5 0 ) ) + ' < / p r n s : n u m b e r O f C o n n e c t i o n s > '  
 	 	 	 + ' < p r n s : o f f s e t   r d f : d a t a t y p e = " h t t p : / / w w w . w 3 . o r g / 2 0 0 1 / X M L S c h e m a # i n t " '   +   I s N u l l ( ' > ' + c a s t ( @ o f f s e t   a s   n v a r c h a r ( 5 0 ) ) + ' < / p r n s : o f f s e t > ' , '   / > ' )  
 	 	 	 + ' < p r n s : l i m i t   r d f : d a t a t y p e = " h t t p : / / w w w . w 3 . o r g / 2 0 0 1 / X M L S c h e m a # i n t " '   +   I s N u l l ( ' > ' + c a s t ( @ l i m i t   a s   n v a r c h a r ( 5 0 ) ) + ' < / p r n s : l i m i t > ' , '   / > ' )  
 	 	 	 + ' < p r n s : m a x W e i g h t   r d f : d a t a t y p e = " h t t p : / / w w w . w 3 . o r g / 2 0 0 1 / X M L S c h e m a # f l o a t " '   +   I s N u l l ( ' > ' + c a s t ( @ M a x W e i g h t   a s   n v a r c h a r ( 5 0 ) ) + ' < / p r n s : m a x W e i g h t > ' , '   / > ' )  
 	 	 	 + ' < p r n s : m i n W e i g h t   r d f : d a t a t y p e = " h t t p : / / w w w . w 3 . o r g / 2 0 0 1 / X M L S c h e m a # f l o a t " '   +   I s N u l l ( ' > ' + c a s t ( @ M i n W e i g h t   a s   n v a r c h a r ( 5 0 ) ) + ' < / p r n s : m i n W e i g h t > ' , '   / > ' )  
 	 	 	 + ' < v i v o : o v e r v i e w   r d f : p a r s e T y p e = " L i t e r a l " > '  
 	 	 	 + I s N u l l ( c a s t ( @ S e a r c h O p t i o n s   a s   n v a r c h a r ( m a x ) ) , ' ' )  
 	 	 	 + ' < S e a r c h D e t a i l s > ' + I s N u l l ( c a s t ( @ S e a r c h P h r a s e X M L   a s   n v a r c h a r ( m a x ) ) , ' ' ) + ' < / S e a r c h D e t a i l s > '  
 	 	 	 + I s N u l l ( ' < p r n s : m a t c h e s C l a s s G r o u p s L i s t > ' + @ M a t c h e s C l a s s G r o u p s + ' < / p r n s : m a t c h e s C l a s s G r o u p s L i s t > ' , ' ' )  
 	 	 	 + ' < / v i v o : o v e r v i e w > '  
 	 	 	 + I s N u l l ( ( s e l e c t   r e p l a c e ( r e p l a c e ( c a s t ( (  
 	 	 	 	 	 s e l e c t   ' _ T A G L T _ p r n s : h a s C o n n e c t i o n   r d f : n o d e I D = " C ' + c a s t ( S o r t O r d e r   a s   n v a r c h a r ( 5 0 ) ) + ' "   / _ T A G G T _ '  
 	 	 	 	 	 f r o m   # N o d e  
 	 	 	 	 	 w h e r e   S o r t O r d e r   > =   I s N u l l ( @ o f f s e t , 0 )   a n d   S o r t O r d e r   <   I s N u l l ( I s N u l l ( @ o f f s e t , 0 ) + @ l i m i t , S o r t O r d e r + 1 )  
 	 	 	 	 	 o r d e r   b y   S o r t O r d e r  
 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 )   a s   n v a r c h a r ( m a x ) ) , ' _ T A G L T _ ' , ' < ' ) , ' _ T A G G T _ ' , ' > ' ) ) , ' ' )  
 	 	 	 + ' < / r d f : D e s c r i p t i o n > '  
 	 	 	 + I s N u l l ( ( s e l e c t   r e p l a c e ( r e p l a c e ( c a s t ( (  
 	 	 	 	 	 s e l e c t   ' '  
 	 	 	 	 	 	 + ' _ T A G L T _ r d f : D e s c r i p t i o n   r d f : n o d e I D = " C ' + c a s t ( x . S o r t O r d e r   a s   n v a r c h a r ( 5 0 ) ) + ' " _ T A G G T _ '  
 	 	 	 	 	 	 + ' _ T A G L T _ p r n s : c o n n e c t i o n W e i g h t _ T A G G T _ ' + c a s t ( x . W e i g h t   a s   n v a r c h a r ( 5 0 ) ) + ' _ T A G L T _ / p r n s : c o n n e c t i o n W e i g h t _ T A G G T _ '  
 	 	 	 	 	 	 + ' _ T A G L T _ p r n s : s o r t O r d e r _ T A G G T _ ' + c a s t ( x . S o r t O r d e r   a s   n v a r c h a r ( 5 0 ) ) + ' _ T A G L T _ / p r n s : s o r t O r d e r _ T A G G T _ '  
 	 	 	 	 	 	 + ' _ T A G L T _ r d f : o b j e c t   r d f : r e s o u r c e = " ' + r e p l a c e ( n . V a l u e , ' " ' , ' ' ) + ' " / _ T A G G T _ '  
 	 	 	 	 	 	 + ' _ T A G L T _ r d f : t y p e   r d f : r e s o u r c e = " h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # C o n n e c t i o n "   / _ T A G G T _ '  
 	 	 	 	 	 	 + ' _ T A G L T _ r d f s : l a b e l _ T A G G T _ ' + ( c a s e   w h e n   s . S h o r t L a b e l < > ' '   t h e n   l t r i m ( r t r i m ( s . S h o r t L a b e l ) )   e l s e   ' U n t i t l e d '   e n d ) + ' _ T A G L T _ / r d f s : l a b e l _ T A G G T _ '  
 	 	 	 	 	 	 + I s N u l l ( + ' _ T A G L T _ v i v o : o v e r v i e w _ T A G G T _ ' + s . C l a s s N a m e + ' _ T A G L T _ / v i v o : o v e r v i e w _ T A G G T _ ' , ' ' )  
 	 	 	 	 	 	 + ' _ T A G L T _ / r d f : D e s c r i p t i o n _ T A G G T _ '  
 	 	 	 	 	 f r o m   # N o d e   x ,   [ R D F . ] . N o d e   n ,   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e S u m m a r y ]   s  
 	 	 	 	 	 w h e r e   x . S o r t O r d e r   > =   I s N u l l ( @ o f f s e t , 0 )   a n d   x . S o r t O r d e r   <   I s N u l l ( I s N u l l ( @ o f f s e t , 0 ) + @ l i m i t , x . S o r t O r d e r + 1 )  
 	 	 	 	 	 	 a n d   x . N o d e I D   =   n . N o d e I D  
 	 	 	 	 	 	 a n d   x . N o d e I D   =   s . N o d e I D  
 	 	 	 	 	 o r d e r   b y   x . S o r t O r d e r  
 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 )   a s   n v a r c h a r ( m a x ) ) , ' _ T A G L T _ ' , ' < ' ) , ' _ T A G G T _ ' , ' > ' ) ) , ' ' )  
 	 	 	 + I s N u l l ( @ O b j e c t N o d e s R D F , ' ' )  
  
 	 d e c l a r e   @ x   a s   v a r c h a r ( m a x )  
 	 s e l e c t   @ x   =   ' < r d f : R D F '  
 	 s e l e c t   @ x   =   @ x   +   '   x m l n s : ' + P r e f i x + ' = " ' + U R I + ' " '    
 	 	 f r o m   [ O n t o l o g y . ] . N a m e s p a c e  
 	 s e l e c t   @ x   =   @ x   +   '   > '   +   @ r e s u l t s   +   ' < / r d f : R D F > '  
 	 s e l e c t   c a s t ( @ x   a s   x m l )   R D F  
  
  
 E N D  
  
  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ S e a r c h . ] . [ L o o k u p N o d e s ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ S e a r c h . ] . [ L o o k u p N o d e s ]  
 	 @ S e a r c h O p t i o n s   X M L ,  
 	 @ S e s s i o n I D   U N I Q U E I D E N T I F I E R   =   N U L L  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
 	 / * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	  
 	 T h i s   p r o c e d u r e   p r o v i d e s   s e c u r e ,   r e a l - t i m e   s e a r c h   f o r   e d i t i n g   a n d  
 	 a d m i n i s t r a t i v e   f u n c t i o n s .   I t   g e t s   c a l l e d   i n   t h e   s a m e   w a y   a s   t h e  
 	 m a i n   G e t N o d e s   s e a r c h   p r o c e d u r e ,   b u t   i t   h a s   s e v e r a l   d i f f e r e n c e s :  
 	  
 	 1 )   A l l   n o d e s ,   i n c l u d i n g   n o n - p u b l i c   n o d e s ,   a r e   s e a r c h e d .   T h e  
 	 	 u s e r ' s   S e s s i o n I D   d e t e r m i n e s   w h i c h   n o n - p u b l i c   n o d e s   a r e  
 	 	 r e t u r n e d .  
 	 2 )   N o   c a c h e   t a b l e s   a r e   u s e d .   C h a n g e s   t o   N o d e s   a n d   T r i p l e s   a r e  
 	 	 i m m e d i a t e l y   a v a i l a b l e   t o   t h i s   p r o c e d u r e .   T h o u g h ,   t h e r e   c o u l d  
 	 	 b e   a   d e l a y   c a u s e d   b y   t h e   t i m e   i t   t a k e s   f u l l t e x t   s e a r c h   i n d e x e s  
 	 	 t o   b e   u p d a t e d .  
 	 3 )   O n l y   n o d e   l a b e l s   ( n o t   t h e   f u l l   c o n t e n t   o f   a   p r o f i l e )   a r e    
 	 	 s e a r c h e d .   A s   a   r e s u l t ,   f e w e r   n o d e s   a r e   m a t c h e d   b y   a   s e a r c h  
 	 	 s t r i n g .  
 	 4 )   T h e r e   a r e   f e w e r   s e a r c h   o p t i o n s .   I n   p a r t i c u l a r ,   c l a s s   g r o u p ,  
 	 	 s e a r c h   f i l t e r s ,   a n d   s o r t   o p t i o n s   a r e   n o t   s u p p o r t e d .  
 	 5 )   D a t a   i s   r e t u r n e d   a s   X M L ,   n o t   R D F .  
 	  
 	 B e l o w   a r e   e x a m p l e s :  
  
 	 - -   R e t u r n   a l l   p e o p l e   n a m e d   " S m i t h "  
 	 E X E C   [ S e a r c h . ] . [ L o o k u p N o d e s ]   @ S e a r c h O p t i o n s   =   '  
 	 	 < S e a r c h O p t i o n s >  
 	 	 	 < M a t c h O p t i o n s >  
 	 	 	 	 < S e a r c h S t r i n g > S m i t h < / S e a r c h S t r i n g >  
 	 	 	 	 < C l a s s U R I > h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / P e r s o n < / C l a s s U R I >  
 	 	 	 < / M a t c h O p t i o n s >  
 	 	 	 < O u t p u t O p t i o n s >  
 	 	 	 	 < O f f s e t > 0 < / O f f s e t >  
 	 	 	 	 < L i m i t > 5 < / L i m i t >  
 	 	 	 < / O u t p u t O p t i o n s > 	  
 	 	 < / S e a r c h O p t i o n s >  
 	 	 '  
  
 	 - -   R e t u r n   p u b l i c a t i o n s   a b o u t   " l u n g   c a n c e r "  
 	 E X E C   [ S e a r c h . ] . [ L o o k u p N o d e s ]   @ S e a r c h O p t i o n s   =   '  
 	 	 < S e a r c h O p t i o n s >  
 	 	 	 < M a t c h O p t i o n s >  
 	 	 	 	 < S e a r c h S t r i n g > l u n g   c a n c e r < / S e a r c h S t r i n g >  
 	 	 	 	 < C l a s s U R I > h t t p : / / p u r l . o r g / o n t o l o g y / b i b o / A c a d e m i c A r t i c l e < / C l a s s U R I >  
 	 	 	 < / M a t c h O p t i o n s >  
 	 	 	 < O u t p u t O p t i o n s >  
 	 	 	 	 < O f f s e t > 5 < / O f f s e t >  
 	 	 	 	 < L i m i t > 1 0 < / L i m i t >  
 	 	 	 < / O u t p u t O p t i o n s > 	  
 	 	 < / S e a r c h O p t i o n s >  
 	 	 '  
  
 	 - -   R e t u r n   a l l   d e p a r t m e n t s  
 	 E X E C   [ S e a r c h . ] . [ L o o k u p N o d e s ]   @ S e a r c h O p t i o n s   =   '  
 	 	 < S e a r c h O p t i o n s >  
 	 	 	 < M a t c h O p t i o n s >  
 	 	 	 	 < C l a s s U R I > h t t p : / / v i v o w e b . o r g / o n t o l o g y / c o r e # D e p a r t m e n t < / C l a s s U R I >  
 	 	 	 < / M a t c h O p t i o n s >  
 	 	 	 < O u t p u t O p t i o n s >  
 	 	 	 	 < O f f s e t > 0 < / O f f s e t >  
 	 	 	 	 < L i m i t > 2 5 < / L i m i t >  
 	 	 	 < / O u t p u t O p t i o n s > 	  
 	 	 < / S e a r c h O p t i o n s >  
 	 	 '  
  
 	 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * /  
  
 	 - -   s t a r t   t i m e r  
 	 d e c l a r e   @ d   d a t e t i m e  
 	 s e l e c t   @ d   =   G e t D a t e ( )  
  
 	 - -   d e c l a r e   v a r i a b l e s  
 	 d e c l a r e   @ M a t c h O p t i o n s   x m l  
 	 d e c l a r e   @ O u t p u t O p t i o n s   x m l  
 	 d e c l a r e   @ S e a r c h S t r i n g   v a r c h a r ( 5 0 0 )  
 	 d e c l a r e   @ C l a s s U R I   v a r c h a r ( 4 0 0 )  
 	 d e c l a r e   @ o f f s e t   b i g i n t  
 	 d e c l a r e   @ l i m i t   b i g i n t  
 	 d e c l a r e   @ b a s e U R I   n v a r c h a r ( 4 0 0 )  
 	 d e c l a r e   @ t y p e I D   b i g i n t  
 	 d e c l a r e   @ l a b e l I D   b i g i n t  
 	 d e c l a r e   @ c l a s s I D   b i g i n t  
 	 d e c l a r e   @ C o m b i n e d S e a r c h S t r i n g   V A R C H A R ( 8 0 0 0 )  
  
 	 - -   s e t   c o n s t a n t s  
 	 s e l e c t   @ b a s e U R I   =   v a l u e   f r o m   [ F r a m e w o r k . ] . P a r a m e t e r   w h e r e   P a r a m e t e r I D   =   ' b a s e U R I '  
 	 s e l e c t   @ t y p e I D   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # t y p e ' )  
 	 s e l e c t   @ l a b e l I D   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # l a b e l ' )  
  
 	 - -   p a r s e   i n p u t  
 	 s e l e c t 	 @ M a t c h O p t i o n s   =   @ S e a r c h O p t i o n s . q u e r y ( ' S e a r c h O p t i o n s [ 1 ] / M a t c h O p t i o n s [ 1 ] ' ) ,  
 	 	 	 @ O u t p u t O p t i o n s   =   @ S e a r c h O p t i o n s . q u e r y ( ' S e a r c h O p t i o n s [ 1 ] / O u t p u t O p t i o n s [ 1 ] ' )  
 	 s e l e c t 	 @ S e a r c h S t r i n g   =   @ M a t c h O p t i o n s . v a l u e ( ' M a t c h O p t i o n s [ 1 ] / S e a r c h S t r i n g [ 1 ] ' , ' v a r c h a r ( 5 0 0 ) ' ) ,  
 	 	 	 @ C l a s s U R I   =   @ M a t c h O p t i o n s . v a l u e ( ' M a t c h O p t i o n s [ 1 ] / C l a s s U R I [ 1 ] ' , ' v a r c h a r ( 4 0 0 ) ' ) ,  
 	 	 	 @ o f f s e t   =   @ O u t p u t O p t i o n s . v a l u e ( ' O u t p u t O p t i o n s [ 1 ] / O f f s e t [ 1 ] ' , ' b i g i n t ' ) ,  
 	 	 	 @ l i m i t   =   @ O u t p u t O p t i o n s . v a l u e ( ' O u t p u t O p t i o n s [ 1 ] / L i m i t [ 1 ] ' , ' b i g i n t ' )  
 	 i f   @ C l a s s U R I   i s   n o t   n u l l  
 	 	 s e l e c t   @ c l a s s I D   =   [ R D F . ] . f n U R I 2 N o d e I D ( @ C l a s s U R I )  
 	 i f   @ S e a r c h S t r i n g   i s   n o t   n u l l  
 	 	 E X E C   [ S e a r c h . ] . [ P a r s e S e a r c h S t r i n g ] 	 @ S e a r c h S t r i n g   =   @ S e a r c h S t r i n g ,  
 	 	 	 	 	 	 	 	 	 	 	 @ C o m b i n e d S e a r c h S t r i n g   =   @ C o m b i n e d S e a r c h S t r i n g   O U T P U T  
  
 	 - -   g e t   s e c u r i t y   i n f o r m a t i o n  
 	 D E C L A R E   @ S e c u r i t y G r o u p I D   B I G I N T ,   @ H a s S p e c i a l V i e w A c c e s s   B I T  
 	 E X E C   [ R D F . S e c u r i t y ] . G e t S e s s i o n S e c u r i t y G r o u p   @ S e s s i o n I D ,   @ S e c u r i t y G r o u p I D   O U T P U T ,   @ H a s S p e c i a l V i e w A c c e s s   O U T P U T  
 	 C R E A T E   T A B L E   # S e c u r i t y G r o u p N o d e s   ( S e c u r i t y G r o u p N o d e   B I G I N T   P R I M A R Y   K E Y )  
 	 I N S E R T   I N T O   # S e c u r i t y G r o u p N o d e s   ( S e c u r i t y G r o u p N o d e )   E X E C   [ R D F . S e c u r i t y ] . G e t S e s s i o n S e c u r i t y G r o u p N o d e s   @ S e s s i o n I D  
  
  
 	 - -   g e t   a   l i s t   o f   p o s s i b l e   c l a s s e s  
 	 c r e a t e   t a b l e   # c   ( C l a s s N o d e   b i g i n t   p r i m a r y   k e y ,   T r e e D e p t h   i n t ,   C l a s s N a m e   v a r c h a r ( 4 0 0 ) )  
 	 i n s e r t   i n t o   # c   ( C l a s s N o d e ,   T r e e D e p t h ,   C l a s s N a m e )  
 	 	 s e l e c t   _ C l a s s N o d e ,   _ T r e e D e p t h ,   _ C l a s s N a m e  
 	 	 f r o m   [ O n t o l o g y . ] . C l a s s T r e e D e p t h  
 	 	 w h e r e   _ C l a s s N o d e   =   I s N u l l ( @ c l a s s I D , _ C l a s s N o d e )  
  
 	  
 	 - -   C A S E   1 :   A   s e a r c h   s t r i n g   w a s   p r o v i d e d  
 	 I F   I s N u l l ( @ C o m b i n e d S e a r c h S t r i n g , ' ' )   < >   ' '  
 	 B E G I N  
 	 	 ; w i t h   a   a s   (  
 	 	 	 s e l e c t   N o d e I D ,   L a b e l ,   C l a s s N a m e ,   U R I ,   C o n n e c t i o n W e i g h t ,  
 	 	 	 	 	 r o w _ n u m b e r ( )   o v e r   ( o r d e r   b y   L a b e l ,   N o d e I D )   S o r t O r d e r  
 	 	 	 	 f r o m   (  
 	 	 	 	 	 s e l e c t   ( c a s e   w h e n   l e n ( m . V a l u e ) > 5 0 0   t h e n   l e f t ( m . V a l u e , 4 9 7 ) + ' . . . '   e l s e   m . V a l u e   e n d )   L a b e l ,    
 	 	 	 	 	 	 n . N o d e I D ,   n . v a l u e   U R I ,   c . C l a s s N a m e   C l a s s N a m e ,   x . [ R a n k ] * 0 . 0 0 1   C o n n e c t i o n W e i g h t ,  
 	 	 	 	 	 	 r o w _ n u m b e r ( )   o v e r   ( p a r t i t i o n   b y   n . N o d e I D   o r d e r   b y   c . T r e e D e p t h   d e s c )   k  
 	 	 	 	 	 f r o m   C o n t a i n s t a b l e   ( [ R D F . ] . N o d e ,   v a l u e ,   @ C o m b i n e d S e a r c h S t r i n g )   x  
 	 	 	 	 	 	 i n n e r   j o i n   [ R D F . ] . N o d e   m   - -   t e x t   n o d e  
 	 	 	 	 	 	 	 o n   x . [ K e y ]   =   m . N o d e I D  
 	 	 	 	 	 	 	 	 a n d   ( ( m . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( m . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( m . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) ) )  
 	 	 	 	 	 	 i n n e r   j o i n   [ R D F . ] . T r i p l e   t   - -   m a t c h   l a b e l  
 	 	 	 	 	 	 	 o n   t . o b j e c t   =   m . N o d e I D  
 	 	 	 	 	 	 	 	 a n d   t . p r e d i c a t e   =   @ l a b e l I D  
 	 	 	 	 	 	 	 	 a n d   ( ( t . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( t . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( t . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) ) )  
 	 	 	 	 	 	 i n n e r   j o i n   [ R D F . ] . N o d e   n   - -   m a t c h   n o d e  
 	 	 	 	 	 	 	 o n   n . N o d e I D   =   t . s u b j e c t  
 	 	 	 	 	 	 	 	 a n d   ( ( n . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( n . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( n . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) ) )  
 	 	 	 	 	 	 i n n e r   j o i n   [ R D F . ] . T r i p l e   v   - -   c l a s s  
 	 	 	 	 	 	 	 o n   v . s u b j e c t   =   n . N o d e I D  
 	 	 	 	 	 	 	 	 a n d   v . p r e d i c a t e   =   @ t y p e I D  
 	 	 	 	 	 	 	 	 a n d   ( ( v . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( v . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( v . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) ) )  
 	 	 	 	 	 	 i n n e r   j o i n   # c   c   - -   c l a s s   n a m e  
 	 	 	 	 	 	 	 o n   c . C l a s s N o d e   =   v . o b j e c t  
 	 	 	 	 )   t  
 	 	 	 	 w h e r e   k   =   1  
 	 	 )  
 	 	 s e l e c t   (  
 	 	 	 	 s e l e c t 	 @ S e a r c h S t r i n g   " S e a r c h S t r i n g " ,  
 	 	 	 	 	 	 @ C l a s s U R I   " C l a s s U R I " ,  
 	 	 	 	 	 	 @ o f f s e t   " o f f s e t " ,  
 	 	 	 	 	 	 @ l i m i t   " l i m i t " ,  
 	 	 	 	 	 	 ( s e l e c t   c o u n t ( * )   f r o m   a )   " N u m b e r O f C o n n e c t i o n s " ,  
 	 	 	 	 	 	 (  
 	 	 	 	 	 	 	 s e l e c t 	 S o r t O r d e r   " C o n n e c t i o n / @ S o r t O r d e r " ,  
 	 	 	 	 	 	 	 	 	 N o d e I D   " C o n n e c t i o n / @ N o d e I D " ,  
 	 	 	 	 	 	 	 	 	 C l a s s N a m e   " C o n n e c t i o n / @ C l a s s N a m e " ,    
 	 	 	 	 	 	 	 	 	 U R I   " C o n n e c t i o n / @ U R I " ,  
 	 	 	 	 	 	 	 	 	 C o n n e c t i o n W e i g h t   " C o n n e c t i o n / @ C o n n e c t i o n W e i g h t " ,  
 	 	 	 	 	 	 	 	 	 L a b e l   " C o n n e c t i o n "  
 	 	 	 	 	 	 	 f r o m   a  
 	 	 	 	 	 	 	 w h e r e   S o r t O r d e r   > =   ( I s N u l l ( @ o f f s e t , 0 )   +   1 )   A N D   S o r t O r d e r   < =   ( I s N u l l ( @ o f f s e t , 0 )   +   I s N u l l ( @ l i m i t , S o r t O r d e r ) )  
 	 	 	 	 	 	 	 o r d e r   b y   S o r t O r d e r  
 	 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 	 	 )   " N e t w o r k "  
 	 	 	 	 	 f o r   x m l   p a t h ( ' S e a r c h R e s u l t s ' ) ,   t y p e  
 	 	 	 )   S e a r c h R e s u l t s  
 	 E N D  
  
  
 	 - -   C A S E   2 :   A   C l a s s ,   b u t   n o   s e a r c h   s t r i n g ,   w a s   p r o v i d e d  
 	 I F   ( I s N u l l ( @ C o m b i n e d S e a r c h S t r i n g , ' ' )   =   ' ' )   A N D   ( @ c l a s s I D   I S   N O T   N U L L )  
 	 B E G I N  
 	 	 ; w i t h   a   a s   (  
 	 	 	 s e l e c t   N o d e I D ,   L a b e l ,   C l a s s N a m e ,   U R I ,   1   C o n n e c t i o n W e i g h t ,  
 	 	 	 	 	 r o w _ n u m b e r ( )   o v e r   ( o r d e r   b y   L a b e l ,   N o d e I D )   S o r t O r d e r  
 	 	 	 	 f r o m   (  
 	 	 	 	 	 s e l e c t   ( c a s e   w h e n   l e n ( m . V a l u e ) > 5 0 0   t h e n   l e f t ( m . V a l u e , 4 9 7 ) + ' . . . '   e l s e   m . V a l u e   e n d )   L a b e l ,    
 	 	 	 	 	 	 n . N o d e I D ,   n . v a l u e   U R I ,   c . C l a s s N a m e   C l a s s N a m e ,  
 	 	 	 	 	 	 r o w _ n u m b e r ( )   o v e r   ( p a r t i t i o n   b y   n . N o d e I D   o r d e r   b y   m . N o d e I D   d e s c )   k  
 	 	 	 	 	 f r o m   # c   c  
 	 	 	 	 	 	 i n n e r   j o i n   [ R D F . ] . T r i p l e   v   - -   c l a s s  
 	 	 	 	 	 	 	 o n   v . o b j e c t   =   c . C l a s s N o d e  
 	 	 	 	 	 	 	 	 a n d   v . p r e d i c a t e   =   @ t y p e I D  
 	 	 	 	 	 	 	 	 a n d   ( ( v . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( v . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( v . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) ) )  
 	 	 	 	 	 	 i n n e r   j o i n   [ R D F . ] . N o d e   n   - -   m a t c h   n o d e  
 	 	 	 	 	 	 	 o n   n . N o d e I D   =   v . s u b j e c t  
 	 	 	 	 	 	 	 	 a n d   ( ( n . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( n . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( n . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) ) )  
 	 	 	 	 	 	 i n n e r   j o i n   [ R D F . ] . T r i p l e   t   - -   m a t c h   l a b e l  
 	 	 	 	 	 	 	 o n   t . s u b j e c t   =   n . N o d e I D  
 	 	 	 	 	 	 	 	 a n d   t . p r e d i c a t e   =   @ l a b e l I D  
 	 	 	 	 	 	 	 	 a n d   ( ( t . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( t . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( t . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) ) )  
 	 	 	 	 	 	 i n n e r   j o i n   [ R D F . ] . N o d e   m   - -   t e x t   n o d e  
 	 	 	 	 	 	 	 o n   m . N o d e I D   =   t . o b j e c t  
 	 	 	 	 	 	 	 	 a n d   ( ( m . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( m . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( m . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) ) )  
 	 	 	 	 )   t  
 	 	 	 	 w h e r e   k   =   1  
 	 	 )  
 	 	 s e l e c t   (  
 	 	 	 	 s e l e c t 	 @ S e a r c h S t r i n g   " S e a r c h S t r i n g " ,  
 	 	 	 	 	 	 @ C l a s s U R I   " C l a s s U R I " ,  
 	 	 	 	 	 	 @ o f f s e t   " o f f s e t " ,  
 	 	 	 	 	 	 @ l i m i t   " l i m i t " ,  
 	 	 	 	 	 	 ( s e l e c t   c o u n t ( * )   f r o m   a )   " N u m b e r O f C o n n e c t i o n s " ,  
 	 	 	 	 	 	 (  
 	 	 	 	 	 	 	 s e l e c t 	 S o r t O r d e r   " C o n n e c t i o n / @ S o r t O r d e r " ,  
 	 	 	 	 	 	 	 	 	 N o d e I D   " C o n n e c t i o n / @ N o d e I D " ,  
 	 	 	 	 	 	 	 	 	 C l a s s N a m e   " C o n n e c t i o n / @ C l a s s N a m e " ,    
 	 	 	 	 	 	 	 	 	 U R I   " C o n n e c t i o n / @ U R I " ,  
 	 	 	 	 	 	 	 	 	 C o n n e c t i o n W e i g h t   " C o n n e c t i o n / @ C o n n e c t i o n W e i g h t " ,  
 	 	 	 	 	 	 	 	 	 L a b e l   " C o n n e c t i o n "  
 	 	 	 	 	 	 	 f r o m   a  
 	 	 	 	 	 	 	 w h e r e   S o r t O r d e r   > =   ( I s N u l l ( @ o f f s e t , 0 )   +   1 )   A N D   S o r t O r d e r   < =   ( I s N u l l ( @ o f f s e t , 0 )   +   I s N u l l ( @ l i m i t , S o r t O r d e r ) )  
 	 	 	 	 	 	 	 o r d e r   b y   S o r t O r d e r  
 	 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 	 	 )   " N e t w o r k "  
 	 	 	 	 	 f o r   x m l   p a t h ( ' S e a r c h R e s u l t s ' ) ,   t y p e  
 	 	 	 )   S e a r c h R e s u l t s 	  
 	 E N D  
  
  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ S e a r c h . ] . [ G e t N o d e s ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ S e a r c h . ] . [ G e t N o d e s ]  
 	 @ S e a r c h O p t i o n s   X M L ,  
 	 @ S e s s i o n I D   U N I Q U E I D E N T I F I E R   =   N U L L ,  
 	 @ L o o k u p   B I T   =   0 ,  
 	 @ U s e C a c h e   V A R C H A R ( 5 0 )   =   ' P u b l i c '  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
 	 / *  
 	  
 	 E X E C   [ S e a r c h . ] . [ G e t N o d e s ]   @ S e a r c h O p t i o n s   =   '  
 	 < S e a r c h O p t i o n s >  
 	 	 < M a t c h O p t i o n s >  
 	 	 	 < S e a r c h S t r i n g   E x a c t M a t c h = " f a l s e " > o p t i o n s   f o r   " l u n g   c a n c e r "   t r e a t m e n t < / S e a r c h S t r i n g >  
 	 	 	 < C l a s s U R I > h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / P e r s o n < / C l a s s U R I >  
 	 	 	 < S e a r c h F i l t e r s L i s t >  
 	 	 	 	 < S e a r c h F i l t e r   P r o p e r t y = " h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / l a s t N a m e "   M a t c h T y p e = " L e f t " > S m i t < / S e a r c h F i l t e r >  
 	 	 	 < / S e a r c h F i l t e r s L i s t >  
 	 	 < / M a t c h O p t i o n s >  
 	 	 < O u t p u t O p t i o n s >  
 	 	 	 < O f f s e t > 0 < / O f f s e t >  
 	 	 	 < L i m i t > 5 < / L i m i t >  
 	 	 	 < S o r t B y L i s t >  
 	 	 	 	 < S o r t B y   I s D e s c = " 1 "   P r o p e r t y = " h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / f i r s t N a m e "   / >  
 	 	 	 	 < S o r t B y   I s D e s c = " 0 "   P r o p e r t y = " h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / l a s t N a m e "   / >  
 	 	 	 < / S o r t B y L i s t >  
 	 	 < / O u t p u t O p t i o n s > 	  
 	 < / S e a r c h O p t i o n s >  
 	 '  
 	 	  
 	 * /  
 	  
 	 - -   S e l e c t   e i t h e r   a   l o o k u p   o r   a   f u l l   s e a r c h  
 	 I F   @ L o o k u p   =   1  
 	 B E G I N  
 	 	 - -   R u n   a   l o o k u p  
 	 	 E X E C   [ S e a r c h . ] . [ L o o k u p N o d e s ]   @ S e a r c h O p t i o n s   =   @ S e a r c h O p t i o n s ,   @ S e s s i o n I D   =   @ S e s s i o n I D  
 	 E N D  
 	 E L S E  
 	 B E G I N  
 	 	 - -   R u n   a   f u l l   s e a r c h  
 	 	 - -   D e t e r m i n e   t h e   c a c h e   t y p e   i f   s e t   t o   a u t o  
 	 	 I F   I s N u l l ( @ U s e C a c h e , ' A u t o ' )   I N   ( ' ' , ' A u t o ' )  
 	 	 B E G I N  
 	 	 	 D E C L A R E   @ S e c u r i t y G r o u p I D   B I G I N T ,   @ H a s S p e c i a l V i e w A c c e s s   B I T  
 	 	 	 E X E C   [ R D F . S e c u r i t y ] . G e t S e s s i o n S e c u r i t y G r o u p   @ S e s s i o n I D ,   @ S e c u r i t y G r o u p I D   O U T P U T ,   @ H a s S p e c i a l V i e w A c c e s s   O U T P U T  
 	 	 	 S E L E C T   @ U s e C a c h e   =   ( C A S E   W H E N   @ S e c u r i t y G r o u p I D   < =   - 3 0   T H E N   ' P r i v a t e '   E L S E   ' P u b l i c '   E N D )  
 	 	 E N D  
 	 	 - -   R u n   t h e   s e a r c h   b a s e d   o n   t h e   c a c h e   t y p e  
 	 	 I F   @ U s e C a c h e   =   ' P u b l i c '  
 	 	 	 E X E C   [ S e a r c h . C a c h e ] . [ P u b l i c . G e t N o d e s ]   @ S e a r c h O p t i o n s   =   @ S e a r c h O p t i o n s ,   @ S e s s i o n I D   =   @ S e s s i o n I D  
 	 	 E L S E   I F   @ U s e C a c h e   =   ' P r i v a t e '  
 	 	 	 E X E C   [ S e a r c h . C a c h e ] . [ P r i v a t e . G e t N o d e s ]   @ S e a r c h O p t i o n s   =   @ S e a r c h O p t i o n s ,   @ S e s s i o n I D   =   @ S e s s i o n I D  
 	 E N D  
  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A l t e r i n g   [ R D F . ] . [ G e t D a t a R D F ] '  
 G O  
 A L T E R   P R O C E D U R E   [ R D F . ] . [ G e t D a t a R D F ]  
 	 @ s u b j e c t   B I G I N T = N U L L ,  
 	 @ p r e d i c a t e   B I G I N T = N U L L ,  
 	 @ o b j e c t   B I G I N T = N U L L ,  
 	 @ o f f s e t   B I G I N T = N U L L ,  
 	 @ l i m i t   B I G I N T = N U L L ,  
 	 @ s h o w D e t a i l s   B I T = 1 ,  
 	 @ e x p a n d   B I T = 1 ,  
 	 @ S e s s i o n I D   U N I Q U E I D E N T I F I E R = N U L L ,  
 	 @ N o d e L i s t X M L   X M L = N U L L ,  
 	 @ E x p a n d R D F L i s t X M L   X M L = N U L L ,  
 	 @ r e t u r n X M L   B I T = 1 ,  
 	 @ d a t a S t r   N V A R C H A R ( M A X ) = N U L L   O U T P U T ,  
 	 @ d a t a S t r D a t a T y p e   N V A R C H A R ( 2 5 5 ) = N U L L   O U T P U T ,  
 	 @ d a t a S t r L a n g u a g e   N V A R C H A R ( 2 5 5 ) = N U L L   O U T P U T ,  
 	 @ R D F   X M L = N U L L   O U T P U T  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
 	 / *  
  
 	 T h i s   s t o r e d   p r o c e d u r e   r e t u r n s   t h e   d a t a   f o r   a   n o d e   i n   R D F   f o r m a t .  
  
 	 I n p u t   p a r a m e t e r s :  
 	 	 @ s u b j e c t 	 	 T h e   N o d e I D   w h o s e   R D F   s h o u l d   b e   r e t u r n e d .  
 	 	 @ p r e d i c a t e 	 	 T h e   p r e d i c a t e   N o d e I D   f o r   a   n e t w o r k .  
 	 	 @ o b j e c t 	 	 	 T h e   o b j e c t   N o d e I D   f o r   a   c o n n e c t i o n .  
 	 	 @ o f f s e t 	 	 	 P a g i n a t i o n   -   T h e   f i r s t   o b j e c t   n o d e   t o   r e t u r n .  
 	 	 @ l i m i t 	 	 	 P a g i n a t i o n   -   T h e   n u m b e r   o f   o b j e c t   n o d e s   t o   r e t u r n .  
 	 	 @ s h o w D e t a i l s 	 I f   1 ,   t h e n   a d d i t i o n a l   p r o p e r t i e s   w i l l   b e   r e t u r n e d .  
 	 	 @ e x p a n d 	 	 	 I f   1 ,   t h e n   o b j e c t   p r o p e r t i e s   w i l l   b e   e x p a n d e d .  
 	 	 @ S e s s i o n I D 	 	 T h e   S e s s i o n I D   o f   t h e   u s e r   r e q u e s t i n g   t h e   d a t a .  
  
 	 T h e r e   a r e   t w o   w a y s   t o   c a l l   t h i s   p r o c e d u r e .   B y   d e f a u l t ,   @ r e t u r n X M L   =   1 ,  
 	 a n d   t h e   R D F   i s   r e t u r n e d   a s   X M L .   W h e n   @ r e t u r n X M L   =   0 ,   t h e   d a t a   i s   i n s t e a d  
 	 r e t u r n e d   a s   t h e   s t r i n g s   @ d a t a S t r ,   @ d a t a S t r D a t a T y p e ,   a n d   @ d a t a S t r L a n g u a g e .  
 	 T h i s   s e c o n d   m e t h o d   o f   c a l l i n g   t h i s   p r o c e d u r e   i s   u s e d   b y   o t h e r   p r o c e d u r e s  
 	 a n d   i s   g e n e r a l l y   n o t   c a l l e d   d i r e c t l y   b y   t h e   w e b s i t e .  
  
 	 T h e   R D F   r e t u r n e d   b y   t h i s   p r o c e d u r e   i s   n o t   e q u i v a l e n t   t o   w h a t   i s  
 	 r e t u r n e d   b y   S P A R Q L .   T h i s   p r o c e d u r e   a p p l i e s   s e c u r i t y   r u l e s ,   e x p a n d s  
 	 n o d e s   a s   d e f i n e d   b y   [ O n t o l o g y . ] . [ R D F E x p a n d ] ,   a n d   c a l c u l a t e s   n e t w o r k  
 	 i n f o r m a t i o n   o n - t h e - f l y .  
  
 	 * /  
  
 	 d e c l a r e   @ d   d a t e t i m e  
  
 	 d e c l a r e   @ b a s e U R I   n v a r c h a r ( 4 0 0 )  
 	 s e l e c t   @ b a s e U R I   =   v a l u e   f r o m   [ F r a m e w o r k . ] . P a r a m e t e r   w h e r e   P a r a m e t e r I D   =   ' b a s e U R I '  
  
 	 s e l e c t   @ s u b j e c t   =   n u l l   w h e r e   @ s u b j e c t   =   0  
 	 s e l e c t   @ p r e d i c a t e   =   n u l l   w h e r e   @ p r e d i c a t e   =   0  
 	 s e l e c t   @ o b j e c t   =   n u l l   w h e r e   @ o b j e c t   =   0  
 	 	  
 	 d e c l a r e   @ f i r s t U R I   n v a r c h a r ( 4 0 0 )  
 	 s e l e c t   @ f i r s t U R I   =   @ b a s e U R I + c a s t ( @ s u b j e c t   a s   v a r c h a r ( 5 0 ) )  
  
 	 d e c l a r e   @ f i r s t V a l u e   n v a r c h a r ( 4 0 0 )  
 	 s e l e c t   @ f i r s t V a l u e   =   n u l l  
 	  
 	 d e c l a r e   @ t y p e I D   b i g i n t  
 	 s e l e c t   @ t y p e I D   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # t y p e ' )  
  
 	 d e c l a r e   @ l a b e l I D   b i g i n t  
 	 s e l e c t   @ l a b e l I D   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # l a b e l ' ) 	  
  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - -   D e f i n e   t e m p   t a b l e s  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  
 	 / *  
 	 	 d r o p   t a b l e   # s u b j e c t s  
 	 	 d r o p   t a b l e   # t y p e s  
 	 	 d r o p   t a b l e   # e x p a n d  
 	 	 d r o p   t a b l e   # p r o p e r t i e s  
 	 	 d r o p   t a b l e   # c o n n e c t i o n s  
 	 * /  
  
 	 c r e a t e   t a b l e   # s u b j e c t s   (  
 	 	 s u b j e c t   b i g i n t   p r i m a r y   k e y ,  
 	 	 s h o w D e t a i l   b i t ,  
 	 	 e x p a n d e d   b i t ,  
 	 	 u r i   n v a r c h a r ( 4 0 0 )  
 	 )  
 	  
 	 c r e a t e   t a b l e   # t y p e s   (  
 	 	 s u b j e c t   b i g i n t   n o t   n u l l ,  
 	 	 o b j e c t   b i g i n t   n o t   n u l l ,  
 	 	 p r e d i c a t e   b i g i n t ,  
 	 	 s h o w D e t a i l   b i t ,  
 	 	 u r i   n v a r c h a r ( 4 0 0 )  
 	 )  
 	 c r e a t e   u n i q u e   c l u s t e r e d   i n d e x   i d x _ s o p   o n   # t y p e s   ( s u b j e c t , o b j e c t , p r e d i c a t e )  
  
 	 c r e a t e   t a b l e   # e x p a n d   (  
 	 	 s u b j e c t   b i g i n t   n o t   n u l l ,  
 	 	 p r e d i c a t e   b i g i n t   n o t   n u l l ,  
 	 	 u r i   n v a r c h a r ( 4 0 0 ) ,  
 	 	 p r o p e r t y   n v a r c h a r ( 4 0 0 ) ,  
 	 	 t a g N a m e   n v a r c h a r ( 1 0 0 0 ) ,  
 	 	 p r o p e r t y L a b e l   n v a r c h a r ( 4 0 0 ) ,  
 	 	 I s D e t a i l   b i t ,  
 	 	 l i m i t   b i g i n t ,  
 	 	 s h o w S t a t s   b i t ,  
 	 	 s h o w S u m m a r y   b i t  
 	 )  
 	 a l t e r   t a b l e   # e x p a n d   a d d   p r i m a r y   k e y   ( s u b j e c t , p r e d i c a t e )  
  
 	 c r e a t e   t a b l e   # p r o p e r t i e s   (  
 	 	 u r i   n v a r c h a r ( 4 0 0 ) ,  
 	 	 s u b j e c t   b i g i n t ,  
 	 	 p r e d i c a t e   b i g i n t ,  
 	 	 o b j e c t   b i g i n t ,  
 	 	 s h o w S u m m a r y   b i t ,  
 	 	 p r o p e r t y   n v a r c h a r ( 4 0 0 ) ,  
 	 	 t a g N a m e   n v a r c h a r ( 1 0 0 0 ) ,  
 	 	 p r o p e r t y L a b e l   n v a r c h a r ( 4 0 0 ) ,  
 	 	 L a n g u a g e   n v a r c h a r ( 2 5 5 ) ,  
 	 	 D a t a T y p e   n v a r c h a r ( 2 5 5 ) ,  
 	 	 V a l u e   n v a r c h a r ( m a x ) ,  
 	 	 O b j e c t T y p e   b i t ,  
 	 	 S o r t O r d e r   i n t  
 	 )  
  
 	 c r e a t e   t a b l e   # c o n n e c t i o n s   (  
 	 	 s u b j e c t   b i g i n t ,  
 	 	 s u b j e c t U R I   n v a r c h a r ( 4 0 0 ) ,  
 	 	 p r e d i c a t e   b i g i n t ,  
 	 	 p r e d i c a t e U R I   n v a r c h a r ( 4 0 0 ) ,  
 	 	 o b j e c t   b i g i n t ,  
 	 	 L a n g u a g e   n v a r c h a r ( 2 5 5 ) ,  
 	 	 D a t a T y p e   n v a r c h a r ( 2 5 5 ) ,  
 	 	 V a l u e   n v a r c h a r ( m a x ) ,  
 	 	 O b j e c t T y p e   b i t ,  
 	 	 S o r t O r d e r   i n t ,  
 	 	 W e i g h t   f l o a t ,  
 	 	 R e i t i f i c a t i o n   b i g i n t ,  
 	 	 R e i t i f i c a t i o n U R I   n v a r c h a r ( 4 0 0 ) ,  
 	 	 c o n n e c t i o n U R I   n v a r c h a r ( 4 0 0 )  
 	 )  
 	  
 	 c r e a t e   t a b l e   # C l a s s P r o p e r t y C u s t o m   (  
 	 	 C l a s s P r o p e r t y I D   i n t   p r i m a r y   k e y ,  
 	 	 I n c l u d e P r o p e r t y   b i t ,  
 	 	 L i m i t   i n t ,  
 	 	 I n c l u d e N e t w o r k   b i t ,  
 	 	 I n c l u d e D e s c r i p t i o n   b i t  
 	 )  
  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - -   S e t u p   v a r i a b l e s   u s e d   f o r   s e c u r i t y  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  
 	 D E C L A R E   @ S e c u r i t y G r o u p I D   B I G I N T ,   @ H a s S p e c i a l V i e w A c c e s s   B I T ,   @ H a s S e c u r i t y G r o u p N o d e s   B I T  
 	 E X E C   [ R D F . S e c u r i t y ] . G e t S e s s i o n S e c u r i t y G r o u p   @ S e s s i o n I D ,   @ S e c u r i t y G r o u p I D   O U T P U T ,   @ H a s S p e c i a l V i e w A c c e s s   O U T P U T  
 	 C R E A T E   T A B L E   # S e c u r i t y G r o u p N o d e s   ( S e c u r i t y G r o u p N o d e   B I G I N T   P R I M A R Y   K E Y )  
 	 I N S E R T   I N T O   # S e c u r i t y G r o u p N o d e s   ( S e c u r i t y G r o u p N o d e )   E X E C   [ R D F . S e c u r i t y ] . G e t S e s s i o n S e c u r i t y G r o u p N o d e s   @ S e s s i o n I D ,   @ S u b j e c t  
 	 S E L E C T   @ H a s S e c u r i t y G r o u p N o d e s   =   ( C A S E   W H E N   E X I S T S   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s )   T H E N   1   E L S E   0   E N D )  
  
  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - -   G e t   s u b j e c t   i n f o r m a t i o n   w h e n   i t   i s   a   l i t e r a l  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  
 	 s e l e c t   @ d a t a S t r   =   V a l u e ,   @ d a t a S t r D a t a T y p e   =   D a t a T y p e ,   @ d a t a S t r L a n g u a g e   =   L a n g u a g e  
 	 	 f r o m   [ R D F . ] . N o d e  
 	 	 w h e r e   N o d e I D   =   @ s u b j e c t   a n d   O b j e c t T y p e   =   1  
 	 	 	 a n d   (   ( V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) )   )  
  
  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - -   S e e d   t e m p   t a b l e s  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   P r o f i l e   [ s e e d   w i t h   t h e   s u b j e c t ( s ) ]  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 i f   ( @ s u b j e c t   i s   n o t   n u l l )   a n d   ( @ p r e d i c a t e   i s   n u l l )   a n d   ( @ o b j e c t   i s   n u l l )  
 	 b e g i n  
 	 	 i n s e r t   i n t o   # s u b j e c t s ( s u b j e c t , s h o w D e t a i l , e x p a n d e d , U R I )  
 	 	 	 s e l e c t   N o d e I D ,   @ s h o w D e t a i l s ,   0 ,   V a l u e  
 	 	 	 	 f r o m   [ R D F . ] . N o d e  
 	 	 	 	 w h e r e   N o d e I D   =   @ s u b j e c t  
 	 	 	 	 	 a n d   ( ( V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) ) )  
 	 	 s e l e c t   @ f i r s t V a l u e   =   U R I  
 	 	 	 f r o m   # s u b j e c t s   s ,   [ R D F . ] . N o d e   n  
 	 	 	 w h e r e   s . s u b j e c t   =   @ s u b j e c t  
 	 	 	 	 a n d   s . s u b j e c t   =   n . N o d e I D   a n d   n . O b j e c t T y p e   =   0  
 	 e n d  
 	 i f   ( @ N o d e L i s t X M L   i s   n o t   n u l l )  
 	 b e g i n  
 	 	 i n s e r t   i n t o   # s u b j e c t s ( s u b j e c t , s h o w D e t a i l , e x p a n d e d , U R I )  
 	 	 	 s e l e c t   n . N o d e I D ,   t . S h o w D e t a i l s ,   0 ,   n . V a l u e  
 	 	 	 f r o m   [ R D F . ] . N o d e   n ,   (  
 	 	 	 	 s e l e c t   N o d e I D ,   M A X ( S h o w D e t a i l s )   S h o w D e t a i l s  
 	 	 	 	 f r o m   (  
 	 	 	 	 	 s e l e c t   x . v a l u e ( ' @ I D ' , ' b i g i n t ' )   N o d e I D ,   I s N u l l ( x . v a l u e ( ' @ S h o w D e t a i l s ' , ' t i n y i n t ' ) , 0 )   S h o w D e t a i l s  
 	 	 	 	 	 f r o m   @ N o d e L i s t X M L . n o d e s ( ' / / N o d e ' )   a s   N ( x )  
 	 	 	 	 )   t  
 	 	 	 	 g r o u p   b y   N o d e I D  
 	 	 	 	 h a v i n g   N o d e I D   n o t   i n   ( s e l e c t   s u b j e c t   f r o m   # s u b j e c t s )  
 	 	 	 )   t  
 	 	 	 w h e r e   n . N o d e I D   =   t . N o d e I D   a n d   n . O b j e c t T y p e   =   0  
 	 e n d  
 	  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   G e t   a l l   c o n n e c t i o n s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 i n s e r t   i n t o   # c o n n e c t i o n s   ( s u b j e c t ,   s u b j e c t U R I ,   p r e d i c a t e ,   p r e d i c a t e U R I ,   o b j e c t ,   L a n g u a g e ,   D a t a T y p e ,   V a l u e ,   O b j e c t T y p e ,   S o r t O r d e r ,   W e i g h t ,   R e i t i f i c a t i o n ,   R e i t i f i c a t i o n U R I ,   c o n n e c t i o n U R I )  
 	 	 s e l e c t 	 s . N o d e I D   s u b j e c t ,   s . v a l u e   s u b j e c t U R I ,    
 	 	 	 	 p . N o d e I D   p r e d i c a t e ,   p . v a l u e   p r e d i c a t e U R I ,  
 	 	 	 	 t . o b j e c t ,   o . L a n g u a g e ,   o . D a t a T y p e ,   o . V a l u e ,   o . O b j e c t T y p e ,  
 	 	 	 	 t . S o r t O r d e r ,   t . W e i g h t ,    
 	 	 	 	 r . N o d e I D   R e i t i f i c a t i o n ,   r . V a l u e   R e i t i f i c a t i o n U R I ,  
 	 	 	 	 @ b a s e U R I + c a s t ( @ s u b j e c t   a s   v a r c h a r ( 5 0 ) ) + ' / ' + c a s t ( @ p r e d i c a t e   a s   v a r c h a r ( 5 0 ) ) + ' / ' + c a s t ( o b j e c t   a s   v a r c h a r ( 5 0 ) )   c o n n e c t i o n U R I  
 	 	 	 f r o m   [ R D F . ] . T r i p l e   t  
 	 	 	 	 i n n e r   j o i n   [ R D F . ] . N o d e   s  
 	 	 	 	 	 o n   t . s u b j e c t   =   s . N o d e I D  
 	 	 	 	 i n n e r   j o i n   [ R D F . ] . N o d e   p  
 	 	 	 	 	 o n   t . p r e d i c a t e   =   p . N o d e I D  
 	 	 	 	 i n n e r   j o i n   [ R D F . ] . N o d e   o  
 	 	 	 	 	 o n   t . o b j e c t   =   o . N o d e I D  
 	 	 	 	 l e f t   j o i n   [ R D F . ] . N o d e   r  
 	 	 	 	 	 o n   t . r e i t i f i c a t i o n   =   r . N o d e I D  
 	 	 	 	 	 	 a n d   t . r e i t i f i c a t i o n   i s   n o t   n u l l  
 	 	 	 	 	 	 a n d   ( ( r . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( r . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( r . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) ) )  
 	 	 	 w h e r e   @ s u b j e c t   i s   n o t   n u l l   a n d   @ p r e d i c a t e   i s   n o t   n u l l  
 	 	 	 	 a n d   s . N o d e I D   =   @ s u b j e c t    
 	 	 	 	 a n d   p . N o d e I D   =   @ p r e d i c a t e    
 	 	 	 	 a n d   o . N o d e I D   =   I s N u l l ( @ o b j e c t , o . N o d e I D )  
 	 	 	 	 a n d   ( ( t . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( t . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( t . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) ) )  
 	 	 	 	 a n d   ( ( s . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( s . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( s . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) ) )  
 	 	 	 	 a n d   ( ( p . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( p . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( p . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) ) )  
 	 	 	 	 a n d   ( ( o . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( o . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( o . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) ) )  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   N e t w o r k   [ s e e d   w i t h   n e t w o r k   s t a t i s t i c s   a n d   c o n n e c t i o n s ]  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 i f   ( @ s u b j e c t   i s   n o t   n u l l )   a n d   ( @ p r e d i c a t e   i s   n o t   n u l l )   a n d   ( @ o b j e c t   i s   n u l l )  
 	 b e g i n  
 	 	 s e l e c t   @ f i r s t U R I   =   @ b a s e U R I + c a s t ( @ s u b j e c t   a s   v a r c h a r ( 5 0 ) ) + ' / ' + c a s t ( @ p r e d i c a t e   a s   v a r c h a r ( 5 0 ) )  
 	 	 - -   B a s i c   n e t w o r k   p r o p e r t i e s  
 	 	 ; w i t h   n e t w o r k P r o p e r t i e s   a s   (  
 	 	 	 s e l e c t   1   n ,   ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # t y p e '   p r o p e r t y ,   ' r d f : t y p e '   t a g N a m e ,   ' t y p e '   p r o p e r t y L a b e l ,   0   O b j e c t T y p e  
 	 	 	 u n i o n   a l l   s e l e c t   2 ,   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # n u m b e r O f C o n n e c t i o n s ' ,   ' p r n s : n u m b e r O f C o n n e c t i o n s ' ,   ' n u m b e r   o f   c o n n e c t i o n s ' ,   1  
 	 	 	 u n i o n   a l l   s e l e c t   3 ,   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # m a x W e i g h t ' ,   ' p r n s : m a x W e i g h t ' ,   ' m a x i m u m   c o n n e c t i o n   w e i g h t ' ,   1  
 	 	 	 u n i o n   a l l   s e l e c t   4 ,   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # m i n W e i g h t ' ,   ' p r n s : m i n W e i g h t ' ,   ' m i n i m u m   c o n n e c t i o n   w e i g h t ' ,   1  
 	 	 	 u n i o n   a l l   s e l e c t   5 ,   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # p r e d i c a t e N o d e ' ,   ' p r n s : p r e d i c a t e N o d e ' ,   ' p r e d i c a t e   n o d e ' ,   0  
 	 	 	 u n i o n   a l l   s e l e c t   6 ,   ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # p r e d i c a t e ' ,   ' r d f : p r e d i c a t e ' ,   ' p r e d i c a t e ' ,   0  
 	 	 	 u n i o n   a l l   s e l e c t   7 ,   ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # l a b e l ' ,   ' r d f s : l a b e l ' ,   ' l a b e l ' ,   1  
 	 	 	 u n i o n   a l l   s e l e c t   8 ,   ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # s u b j e c t ' ,   ' r d f : s u b j e c t ' ,   ' s u b j e c t ' ,   0  
 	 	 ) ,   n e t w o r k S t a t s   a s   (  
 	 	 	 s e l e c t 	 c a s t ( i s n u l l ( c o u n t ( * ) , 0 )   a s   v a r c h a r ( 5 0 ) )   n u m b e r O f C o n n e c t i o n s ,  
 	 	 	 	 	 c a s t ( i s n u l l ( m a x ( W e i g h t ) , 1 )   a s   v a r c h a r ( 5 0 ) )   m a x W e i g h t ,  
 	 	 	 	 	 c a s t ( i s n u l l ( m i n ( W e i g h t ) , 1 )   a s   v a r c h a r ( 5 0 ) )   m i n W e i g h t ,  
 	 	 	 	 	 m a x ( p r e d i c a t e U R I )   p r e d i c a t e U R I  
 	 	 	 	 f r o m   # c o n n e c t i o n s  
 	 	 ) ,   s u b j e c t L a b e l   a s   (  
 	 	 	 s e l e c t   I s N u l l ( M a x ( o . V a l u e ) , ' ' )   L a b e l  
 	 	 	 f r o m   [ R D F . ] . T r i p l e   t ,   [ R D F . ] . N o d e   o  
 	 	 	 w h e r e   t . s u b j e c t   =   @ s u b j e c t  
 	 	 	 	 a n d   t . p r e d i c a t e   =   @ l a b e l I D  
 	 	 	 	 a n d   t . o b j e c t   =   o . N o d e I D  
 	 	 	 	 a n d   ( ( t . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( t . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( t . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) ) )  
 	 	 	 	 a n d   ( ( o . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( o . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( o . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) ) )  
 	 	 )  
 	 	 i n s e r t   i n t o   # p r o p e r t i e s   ( u r i , p r e d i c a t e , p r o p e r t y , t a g N a m e , p r o p e r t y L a b e l , V a l u e , O b j e c t T y p e , S o r t O r d e r )  
 	 	 	 s e l e c t 	 @ f i r s t U R I ,  
 	 	 	 	 	 [ R D F . ] . f n U R I 2 N o d e I D ( p . p r o p e r t y ) ,   p . p r o p e r t y ,   p . t a g N a m e ,   p . p r o p e r t y L a b e l ,  
 	 	 	 	 	 ( c a s e   p . n   w h e n   1   t h e n   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # N e t w o r k '  
 	 	 	 	 	 	 	 	 w h e n   2   t h e n   n . n u m b e r O f C o n n e c t i o n s  
 	 	 	 	 	 	 	 	 w h e n   3   t h e n   n . m a x W e i g h t  
 	 	 	 	 	 	 	 	 w h e n   4   t h e n   n . m i n W e i g h t  
 	 	 	 	 	 	 	 	 w h e n   5   t h e n   @ b a s e U R I + c a s t ( @ p r e d i c a t e   a s   v a r c h a r ( 5 0 ) )  
 	 	 	 	 	 	 	 	 w h e n   6   t h e n   n . p r e d i c a t e U R I  
 	 	 	 	 	 	 	 	 w h e n   7   t h e n   l . L a b e l  
 	 	 	 	 	 	 	 	 w h e n   8   t h e n   @ b a s e U R I + c a s t ( @ s u b j e c t   a s   v a r c h a r ( 5 0 ) )  
 	 	 	 	 	 	 	 	 e n d ) ,  
 	 	 	 	 	 p . O b j e c t T y p e ,  
 	 	 	 	 	 1  
 	 	 	 	 f r o m   n e t w o r k S t a t s   n ,   n e t w o r k P r o p e r t i e s   p ,   s u b j e c t L a b e l   l  
 	 	 - -   R e m o v e   c o n n e c t i o n s   n o t   w i t h i n   o f f s e t - l i m i t   w i n d o w  
 	 	 d e l e t e   f r o m   # c o n n e c t i o n s  
 	 	 	 w h e r e   ( S o r t O r d e r   <   1 + I s N u l l ( @ o f f s e t , 0 ) )   o r   ( S o r t O r d e r   >   I s N u l l ( @ l i m i t , S o r t O r d e r )   +   ( c a s e   w h e n   I s N u l l ( @ o f f s e t , 0 ) < 1   t h e n   0   e l s e   @ o f f s e t   e n d ) )  
 	 	 - -   A d d   h a s C o n n e c t i o n   p r o p e r t i e s  
 	 	 i n s e r t   i n t o   # p r o p e r t i e s   ( u r i , p r e d i c a t e , p r o p e r t y , t a g N a m e , p r o p e r t y L a b e l , V a l u e , O b j e c t T y p e , S o r t O r d e r )  
 	 	 	 s e l e c t 	 @ b a s e U R I + c a s t ( @ s u b j e c t   a s   v a r c h a r ( 5 0 ) ) + ' / ' + c a s t ( @ p r e d i c a t e   a s   v a r c h a r ( 5 0 ) ) ,  
 	 	 	 	 	 [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # h a s C o n n e c t i o n ' ) ,    
 	 	 	 	 	 ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # h a s C o n n e c t i o n ' ,   ' p r n s : h a s C o n n e c t i o n ' ,   ' h a s   c o n n e c t i o n ' ,  
 	 	 	 	 	 c o n n e c t i o n U R I ,  
 	 	 	 	 	 0 ,  
 	 	 	 	 	 S o r t O r d e r  
 	 	 	 	 f r o m   # c o n n e c t i o n s  
 	 e n d  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   C o n n e c t i o n   [ s e e d   w i t h   c o n n e c t i o n ]  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 i f   ( @ s u b j e c t   i s   n o t   n u l l )   a n d   ( @ p r e d i c a t e   i s   n o t   n u l l )   a n d   ( @ o b j e c t   i s   n o t   n u l l )  
 	 b e g i n  
 	 	 s e l e c t   @ f i r s t U R I   =   @ b a s e U R I + c a s t ( @ s u b j e c t   a s   v a r c h a r ( 5 0 ) ) + ' / ' + c a s t ( @ p r e d i c a t e   a s   v a r c h a r ( 5 0 ) ) + ' / ' + c a s t ( @ o b j e c t   a s   v a r c h a r ( 5 0 ) )  
 	 e n d  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   E x p a n d e d   C o n n e c t i o n s   [ s e e d   w i t h   s t a t i s t i c s ,   s u b j e c t ,   o b j e c t ,   a n d   c o n n e c t i o n D e t a i l s ]  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 i f   ( @ e x p a n d   =   1   o r   @ o b j e c t   i s   n o t   n u l l )   a n d   e x i s t s   ( s e l e c t   *   f r o m   # c o n n e c t i o n s )  
 	 b e g i n  
 	 	 - -   C o n n e c t i o n   s t a t i s t i c s  
 	 	 ; w i t h   c o n n e c t i o n P r o p e r t i e s   a s   (  
 	 	 	 s e l e c t   1   n ,   ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # t y p e '   p r o p e r t y ,   ' r d f : t y p e '   t a g N a m e ,   ' t y p e '   p r o p e r t y L a b e l ,   0   O b j e c t T y p e  
 	 	 	 u n i o n   a l l   s e l e c t   2 ,   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # c o n n e c t i o n W e i g h t ' ,   ' p r n s : c o n n e c t i o n W e i g h t ' ,   ' c o n n e c t i o n   w e i g h t ' ,   1  
 	 	 	 u n i o n   a l l   s e l e c t   3 ,   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # s o r t O r d e r ' ,   ' p r n s : s o r t O r d e r ' ,   ' s o r t   o r d e r ' ,   1  
 	 	 	 u n i o n   a l l   s e l e c t   4 ,   ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # o b j e c t ' ,   ' r d f : o b j e c t ' ,   ' o b j e c t ' ,   0  
 	 	 	 u n i o n   a l l   s e l e c t   5 ,   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # h a s C o n n e c t i o n D e t a i l s ' ,   ' p r n s : h a s C o n n e c t i o n D e t a i l s ' ,   ' c o n n e c t i o n   d e t a i l s ' ,   0  
 	 	 	 u n i o n   a l l   s e l e c t   6 ,   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # p r e d i c a t e N o d e ' ,   ' p r n s : p r e d i c a t e N o d e ' ,   ' p r e d i c a t e   n o d e ' ,   0  
 	 	 	 u n i o n   a l l   s e l e c t   7 ,   ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # p r e d i c a t e ' ,   ' r d f : p r e d i c a t e ' ,   ' p r e d i c a t e ' ,   0  
 	 	 	 u n i o n   a l l   s e l e c t   8 ,   ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # l a b e l ' ,   ' r d f s : l a b e l ' ,   ' l a b e l ' ,   1  
 	 	 	 u n i o n   a l l   s e l e c t   9 ,   ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # s u b j e c t ' ,   ' r d f : s u b j e c t ' ,   ' s u b j e c t ' ,   0  
 	 	 	 u n i o n   a l l   s e l e c t   1 0 ,   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # c o n n e c t i o n I n N e t w o r k ' ,   ' p r n s : c o n n e c t i o n I n N e t w o r k ' ,   ' c o n n e c t i o n   i n   n e t w o r k ' ,   0  
 	 	 )  
 	 	 i n s e r t   i n t o   # p r o p e r t i e s   ( u r i , p r e d i c a t e , p r o p e r t y , t a g N a m e , p r o p e r t y L a b e l , V a l u e , O b j e c t T y p e , S o r t O r d e r )  
 	 	 	 s e l e c t 	 c o n n e c t i o n U R I ,  
 	 	 	 	 	 [ R D F . ] . f n U R I 2 N o d e I D ( p . p r o p e r t y ) ,   p . p r o p e r t y ,   p . t a g N a m e ,   p . p r o p e r t y L a b e l ,  
 	 	 	 	 	 ( c a s e   p . n 	 w h e n   1   t h e n   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # C o n n e c t i o n '  
 	 	 	 	 	 	 	 	 w h e n   2   t h e n   c a s t ( c . W e i g h t   a s   v a r c h a r ( 5 0 ) )  
 	 	 	 	 	 	 	 	 w h e n   3   t h e n   c a s t ( c . S o r t O r d e r   a s   v a r c h a r ( 5 0 ) )  
 	 	 	 	 	 	 	 	 w h e n   4   t h e n   c . v a l u e  
 	 	 	 	 	 	 	 	 w h e n   5   t h e n   c . R e i t i f i c a t i o n U R I  
 	 	 	 	 	 	 	 	 w h e n   6   t h e n   @ b a s e U R I + c a s t ( @ p r e d i c a t e   a s   v a r c h a r ( 5 0 ) )  
 	 	 	 	 	 	 	 	 w h e n   7   t h e n   c . p r e d i c a t e U R I  
 	 	 	 	 	 	 	 	 w h e n   8   t h e n   l . v a l u e  
 	 	 	 	 	 	 	 	 w h e n   9   t h e n   c . s u b j e c t U R I  
 	 	 	 	 	 	 	 	 w h e n   1 0   t h e n   c . s u b j e c t U R I + ' / ' + c a s t ( @ p r e d i c a t e   a s   v a r c h a r ( 5 0 ) )  
 	 	 	 	 	 	 	 	 e n d ) ,  
 	 	 	 	 	 ( c a s e   p . n   w h e n   4   t h e n   c . O b j e c t T y p e   e l s e   p . O b j e c t T y p e   e n d ) ,  
 	 	 	 	 	 1  
 	 	 	 	 f r o m   # c o n n e c t i o n s   c ,   c o n n e c t i o n P r o p e r t i e s   p  
 	 	 	 	 	 l e f t   o u t e r   j o i n   (  
 	 	 	 	 	 	 s e l e c t   o . v a l u e  
 	 	 	 	 	 	 	 f r o m   [ R D F . ] . T r i p l e   t ,   [ R D F . ] . N o d e   o  
 	 	 	 	 	 	 	 w h e r e   t . s u b j e c t   =   @ s u b j e c t    
 	 	 	 	 	 	 	 	 a n d   t . p r e d i c a t e   =   @ l a b e l I D  
 	 	 	 	 	 	 	 	 a n d   t . o b j e c t   =   o . N o d e I D  
 	 	 	 	 	 	 	 	 a n d   ( ( t . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( t . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( t . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) ) )  
 	 	 	 	 	 	 	 	 a n d   ( ( o . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( o . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( o . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) ) )  
 	 	 	 	 	 )   l   o n   p . n   =   8  
 	 	 	 	 w h e r e   ( p . n   <   5 )    
 	 	 	 	 	 o r   ( p . n   =   5   a n d   c . R e i t i f i c a t i o n U R I   i s   n o t   n u l l )  
 	 	 	 	 	 o r   ( p . n   >   5   a n d   @ o b j e c t   i s   n o t   n u l l )  
 	 	 i f   ( @ e x p a n d   =   1 )  
 	 	 b e g i n  
 	 	 	 - -   C o n n e c t i o n   s u b j e c t  
 	 	 	 i n s e r t   i n t o   # s u b j e c t s   ( s u b j e c t ,   s h o w D e t a i l ,   e x p a n d e d ,   U R I )  
 	 	 	 	 s e l e c t   N o d e I D ,   0 ,   0 ,   V a l u e  
 	 	 	 	 	 f r o m   [ R D F . ] . N o d e  
 	 	 	 	 	 w h e r e   N o d e I D   =   @ s u b j e c t  
 	 	 	 - -   C o n n e c t i o n   o b j e c t s  
 	 	 	 i n s e r t   i n t o   # s u b j e c t s   ( s u b j e c t ,   s h o w D e t a i l ,   e x p a n d e d ,   U R I )  
 	 	 	 	 s e l e c t   o b j e c t ,   0 ,   0 ,   v a l u e  
 	 	 	 	 	 f r o m   # c o n n e c t i o n s  
 	 	 	 	 	 w h e r e   O b j e c t T y p e   =   0   a n d   o b j e c t   n o t   i n   ( s e l e c t   s u b j e c t   f r o m   # s u b j e c t s )  
 	 	 	 - -   C o n n e c t i o n   d e t a i l s   ( r e i t i f i c a t i o n s )  
 	 	 	 i n s e r t   i n t o   # s u b j e c t s   ( s u b j e c t ,   s h o w D e t a i l ,   e x p a n d e d ,   U R I )  
 	 	 	 	 s e l e c t   R e i t i f i c a t i o n ,   0 ,   0 ,   R e i t i f i c a t i o n U R I  
 	 	 	 	 	 f r o m   # c o n n e c t i o n s  
 	 	 	 	 	 w h e r e   R e i t i f i c a t i o n   i s   n o t   n u l l   a n d   R e i t i f i c a t i o n   n o t   i n   ( s e l e c t   s u b j e c t   f r o m   # s u b j e c t s )  
 	 	 e n d  
 	 e n d  
  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - -   G e t   p r o p e r t y   v a l u e s  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  
 	 - -   G e t   c u s t o m   s e t t i n g s   t o   o v e r r i d e   t h e   [ O n t o l o g y . ] . [ C l a s s P r o p e r t y ]   d e f a u l t   v a l u e s  
 	 i n s e r t   i n t o   # C l a s s P r o p e r t y C u s t o m   ( C l a s s P r o p e r t y I D ,   I n c l u d e P r o p e r t y ,   L i m i t ,   I n c l u d e N e t w o r k ,   I n c l u d e D e s c r i p t i o n )  
 	 	 s e l e c t   p . C l a s s P r o p e r t y I D ,   t . I n c l u d e P r o p e r t y ,   t . L i m i t ,   t . I n c l u d e N e t w o r k ,   t . I n c l u d e D e s c r i p t i o n  
 	 	 	 f r o m   [ O n t o l o g y . ] . [ C l a s s P r o p e r t y ]   p  
 	 	 	 	 i n n e r   j o i n   (  
 	 	 	 	 	 s e l e c t 	 x . v a l u e ( ' @ C l a s s ' , ' v a r c h a r ( 4 0 0 ) ' )   C l a s s ,  
 	 	 	 	 	 	 	 x . v a l u e ( ' @ N e t w o r k P r o p e r t y ' , ' v a r c h a r ( 4 0 0 ) ' )   N e t w o r k P r o p e r t y ,  
 	 	 	 	 	 	 	 x . v a l u e ( ' @ P r o p e r t y ' , ' v a r c h a r ( 4 0 0 ) ' )   P r o p e r t y ,  
 	 	 	 	 	 	 	 ( c a s e   x . v a l u e ( ' @ I n c l u d e P r o p e r t y ' , ' v a r c h a r ( 5 ) ' )   w h e n   ' t r u e '   t h e n   1   w h e n   ' f a l s e '   t h e n   0   e l s e   n u l l   e n d )   I n c l u d e P r o p e r t y ,  
 	 	 	 	 	 	 	 x . v a l u e ( ' @ L i m i t ' , ' i n t ' )   L i m i t ,  
 	 	 	 	 	 	 	 ( c a s e   x . v a l u e ( ' @ I n c l u d e N e t w o r k ' , ' v a r c h a r ( 5 ) ' )   w h e n   ' t r u e '   t h e n   1   w h e n   ' f a l s e '   t h e n   0   e l s e   n u l l   e n d )   I n c l u d e N e t w o r k ,  
 	 	 	 	 	 	 	 ( c a s e   x . v a l u e ( ' @ I n c l u d e D e s c r i p t i o n ' , ' v a r c h a r ( 5 ) ' )   w h e n   ' t r u e '   t h e n   1   w h e n   ' f a l s e '   t h e n   0   e l s e   n u l l   e n d )   I n c l u d e D e s c r i p t i o n  
 	 	 	 	 	 f r o m   @ E x p a n d R D F L i s t X M L . n o d e s ( ' / / E x p a n d R D F ' )   a s   R ( x )  
 	 	 	 	 )   t  
 	 	 	 	 o n   p . C l a s s = t . C l a s s   a n d   p . P r o p e r t y = t . P r o p e r t y  
 	 	 	 	 	 a n d   ( ( p . N e t w o r k P r o p e r t y   i s   n u l l   a n d   t . N e t w o r k P r o p e r t y   i s   n u l l )   o r   ( p . N e t w o r k P r o p e r t y   =   t . N e t w o r k P r o p e r t y ) )  
  
 	 - -   G e t   p r o p e r t i e s   a n d   l o o p   i f   o b j e c t s   n e e d   t o   b e   e x p a n d e d  
 	 d e c l a r e   @ n u m L o o p s   i n t  
 	 d e c l a r e   @ m a x L o o p s   i n t  
 	 d e c l a r e   @ a c t u a l L o o p s   i n t  
 	 d e c l a r e   @ N e w S u b j e c t s   i n t  
 	 s e l e c t   @ n u m L o o p s   =   0 ,   @ m a x L o o p s   =   1 0 ,   @ a c t u a l L o o p s   =   0  
 	 w h i l e   ( @ n u m L o o p s   <   @ m a x L o o p s )  
 	 b e g i n  
 	 	 - -   G e t   t h e   t y p e s   o f   e a c h   s u b j e c t   t h a t   h a s n ' t   b e e n   e x p a n d e d  
 	 	 t r u n c a t e   t a b l e   # t y p e s  
 	 	 i n s e r t   i n t o   # t y p e s ( s u b j e c t , o b j e c t , p r e d i c a t e , s h o w D e t a i l , u r i )  
 	 	 	 s e l e c t   s . s u b j e c t ,   t . o b j e c t ,   n u l l ,   s . s h o w D e t a i l ,   s . u r i  
 	 	 	 	 f r o m   # s u b j e c t s   s    
 	 	 	 	 	 i n n e r   j o i n   [ R D F . ] . T r i p l e   t   o n   s . s u b j e c t   =   t . s u b j e c t    
 	 	 	 	 	 	 a n d   t . p r e d i c a t e   =   @ t y p e I D    
 	 	 	 	 	 i n n e r   j o i n   [ R D F . ] . N o d e   n   o n   t . o b j e c t   =   n . N o d e I D  
 	 	 	 	 	 	 a n d   ( ( n . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( n . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( 1   =   C A S E   W H E N   @ H a s S e c u r i t y G r o u p N o d e s   =   0   T H E N   0   W H E N   n . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s )   T H E N   1   E L S E   0   E N D ) )  
 	 	 	 	 	 	 a n d   ( ( t . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( t . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( 1   =   C A S E   W H E N   @ H a s S e c u r i t y G r o u p N o d e s   =   0   T H E N   0   W H E N   t . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s )   T H E N   1   E L S E   0   E N D ) )  
 	 	 	 	 w h e r e   s . e x p a n d e d   =   0 	 	 	 	        
 	 	 - -   G e t   t h e   s u b j e c t   t y p e s   o f   e a c h   r e i t i f i c a t i o n   t h a t   h a s n ' t   b e e n   e x p a n d e d  
 	 	 i n s e r t   i n t o   # t y p e s ( s u b j e c t , o b j e c t , p r e d i c a t e , s h o w D e t a i l , u r i )  
 	 	 s e l e c t   d i s t i n c t   s . s u b j e c t ,   t . o b j e c t ,   r . p r e d i c a t e ,   s . s h o w D e t a i l ,   s . u r i  
 	 	 	 f r o m   # s u b j e c t s   s    
 	 	 	 	 i n n e r   j o i n   [ R D F . ] . T r i p l e   r   o n   s . s u b j e c t   =   r . r e i t i f i c a t i o n  
 	 	 	 	 i n n e r   j o i n   [ R D F . ] . T r i p l e   t   o n   r . s u b j e c t   =   t . s u b j e c t    
 	 	 	 	 	 a n d   t . p r e d i c a t e   =   @ t y p e I D    
 	 	 	 	 i n n e r   j o i n   [ R D F . ] . N o d e   n   o n   t . o b j e c t   =   n . N o d e I D  
 	 	 	 	 	 a n d   ( ( n . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( n . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( 1   =   C A S E   W H E N   @ H a s S e c u r i t y G r o u p N o d e s   =   0   T H E N   0   W H E N   n . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s )   T H E N   1   E L S E   0   E N D ) )  
 	 	 	 	 	 a n d   ( ( t . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( t . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( 1   =   C A S E   W H E N   @ H a s S e c u r i t y G r o u p N o d e s   =   0   T H E N   0   W H E N   t . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s )   T H E N   1   E L S E   0   E N D ) )  
 	 	 	 	 	 a n d   ( ( r . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( r . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( 1   =   C A S E   W H E N   @ H a s S e c u r i t y G r o u p N o d e s   =   0   T H E N   0   W H E N   r . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s )   T H E N   1   E L S E   0   E N D ) )  
 	 	 	 w h e r e   s . e x p a n d e d   =   0  
 	 	 - -   G e t   t h e   i t e m s   t h a t   s h o u l d   b e   e x p a n d e d  
 	 	 t r u n c a t e   t a b l e   # e x p a n d  
 	 	 i n s e r t   i n t o   # e x p a n d ( s u b j e c t ,   p r e d i c a t e ,   u r i ,   p r o p e r t y ,   t a g N a m e ,   p r o p e r t y L a b e l ,   I s D e t a i l ,   l i m i t ,   s h o w S t a t s ,   s h o w S u m m a r y )  
 	 	 	 s e l e c t   p . s u b j e c t ,   o . _ P r o p e r t y N o d e ,   m a x ( p . u r i )   u r i ,   o . p r o p e r t y ,   o . _ T a g N a m e ,   o . _ P r o p e r t y L a b e l ,   m i n ( o . I s D e t a i l * 1 )   I s D e t a i l ,    
 	 	 	 	 	 ( c a s e   w h e n   m i n ( o . I s D e t a i l * 1 )   =   0   t h e n   m a x ( c a s e   w h e n   o . I s D e t a i l = 0   t h e n   I s N u l l ( c . l i m i t , o . l i m i t )   e l s e   n u l l   e n d )   e l s e   m a x ( I s N u l l ( c . l i m i t , o . l i m i t ) )   e n d )   l i m i t ,  
 	 	 	 	 	 ( c a s e   w h e n   m i n ( o . I s D e t a i l * 1 )   =   0   t h e n   m a x ( c a s e   w h e n   o . I s D e t a i l = 0   t h e n   I s N u l l ( c . I n c l u d e N e t w o r k , o . I n c l u d e N e t w o r k ) * 1   e l s e   0   e n d )   e l s e   m a x ( I s N u l l ( c . I n c l u d e N e t w o r k , o . I n c l u d e N e t w o r k ) * 1 )   e n d )   s h o w S t a t s ,  
 	 	 	 	 	 ( c a s e   w h e n   m i n ( o . I s D e t a i l * 1 )   =   0   t h e n   m a x ( c a s e   w h e n   o . I s D e t a i l = 0   t h e n   I s N u l l ( c . I n c l u d e D e s c r i p t i o n , o . I n c l u d e D e s c r i p t i o n ) * 1   e l s e   0   e n d )   e l s e   m a x ( I s N u l l ( c . I n c l u d e D e s c r i p t i o n , o . I n c l u d e D e s c r i p t i o n ) * 1 )   e n d )   s h o w S u m m a r y  
 	 	 	 	 f r o m   # t y p e s   p  
 	 	 	 	 	 i n n e r   j o i n   [ O n t o l o g y . ] . C l a s s P r o p e r t y   o  
 	 	 	 	 	 	 o n   p . o b j e c t   =   o . _ C l a s s N o d e    
 	 	 	 	 	 	 a n d   ( ( p . p r e d i c a t e   i s   n u l l   a n d   o . _ N e t w o r k P r o p e r t y N o d e   i s   n u l l )   o r   ( p . p r e d i c a t e   =   o . _ N e t w o r k P r o p e r t y N o d e ) )  
 	 	 	 	 	 	 a n d   o . I s D e t a i l   < =   p . s h o w D e t a i l  
 	 	 	 	 	 l e f t   o u t e r   j o i n   # C l a s s P r o p e r t y C u s t o m   c  
 	 	 	 	 	 	 o n   o . C l a s s P r o p e r t y I D   =   c . C l a s s P r o p e r t y I D  
 	 	 	 	 w h e r e   I s N u l l ( c . I n c l u d e P r o p e r t y , 1 )   =   1  
 	 	 	 	 g r o u p   b y   p . s u b j e c t ,   o . p r o p e r t y ,   o . _ P r o p e r t y N o d e ,   o . _ T a g N a m e ,   o . _ P r o p e r t y L a b e l  
 	 	 - -   G e t   t h e   v a l u e s   f o r   e a c h   p r o p e r t y   t h a t   s h o u l d   b e   e x p a n d e d  
 	 	 i n s e r t   i n t o   # p r o p e r t i e s   ( u r i , s u b j e c t , p r e d i c a t e , o b j e c t , s h o w S u m m a r y , p r o p e r t y , t a g N a m e , p r o p e r t y L a b e l , L a n g u a g e , D a t a T y p e , V a l u e , O b j e c t T y p e , S o r t O r d e r )  
 	 	 	 s e l e c t   e . u r i ,   e . s u b j e c t ,   t . p r e d i c a t e ,   t . o b j e c t ,   e . s h o w S u m m a r y ,  
 	 	 	 	 	 e . p r o p e r t y ,   e . t a g N a m e ,   e . p r o p e r t y L a b e l ,    
 	 	 	 	 	 o . L a n g u a g e ,   o . D a t a T y p e ,   o . V a l u e ,   o . O b j e c t T y p e ,   t . S o r t O r d e r  
 	 	 	 f r o m   # e x p a n d   e  
 	 	 	 	 i n n e r   j o i n   [ R D F . ] . T r i p l e   t  
 	 	 	 	 	 o n   t . s u b j e c t   =   e . s u b j e c t   a n d   t . p r e d i c a t e   =   e . p r e d i c a t e  
 	 	 	 	 	 	 a n d   ( e . l i m i t   i s   n u l l   o r   t . s o r t o r d e r   < =   e . l i m i t )  
 	 	 	 	 	 	 a n d   ( ( t . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( t . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( 1   =   C A S E   W H E N   @ H a s S e c u r i t y G r o u p N o d e s   =   0   T H E N   0   W H E N   t . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s )   T H E N   1   E L S E   0   E N D ) )  
 	 	 	 	 i n n e r   j o i n   [ R D F . ] . N o d e   p  
 	 	 	 	 	 o n   t . p r e d i c a t e   =   p . N o d e I D  
 	 	 	 	 	 	 a n d   ( ( p . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( p . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( 1   =   C A S E   W H E N   @ H a s S e c u r i t y G r o u p N o d e s   =   0   T H E N   0   W H E N   p . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s )   T H E N   1   E L S E   0   E N D ) )  
 	 	 	 	 i n n e r   j o i n   [ R D F . ] . N o d e   o  
 	 	 	 	 	 o n   t . o b j e c t   =   o . N o d e I D  
 	 	 	 	 	 	 a n d   ( ( o . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( o . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( 1   =   C A S E   W H E N   @ H a s S e c u r i t y G r o u p N o d e s   =   0   T H E N   0   W H E N   o . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s )   T H E N   1   E L S E   0   E N D ) )  
 	 	 - -   G e t   n e t w o r k   p r o p e r t i e s  
 	 	 i f   ( @ n u m L o o p s   =   0 )  
 	 	 b e g i n  
 	 	 	 - -   C a l c u l a t e   n e t w o r k   s t a t i s t i c s  
 	 	 	 s e l e c t   e . u r i ,   e . s u b j e c t ,   t . p r e d i c a t e ,   e . p r o p e r t y ,   e . t a g N a m e ,   e . P r o p e r t y L a b e l ,    
 	 	 	 	 	 c a s t ( i s n u l l ( c o u n t ( * ) , 0 )   a s   v a r c h a r ( 5 0 ) )   n u m b e r O f C o n n e c t i o n s ,  
 	 	 	 	 	 c a s t ( i s n u l l ( m a x ( t . W e i g h t ) , 1 )   a s   v a r c h a r ( 5 0 ) )   m a x W e i g h t ,  
 	 	 	 	 	 c a s t ( i s n u l l ( m i n ( t . W e i g h t ) , 1 )   a s   v a r c h a r ( 5 0 ) )   m i n W e i g h t ,  
 	 	 	 	 	 @ b a s e U R I + c a s t ( e . s u b j e c t   a s   v a r c h a r ( 5 0 ) ) + ' / ' + c a s t ( t . p r e d i c a t e   a s   v a r c h a r ( 5 0 ) )   n e t w o r k U R I  
 	 	 	 	 i n t o   # n e t w o r k s  
 	 	 	 	 f r o m   # e x p a n d   e  
 	 	 	 	 	 i n n e r   j o i n   [ R D F . ] . T r i p l e   t  
 	 	 	 	 	 	 o n   t . s u b j e c t   =   e . s u b j e c t   a n d   t . p r e d i c a t e   =   e . p r e d i c a t e  
 	 	 	 	 	 	 	 a n d   ( e . s h o w S t a t s   =   1 )  
 	 	 	 	 	 	 	 a n d   ( ( t . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( t . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( 1   =   C A S E   W H E N   @ H a s S e c u r i t y G r o u p N o d e s   =   0   T H E N   0   W H E N   t . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s )   T H E N   1   E L S E   0   E N D ) )  
 	 	 	 	 	 i n n e r   j o i n   [ R D F . ] . N o d e   p  
 	 	 	 	 	 	 o n   t . p r e d i c a t e   =   p . N o d e I D  
 	 	 	 	 	 	 	 a n d   ( ( p . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( p . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( 1   =   C A S E   W H E N   @ H a s S e c u r i t y G r o u p N o d e s   =   0   T H E N   0   W H E N   p . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s )   T H E N   1   E L S E   0   E N D ) )  
 	 	 	 	 	 i n n e r   j o i n   [ R D F . ] . N o d e   o  
 	 	 	 	 	 	 o n   t . o b j e c t   =   o . N o d e I D  
 	 	 	 	 	 	 	 a n d   ( ( o . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( o . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( 1   =   C A S E   W H E N   @ H a s S e c u r i t y G r o u p N o d e s   =   0   T H E N   0   W H E N   o . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s )   T H E N   1   E L S E   0   E N D ) )  
 	 	 	 	 g r o u p   b y   e . u r i ,   e . s u b j e c t ,   t . p r e d i c a t e ,   e . p r o p e r t y ,   e . t a g N a m e ,   e . P r o p e r t y L a b e l  
 	 	 	 - -   C r e a t e   p r o p e r t i e s   f r o m   n e t w o r k   s t a t i s t i c s  
 	 	 	 ; w i t h   n e t w o r k P r o p e r t i e s   a s   (  
 	 	 	 	 s e l e c t   1   n ,   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # h a s N e t w o r k '   p r o p e r t y ,   ' p r n s : h a s N e t w o r k '   t a g N a m e ,   ' h a s   n e t w o r k '   p r o p e r t y L a b e l ,   0   O b j e c t T y p e  
 	 	 	 	 u n i o n   a l l   s e l e c t   2 ,   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # n u m b e r O f C o n n e c t i o n s ' ,   ' p r n s : n u m b e r O f C o n n e c t i o n s ' ,   ' n u m b e r   o f   c o n n e c t i o n s ' ,   1  
 	 	 	 	 u n i o n   a l l   s e l e c t   3 ,   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # m a x W e i g h t ' ,   ' p r n s : m a x W e i g h t ' ,   ' m a x i m u m   c o n n e c t i o n   w e i g h t ' ,   1  
 	 	 	 	 u n i o n   a l l   s e l e c t   4 ,   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # m i n W e i g h t ' ,   ' p r n s : m i n W e i g h t ' ,   ' m i n i m u m   c o n n e c t i o n   w e i g h t ' ,   1  
 	 	 	 	 u n i o n   a l l   s e l e c t   5 ,   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # p r e d i c a t e N o d e ' ,   ' p r n s : p r e d i c a t e N o d e ' ,   ' p r e d i c a t e   n o d e ' ,   0  
 	 	 	 	 u n i o n   a l l   s e l e c t   6 ,   ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # p r e d i c a t e ' ,   ' r d f : p r e d i c a t e ' ,   ' p r e d i c a t e ' ,   0  
 	 	 	 	 u n i o n   a l l   s e l e c t   7 ,   ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # l a b e l ' ,   ' r d f s : l a b e l ' ,   ' l a b e l ' ,   1  
 	 	 	 	 u n i o n   a l l   s e l e c t   8 ,   ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # t y p e ' ,   ' r d f : t y p e ' ,   ' t y p e ' ,   0  
 	 	 	 )  
 	 	 	 i n s e r t   i n t o   # p r o p e r t i e s   ( u r i , s u b j e c t , p r e d i c a t e , p r o p e r t y , t a g N a m e , p r o p e r t y L a b e l , V a l u e , O b j e c t T y p e , S o r t O r d e r )  
 	 	 	 	 s e l e c t 	 ( c a s e   p . n   w h e n   1   t h e n   n . u r i   e l s e   n . n e t w o r k U R I   e n d ) ,  
 	 	 	 	 	 	 ( c a s e   p . n   w h e n   1   t h e n   s u b j e c t   e l s e   n u l l   e n d ) ,  
 	 	 	 	 	 	 [ R D F . ] . f n U R I 2 N o d e I D ( p . p r o p e r t y ) ,   p . p r o p e r t y ,   p . t a g N a m e ,   p . p r o p e r t y L a b e l ,  
 	 	 	 	 	 	 ( c a s e   p . n   w h e n   1   t h e n   n . n e t w o r k U R I    
 	 	 	 	 	 	 	 	 	 w h e n   2   t h e n   n . n u m b e r O f C o n n e c t i o n s  
 	 	 	 	 	 	 	 	 	 w h e n   3   t h e n   n . m a x W e i g h t  
 	 	 	 	 	 	 	 	 	 w h e n   4   t h e n   n . m i n W e i g h t  
 	 	 	 	 	 	 	 	 	 w h e n   5   t h e n   @ b a s e U R I + c a s t ( n . p r e d i c a t e   a s   v a r c h a r ( 5 0 ) )  
 	 	 	 	 	 	 	 	 	 w h e n   6   t h e n   n . p r o p e r t y  
 	 	 	 	 	 	 	 	 	 w h e n   7   t h e n   n . P r o p e r t y L a b e l  
 	 	 	 	 	 	 	 	 	 w h e n   8   t h e n   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # N e t w o r k '  
 	 	 	 	 	 	 	 	 	 e n d ) ,  
 	 	 	 	 	 	 p . O b j e c t T y p e ,  
 	 	 	 	 	 	 1  
 	 	 	 	 	 f r o m   # n e t w o r k s   n ,   n e t w o r k P r o p e r t i e s   p  
 	 	 	 	 	 w h e r e   p . n   =   1   o r   @ e x p a n d   =   1  
 	 	 e n d  
 	 	 - -   M a r k   t h a t   a l l   p r e v i o u s   s u b j e c t s   h a v e   b e e n   e x p a n d e d  
 	 	 u p d a t e   # s u b j e c t s   s e t   e x p a n d e d   =   1   w h e r e   e x p a n d e d   =   0  
 	 	 - -   S e e   i f   t h e r e   a r e   a n y   n e w   s u b j e c t s   t h a t   n e e d   t o   b e   e x p a n d e d  
 	 	 i n s e r t   i n t o   # s u b j e c t s ( s u b j e c t , s h o w D e t a i l , e x p a n d e d , u r i )  
 	 	 	 s e l e c t   d i s t i n c t   o b j e c t ,   0 ,   0 ,   v a l u e  
 	 	 	 	 f r o m   # p r o p e r t i e s  
 	 	 	 	 w h e r e   s h o w S u m m a r y   =   1  
 	 	 	 	 	 a n d   O b j e c t T y p e   =   0  
 	 	 	 	 	 a n d   o b j e c t   n o t   i n   ( s e l e c t   s u b j e c t   f r o m   # s u b j e c t s )  
 	 	 s e l e c t   @ N e w S u b j e c t s   =   @ @ R O W C O U N T 	 	  
 	 	 i n s e r t   i n t o   # s u b j e c t s ( s u b j e c t , s h o w D e t a i l , e x p a n d e d , u r i )  
 	 	 	 s e l e c t   d i s t i n c t   p r e d i c a t e ,   0 ,   0 ,   p r o p e r t y  
 	 	 	 	 f r o m   # p r o p e r t i e s  
 	 	 	 	 w h e r e   p r e d i c a t e   i s   n o t   n u l l  
 	 	 	 	 	 a n d   p r e d i c a t e   n o t   i n   ( s e l e c t   s u b j e c t   f r o m   # s u b j e c t s )  
 	 	 - -   I f   n o   s u b j e c t s   n e e d   t o   b e   e x p a n d e d ,   t h e n   w e   a r e   d o n e  
 	 	 i f   @ N e w S u b j e c t s   +   @ @ R O W C O U N T   =   0  
 	 	 	 s e l e c t   @ n u m L o o p s   =   @ m a x L o o p s  
 	 	 s e l e c t   @ n u m L o o p s   =   @ n u m L o o p s   +   1   +   @ m a x L o o p s   *   ( 1   -   @ e x p a n d )  
 	 	 s e l e c t   @ a c t u a l L o o p s   =   @ a c t u a l L o o p s   +   1  
 	 e n d  
 	 - -   A d d   t a g N a m e   a s   a   p r o p e r t y   o f   D a t a t y p e P r o p e r t y   a n d   O b j e c t P r o p e r t y   c l a s s e s  
 	 i n s e r t   i n t o   # p r o p e r t i e s   ( u r i ,   s u b j e c t ,   s h o w S u m m a r y ,   p r o p e r t y ,   t a g N a m e ,   p r o p e r t y L a b e l ,   V a l u e ,   O b j e c t T y p e ,   S o r t O r d e r )  
 	 	 s e l e c t   p . u r i ,   p . s u b j e c t ,   0 ,   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # t a g N a m e ' ,   ' p r n s : t a g N a m e ' ,   ' t a g   n a m e ' ,    
 	 	 	 	 n . p r e f i x + ' : ' + s u b s t r i n g ( p . u r i , l e n ( n . u r i ) + 1 , l e n ( p . u r i ) ) ,   1 ,   1  
 	 	 	 f r o m   # p r o p e r t i e s   p ,   [ O n t o l o g y . ] . N a m e s p a c e   n  
 	 	 	 w h e r e   p . p r o p e r t y   =   ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # t y p e '  
 	 	 	 	 a n d   p . v a l u e   i n   ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # D a t a t y p e P r o p e r t y ' , ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # O b j e c t P r o p e r t y ' )  
 	 	 	 	 a n d   p . u r i   l i k e   n . u r i + ' % '  
 	 - - s e l e c t   @ a c t u a l L o o p s  
 	 - - s e l e c t   *   f r o m   # p r o p e r t i e s   o r d e r   b y   ( c a s e   w h e n   u r i   =   @ f i r s t U R I   t h e n   0   e l s e   1   e n d ) ,   u r i ,   t a g N a m e ,   v a l u e  
  
  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - -   H a n d l e   t h e   s p e c i a l   c a s e   w h e r e   a   l o c a l   n o d e   i s   s t o r i n g   a   c o p y   o f   a n   e x t e r n a l   U R I  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  
 	 i f   ( @ f i r s t V a l u e   I S   N O T   N U L L )   A N D   ( @ f i r s t V a l u e   < >   @ f i r s t U R I )  
 	 	 i n s e r t   i n t o   # p r o p e r t i e s   ( u r i ,   s u b j e c t ,   p r e d i c a t e ,   o b j e c t ,    
 	 	 	 	 s h o w S u m m a r y ,   p r o p e r t y ,    
 	 	 	 	 t a g N a m e ,   p r o p e r t y L a b e l ,    
 	 	 	 	 L a n g u a g e ,   D a t a T y p e ,   V a l u e ,   O b j e c t T y p e ,   S o r t O r d e r  
 	 	 	 )  
 	 	 	 s e l e c t   @ f i r s t U R I   u r i ,   @ s u b j e c t   s u b j e c t ,   p r e d i c a t e ,   o b j e c t ,    
 	 	 	 	 	 s h o w S u m m a r y ,   p r o p e r t y ,    
 	 	 	 	 	 t a g N a m e ,   p r o p e r t y L a b e l ,    
 	 	 	 	 	 L a n g u a g e ,   D a t a T y p e ,   V a l u e ,   O b j e c t T y p e ,   1   S o r t O r d e r  
 	 	 	 	 f r o m   # p r o p e r t i e s  
 	 	 	 	 w h e r e   u r i   =   @ f i r s t V a l u e  
 	 	 	 	 	 a n d   n o t   e x i s t s   ( s e l e c t   *   f r o m   # p r o p e r t i e s   w h e r e   u r i   =   @ f i r s t U R I )  
 	 	 	 u n i o n   a l l  
 	 	 	 s e l e c t   @ f i r s t U R I   u r i ,   @ s u b j e c t   s u b j e c t ,   n u l l   p r e d i c a t e ,   n u l l   o b j e c t ,    
 	 	 	 	 	 0   s h o w S u m m a r y ,   ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # s a m e A s '   p r o p e r t y ,  
 	 	 	 	 	 ' o w l : s a m e A s '   t a g N a m e ,   ' s a m e   a s '   p r o p e r t y L a b e l ,    
 	 	 	 	 	 n u l l   L a n g u a g e ,   n u l l   D a t a T y p e ,   @ f i r s t V a l u e   V a l u e ,   0   O b j e c t T y p e ,   1   S o r t O r d e r  
  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - -   G e n e r a t e   a n   X M L   s t r i n g   f r o m   t h e   n o d e   p r o p e r t i e s   t a b l e  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  
 	 d e c l a r e   @ d e s c r i p t i o n   n v a r c h a r ( m a x )  
 	 s e l e c t   @ d e s c r i p t i o n   =   ' '  
 	 - -   s o r t   t h e   t a g s  
 	 s e l e c t   * ,    
 	 	 	 r o w _ n u m b e r ( )   o v e r   ( p a r t i t i o n   b y   u r i   o r d e r   b y   i )   j ,    
 	 	 	 r o w _ n u m b e r ( )   o v e r   ( p a r t i t i o n   b y   u r i   o r d e r   b y   i   d e s c )   k    
 	 	 i n t o   # p r o p e r t i e s S o r t e d  
 	 	 f r o m   (  
 	 	 	 s e l e c t   * ,   r o w _ n u m b e r ( )   o v e r   ( o r d e r   b y   ( c a s e   w h e n   u r i   =   @ f i r s t U R I   t h e n   0   e l s e   1   e n d ) ,   u r i ,   t a g N a m e ,   S o r t O r d e r ,   v a l u e )   i  
 	 	 	 	 f r o m   # p r o p e r t i e s  
 	 	 )   t  
 	 c r e a t e   u n i q u e   c l u s t e r e d   i n d e x   i d x _ i   o n   # p r o p e r t i e s S o r t e d ( i )  
 	 - -   h a n d l e   s p e c i a l   x m l   c h a r a c t e r s   i n   t h e   u r i   a n d   v a l u e   s t r i n g s  
 	 u p d a t e   # p r o p e r t i e s S o r t e d  
 	 	 s e t   u r i   =   r e p l a c e ( r e p l a c e ( r e p l a c e ( u r i , ' & ' , ' & a m p ; ' ) , ' < ' , ' & l t ; ' ) , ' > ' , ' & g t ; ' )  
 	 	 w h e r e   u r i   l i k e   ' % [ & < > ] % '  
 	 u p d a t e   # p r o p e r t i e s S o r t e d  
 	 	 s e t   v a l u e   =   r e p l a c e ( r e p l a c e ( r e p l a c e ( v a l u e , ' & ' , ' & a m p ; ' ) , ' < ' , ' & l t ; ' ) , ' > ' , ' & g t ; ' )  
 	 	 w h e r e   v a l u e   l i k e   ' % [ & < > ] % '  
 	 - -   c o n c a t e n a t e   t h e   t a g s  
 	 s e l e c t   @ d e s c r i p t i o n   =   (  
 	 	 	 s e l e c t   ( c a s e   w h e n   j = 1   t h e n   ' < r d f : D e s c r i p t i o n   r d f : a b o u t = " '   +   u r i   +   ' " > '   e l s e   ' '   e n d )  
 	 	 	 	 	 + ' < ' + t a g N a m e  
 	 	 	 	 	 + ( c a s e   w h e n   O b j e c t T y p e   =   0   t h e n   '   r d f : r e s o u r c e = " ' + v a l u e + ' " / > '   e l s e   ' > ' + v a l u e + ' < / ' + t a g N a m e + ' > '   e n d )  
 	 	 	 	 	 + ( c a s e   w h e n   k = 1   t h e n   ' < / r d f : D e s c r i p t i o n > '   e l s e   ' '   e n d )  
 	 	 	 f r o m   # p r o p e r t i e s S o r t e d  
 	 	 	 o r d e r   b y   i  
 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 ) . v a l u e ( ' ( . / t e x t ( ) ) [ 1 ] ' , ' n v a r c h a r ( m a x ) ' )  
 	 - -   d e f a u l t   d e s c r i p t i o n   i f   n o n e   e x i s t s  
 	 i f   @ d e s c r i p t i o n   I S   N U L L  
 	 	 s e l e c t   @ d e s c r i p t i o n   =   ' < r d f : D e s c r i p t i o n   r d f : a b o u t = " '   +   @ f i r s t U R I   +   ' " '  
 	 	 	 + I s N u l l ( '   x m l : l a n g = " ' + @ d a t a S t r L a n g u a g e + ' " ' , ' ' )  
 	 	 	 + I s N u l l ( '   r d f : d a t a t y p e = " ' + @ d a t a S t r D a t a T y p e + ' " ' , ' ' )  
 	 	 	 + I s N u l l ( '   > ' + r e p l a c e ( r e p l a c e ( r e p l a c e ( @ d a t a S t r , ' & ' , ' & a m p ; ' ) , ' < ' , ' & l t ; ' ) , ' > ' , ' & g t ; ' ) + ' < / r d f : D e s c r i p t i o n > ' , '   / > ' )  
  
  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - -   R e t u r n   a s   a   s t r i n g   o r   a s   X M L  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  
 	 s e l e c t   @ d a t a S t r   =   I s N u l l ( @ d a t a S t r , @ d e s c r i p t i o n )  
  
 	 d e c l a r e   @ x   a s   v a r c h a r ( m a x )  
 	 s e l e c t   @ x   =   ' < r d f : R D F '  
 	 s e l e c t   @ x   =   @ x   +   '   x m l n s : ' + P r e f i x + ' = " ' + U R I + ' " '    
 	 	 f r o m   [ O n t o l o g y . ] . N a m e s p a c e  
 	 s e l e c t   @ x   =   @ x   +   '   > '   +   @ d e s c r i p t i o n   +   ' < / r d f : R D F > '  
 	 s e l e c t   @ R D F   =   c a s t ( @ x   a s   x m l )  
  
 	 i f   @ r e t u r n X M L   =   1  
 	 	 s e l e c t   @ R D F   R D F  
  
 	 / * 	  
 	 	 d e c l a r e   @ d   d a t e t i m e  
 	 	 s e l e c t   @ d   =   g e t d a t e ( )  
 	 	 s e l e c t   d a t e d i f f ( m s , @ d , g e t d a t e ( ) )  
 	 * /  
 	 	  
 E N D  
  
  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ S e a r c h . C a c h e ] . [ P u b l i c . G e t C o n n e c t i o n ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ S e a r c h . C a c h e ] . [ P u b l i c . G e t C o n n e c t i o n ]  
 	 @ S e a r c h O p t i o n s   X M L ,  
 	 @ N o d e I D   B I G I N T   =   N U L L ,  
 	 @ N o d e U R I   V A R C H A R ( 4 0 0 )   =   N U L L ,  
 	 @ S e s s i o n I D   U N I Q U E I D E N T I F I E R   =   N U L L  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
 	 - -   s t a r t   t i m e r  
 	 d e c l a r e   @ d   d a t e t i m e  
 	 s e l e c t   @ d   =   G e t D a t e ( )  
  
 	 - -   g e t   t h e   N o d e I D  
 	 I F   ( @ N o d e I D   I S   N U L L )   A N D   ( @ N o d e U R I   I S   N O T   N U L L )  
 	 	 S E L E C T   @ N o d e I D   =   [ R D F . ] . f n U R I 2 N o d e I D ( @ N o d e U R I )  
 	 I F   @ N o d e I D   I S   N U L L  
 	 	 R E T U R N  
 	 S E L E C T   @ N o d e U R I   =   V a l u e  
 	 	 F R O M   [ R D F . ] . N o d e  
 	 	 W H E R E   N o d e I D   =   @ N o d e I D  
  
 	 - -   g e t   t h e   s e a r c h   s t r i n g  
 	 d e c l a r e   @ S e a r c h S t r i n g   v a r c h a r ( 5 0 0 )  
 	 d e c l a r e   @ D o E x p a n d e d S e a r c h   b i t  
 	 s e l e c t 	 @ S e a r c h S t r i n g   =   @ S e a r c h O p t i o n s . v a l u e ( ' S e a r c h O p t i o n s [ 1 ] / M a t c h O p t i o n s [ 1 ] / S e a r c h S t r i n g [ 1 ] ' , ' v a r c h a r ( 5 0 0 ) ' ) ,  
 	 	 	 @ D o E x p a n d e d S e a r c h   =   ( c a s e   w h e n   @ S e a r c h O p t i o n s . v a l u e ( ' S e a r c h O p t i o n s [ 1 ] / M a t c h O p t i o n s [ 1 ] / S e a r c h S t r i n g [ 1 ] / @ E x a c t M a t c h ' , ' v a r c h a r ( 5 0 ) ' )   =   ' t r u e '   t h e n   0   e l s e   1   e n d )  
  
 	 i f   @ S e a r c h S t r i n g   i s   n u l l  
 	 	 R E T U R N  
  
 	 - -   s e t   c o n s t a n t s  
 	 d e c l a r e   @ b a s e U R I   n v a r c h a r ( 4 0 0 )  
 	 d e c l a r e   @ t y p e I D   b i g i n t  
 	 d e c l a r e   @ l a b e l I D   b i g i n t  
 	 s e l e c t   @ b a s e U R I   =   v a l u e   f r o m   [ F r a m e w o r k . ] . P a r a m e t e r   w h e r e   P a r a m e t e r I D   =   ' b a s e U R I '  
 	 s e l e c t   @ t y p e I D   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # t y p e ' )  
 	 s e l e c t   @ l a b e l I D   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # l a b e l ' )  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   P a r s e   s e a r c h   s t r i n g   a n d   c o n v e r t   t o   f u l l t e x t   q u e r y  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	  
 	 d e c l a r e   @ N u m b e r O f P h r a s e s   I N T  
 	 d e c l a r e   @ C o m b i n e d S e a r c h S t r i n g   V A R C H A R ( 8 0 0 0 )  
 	 d e c l a r e   @ S e a r c h P h r a s e X M L   X M L  
 	 d e c l a r e   @ S e a r c h P h r a s e F o r m s X M L   X M L  
 	 d e c l a r e   @ P a r s e P r o c e s s T i m e   I N T  
  
 	 	  
 	 E X E C   [ S e a r c h . ] . [ P a r s e S e a r c h S t r i n g ] 	 @ S e a r c h S t r i n g   =   @ S e a r c h S t r i n g ,  
 	 	 	 	 	 	 	 	 	 	 @ N u m b e r O f P h r a s e s   =   @ N u m b e r O f P h r a s e s   O U T P U T ,  
 	 	 	 	 	 	 	 	 	 	 @ C o m b i n e d S e a r c h S t r i n g   =   @ C o m b i n e d S e a r c h S t r i n g   O U T P U T ,  
 	 	 	 	 	 	 	 	 	 	 @ S e a r c h P h r a s e X M L   =   @ S e a r c h P h r a s e X M L   O U T P U T ,  
 	 	 	 	 	 	 	 	 	 	 @ S e a r c h P h r a s e F o r m s X M L   =   @ S e a r c h P h r a s e F o r m s X M L   O U T P U T ,  
 	 	 	 	 	 	 	 	 	 	 @ P r o c e s s T i m e   =   @ P a r s e P r o c e s s T i m e   O U T P U T  
  
 	 d e c l a r e   @ P h r a s e L i s t   t a b l e   ( P h r a s e I D   i n t ,   P h r a s e   v a r c h a r ( m a x ) ,   T h e s a u r u s M a t c h   b i t ,   F o r m s   v a r c h a r ( m a x ) )  
 	 i n s e r t   i n t o   @ P h r a s e L i s t   ( P h r a s e I D ,   P h r a s e ,   T h e s a u r u s M a t c h ,   F o r m s )  
 	 s e l e c t 	 x . v a l u e ( ' @ I D ' , ' I N T ' ) ,  
 	 	 	 x . v a l u e ( ' . ' , ' V A R C H A R ( M A X ) ' ) ,  
 	 	 	 x . v a l u e ( ' @ T h e s a u r u s M a t c h ' , ' B I T ' ) ,  
 	 	 	 x . v a l u e ( ' @ F o r m s ' , ' V A R C H A R ( M A X ) ' )  
 	 	 f r o m   @ S e a r c h P h r a s e F o r m s X M L . n o d e s ( ' / / S e a r c h P h r a s e ' )   a s   p ( x )  
  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   F i n d   m a t c h i n g   n o d e s   c o n n e c t e d   t o   N o d e I D  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 - -   G e t   n o d e s   t h a t   m a t c h   s e p a r a t e   p h r a s e s  
 	 c r e a t e   t a b l e   # P h r a s e N o d e M a p   (  
 	 	 P h r a s e I D   i n t   n o t   n u l l ,  
 	 	 N o d e I D   b i g i n t   n o t   n u l l ,  
 	 	 M a t c h e d B y N o d e I D   b i g i n t   n o t   n u l l ,  
 	 	 D i s t a n c e   i n t ,  
 	 	 P a t h s   i n t ,  
 	 	 M a p W e i g h t   f l o a t ,  
 	 	 T e x t W e i g h t   f l o a t ,  
 	 	 W e i g h t   f l o a t  
 	 )  
 	 i f   ( @ D o E x p a n d e d S e a r c h   =   1 )  
 	 b e g i n  
 	 	 d e c l a r e   @ P h r a s e S e a r c h S t r i n g   v a r c h a r ( 8 0 0 0 )  
 	 	 d e c l a r e   @ l o o p   i n t  
 	 	 s e l e c t   @ l o o p   =   1  
 	 	 w h i l e   @ l o o p   < =   @ N u m b e r O f P h r a s e s  
 	 	 b e g i n  
 	 	 	 s e l e c t   @ P h r a s e S e a r c h S t r i n g   =   F o r m s  
 	 	 	 	 f r o m   @ P h r a s e L i s t  
 	 	 	 	 w h e r e   P h r a s e I D   =   @ l o o p  
 	 	 	 i n s e r t   i n t o   # P h r a s e N o d e M a p   ( P h r a s e I D ,   N o d e I D ,   M a t c h e d B y N o d e I D ,   D i s t a n c e ,   P a t h s ,   M a p W e i g h t ,   T e x t W e i g h t ,   W e i g h t )  
 	 	 	 	 s e l e c t   @ l o o p ,   s . N o d e I D ,   s . M a t c h e d B y N o d e I D ,   s . D i s t a n c e ,   s . P a t h s ,   s . W e i g h t ,   m . W e i g h t ,  
 	 	 	 	 	 	 ( c a s e   w h e n   s . W e i g h t * m . W e i g h t   >   0 . 9 9 9 9 9 9   t h e n   0 . 9 9 9 9 9 9   e l s e   s . W e i g h t * m . W e i g h t   e n d )   W e i g h t  
 	 	 	 	 	 f r o m   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e M a p ]   s ,   (  
 	 	 	 	 	 	 s e l e c t   [ K e y ]   N o d e I D ,   [ R a n k ] * 0 . 0 0 1   W e i g h t  
 	 	 	 	 	 	 	 f r o m   C o n t a i n s t a b l e   ( [ R D F . ] . N o d e ,   v a l u e ,   @ P h r a s e S e a r c h S t r i n g )   n  
 	 	 	 	 	 )   m  
 	 	 	 	 	 w h e r e   s . M a t c h e d B y N o d e I D   =   m . N o d e I D   a n d   s . N o d e I D   =   @ N o d e I D  
 	 	 	 s e l e c t   @ l o o p   =   @ l o o p   +   1  
 	 	 e n d  
 	 e n d  
 	 e l s e  
 	 b e g i n  
 	 	 i n s e r t   i n t o   # P h r a s e N o d e M a p   ( P h r a s e I D ,   N o d e I D ,   M a t c h e d B y N o d e I D ,   D i s t a n c e ,   P a t h s ,   M a p W e i g h t ,   T e x t W e i g h t ,   W e i g h t )  
 	 	 	 s e l e c t   1 ,   s . N o d e I D ,   s . M a t c h e d B y N o d e I D ,   s . D i s t a n c e ,   s . P a t h s ,   s . W e i g h t ,   m . W e i g h t ,  
 	 	 	 	 	 ( c a s e   w h e n   s . W e i g h t * m . W e i g h t   >   0 . 9 9 9 9 9 9   t h e n   0 . 9 9 9 9 9 9   e l s e   s . W e i g h t * m . W e i g h t   e n d )   W e i g h t  
 	 	 	 	 f r o m   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e M a p ]   s ,   (  
 	 	 	 	 	 s e l e c t   [ K e y ]   N o d e I D ,   [ R a n k ] * 0 . 0 0 1   W e i g h t  
 	 	 	 	 	 	 f r o m   C o n t a i n s t a b l e   ( [ R D F . ] . N o d e ,   v a l u e ,   @ C o m b i n e d S e a r c h S t r i n g )   n  
 	 	 	 	 )   m  
 	 	 	 	 w h e r e   s . M a t c h e d B y N o d e I D   =   m . N o d e I D   a n d   s . N o d e I D   =   @ N o d e I D  
 	 e n d  
  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   G e t   d e t a i l s   o n   t h e   m a t c h e s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	  
  
 	 ; W I T H   m   A S   (  
 	 	 S E L E C T   1   D i r e c t M a t c h ,   N o d e I D ,   N o d e I D   M i d d l e N o d e I D ,   M a t c h e d B y N o d e I D ,    
 	 	 	 	 C O U N T ( D I S T I N C T   P h r a s e I D )   P h r a s e s ,   1 - e x p ( s u m ( l o g ( 1 - W e i g h t ) ) )   W e i g h t  
 	 	 	 F R O M   # P h r a s e N o d e M a p  
 	 	 	 W H E R E   D i s t a n c e   =   1  
 	 	 	 G R O U P   B Y   N o d e I D ,   M a t c h e d B y N o d e I D  
 	 	 U N I O N   A L L  
 	 	 S E L E C T   0   D i r e c t M a t c h ,   d . N o d e I D ,   y . N o d e I D   M i d d l e N o d e I D ,   d . M a t c h e d B y N o d e I D ,  
 	 	 	 	 C O U N T ( D I S T I N C T   d . P h r a s e I D )   P h r a s e s ,   1 - e x p ( s u m ( l o g ( 1 - d . W e i g h t ) ) )   W e i g h t  
 	 	 	 F R O M   # P h r a s e N o d e M a p   d  
 	 	 	 	 I N N E R   J O I N   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e M a p ]   x  
 	 	 	 	 	 O N   x . N o d e I D   =   d . N o d e I D  
 	 	 	 	 	 	 A N D   x . D i s t a n c e   =   d . D i s t a n c e   -   1  
 	 	 	 	 I N N E R   J O I N   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e M a p ]   y  
 	 	 	 	 	 O N   y . N o d e I D   =   x . M a t c h e d B y N o d e I D  
 	 	 	 	 	 	 A N D   y . M a t c h e d B y N o d e I D   =   d . M a t c h e d B y N o d e I D  
 	 	 	 	 	 	 A N D   y . D i s t a n c e   =   1  
 	 	 	 W H E R E   d . D i s t a n c e   >   1  
 	 	 	 G R O U P   B Y   d . N o d e I D ,   d . M a t c h e d B y N o d e I D ,   y . N o d e I D  
 	 ) ,   w   a s   (  
 	 	 S E L E C T   D I S T I N C T   m . D i r e c t M a t c h ,   m . N o d e I D ,   m . M i d d l e N o d e I D ,   m . M a t c h e d B y N o d e I D ,   m . P h r a s e s ,   m . W e i g h t ,  
 	 	 	 p . _ P r o p e r t y L a b e l   P r o p e r t y L a b e l ,   p . _ P r o p e r t y N o d e   P r o p e r t y N o d e  
 	 	 F R O M   m  
 	 	 	 I N N E R   J O I N   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e C l a s s ]   c  
 	 	 	 	 O N   c . N o d e I D   =   m . M i d d l e N o d e I D  
 	 	 	 I N N E R   J O I N   [ O n t o l o g y . ] . [ C l a s s P r o p e r t y ]   p  
 	 	 	 	 O N   p . _ C l a s s N o d e   =   c . C l a s s  
 	 	 	 	 	 A N D   p . _ N e t w o r k P r o p e r t y N o d e   I S   N U L L  
 	 	 	 	 	 A N D   p . S e a r c h W e i g h t   >   0  
 	 	 	 I N N E R   J O I N   [ R D F . ] . T r i p l e   t  
 	 	 	 	 O N   t . s u b j e c t   =   m . M i d d l e N o d e I D  
 	 	 	 	 	 A N D   t . p r e d i c a t e   =   p . _ P r o p e r t y N o d e  
 	 	 	 	 	 A N D   t . o b j e c t   =   m . M a t c h e d B y N o d e I D  
 	 )  
 	 S E L E C T   w . D i r e c t M a t c h ,   w . P h r a s e s ,   w . W e i g h t ,  
 	 	 	 n . N o d e I D ,   n . V a l u e   U R I ,   c . S h o r t L a b e l   L a b e l ,   c . C l a s s N a m e ,    
 	 	 	 w . P r o p e r t y L a b e l   P r e d i c a t e ,    
 	 	 	 w . M a t c h e d B y N o d e I D ,   o . v a l u e   V a l u e  
 	 	 I N T O   # M a t c h D e t a i l s  
 	 	 F R O M   w  
 	 	 	 I N N E R   J O I N   [ R D F . ] . N o d e   n  
 	 	 	 	 O N   n . N o d e I D   =   w . M i d d l e N o d e I D  
 	 	 	 I N N E R   J O I N   [ S e a r c h . C a c h e ] . [ P u b l i c . N o d e S u m m a r y ]   c  
 	 	 	 	 O N   c . N o d e I D   =   w . M i d d l e N o d e I D  
 	 	 	 I N N E R   J O I N   [ R D F . ] . N o d e   o  
 	 	 	 	 O N   o . N o d e I D   =   w . M a t c h e d B y N o d e I D  
  
 	 U P D A T E   # M a t c h D e t a i l s  
 	 	 S E T   W e i g h t   =   ( C A S E   W H E N   W e i g h t   >   0 . 9 9 9 9 9 9   T H E N   9 9 9 9 9 9   W H E N   W e i g h t   <   0 . 0 0 0 0 0 1   T H E N   0 . 0 0 0 0 0 1   E L S E   W e i g h t   E N D )  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   B u i l d   C o n n e c t i o n D e t a i l s X M L  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 D E C L A R E   @ C o n n e c t i o n D e t a i l s X M L   X M L  
 	  
 	 ; W I T H   a   A S   (  
 	 	 S E L E C T   D i r e c t M a t c h ,   N o d e I D ,   U R I ,   L a b e l ,   C l a s s N a m e ,    
 	 	 	 	 C O U N T ( * )   N u m b e r O f P r o p e r t i e s ,   1 - e x p ( s u m ( l o g ( 1 - W e i g h t ) ) )   W e i g h t ,  
 	 	 	 	 (  
 	 	 	 	 	 S E L E C T 	 p . P r e d i c a t e   " N a m e " ,  
 	 	 	 	 	 	 	 p . P h r a s e s   " N u m b e r O f P h r a s e s " ,  
 	 	 	 	 	 	 	 p . W e i g h t   " W e i g h t " ,  
 	 	 	 	 	 	 	 p . V a l u e   " V a l u e " ,  
 	 	 	 	 	 	 	 (  
 	 	 	 	 	 	 	 	 S E L E C T   r . P h r a s e   " M a t c h e d P h r a s e "  
 	 	 	 	 	 	 	 	 F R O M   # P h r a s e N o d e M a p   q ,   @ P h r a s e L i s t   r  
 	 	 	 	 	 	 	 	 W H E R E   q . M a t c h e d B y N o d e I D   =   p . M a t c h e d B y N o d e I D  
 	 	 	 	 	 	 	 	 	 A N D   r . P h r a s e I D   =   q . P h r a s e I D  
 	 	 	 	 	 	 	 	 O R D E R   B Y   r . P h r a s e I D  
 	 	 	 	 	 	 	 	 F O R   X M L   P A T H ( ' ' ) ,   T Y P E  
 	 	 	 	 	 	 	 )   " M a t c h e d P h r a s e L i s t "  
 	 	 	 	 	 	 F R O M   # M a t c h D e t a i l s   p  
 	 	 	 	 	 	 W H E R E   p . D i r e c t M a t c h   =   m . D i r e c t M a t c h  
 	 	 	 	 	 	 	 A N D   p . N o d e I D   =   m . N o d e I D  
 	 	 	 	 	 	 O R D E R   B Y   p . P r e d i c a t e  
 	 	 	 	 	 	 F O R   X M L   P A T H ( ' P r o p e r t y ' ) ,   T Y P E  
 	 	 	 	 )   P r o p e r t y L i s t  
 	 	 	 F R O M   # M a t c h D e t a i l s   m  
 	 	 	 G R O U P   B Y   D i r e c t M a t c h ,   N o d e I D ,   U R I ,   L a b e l ,   C l a s s N a m e  
 	 )  
 	 S E L E C T   @ C o n n e c t i o n D e t a i l s X M L   =   (  
 	 	 S E L E C T 	 (  
 	 	 	 	 	 S E L E C T 	 N o d e I D   " N o d e I D " ,  
 	 	 	 	 	 	 	 U R I   " U R I " ,  
 	 	 	 	 	 	 	 L a b e l   " L a b e l " ,  
 	 	 	 	 	 	 	 C l a s s N a m e   " C l a s s N a m e " ,  
 	 	 	 	 	 	 	 N u m b e r O f P r o p e r t i e s   " N u m b e r O f P r o p e r t i e s " ,  
 	 	 	 	 	 	 	 W e i g h t   " W e i g h t " ,  
 	 	 	 	 	 	 	 P r o p e r t y L i s t   " P r o p e r t y L i s t "  
 	 	 	 	 	 F R O M   a  
 	 	 	 	 	 W H E R E   D i r e c t M a t c h   =   1  
 	 	 	 	 	 F O R   X M L   P A T H ( ' M a t c h ' ) ,   T Y P E  
 	 	 	 	 )   " D i r e c t M a t c h L i s t " ,  
 	 	 	 	 (  
 	 	 	 	 	 S E L E C T 	 N o d e I D   " N o d e I D " ,  
 	 	 	 	 	 	 	 U R I   " U R I " ,  
 	 	 	 	 	 	 	 L a b e l   " L a b e l " ,  
 	 	 	 	 	 	 	 C l a s s N a m e   " C l a s s N a m e " ,  
 	 	 	 	 	 	 	 N u m b e r O f P r o p e r t i e s   " N u m b e r O f P r o p e r t i e s " ,  
 	 	 	 	 	 	 	 W e i g h t   " W e i g h t " ,  
 	 	 	 	 	 	 	 P r o p e r t y L i s t   " P r o p e r t y L i s t "  
 	 	 	 	 	 F R O M   a  
 	 	 	 	 	 W H E R E   D i r e c t M a t c h   =   0  
 	 	 	 	 	 F O R   X M L   P A T H ( ' M a t c h ' ) ,   T Y P E  
 	 	 	 	 )   " I n d i r e c t M a t c h L i s t " 	 	 	 	  
 	 	 F O R   X M L   P A T H ( ' ' ) ,   T Y P E  
 	 )  
 	  
 	 - - S E L E C T   @ C o n n e c t i o n D e t a i l s X M L   C o n n e c t i o n D e t a i l s  
 	 - - S E L E C T   *   F R O M   # P h r a s e N o d e M a p  
  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   G e t   R D F   o f   t h e   N o d e I D  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 D E C L A R E   @ O b j e c t N o d e R D F   N V A R C H A R ( M A X )  
 	  
 	 E X E C   [ R D F . ] . G e t D a t a R D F 	 @ s u b j e c t   =   @ N o d e I D ,  
 	 	 	 	 	 	 	 @ s h o w D e t a i l s   =   0 ,  
 	 	 	 	 	 	 	 @ e x p a n d   =   0 ,  
 	 	 	 	 	 	 	 @ S e s s i o n I D   =   @ S e s s i o n I D ,  
 	 	 	 	 	 	 	 @ r e t u r n X M L   =   0 ,  
 	 	 	 	 	 	 	 @ d a t a S t r   =   @ O b j e c t N o d e R D F   O U T P U T  
  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   F o r m   s e a r c h   r e s u l t s   d e t a i l s   R D F  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 D E C L A R E   @ r e s u l t s   N V A R C H A R ( M A X )  
  
 	 S E L E C T   @ r e s u l t s   =   ' '  
 	 	 	 + ' < r d f : D e s c r i p t i o n   r d f : n o d e I D = " S e a r c h R e s u l t s D e t a i l s " > '  
 	 	 	 + ' < r d f : t y p e   r d f : r e s o u r c e = " h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # C o n n e c t i o n "   / > '  
 	 	 	 + ' < p r n s : c o n n e c t i o n I n N e t w o r k   r d f : N o d e I D = " S e a r c h R e s u l t s "   / > '  
 	 	 	 - - + ' < p r n s : c o n n e c t i o n W e i g h t > 0 . 3 7 7 4 4 < / p r n s : c o n n e c t i o n W e i g h t > '  
 	 	 	 + ' < p r n s : h a s C o n n e c t i o n D e t a i l s   r d f : N o d e I D = " C o n n e c t i o n D e t a i l s "   / > '  
 	 	 	 + ' < r d f : o b j e c t   r d f : r e s o u r c e = " ' + @ N o d e U R I + ' "   / > '  
 	 	 	 + ' < r d f s : l a b e l > S e a r c h   R e s u l t s   D e t a i l s < / r d f s : l a b e l > '  
 	 	 	 + ' < / r d f : D e s c r i p t i o n > '  
 	 	 	 + ' < r d f : D e s c r i p t i o n   r d f : n o d e I D = " S e a r c h R e s u l t s " > '  
 	 	 	 + ' < r d f : t y p e   r d f : r e s o u r c e = " h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # N e t w o r k "   / > '  
 	 	 	 + ' < r d f s : l a b e l > S e a r c h   R e s u l t s < / r d f s : l a b e l > '  
 	 	 	 + ' < v i v o : o v e r v i e w   r d f : p a r s e T y p e = " L i t e r a l " > '  
 	 	 	 + C A S T ( @ S e a r c h O p t i o n s   A S   N V A R C H A R ( M A X ) )  
 	 	 	 + I s N u l l ( ' < S e a r c h D e t a i l s > ' + C A S T ( @ S e a r c h P h r a s e X M L   A S   N V A R C H A R ( M A X ) ) + ' < / S e a r c h D e t a i l s > ' , ' ' )  
 	 	 	 + ' < / v i v o : o v e r v i e w > '  
 	 	 	 + ' < p r n s : h a s C o n n e c t i o n   r d f : n o d e I D = " S e a r c h R e s u l t s D e t a i l s "   / > '  
 	 	 	 + ' < / r d f : D e s c r i p t i o n > '  
 	 	 	 + I s N u l l ( @ O b j e c t N o d e R D F , ' ' )  
 	 	 	 + ' < r d f : D e s c r i p t i o n   r d f : N o d e I D = " C o n n e c t i o n D e t a i l s " > '  
 	 	 	 + ' < r d f : t y p e   r d f : r e s o u r c e = " h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # C o n n e c t i o n D e t a i l s "   / > '  
 	 	 	 + ' < v i v o : o v e r v i e w   r d f : p a r s e T y p e = " L i t e r a l " > '  
 	 	 	 + C A S T ( @ C o n n e c t i o n D e t a i l s X M L   A S   N V A R C H A R ( M A X ) )  
 	 	 	 + ' < / v i v o : o v e r v i e w > '  
 	 	 	 + ' < / r d f : D e s c r i p t i o n >   '  
  
 	 d e c l a r e   @ x   a s   v a r c h a r ( m a x )  
 	 s e l e c t   @ x   =   ' < r d f : R D F '  
 	 s e l e c t   @ x   =   @ x   +   '   x m l n s : ' + P r e f i x + ' = " ' + U R I + ' " '    
 	 	 f r o m   [ O n t o l o g y . ] . N a m e s p a c e  
 	 s e l e c t   @ x   =   @ x   +   '   > '   +   @ r e s u l t s   +   ' < / r d f : R D F > '  
 	 s e l e c t   c a s t ( @ x   a s   x m l )   R D F  
  
 / *  
  
  
 	 E X E C   [ S e a r c h . ] . [ G e t N o d e s ]   @ S e a r c h O p t i o n s   =   '  
 	 < S e a r c h O p t i o n s >  
 	 	 < M a t c h O p t i o n s >  
 	 	 	 < S e a r c h S t r i n g   E x a c t M a t c h = " f a l s e " > o p t i o n s   f o r   " l u n g   c a n c e r "   t r e a t m e n t < / S e a r c h S t r i n g >  
 	 	 	 < C l a s s U R I > h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / P e r s o n < / C l a s s U R I >  
 	 	 < / M a t c h O p t i o n s >  
 	 	 < O u t p u t O p t i o n s >  
 	 	 	 < O f f s e t > 0 < / O f f s e t >  
 	 	 	 < L i m i t > 5 < / L i m i t >  
 	 	 < / O u t p u t O p t i o n s > 	  
 	 < / S e a r c h O p t i o n s >  
 	 '  
  
 	 E X E C   [ S e a r c h . ] . [ G e t C o n n e c t i o n ]   @ S e a r c h O p t i o n s   =   '  
 	 < S e a r c h O p t i o n s >  
 	 	 < M a t c h O p t i o n s >  
 	 	 	 < S e a r c h S t r i n g   E x a c t M a t c h = " f a l s e " > o p t i o n s   f o r   " l u n g   c a n c e r "   t r e a t m e n t < / S e a r c h S t r i n g >  
 	 	 	 < C l a s s U R I > h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / P e r s o n < / C l a s s U R I >  
 	 	 < / M a t c h O p t i o n s >  
 	 	 < O u t p u t O p t i o n s >  
 	 	 	 < O f f s e t > 0 < / O f f s e t >  
 	 	 	 < L i m i t > 5 < / L i m i t >  
 	 	 < / O u t p u t O p t i o n s > 	  
 	 < / S e a r c h O p t i o n s >  
 	 ' ,   @ N o d e U R I   =   ' h t t p : / / l o c a l h o s t : 5 5 9 5 6 / p r o f i l e / 1 0 6 9 7 3 1 '  
  
  
 * /  
  
  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ S e a r c h . C a c h e ] . [ P r i v a t e . G e t C o n n e c t i o n ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ S e a r c h . C a c h e ] . [ P r i v a t e . G e t C o n n e c t i o n ]  
 	 @ S e a r c h O p t i o n s   X M L ,  
 	 @ N o d e I D   B I G I N T   =   N U L L ,  
 	 @ N o d e U R I   V A R C H A R ( 4 0 0 )   =   N U L L ,  
 	 @ S e s s i o n I D   U N I Q U E I D E N T I F I E R   =   N U L L  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
 	 - -   s t a r t   t i m e r  
 	 d e c l a r e   @ d   d a t e t i m e  
 	 s e l e c t   @ d   =   G e t D a t e ( )  
  
 	 - -   g e t   t h e   N o d e I D  
 	 I F   ( @ N o d e I D   I S   N U L L )   A N D   ( @ N o d e U R I   I S   N O T   N U L L )  
 	 	 S E L E C T   @ N o d e I D   =   [ R D F . ] . f n U R I 2 N o d e I D ( @ N o d e U R I )  
 	 I F   @ N o d e I D   I S   N U L L  
 	 	 R E T U R N  
 	 S E L E C T   @ N o d e U R I   =   V a l u e  
 	 	 F R O M   [ R D F . ] . N o d e  
 	 	 W H E R E   N o d e I D   =   @ N o d e I D  
  
 	 - -   g e t   t h e   s e a r c h   s t r i n g  
 	 d e c l a r e   @ S e a r c h S t r i n g   v a r c h a r ( 5 0 0 )  
 	 d e c l a r e   @ D o E x p a n d e d S e a r c h   b i t  
 	 s e l e c t 	 @ S e a r c h S t r i n g   =   @ S e a r c h O p t i o n s . v a l u e ( ' S e a r c h O p t i o n s [ 1 ] / M a t c h O p t i o n s [ 1 ] / S e a r c h S t r i n g [ 1 ] ' , ' v a r c h a r ( 5 0 0 ) ' ) ,  
 	 	 	 @ D o E x p a n d e d S e a r c h   =   ( c a s e   w h e n   @ S e a r c h O p t i o n s . v a l u e ( ' S e a r c h O p t i o n s [ 1 ] / M a t c h O p t i o n s [ 1 ] / S e a r c h S t r i n g [ 1 ] / @ E x a c t M a t c h ' , ' v a r c h a r ( 5 0 ) ' )   =   ' t r u e '   t h e n   0   e l s e   1   e n d )  
  
 	 i f   @ S e a r c h S t r i n g   i s   n u l l  
 	 	 R E T U R N  
  
 	 - -   s e t   c o n s t a n t s  
 	 d e c l a r e   @ b a s e U R I   n v a r c h a r ( 4 0 0 )  
 	 d e c l a r e   @ t y p e I D   b i g i n t  
 	 d e c l a r e   @ l a b e l I D   b i g i n t  
 	 s e l e c t   @ b a s e U R I   =   v a l u e   f r o m   [ F r a m e w o r k . ] . P a r a m e t e r   w h e r e   P a r a m e t e r I D   =   ' b a s e U R I '  
 	 s e l e c t   @ t y p e I D   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # t y p e ' )  
 	 s e l e c t   @ l a b e l I D   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # l a b e l ' )  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   P a r s e   s e a r c h   s t r i n g   a n d   c o n v e r t   t o   f u l l t e x t   q u e r y  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	  
 	 d e c l a r e   @ N u m b e r O f P h r a s e s   I N T  
 	 d e c l a r e   @ C o m b i n e d S e a r c h S t r i n g   V A R C H A R ( 8 0 0 0 )  
 	 d e c l a r e   @ S e a r c h P h r a s e X M L   X M L  
 	 d e c l a r e   @ S e a r c h P h r a s e F o r m s X M L   X M L  
 	 d e c l a r e   @ P a r s e P r o c e s s T i m e   I N T  
  
 	 	  
 	 E X E C   [ S e a r c h . ] . [ P a r s e S e a r c h S t r i n g ] 	 @ S e a r c h S t r i n g   =   @ S e a r c h S t r i n g ,  
 	 	 	 	 	 	 	 	 	 	 @ N u m b e r O f P h r a s e s   =   @ N u m b e r O f P h r a s e s   O U T P U T ,  
 	 	 	 	 	 	 	 	 	 	 @ C o m b i n e d S e a r c h S t r i n g   =   @ C o m b i n e d S e a r c h S t r i n g   O U T P U T ,  
 	 	 	 	 	 	 	 	 	 	 @ S e a r c h P h r a s e X M L   =   @ S e a r c h P h r a s e X M L   O U T P U T ,  
 	 	 	 	 	 	 	 	 	 	 @ S e a r c h P h r a s e F o r m s X M L   =   @ S e a r c h P h r a s e F o r m s X M L   O U T P U T ,  
 	 	 	 	 	 	 	 	 	 	 @ P r o c e s s T i m e   =   @ P a r s e P r o c e s s T i m e   O U T P U T  
  
 	 d e c l a r e   @ P h r a s e L i s t   t a b l e   ( P h r a s e I D   i n t ,   P h r a s e   v a r c h a r ( m a x ) ,   T h e s a u r u s M a t c h   b i t ,   F o r m s   v a r c h a r ( m a x ) )  
 	 i n s e r t   i n t o   @ P h r a s e L i s t   ( P h r a s e I D ,   P h r a s e ,   T h e s a u r u s M a t c h ,   F o r m s )  
 	 s e l e c t 	 x . v a l u e ( ' @ I D ' , ' I N T ' ) ,  
 	 	 	 x . v a l u e ( ' . ' , ' V A R C H A R ( M A X ) ' ) ,  
 	 	 	 x . v a l u e ( ' @ T h e s a u r u s M a t c h ' , ' B I T ' ) ,  
 	 	 	 x . v a l u e ( ' @ F o r m s ' , ' V A R C H A R ( M A X ) ' )  
 	 	 f r o m   @ S e a r c h P h r a s e F o r m s X M L . n o d e s ( ' / / S e a r c h P h r a s e ' )   a s   p ( x )  
  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   F i n d   m a t c h i n g   n o d e s   c o n n e c t e d   t o   N o d e I D  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
  
 	 - -   G e t   n o d e s   t h a t   m a t c h   s e p a r a t e   p h r a s e s  
 	 c r e a t e   t a b l e   # P h r a s e N o d e M a p   (  
 	 	 P h r a s e I D   i n t   n o t   n u l l ,  
 	 	 N o d e I D   b i g i n t   n o t   n u l l ,  
 	 	 M a t c h e d B y N o d e I D   b i g i n t   n o t   n u l l ,  
 	 	 D i s t a n c e   i n t ,  
 	 	 P a t h s   i n t ,  
 	 	 M a p W e i g h t   f l o a t ,  
 	 	 T e x t W e i g h t   f l o a t ,  
 	 	 W e i g h t   f l o a t  
 	 )  
 	 i f   ( @ D o E x p a n d e d S e a r c h   =   1 )  
 	 b e g i n  
 	 	 d e c l a r e   @ P h r a s e S e a r c h S t r i n g   v a r c h a r ( 8 0 0 0 )  
 	 	 d e c l a r e   @ l o o p   i n t  
 	 	 s e l e c t   @ l o o p   =   1  
 	 	 w h i l e   @ l o o p   < =   @ N u m b e r O f P h r a s e s  
 	 	 b e g i n  
 	 	 	 s e l e c t   @ P h r a s e S e a r c h S t r i n g   =   F o r m s  
 	 	 	 	 f r o m   @ P h r a s e L i s t  
 	 	 	 	 w h e r e   P h r a s e I D   =   @ l o o p  
 	 	 	 i n s e r t   i n t o   # P h r a s e N o d e M a p   ( P h r a s e I D ,   N o d e I D ,   M a t c h e d B y N o d e I D ,   D i s t a n c e ,   P a t h s ,   M a p W e i g h t ,   T e x t W e i g h t ,   W e i g h t )  
 	 	 	 	 s e l e c t   @ l o o p ,   s . N o d e I D ,   s . M a t c h e d B y N o d e I D ,   s . D i s t a n c e ,   s . P a t h s ,   s . W e i g h t ,   m . W e i g h t ,  
 	 	 	 	 	 	 ( c a s e   w h e n   s . W e i g h t * m . W e i g h t   >   0 . 9 9 9 9 9 9   t h e n   0 . 9 9 9 9 9 9   e l s e   s . W e i g h t * m . W e i g h t   e n d )   W e i g h t  
 	 	 	 	 	 f r o m   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e M a p ]   s ,   (  
 	 	 	 	 	 	 s e l e c t   [ K e y ]   N o d e I D ,   [ R a n k ] * 0 . 0 0 1   W e i g h t  
 	 	 	 	 	 	 	 f r o m   C o n t a i n s t a b l e   ( [ R D F . ] . N o d e ,   v a l u e ,   @ P h r a s e S e a r c h S t r i n g )   n  
 	 	 	 	 	 )   m  
 	 	 	 	 	 w h e r e   s . M a t c h e d B y N o d e I D   =   m . N o d e I D   a n d   s . N o d e I D   =   @ N o d e I D  
 	 	 	 s e l e c t   @ l o o p   =   @ l o o p   +   1  
 	 	 e n d  
 	 e n d  
 	 e l s e  
 	 b e g i n  
 	 	 i n s e r t   i n t o   # P h r a s e N o d e M a p   ( P h r a s e I D ,   N o d e I D ,   M a t c h e d B y N o d e I D ,   D i s t a n c e ,   P a t h s ,   M a p W e i g h t ,   T e x t W e i g h t ,   W e i g h t )  
 	 	 	 s e l e c t   1 ,   s . N o d e I D ,   s . M a t c h e d B y N o d e I D ,   s . D i s t a n c e ,   s . P a t h s ,   s . W e i g h t ,   m . W e i g h t ,  
 	 	 	 	 	 ( c a s e   w h e n   s . W e i g h t * m . W e i g h t   >   0 . 9 9 9 9 9 9   t h e n   0 . 9 9 9 9 9 9   e l s e   s . W e i g h t * m . W e i g h t   e n d )   W e i g h t  
 	 	 	 	 f r o m   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e M a p ]   s ,   (  
 	 	 	 	 	 s e l e c t   [ K e y ]   N o d e I D ,   [ R a n k ] * 0 . 0 0 1   W e i g h t  
 	 	 	 	 	 	 f r o m   C o n t a i n s t a b l e   ( [ R D F . ] . N o d e ,   v a l u e ,   @ C o m b i n e d S e a r c h S t r i n g )   n  
 	 	 	 	 )   m  
 	 	 	 	 w h e r e   s . M a t c h e d B y N o d e I D   =   m . N o d e I D   a n d   s . N o d e I D   =   @ N o d e I D  
 	 e n d  
  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   G e t   d e t a i l s   o n   t h e   m a t c h e s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	  
  
 	 ; W I T H   m   A S   (  
 	 	 S E L E C T   1   D i r e c t M a t c h ,   N o d e I D ,   N o d e I D   M i d d l e N o d e I D ,   M a t c h e d B y N o d e I D ,    
 	 	 	 	 C O U N T ( D I S T I N C T   P h r a s e I D )   P h r a s e s ,   1 - e x p ( s u m ( l o g ( 1 - W e i g h t ) ) )   W e i g h t  
 	 	 	 F R O M   # P h r a s e N o d e M a p  
 	 	 	 W H E R E   D i s t a n c e   =   1  
 	 	 	 G R O U P   B Y   N o d e I D ,   M a t c h e d B y N o d e I D  
 	 	 U N I O N   A L L  
 	 	 S E L E C T   0   D i r e c t M a t c h ,   d . N o d e I D ,   y . N o d e I D   M i d d l e N o d e I D ,   d . M a t c h e d B y N o d e I D ,  
 	 	 	 	 C O U N T ( D I S T I N C T   d . P h r a s e I D )   P h r a s e s ,   1 - e x p ( s u m ( l o g ( 1 - d . W e i g h t ) ) )   W e i g h t  
 	 	 	 F R O M   # P h r a s e N o d e M a p   d  
 	 	 	 	 I N N E R   J O I N   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e M a p ]   x  
 	 	 	 	 	 O N   x . N o d e I D   =   d . N o d e I D  
 	 	 	 	 	 	 A N D   x . D i s t a n c e   =   d . D i s t a n c e   -   1  
 	 	 	 	 I N N E R   J O I N   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e M a p ]   y  
 	 	 	 	 	 O N   y . N o d e I D   =   x . M a t c h e d B y N o d e I D  
 	 	 	 	 	 	 A N D   y . M a t c h e d B y N o d e I D   =   d . M a t c h e d B y N o d e I D  
 	 	 	 	 	 	 A N D   y . D i s t a n c e   =   1  
 	 	 	 W H E R E   d . D i s t a n c e   >   1  
 	 	 	 G R O U P   B Y   d . N o d e I D ,   d . M a t c h e d B y N o d e I D ,   y . N o d e I D  
 	 ) ,   w   a s   (  
 	 	 S E L E C T   D I S T I N C T   m . D i r e c t M a t c h ,   m . N o d e I D ,   m . M i d d l e N o d e I D ,   m . M a t c h e d B y N o d e I D ,   m . P h r a s e s ,   m . W e i g h t ,  
 	 	 	 p . _ P r o p e r t y L a b e l   P r o p e r t y L a b e l ,   p . _ P r o p e r t y N o d e   P r o p e r t y N o d e  
 	 	 F R O M   m  
 	 	 	 I N N E R   J O I N   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e C l a s s ]   c  
 	 	 	 	 O N   c . N o d e I D   =   m . M i d d l e N o d e I D  
 	 	 	 I N N E R   J O I N   [ O n t o l o g y . ] . [ C l a s s P r o p e r t y ]   p  
 	 	 	 	 O N   p . _ C l a s s N o d e   =   c . C l a s s  
 	 	 	 	 	 A N D   p . _ N e t w o r k P r o p e r t y N o d e   I S   N U L L  
 	 	 	 	 	 A N D   p . S e a r c h W e i g h t   >   0  
 	 	 	 I N N E R   J O I N   [ R D F . ] . T r i p l e   t  
 	 	 	 	 O N   t . s u b j e c t   =   m . M i d d l e N o d e I D  
 	 	 	 	 	 A N D   t . p r e d i c a t e   =   p . _ P r o p e r t y N o d e  
 	 	 	 	 	 A N D   t . o b j e c t   =   m . M a t c h e d B y N o d e I D  
 	 )  
 	 S E L E C T   w . D i r e c t M a t c h ,   w . P h r a s e s ,   w . W e i g h t ,  
 	 	 	 n . N o d e I D ,   n . V a l u e   U R I ,   c . S h o r t L a b e l   L a b e l ,   c . C l a s s N a m e ,    
 	 	 	 w . P r o p e r t y L a b e l   P r e d i c a t e ,    
 	 	 	 w . M a t c h e d B y N o d e I D ,   o . v a l u e   V a l u e  
 	 	 I N T O   # M a t c h D e t a i l s  
 	 	 F R O M   w  
 	 	 	 I N N E R   J O I N   [ R D F . ] . N o d e   n  
 	 	 	 	 O N   n . N o d e I D   =   w . M i d d l e N o d e I D  
 	 	 	 I N N E R   J O I N   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e S u m m a r y ]   c  
 	 	 	 	 O N   c . N o d e I D   =   w . M i d d l e N o d e I D  
 	 	 	 I N N E R   J O I N   [ R D F . ] . N o d e   o  
 	 	 	 	 O N   o . N o d e I D   =   w . M a t c h e d B y N o d e I D  
  
 	 U P D A T E   # M a t c h D e t a i l s  
 	 	 S E T   W e i g h t   =   ( C A S E   W H E N   W e i g h t   >   0 . 9 9 9 9 9 9   T H E N   9 9 9 9 9 9   W H E N   W e i g h t   <   0 . 0 0 0 0 0 1   T H E N   0 . 0 0 0 0 0 1   E L S E   W e i g h t   E N D )  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   B u i l d   C o n n e c t i o n D e t a i l s X M L  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 D E C L A R E   @ C o n n e c t i o n D e t a i l s X M L   X M L  
 	  
 	 ; W I T H   a   A S   (  
 	 	 S E L E C T   D i r e c t M a t c h ,   N o d e I D ,   U R I ,   L a b e l ,   C l a s s N a m e ,    
 	 	 	 	 C O U N T ( * )   N u m b e r O f P r o p e r t i e s ,   1 - e x p ( s u m ( l o g ( 1 - W e i g h t ) ) )   W e i g h t ,  
 	 	 	 	 (  
 	 	 	 	 	 S E L E C T 	 p . P r e d i c a t e   " N a m e " ,  
 	 	 	 	 	 	 	 p . P h r a s e s   " N u m b e r O f P h r a s e s " ,  
 	 	 	 	 	 	 	 p . W e i g h t   " W e i g h t " ,  
 	 	 	 	 	 	 	 p . V a l u e   " V a l u e " ,  
 	 	 	 	 	 	 	 (  
 	 	 	 	 	 	 	 	 S E L E C T   r . P h r a s e   " M a t c h e d P h r a s e "  
 	 	 	 	 	 	 	 	 F R O M   # P h r a s e N o d e M a p   q ,   @ P h r a s e L i s t   r  
 	 	 	 	 	 	 	 	 W H E R E   q . M a t c h e d B y N o d e I D   =   p . M a t c h e d B y N o d e I D  
 	 	 	 	 	 	 	 	 	 A N D   r . P h r a s e I D   =   q . P h r a s e I D  
 	 	 	 	 	 	 	 	 O R D E R   B Y   r . P h r a s e I D  
 	 	 	 	 	 	 	 	 F O R   X M L   P A T H ( ' ' ) ,   T Y P E  
 	 	 	 	 	 	 	 )   " M a t c h e d P h r a s e L i s t "  
 	 	 	 	 	 	 F R O M   # M a t c h D e t a i l s   p  
 	 	 	 	 	 	 W H E R E   p . D i r e c t M a t c h   =   m . D i r e c t M a t c h  
 	 	 	 	 	 	 	 A N D   p . N o d e I D   =   m . N o d e I D  
 	 	 	 	 	 	 O R D E R   B Y   p . P r e d i c a t e  
 	 	 	 	 	 	 F O R   X M L   P A T H ( ' P r o p e r t y ' ) ,   T Y P E  
 	 	 	 	 )   P r o p e r t y L i s t  
 	 	 	 F R O M   # M a t c h D e t a i l s   m  
 	 	 	 G R O U P   B Y   D i r e c t M a t c h ,   N o d e I D ,   U R I ,   L a b e l ,   C l a s s N a m e  
 	 )  
 	 S E L E C T   @ C o n n e c t i o n D e t a i l s X M L   =   (  
 	 	 S E L E C T 	 (  
 	 	 	 	 	 S E L E C T 	 N o d e I D   " N o d e I D " ,  
 	 	 	 	 	 	 	 U R I   " U R I " ,  
 	 	 	 	 	 	 	 L a b e l   " L a b e l " ,  
 	 	 	 	 	 	 	 C l a s s N a m e   " C l a s s N a m e " ,  
 	 	 	 	 	 	 	 N u m b e r O f P r o p e r t i e s   " N u m b e r O f P r o p e r t i e s " ,  
 	 	 	 	 	 	 	 W e i g h t   " W e i g h t " ,  
 	 	 	 	 	 	 	 P r o p e r t y L i s t   " P r o p e r t y L i s t "  
 	 	 	 	 	 F R O M   a  
 	 	 	 	 	 W H E R E   D i r e c t M a t c h   =   1  
 	 	 	 	 	 F O R   X M L   P A T H ( ' M a t c h ' ) ,   T Y P E  
 	 	 	 	 )   " D i r e c t M a t c h L i s t " ,  
 	 	 	 	 (  
 	 	 	 	 	 S E L E C T 	 N o d e I D   " N o d e I D " ,  
 	 	 	 	 	 	 	 U R I   " U R I " ,  
 	 	 	 	 	 	 	 L a b e l   " L a b e l " ,  
 	 	 	 	 	 	 	 C l a s s N a m e   " C l a s s N a m e " ,  
 	 	 	 	 	 	 	 N u m b e r O f P r o p e r t i e s   " N u m b e r O f P r o p e r t i e s " ,  
 	 	 	 	 	 	 	 W e i g h t   " W e i g h t " ,  
 	 	 	 	 	 	 	 P r o p e r t y L i s t   " P r o p e r t y L i s t "  
 	 	 	 	 	 F R O M   a  
 	 	 	 	 	 W H E R E   D i r e c t M a t c h   =   0  
 	 	 	 	 	 F O R   X M L   P A T H ( ' M a t c h ' ) ,   T Y P E  
 	 	 	 	 )   " I n d i r e c t M a t c h L i s t " 	 	 	 	  
 	 	 F O R   X M L   P A T H ( ' ' ) ,   T Y P E  
 	 )  
 	  
 	 - - S E L E C T   @ C o n n e c t i o n D e t a i l s X M L   C o n n e c t i o n D e t a i l s  
 	 - - S E L E C T   *   F R O M   # P h r a s e N o d e M a p  
  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   G e t   R D F   o f   t h e   N o d e I D  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 D E C L A R E   @ O b j e c t N o d e R D F   N V A R C H A R ( M A X )  
 	  
 	 E X E C   [ R D F . ] . G e t D a t a R D F 	 @ s u b j e c t   =   @ N o d e I D ,  
 	 	 	 	 	 	 	 @ s h o w D e t a i l s   =   0 ,  
 	 	 	 	 	 	 	 @ e x p a n d   =   0 ,  
 	 	 	 	 	 	 	 @ S e s s i o n I D   =   @ S e s s i o n I D ,  
 	 	 	 	 	 	 	 @ r e t u r n X M L   =   0 ,  
 	 	 	 	 	 	 	 @ d a t a S t r   =   @ O b j e c t N o d e R D F   O U T P U T  
  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   F o r m   s e a r c h   r e s u l t s   d e t a i l s   R D F  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 D E C L A R E   @ r e s u l t s   N V A R C H A R ( M A X )  
  
 	 S E L E C T   @ r e s u l t s   =   ' '  
 	 	 	 + ' < r d f : D e s c r i p t i o n   r d f : n o d e I D = " S e a r c h R e s u l t s D e t a i l s " > '  
 	 	 	 + ' < r d f : t y p e   r d f : r e s o u r c e = " h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # C o n n e c t i o n "   / > '  
 	 	 	 + ' < p r n s : c o n n e c t i o n I n N e t w o r k   r d f : N o d e I D = " S e a r c h R e s u l t s "   / > '  
 	 	 	 - - + ' < p r n s : c o n n e c t i o n W e i g h t > 0 . 3 7 7 4 4 < / p r n s : c o n n e c t i o n W e i g h t > '  
 	 	 	 + ' < p r n s : h a s C o n n e c t i o n D e t a i l s   r d f : N o d e I D = " C o n n e c t i o n D e t a i l s "   / > '  
 	 	 	 + ' < r d f : o b j e c t   r d f : r e s o u r c e = " ' + @ N o d e U R I + ' "   / > '  
 	 	 	 + ' < r d f s : l a b e l > S e a r c h   R e s u l t s   D e t a i l s < / r d f s : l a b e l > '  
 	 	 	 + ' < / r d f : D e s c r i p t i o n > '  
 	 	 	 + ' < r d f : D e s c r i p t i o n   r d f : n o d e I D = " S e a r c h R e s u l t s " > '  
 	 	 	 + ' < r d f : t y p e   r d f : r e s o u r c e = " h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # N e t w o r k "   / > '  
 	 	 	 + ' < r d f s : l a b e l > S e a r c h   R e s u l t s < / r d f s : l a b e l > '  
 	 	 	 + ' < v i v o : o v e r v i e w   r d f : p a r s e T y p e = " L i t e r a l " > '  
 	 	 	 + C A S T ( @ S e a r c h O p t i o n s   A S   N V A R C H A R ( M A X ) )  
 	 	 	 + I s N u l l ( ' < S e a r c h D e t a i l s > ' + C A S T ( @ S e a r c h P h r a s e X M L   A S   N V A R C H A R ( M A X ) ) + ' < / S e a r c h D e t a i l s > ' , ' ' )  
 	 	 	 + ' < / v i v o : o v e r v i e w > '  
 	 	 	 + ' < p r n s : h a s C o n n e c t i o n   r d f : n o d e I D = " S e a r c h R e s u l t s D e t a i l s "   / > '  
 	 	 	 + ' < / r d f : D e s c r i p t i o n > '  
 	 	 	 + I s N u l l ( @ O b j e c t N o d e R D F , ' ' )  
 	 	 	 + ' < r d f : D e s c r i p t i o n   r d f : N o d e I D = " C o n n e c t i o n D e t a i l s " > '  
 	 	 	 + ' < r d f : t y p e   r d f : r e s o u r c e = " h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # C o n n e c t i o n D e t a i l s "   / > '  
 	 	 	 + ' < v i v o : o v e r v i e w   r d f : p a r s e T y p e = " L i t e r a l " > '  
 	 	 	 + C A S T ( @ C o n n e c t i o n D e t a i l s X M L   A S   N V A R C H A R ( M A X ) )  
 	 	 	 + ' < / v i v o : o v e r v i e w > '  
 	 	 	 + ' < / r d f : D e s c r i p t i o n >   '  
  
 	 d e c l a r e   @ x   a s   v a r c h a r ( m a x )  
 	 s e l e c t   @ x   =   ' < r d f : R D F '  
 	 s e l e c t   @ x   =   @ x   +   '   x m l n s : ' + P r e f i x + ' = " ' + U R I + ' " '    
 	 	 f r o m   [ O n t o l o g y . ] . N a m e s p a c e  
 	 s e l e c t   @ x   =   @ x   +   '   > '   +   @ r e s u l t s   +   ' < / r d f : R D F > '  
 	 s e l e c t   c a s t ( @ x   a s   x m l )   R D F  
  
  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ S e a r c h . ] . [ G e t C o n n e c t i o n ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ S e a r c h . ] . [ G e t C o n n e c t i o n ]  
 	 @ S e a r c h O p t i o n s   X M L ,  
 	 @ N o d e I D   B I G I N T   =   N U L L ,  
 	 @ N o d e U R I   V A R C H A R ( 4 0 0 )   =   N U L L ,  
 	 @ S e s s i o n I D   U N I Q U E I D E N T I F I E R   =   N U L L ,  
 	 @ U s e C a c h e   V A R C H A R ( 5 0 )   =   ' P u b l i c '  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
 	 - -   D e t e r m i n e   t h e   c a c h e   t y p e   i f   s e t   t o   a u t o  
 	 I F   I s N u l l ( @ U s e C a c h e , ' A u t o ' )   I N   ( ' ' , ' A u t o ' )  
 	 B E G I N  
 	 	 D E C L A R E   @ S e c u r i t y G r o u p I D   B I G I N T ,   @ H a s S p e c i a l V i e w A c c e s s   B I T  
 	 	 E X E C   [ R D F . S e c u r i t y ] . G e t S e s s i o n S e c u r i t y G r o u p   @ S e s s i o n I D ,   @ S e c u r i t y G r o u p I D   O U T P U T ,   @ H a s S p e c i a l V i e w A c c e s s   O U T P U T  
 	 	 S E L E C T   @ U s e C a c h e   =   ( C A S E   W H E N   @ S e c u r i t y G r o u p I D   < =   - 3 0   T H E N   ' P r i v a t e '   E L S E   ' P u b l i c '   E N D )  
 	 E N D  
  
 	 - -   G e t   c o n n e c t i o n   b a s e d   o n   t h e   c a c h e   t y p e  
 	 I F   @ U s e C a c h e   =   ' P u b l i c '  
 	 	 E X E C   [ S e a r c h . C a c h e ] . [ P u b l i c . G e t C o n n e c t i o n ]   @ S e a r c h O p t i o n s   =   @ S e a r c h O p t i o n s ,   @ N o d e I D   =   @ N o d e I D ,   @ N o d e U R I   =   @ N o d e U R I ,   @ S e s s i o n I D   =   @ S e s s i o n I D  
 	 E L S E   I F   @ U s e C a c h e   =   ' P r i v a t e '  
 	 	 E X E C   [ S e a r c h . C a c h e ] . [ P r i v a t e . G e t C o n n e c t i o n ]   @ S e a r c h O p t i o n s   =   @ S e a r c h O p t i o n s ,   @ N o d e I D   =   @ N o d e I D ,   @ N o d e U R I   =   @ N o d e U R I ,   @ S e s s i o n I D   =   @ S e s s i o n I D  
  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A l t e r i n g   [ R D F . S t a g e ] . [ P r o c e s s T r i p l e s ] '  
 G O  
 A L T E R   p r o c e d u r e   [ R D F . S t a g e ] . [ P r o c e s s T r i p l e s ]  
 	 @ P r o c e s s A l l   b i t   =   1 ,  
 	 @ S h o w C o u n t s   b i t   =   0 ,  
 	 @ P r o c e s s L i m i t   b i g i n t   =   1 0 0 0 0 0 0 ,  
 	 @ I s R u n n i n g I n L o o p   b i t   =   0  
 A S  
  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
    
 	 / *    
    
 	 T h i s   s t o r e d   p r o c e d u r e   c o n v e r t s   t r i p l e s   d e f i n e d   i n   [ R D F . S t a g e ] . T r i p l e   i n t o    
 	 r e c o r d s   i n   [ R D F . ] . N o d e   a n d   [ R D F . ] . T r i p l e   a n d   u p d a t e s   I s P u b l i c   a n d   o t h e r   a t t r i b u t e s  
 	 o n   e x i s t i n g   r e c o r d s .  
    
 	 T h e   s u b j e c t ,   p r e d i c a t e ,   a n d   o b j e c t   o f   a   t r i p l e   c a n   b e   d e f i n e d   i n   d i f f e r e n t   w a y s :  
 	 	 S u b j e c t  
 	 	 	 C a t   0 :   s N o d e I D   ( f r o m   [ R D F . ] . N o d e )  
 	 	 	 C a t   1 :   s U R I  
 	 	 	 C a t   2 :   s N o d e T y p e   ( p r i m a r y   V I V O   t y p e ,   h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / P e r s o n ) ,   s I n t e r n a l T y p e   ( P r o f i l e s 1 0   t y p e ,   s u c h   a s   " P e r s o n " ) ,   s I n t e r n a l I D   ( p e r s o n I D = 3 2 2 1 3 )  
 	 	 	 C a t   3 :   s T r i p l e I D   ( f r o m   [ R D F . ] . T r i p l e   - -   a   r e i t i f i c a t i o n )  
 	 	 	 C a t   4 :   s S t a g e T r i p l e I D   ( f r o m   [ R D F . S t a g e . ] . T r i p l e   - -   a   r e i t i f i c a t i o n   o f   a   t r i p l e   n o t   y e t   l o a d e d )  
 	 	 P r e d i c a t e  
 	 	 	 C a t   0 :   p N o d e I D   ( f r o m   [ R D F . ] . N o d e )  
 	 	 	 C a t   1 :   p P r o p e r t y   ( a   V I V O   p r o p e r t y ,   s u c h   a s   h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # t y p e   o r   h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / f i r s t N a m e )  
 	 	 O b j e c t  
 	 	 	 C a t   0 :   o N o d e I D   ( f r o m   [ R D F . ] . N o d e )  
 	 	 	 C a t   1 :   o V a l u e ,   o L a n g u a g e ,   o D a t a T y p e ,   o O b j e c t T y p e   ( s t a n d a r d   R D F   l i t e r a l   [ o O b j e c t T y p e = 1 ] ,   o r   j u s t   o V a l u e   i f   U R I   [ o O b j e c t T y p e = 0 ] )  
 	 	 	 C a t   2 :   o N o d e T y p e   ( p r i m a r y   V I V O   t y p e ,   h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / P e r s o n ) ,   o I n t e r n a l T y p e   ( P r o f i l e s 1 0   t y p e ,   s u c h   a s   " P e r s o n " ) ,   o I n t e r n a l I D   ( p e r s o n I D = 3 2 2 1 3 )  
 	 	 	 C a t   3 :   o T r i p l e I D   ( f r o m   [ R D F . ] . T r i p l e   - -   a   r e i t i f i c a t i o n )  
 	 	 	 C a t   4 :   o S t a g e T r i p l e I D   ( f r o m   [ R D F . S t a g e . ] . T r i p l e   - -   a   r e i t i f i c a t i o n   o f   a   t r i p l e   n o t   y e t   l o a d e d )  
 	 	 	 C a t   5 :   o S t a r t T i m e ,   o E n d T i m e ,   o T i m e P r e c i s i o n   ( V I V O ' s   D a t e T i m e I n t e r v a l ,   D a t e T i m e V a l u e ,   a n d   D a t e T i m e V a l u e P r e c i s i o n   c l a s s e s )  
 	 	 	 C a t   6 :   o S t a r t T i m e ,   o T i m e P r e c i s i o n   ( V I V O ' s   D a t e T i m e V a l u e ,   a n d   D a t e T i m e V a l u e P r e c i s i o n   c l a s s e s )  
    
 	 T h e   f o l l o w i n g   a r e   a l s o   r e l a t e d   t o   a   t r i p l e :  
 	 	 s I s P u b l i c   =   1   ( s e c u r i t y   o f   s u b j e c t )  
 	 	 p I s P u b l i c   =   1   ( s e c u r i t y   o f   p r e d i c a t e )  
 	 	 o I s P u b l i c   =   1   ( s e c u r i t y   o f   o b j e c t )  
 	 	 t I s P u b l i c   =   1   ( s e c u r i t y   o f   t r i p l e )  
 	 	 W e i g h t   =   1   ( f l o a t ,   s t r e n g t h   o f   c o n n e c t i o n )  
 	 	 S o r t O r d e r   =   1   ( s h o u l d   b e   a   r o w _ n u m b e r ( )   o v e r   ( p a r t i t i o n   b y   s u b j e c t ,   p r e d i c a t e   o r d e r   b y   . . . ) )  
    
 	 T h e s e   f i e l d   s   a r e   t o   h e l p   w i t h   p r o c e s s i n g :  
 	 	 S t a g e T r i p l e I D  
 	 	 s V a l u e H a s h  
 	 	 p V a l u e H a s h  
 	 	 o V a l u e H a s h  
 	 	 T r i p l e I D  
 	 	 T r i p l e H a s h  
 	 	 R e i t i f i c a t i o n  
 	 	 S t a t u s  
    
 	 1 .   D e t e r m i n e   t h e   i n p u t   c a t e g o r i e s   f o r   s u b j e c t ,   p r e d i c a t e ,   a n d   o b j e c t   i n   [ R D F . S t a g e ] . T r i p l e  
 	 2 .   C r e a t e   a   d i s t i n c t   l i s t   o f   n o d e   d e f i n i t i o n s   f r o m   [ R D F . S t a g e ] . T r i p l e  
 	 3 .   M a p   e a c h   n o d e   d e f i n i t i o n   t o   a n   e x i s t i n g   N o d e I D   o r   c r e a t e   a   n e w   n o d e   a n d   g e t   i t s   N o d e I D  
 	 4 .   L o o k u p   t h e   N o d e I D   f o r   e a c h   n o d e   d e f i n i t i o n   i n   [ R D F . S t a g e ] . T r i p l e  
 	 5 .   U p d a t e   o r   i n s e r t   t r i p l e s  
 	 6 .   U p d a t e   n o d e   a t t r i b u t e s  
 	 7 .   S a v e   a   l i s t   o f   w h i c h   s t a g e   t r i p l e s   w e r e   p r o c e s s e d  
    
 	 * /  
    
  
 	 - -   T u r n   o f f   r e a l - t i m e   i n d e x i n g  
 	 I F   @ I s R u n n i n g I n L o o p   =   0  
 	 	 A L T E R   F U L L T E X T   I N D E X   O N   [ R D F . ] . N o d e   S E T   C H A N G E _ T R A C K I N G   O F F    
  
  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - -   I t e r a t e   t h r o u g h   m u l t i p l e   c a l l s   t o   t h i s   p r o c e d u r e   u n t i l   a l l   t r i p l e s   a r e   p r o c e s s e d  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  
  
 	 i f   @ P r o c e s s A l l   =   1  
 	 b e g i n  
  
 	 	 t r u n c a t e   t a b l e   [ R D F . S t a g e ] . [ T r i p l e . M a p ]  
 	 	  
 	 	 d e c l a r e   @ I t e r a t i o n R e s u l t s   t a b l e   ( N e w N o d e s   b i g i n t ,   N e w T r i p l e s   b i g i n t ,   F o u n d R e c o r d s   b i g i n t ,   P r o c e s s e d R e c o r d s   b i g i n t )  
 	 	 d e c l a r e   @ I t e r a t i o n C o u n t   i n t  
 	 	 d e c l a r e   @ I t e r a t i o n S t a r t   d a t e t i m e  
 	 	 d e c l a r e   @ I t e r a t i o n M a x   i n t  
 	 	 s e l e c t   @ I t e r a t i o n C o u n t   =   0 ,   @ I t e r a t i o n M a x   =   1 0 0 0  
 	 	 w h i l e   @ I t e r a t i o n C o u n t   <   @ I t e r a t i o n M a x  
 	 	 b e g i n  
 	 	 	 s e l e c t   @ I t e r a t i o n S t a r t   =   g e t d a t e ( )  
 	 	 	 i n s e r t   i n t o   @ I t e r a t i o n R e s u l t s  
 	 	 	 	 e x e c   [ R D F . S t a g e ] . [ P r o c e s s T r i p l e s ]   @ P r o c e s s A l l   =   0 ,   @ S h o w C o u n t s   =   1 ,   @ P r o c e s s L i m i t   =   @ P r o c e s s L i m i t ,   @ I s R u n n i n g I n L o o p   =   1  
 	 	 	 i f   @ S h o w C o u n t s   =   1  
 	 	 	 	 s e l e c t   *   f r o m   @ I t e r a t i o n R e s u l t s  
 	 	 	 i f   ( ( s e l e c t   c o u n t ( * )   f r o m   @ I t e r a t i o n R e s u l t s )   =   0 )   o r   ( ( s e l e c t   P r o c e s s e d R e c o r d s   f r o m   @ I t e r a t i o n R e s u l t s )   =   0 )  
 	 	 	 	 s e l e c t   @ I t e r a t i o n C o u n t   =   @ I t e r a t i o n M a x  
 	 	 	 i n s e r t   i n t o   [ r d f . s t a g e ] . [ L o g . T r i p l e ]   ( C o m p l e t e D a t e ,   N e w N o d e s ,   N e w T r i p l e s ,   F o u n d R e c o r d s ,   P r o c e s s e d R e c o r d s ,   T i m e E l a p s e d )  
 	 	 	 	 s e l e c t   g e t d a t e ( ) ,   * ,   d a t e d i f f ( m s , @ I t e r a t i o n S t a r t , g e t d a t e ( ) ) / 1 0 0 0 . 0 0 0 0 0   f r o m   @ I t e r a t i o n R e s u l t s  
 	 	 	 d e l e t e   f r o m   @ I t e r a t i o n R e s u l t s  
 	 	 	 s e t   @ I t e r a t i o n C o u n t   =   @ I t e r a t i o n C o u n t   +   1  
 	 	 e n d  
  
 	 	 - -   T u r n   o n   r e a l - t i m e   i n d e x i n g  
 	 	 A L T E R   F U L L T E X T   I N D E X   O N   [ R D F . ] . N o d e   S E T   C H A N G E _ T R A C K I N G   A U T O ;  
 	 	 - -   K i c k   o f f   p o p u l a t i o n   F T   C a t a l o g   a n d   i n d e x  
 	 	 A L T E R   F U L L T E X T   I N D E X   O N   [ R D F . ] . N o d e   S T A R T   F U L L   P O P U L A T I O N    
  
 	 	 r e t u r n  
  
 	 e n d  
  
  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - -   S t a r t   a   s i n g l e   i t e r a t i o n  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  
 	 d e c l a r e   @ N e w N o d e s   b i g i n t  
 	 d e c l a r e   @ N e w T r i p l e s   b i g i n t  
 	 d e c l a r e   @ F o u n d R e c o r d s   b i g i n t  
 	 d e c l a r e   @ P r o c e s s e d R e c o r d s   b i g i n t  
 	 s e l e c t   @ N e w N o d e s   =   0 ,   @ N e w T r i p l e s   =   0 ,   @ F o u n d R e c o r d s   =   0 ,   @ P r o c e s s e d R e c o r d s   =   0  
    
 	 c r e a t e   t a b l e   # D e b u g   ( i   i n t   i d e n t i t y ( 0 , 1 )   p r i m a r y   k e y ,   x   v a r c h a r ( 1 0 0 ) ,   d   d a t e t i m e )  
  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - -   1 .   D e t e r m i n e   t h e   i n p u t   c a t e g o r i e s   f o r   s u b j e c t ,   p r e d i c a t e ,   a n d   o b j e c t   i n   [ R D F . S t a g e ] . T r i p l e  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 1 ' , G e t D a t e ( )  
  
 	 s e l e c t   t o p   ( @ P r o c e s s L i m i t )  
 	 	 	 t . S t a g e T r i p l e I D ,  
 	 	 	 	 ( c a s e 	 w h e n   s N o d e I D   i s   n o t   n u l l   t h e n   0  
 	 	 	 	 	 	 w h e n   s U R I   i s   n o t   n u l l   t h e n   1  
 	 	 	 	 	 	 w h e n   s N o d e T y p e   i s   n o t   n u l l   a n d   s I n t e r n a l T y p e   i s   n o t   n u l l   a n d   s I n t e r n a l I D   i s   n o t   n u l l   t h e n   2  
 	 	 	 	 	 	 w h e n   s T r i p l e I D   i s   n o t   n u l l   t h e n   3  
 	 	 	 	 	 	 w h e n   s S t a g e T r i p l e I D   i s   n o t   n u l l   t h e n   4  
 	 	 	 	 	 	 e l s e   n u l l   e n d )   s C a t e g o r y ,  
 	 	 	 	 ( c a s e 	 w h e n   p N o d e I D   i s   n o t   n u l l   t h e n   0  
 	 	 	 	 	 	 w h e n   p P r o p e r t y   i s   n o t   n u l l   t h e n   1  
 	 	 	 	 	 	 e l s e   n u l l   e n d )   p C a t e g o r y ,  
 	 	 	 	 ( c a s e 	 w h e n   o N o d e I D   i s   n o t   n u l l   t h e n   0  
 	 	 	 	 	 	 w h e n   o V a l u e   i s   n o t   n u l l   a n d   o O b j e c t T y p e   i s   n o t   n u l l   t h e n   1  
 	 	 	 	 	 	 w h e n   o N o d e T y p e   i s   n o t   n u l l   a n d   o I n t e r n a l T y p e   i s   n o t   n u l l   a n d   o I n t e r n a l I D   i s   n o t   n u l l   t h e n   2  
 	 	 	 	 	 	 w h e n   o T r i p l e I D   i s   n o t   n u l l   t h e n   3  
 	 	 	 	 	 	 w h e n   o S t a g e T r i p l e I D   i s   n o t   n u l l   t h e n   4  
 	 	 	 	 	 	 w h e n   o S t a r t T i m e   i s   n o t   n u l l   a n d   o E n d T i m e   i s   n o t   n u l l   a n d   o T i m e P r e c i s i o n   i s   n o t   n u l l   t h e n   5  
 	 	 	 	 	 	 w h e n   o S t a r t T i m e   i s   n o t   n u l l   a n d   o T i m e P r e c i s i o n   i s   n o t   n u l l   t h e n   6  
 	 	 	 	 	 	 e l s e   n u l l   e n d )   o C a t e g o r y ,  
 	 	 	 	 ( c a s e 	 w h e n   s N o d e I D   i s   n o t   n u l l   t h e n   n u l l  
 	 	 	 	 	 	 w h e n   s U R I   i s   n o t   n u l l   t h e n   C O N V E R T ( b i n a r y ( 2 0 ) , H A S H B Y T E S ( ' s h a 1 ' , C O N V E R T ( n v a r c h a r ( 4 0 0 0 ) , N ' " ' + r e p l a c e ( i s n u l l ( s U R I , N ' ' ) , N ' " ' , N ' \ " ' ) + N ' " ' ) ) )    
 	 	 	 	 	 	 w h e n   s N o d e T y p e   i s   n o t   n u l l   a n d   s I n t e r n a l T y p e   i s   n o t   n u l l   a n d   s I n t e r n a l I D   i s   n o t   n u l l   t h e n   C O N V E R T ( b i n a r y ( 2 0 ) , H A S H B Y T E S ( ' s h a 1 ' , C O N V E R T ( n v a r c h a r ( 4 0 0 0 ) , N ' " ' + r e p l a c e ( i s n u l l ( s N o d e T y p e + ' ^ ^ ' + s I n t e r n a l T y p e + ' ^ ^ ' + s I n t e r n a l I D , N ' ' ) , N ' " ' , N ' \ " ' ) + N ' " ' ) ) )    
 	 	 	 	 	 	 w h e n   s T r i p l e I D   i s   n o t   n u l l   t h e n   C O N V E R T ( b i n a r y ( 2 0 ) , H A S H B Y T E S ( ' s h a 1 ' , C O N V E R T ( n v a r c h a r ( 4 0 0 0 ) , N ' " ' + r e p l a c e ( i s n u l l ( ' # T R I P L E ' + c a s t ( s T r i p l e I D   a s   v a r c h a r ( 5 0 ) ) , N ' ' ) , N ' " ' , N ' \ " ' ) + N ' " ' ) ) )  
 	 	 	 	 	 	 w h e n   s S t a g e T r i p l e I D   i s   n o t   n u l l   t h e n   C O N V E R T ( b i n a r y ( 2 0 ) , H A S H B Y T E S ( ' s h a 1 ' , C O N V E R T ( n v a r c h a r ( 4 0 0 0 ) , N ' " ' + r e p l a c e ( i s n u l l ( ' # S T A G E T R I P L E ' + c a s t ( s S t a g e T r i p l e I D   a s   v a r c h a r ( 5 0 ) ) , N ' ' ) , N ' " ' , N ' \ " ' ) + N ' " ' ) ) )  
 	 	 	 	 	 	 e l s e   n u l l   e n d )   s V a l u e H a s h ,  
 	 	 	 	 ( c a s e 	 w h e n   p N o d e I D   i s   n o t   n u l l   t h e n   n u l l  
 	 	 	 	 	 	 w h e n   p P r o p e r t y   i s   n o t   n u l l   t h e n   C O N V E R T ( b i n a r y ( 2 0 ) , H A S H B Y T E S ( ' s h a 1 ' , C O N V E R T ( n v a r c h a r ( 4 0 0 0 ) , N ' " ' + r e p l a c e ( i s n u l l ( p P r o p e r t y , N ' ' ) , N ' " ' , N ' \ " ' ) + N ' " ' ) ) )  
 	 	 	 	 	 	 e l s e   n u l l   e n d )   p V a l u e H a s h ,  
 	 	 	 	 ( c a s e 	 w h e n   o N o d e I D   i s   n o t   n u l l   t h e n   n u l l  
 	 	 	 	 	 	 w h e n   o V a l u e   i s   n o t   n u l l   a n d   o O b j e c t T y p e   i s   n o t   n u l l   t h e n   C O N V E R T ( b i n a r y ( 2 0 ) , H A S H B Y T E S ( ' s h a 1 ' , C O N V E R T ( n v a r c h a r ( 4 0 0 0 ) , N ' " ' + r e p l a c e ( i s n u l l ( o V a l u e , N ' ' ) , N ' " ' , N ' \ " ' ) + ' " ' + I s N u l l ( N ' " @ ' + r e p l a c e ( o L a n g u a g e , N ' @ ' , N ' ' ) , N ' ' ) + I s N u l l ( N ' " ^ ^ ' + r e p l a c e ( o D a t a T y p e , N ' ^ ' , N ' ' ) , N ' ' ) ) ) )  
 	 	 	 	 	 	 w h e n   o N o d e T y p e   i s   n o t   n u l l   a n d   o I n t e r n a l T y p e   i s   n o t   n u l l   a n d   o I n t e r n a l I D   i s   n o t   n u l l   t h e n   C O N V E R T ( b i n a r y ( 2 0 ) , H A S H B Y T E S ( ' s h a 1 ' , C O N V E R T ( n v a r c h a r ( 4 0 0 0 ) , N ' " ' + r e p l a c e ( i s n u l l ( o N o d e T y p e + ' ^ ^ ' + o I n t e r n a l T y p e + ' ^ ^ ' + o I n t e r n a l I D , N ' ' ) , N ' " ' , N ' \ " ' ) + N ' " ' ) ) )    
 	 	 	 	 	 	 w h e n   o T r i p l e I D   i s   n o t   n u l l   t h e n   C O N V E R T ( b i n a r y ( 2 0 ) , H A S H B Y T E S ( ' s h a 1 ' , C O N V E R T ( n v a r c h a r ( 4 0 0 0 ) , N ' " ' + r e p l a c e ( i s n u l l ( ' # T R I P L E ' + c a s t ( o T r i p l e I D   a s   v a r c h a r ( 5 0 ) ) , N ' ' ) , N ' " ' , N ' \ " ' ) + N ' " ' ) ) )  
 	 	 	 	 	 	 w h e n   o S t a g e T r i p l e I D   i s   n o t   n u l l   t h e n   C O N V E R T ( b i n a r y ( 2 0 ) , H A S H B Y T E S ( ' s h a 1 ' , C O N V E R T ( n v a r c h a r ( 4 0 0 0 ) , N ' " ' + r e p l a c e ( i s n u l l ( ' # S T A G E T R I P L E ' + c a s t ( o S t a g e T r i p l e I D   a s   v a r c h a r ( 5 0 ) ) , N ' ' ) , N ' " ' , N ' \ " ' ) + N ' " ' ) ) )  
 	 	 	 	 	 	 e l s e   n u l l   e n d )   o V a l u e H a s h ,  
 	 	 	 s N o d e I D ,   s V i e w S e c u r i t y G r o u p ,   s E d i t S e c u r i t y G r o u p ,  
 	 	 	 p N o d e I D ,   p V i e w S e c u r i t y G r o u p ,   p E d i t S e c u r i t y G r o u p ,  
 	 	 	 o N o d e I D ,   o V i e w S e c u r i t y G r o u p ,   o E d i t S e c u r i t y G r o u p ,  
 	 	 	 o O b j e c t T y p e ,   T r i p l e H a s h ,    
 	 	 	 T r i p l e I D ,   t V i e w S e c u r i t y G r o u p ,  
 	 	 	 W e i g h t ,   S o r t O r d e r ,   R e i t i f i c a t i o n ,   G r a p h ,   0   S t a t u s  
 	 	 i n t o   # T r i p l e H a s h  
 	 	 f r o m   [ R D F . S t a g e ] . T r i p l e   t  
 	 	 w h e r e   s t a t u s   i s   n u l l  
 	 	 o r d e r   b y   S t a g e T r i p l e I D  
  
 	 s e l e c t   @ F o u n d R e c o r d s   =   @ @ R O W C O U N T  
    
    
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *   * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - -   2 .   C r e a t e   a   d i s t i n c t   l i s t   o f   n o d e   d e f i n i t i o n s   f r o m   [ R D F . S t a g e ] . T r i p l e  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
    
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 2 ' , G e t D a t e ( )  
  
 	 c r e a t e   t a b l e   # n o d e s   (  
 	 	 C a t e g o r y   t i n y i n t ,  
 	 	 N o d e T y p e   n v a r c h a r ( 4 0 0 ) ,  
 	 	 I n t e r n a l T y p e   n v a r c h a r ( 1 0 0 ) ,  
 	 	 I n t e r n a l I D   n v a r c h a r ( 1 0 0 ) ,  
 	 	 I n t e r n a l H a s h   b i n a r y ( 2 0 ) ,  
 	 	 V a l u e   n v a r c h a r ( m a x ) ,  
 	 	 L a n g u a g e   n v a r c h a r ( 2 5 5 ) ,  
 	 	 D a t a T y p e   n v a r c h a r ( 2 5 5 ) ,  
 	 	 O b j e c t T y p e   b i t ,  
 	 	 V a l u e H a s h   b i n a r y ( 2 0 ) ,  
 	 	 S t a r t T i m e   d a t e t i m e ,  
 	 	 E n d T i m e   d a t e t i m e ,  
 	 	 T i m e P r e c i s i o n   n v a r c h a r ( 2 5 5 ) ,  
 	 	 T r i p l e I D   b i g i n t ,  
 	 	 S t a g e T r i p l e I D   b i g i n t ,  
 	 	 N o d e I D   b i g i n t ,  
 	 	 S t a t u s   t i n y i n t  
 	 )  
  
 	 s e l e c t   V a l u e H a s h ,   C a t e g o r y ,   S t a g e T r i p l e I D ,   m a x O b j e c t T y p e   O b j e c t T y p e ,   n  
 	 	 i n t o   # n t e m p  
 	 	 f r o m   (  
 	 	 	 s e l e c t   * ,   r o w _ n u m b e r ( )   o v e r   ( p a r t i t i o n   b y   V a l u e H a s h   o r d e r   b y   S t a g e T r i p l e I D ,   n )   k ,  
 	 	 	 	 m a x ( O b j e c t T y p e )   o v e r   ( p a r t i t i o n   b y   V a l u e H a s h )   m a x O b j e c t T y p e  
 	 	 	 f r o m   (  
 	 	 	 	 s e l e c t   ( c a s e   w h e n   n   i n   ( 0 , 1 , 2 )   t h e n   1   w h e n   n   i n   ( 3 , 4 )   t h e n   2   w h e n   n   i n   ( 5 , 6 )   t h e n   3   w h e n   n   i n   ( 7 , 8 )   t h e n   4   e l s e   n u l l   e n d )   C a t e g o r y ,  
 	 	 	 	 	 ( c a s e   w h e n   n   i n   ( 0 , 3 , 5 , 7 )   t h e n   s V a l u e H a s h   w h e n   n = 1   t h e n   p V a l u e H a s h   w h e n   n   i n   ( 2 , 4 , 6 , 8 )   t h e n   o V a l u e H a s h   e l s e   n u l l   e n d )   V a l u e H a s h ,    
 	 	 	 	 	 S t a g e T r i p l e I D ,    
 	 	 	 	 	 ( c a s e   w h e n   n = 2   t h e n   c a s t ( o O b j e c t T y p e   a s   t i n y i n t )   e l s e   0   e n d )   O b j e c t T y p e ,  
 	 	 	 	 	 n  
 	 	 	 	 f r o m   # T r i p l e H a s h   t ,   [ U t i l i t y . M a t h ] . N   n  
 	 	 	 	 w h e r e   n   < =   8  
 	 	 	 	 	 a n d   ( 	 ( n = 0   a n d   s C a t e g o r y = 1 )   o r    
 	 	 	 	 	 	 	 ( n = 1   a n d   p C a t e g o r y = 1 )   o r    
 	 	 	 	 	 	 	 ( n = 2   a n d   o C a t e g o r y = 1 )   o r  
 	 	 	 	 	 	 	 ( n = 3   a n d   s C a t e g o r y = 2 )   o r  
 	 	 	 	 	 	 	 ( n = 4   a n d   o C a t e g o r y = 2 )   o r  
 	 	 	 	 	 	 	 ( n = 5   a n d   s C a t e g o r y = 3 )   o r  
 	 	 	 	 	 	 	 ( n = 6   a n d   o C a t e g o r y = 3 )   o r  
 	 	 	 	 	 	 	 ( n = 7   a n d   s C a t e g o r y = 4 )   o r  
 	 	 	 	 	 	 	 ( n = 8   a n d   o C a t e g o r y = 4 )  
 	 	 	 	 	 	 )  
 	 	 	 )   t  
 	 	 )   t  
 	 	 w h e r e   k   =   1  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 2 . 2 ' , G e t D a t e ( )  
  
 	 - -   U s e   t h e   p o i n t e r s   t o   c r e a t e   a   d i s t i n c t   l i s t   o f   n o d e s .  
 	 i n s e r t   i n t o   # n o d e s   ( C a t e g o r y ,   N o d e T y p e ,   I n t e r n a l T y p e ,   I n t e r n a l I D ,   I n t e r n a l H a s h ,   V a l u e ,   L a n g u a g e ,   D a t a T y p e ,   O b j e c t T y p e ,   V a l u e H a s h ,   T r i p l e I D ,   S t a g e T r i p l e I D ,   S t a t u s )  
 	 	 s e l e c t   n . C a t e g o r y ,    
 	 	 	 ( c a s e   w h e n   n = 3   t h e n   s N o d e T y p e   w h e n   n = 4   t h e n   o N o d e T y p e   e l s e   n u l l   e n d ) ,  
 	 	 	 ( c a s e   w h e n   n = 3   t h e n   s I n t e r n a l T y p e   w h e n   n = 4   t h e n   o I n t e r n a l T y p e   e l s e   n u l l   e n d ) ,  
 	 	 	 ( c a s e   w h e n   n = 3   t h e n   s I n t e r n a l I D   w h e n   n = 4   t h e n   o I n t e r n a l I D   e l s e   n u l l   e n d ) ,  
 	 	 	 n . V a l u e H a s h ,  
 	 	 	 ( c a s e   w h e n   n = 0   t h e n   s U R I   w h e n   n = 1   t h e n   p P r o p e r t y   w h e n   n = 2   t h e n   o V a l u e   e l s e   n u l l   e n d ) ,  
 	 	 	 ( c a s e   w h e n   n = 2   t h e n   o L a n g u a g e   e l s e   n u l l   e n d ) ,  
 	 	 	 ( c a s e   w h e n   n = 2   t h e n   o D a t a T y p e   e l s e   n u l l   e n d ) ,  
 	 	 	 n . O b j e c t T y p e ,    
 	 	 	 ( c a s e   w h e n   n . C a t e g o r y = 1   t h e n   n . V a l u e H a s h   e l s e   n u l l   e n d ) ,  
 	 	 	 ( c a s e   w h e n   n = 5   t h e n   s T r i p l e I D   w h e n   n = 6   t h e n   o T r i p l e I D   e l s e   n u l l   e n d ) ,  
 	 	 	 ( c a s e   w h e n   n = 7   t h e n   s S t a g e T r i p l e I D   w h e n   n = 8   t h e n   o S t a g e T r i p l e I D   e l s e   n u l l   e n d ) m ,  
 	 	 	 0  
 	 	 f r o m   [ R D F . S t a g e ] . T r i p l e   t ,   # n t e m p   n  
 	 	 w h e r e   t . S t a g e T r i p l e I D   =   n . S t a g e T r i p l e I D  
 	 - - c r e a t e   n o n c l u s t e r e d   i n d e x   i d x _ V a l u e H a s h   o n   # n o d e s ( C a t e g o r y , V a l u e H a s h )   i n c l u d e   ( N o d e I D )  
 	 - - c r e a t e   n o n c l u s t e r e d   i n d e x   i d x _ I n t e r n a l H a s h   o n   # n o d e s ( C a t e g o r y , I n t e r n a l H a s h )   i n c l u d e   ( N o d e I D )  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 2 . 3 ' , G e t D a t e ( )  
  
 	 c r e a t e   n o n c l u s t e r e d   i n d e x   i d x _ V a l u e H a s h   o n   # n o d e s ( C a t e g o r y , V a l u e H a s h )  
 	 c r e a t e   n o n c l u s t e r e d   i n d e x   i d x _ I n t e r n a l H a s h   o n   # n o d e s ( C a t e g o r y , I n t e r n a l H a s h )  
 	 c r e a t e   n o n c l u s t e r e d   i n d e x   i d x _ n o d e   o n   # n o d e s ( C a t e g o r y , N o d e I D )  
    
    
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - -   3 .   M a p   e a c h   n o d e   d e f i n i t i o n   t o   a n   e x i s t i n g   N o d e I D   o r   c r e a t e   a   n e w   n o d e   a n d   g e t   i t s   N o d e I D  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 3 ' , G e t D a t e ( )  
  
 	 - -   L o o k u p   t h e   b a s e   U R I  
 	 d e c l a r e   @ b a s e U R I   n v a r c h a r ( 4 0 0 )  
 	 s e l e c t   @ b a s e U R I   =   v a l u e   f r o m   [ F r a m e w o r k . ] . P a r a m e t e r   w h e r e   P a r a m e t e r I D   =   ' b a s e U R I '  
    
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   C a t e g o r y   1   ( U R I ,   P r o p e r t y ,   o r   V a l u e )  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 3 . 1 ' , G e t D a t e ( )  
  
 	 - -   F i n d   e x i s t i n g   N o d e I D s  
 	 u p d a t e   n  
 	 	 s e t   n . N o d e I D   =   m . N o d e I D  
 	 	 f r o m   # n o d e s   n ,   [ R D F . ] . N o d e   m  
 	 	 w h e r e   n . C a t e g o r y   =   1  
 	 	 	 a n d   n . V a l u e H a s h   =   m . V a l u e H a s h  
    
 	 - -   C r e a t e   n e w   n o d e s  
 	 i n s e r t   i n t o   [ R D F . ] . N o d e   ( V i e w S e c u r i t y G r o u p ,   E d i t S e c u r i t y G r o u p ,   V a l u e H a s h ,   L a n g u a g e ,   D a t a T y p e ,   V a l u e ,   O b j e c t T y p e )  
 	 	 s e l e c t   0 ,   0 ,   V a l u e H a s h ,   L a n g u a g e ,   D a t a T y p e ,   V a l u e ,   O b j e c t T y p e  
 	 	 f r o m   # n o d e s  
 	 	 w h e r e   C a t e g o r y   =   1   a n d   N o d e I D   i s   n u l l  
 	 s e l e c t   @ N e w N o d e s   =   @ N e w N o d e s   +   @ @ R O W C O U N T  
 	 u p d a t e   n  
 	 	 s e t   n . N o d e I D   =   m . N o d e I D  
 	 	 f r o m   # n o d e s   n ,   [ R D F . ] . N o d e   m  
 	 	 w h e r e   n . C a t e g o r y   =   1   a n d   n . N o d e I D   i s   n u l l  
 	 	 	 a n d   n . V a l u e H a s h   =   m . V a l u e H a s h  
    
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   C a t e g o r y   2   ( I n t e r n a l I D )  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 3 . 2 ' , G e t D a t e ( )  
    
 	 - -   F i n d   e x i s t i n g   N o d e I D s  
 	 u p d a t e   n  
 	 	 s e t   n . N o d e I D   =   m . N o d e I D  
 	 	 f r o m   # n o d e s   n ,   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   m  
 	 	 w h e r e   n . C a t e g o r y   =   2  
 	 	 	 a n d   n . I n t e r n a l H a s h   =   m . I n t e r n a l H a s h  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 3 . 2 . 2 ' , G e t D a t e ( )  
    
 	 - -   C r e a t e   n e w   n o d e s   f o r   n e w   i n t e r n a l   I D s  
 	 i n s e r t   i n t o   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   ( C l a s s ,   I n t e r n a l T y p e ,   I n t e r n a l I D ,   S t a t u s ,   I n t e r n a l H a s h )  
 	 	 s e l e c t   N o d e T y p e ,   I n t e r n a l T y p e ,   I n t e r n a l I D ,   0 ,   I n t e r n a l H a s h  
 	 	 f r o m   # n o d e s  
 	 	 w h e r e   C a t e g o r y   =   2   a n d   N o d e I D   i s   n u l l  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 3 . 2 . 3 ' , G e t D a t e ( )  
  
 	 u p d a t e   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p  
 	 	 s e t   V a l u e H a s h   =   C O N V E R T ( b i n a r y ( 2 0 ) , H A S H B Y T E S ( ' s h a 1 ' , C O N V E R T ( n v a r c h a r ( 4 0 0 0 ) , N ' " # I N M ' + c a s t ( I n t e r n a l N o d e M a p I D   a s   n v a r c h a r ( 5 0 ) ) + N ' " ' ) ) ) ,    
 	 	 	 s t a t u s   =   1  
 	 	 w h e r e   s t a t u s   =   0  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 3 . 2 . 4 ' , G e t D a t e ( )  
  
 	 i n s e r t   i n t o   [ R D F . ] . N o d e   ( V i e w S e c u r i t y G r o u p ,   E d i t S e c u r i t y G r o u p ,   V a l u e H a s h ,   V a l u e ,   I n t e r n a l N o d e M a p I D ,   O b j e c t T y p e )  
 	 	 s e l e c t   0 ,   0 ,   V a l u e H a s h ,  
 	 	 	 ' # I N M ' + c a s t ( I n t e r n a l N o d e M a p I D   a s   n v a r c h a r ( 5 0 ) ) ,  
 	 	 	 I n t e r n a l N o d e M a p I D ,   0  
 	 	 f r o m   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p  
 	 	 w h e r e   s t a t u s   =   1  
 	 s e l e c t   @ N e w N o d e s   =   @ N e w N o d e s   +   @ @ R O W C O U N T  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 3 . 2 . 5 ' , G e t D a t e ( )  
  
 	 u p d a t e   i  
 	 	 s e t   i . N o d e I D   =   n . N o d e I D ,   i . S t a t u s   =   2 ,  
 	 	 	 i . V a l u e H a s h   =   C O N V E R T ( b i n a r y ( 2 0 ) , H A S H B Y T E S ( ' s h a 1 ' , C O N V E R T ( n v a r c h a r ( 4 0 0 0 ) , N ' " ' + @ b a s e U R I + c a s t ( n . N o d e I D   a s   n v a r c h a r ( 5 0 ) ) + N ' " ' ) ) )    
 	 	 f r o m   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   i ,   [ R D F . ] . N o d e   n  
 	 	 w h e r e   i . S t a t u s   =   1   a n d   i . V a l u e H a s h   =   n . V a l u e H a s h  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 3 . 2 . 6 ' , G e t D a t e ( )  
  
 	 u p d a t e   n  
 	 	 s e t   n . V a l u e   =   @ b a s e U R I + c a s t ( n . N o d e I D   a s   n v a r c h a r ( 5 0 ) ) ,  
 	 	 	 n . V a l u e H a s h   =   i . V a l u e H a s h  
 	 	 f r o m   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   i ,   [ R D F . ] . N o d e   n  
 	 	 w h e r e   i . S t a t u s   =   2   a n d   i . N o d e I D   =   n . N o d e I D  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 3 . 2 . 7 ' , G e t D a t e ( )  
  
 	 u p d a t e   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p  
 	 	 s e t   S t a t u s   =   3  
 	 	 w h e r e   S t a t u s   =   2  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 3 . 2 . 8 ' , G e t D a t e ( )  
  
 	 u p d a t e   n  
 	 	 s e t   n . N o d e I D   =   m . N o d e I D  
 	 	 f r o m   # n o d e s   n ,   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   m  
 	 	 w h e r e   n . C a t e g o r y   =   2   a n d   n . N o d e I D   i s   n u l l  
 	 	 	 a n d   n . I n t e r n a l H a s h   =   m . I n t e r n a l H a s h  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   C a t e g o r y   4   ( S t a g e T r i p l e I D   -   M a p   t o   T r i p l e I D )  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 3 . 4 ' , G e t D a t e ( )  
    
 	 u p d a t e   n  
 	 	 s e t 	 n . T r i p l e I D   =   I s N u l l ( m . T r i p l e I D , n . T r i p l e I D ) ,    
 	 	 	 - - n . I n t e r n a l H a s h   =   ( c a s e   w h e n   m . T r i p l e I D   I S   N U L L   t h e n   n . I n t e r n a l H a s h   e l s e   C O N V E R T ( b i n a r y ( 2 0 ) , H A S H B Y T E S ( ' s h a 1 ' , C O N V E R T ( n v a r c h a r ( 4 0 0 0 ) , N ' " # T R I P L E ' + c a s t ( m . T r i p l e I D   a s   v a r c h a r ( 5 0 ) ) + N ' " ' ) ) )   e n d ) ,  
 	 	 	 n . C a t e g o r y   =   ( c a s e   w h e n   m . T r i p l e I D   I S   N U L L   t h e n   9 9   e l s e   4   e n d )  
 	 	 f r o m   # n o d e s   n   L E F T   O U T E R   J O I N   [ R D F . S t a g e ] . [ T r i p l e . M a p ]   m   O N   n . S t a g e T r i p l e I D   =   m . S t a g e T r i p l e I D  
 	 	 w h e r e   n . C a t e g o r y   =   4  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   C a t e g o r y   3   ( T r i p l e I D   -   R e i t i f i c a t i o n )  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 3 . 3 ' , G e t D a t e ( )  
    
 	 - -   F i n d   e x i s t i n g   N o d e I D s  
 	 u p d a t e   n  
 	 	 s e t   n . N o d e I D   =   t . R e i t i f i c a t i o n ,   n . S t a t u s   =   2  
 	 	 f r o m   # n o d e s   n ,   [ R D F . ] . T r i p l e   t  
 	 	 w h e r e   n . C a t e g o r y   I N   ( 3 , 4 )   a n d   n . T r i p l e I D   =   t . T r i p l e I D   a n d   t . R e i t i f i c a t i o n   i s   n o t   n u l l  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 3 . 3 . 2 ' , G e t D a t e ( )  
    
 	 - -   C r e a t e   n e w   n o d e s   f o r   n e w   t r i p l e s  
 	 i n s e r t   i n t o   [ R D F . ] . N o d e   ( V i e w S e c u r i t y G r o u p ,   E d i t S e c u r i t y G r o u p ,   V a l u e H a s h ,   V a l u e ,   O b j e c t T y p e )  
 	 	 s e l e c t   0 ,   0 ,   I n t e r n a l H a s h ,  
 	 	 	 ' # T R I P L E ' + c a s t ( T r i p l e I D   a s   n v a r c h a r ( 5 0 ) ) ,  
 	 	 	 0  
 	 	 f r o m   # n o d e s  
 	 	 w h e r e   C a t e g o r y   I N   ( 3 , 4 )   a n d   S t a t u s   =   0  
 	 s e l e c t   @ N e w N o d e s   =   @ N e w N o d e s   +   @ @ R O W C O U N T  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 3 . 3 . 3 ' , G e t D a t e ( )  
  
 	 u p d a t e   i  
 	 	 s e t   i . N o d e I D   =   n . N o d e I D ,  
 	 	 	 i . V a l u e H a s h   =   C O N V E R T ( b i n a r y ( 2 0 ) , H A S H B Y T E S ( ' s h a 1 ' , C O N V E R T ( n v a r c h a r ( 4 0 0 0 ) , N ' " ' + @ b a s e U R I + c a s t ( n . N o d e I D   a s   n v a r c h a r ( 5 0 ) ) + N ' " ' ) ) ) ,  
 	 	 	 i . S t a t u s   =   1  
 	 	 f r o m   # n o d e s   i ,   [ R D F . ] . N o d e   n  
 	 	 w h e r e   i . C a t e g o r y   I N   ( 3 , 4 )   a n d   i . S t a t u s   =   0   a n d   i . I n t e r n a l H a s h   =   n . V a l u e H a s h  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 3 . 3 . 4 ' , G e t D a t e ( )  
  
 	 u p d a t e   n  
 	 	 s e t   n . V a l u e   =   @ b a s e U R I + c a s t ( n . N o d e I D   a s   n v a r c h a r ( 5 0 ) ) ,  
 	 	 	 n . V a l u e H a s h   =   i . V a l u e H a s h  
 	 	 f r o m   # n o d e s   i ,   [ R D F . ] . N o d e   n  
 	 	 w h e r e   i . C a t e g o r y   I N   ( 3 , 4 )   a n d   i . S t a t u s   =   1   a n d   i . N o d e I D   =   n . N o d e I D  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 3 . 3 . 5 ' , G e t D a t e ( )  
  
 	 u p d a t e   t  
 	 	 s e t   t . R e i t i f i c a t i o n   =   i . N o d e I D  
 	 	 f r o m   # n o d e s   i ,   [ R D F . ] . T r i p l e   t  
 	 	 w h e r e   i . C a t e g o r y   I N   ( 3 , 4 )   a n d   i . S t a t u s   =   1   a n d   i . T r i p l e I D   =   t . T r i p l e I D  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 3 . 3 . 6 ' , G e t D a t e ( )  
  
 	 u p d a t e   # n o d e s  
 	 	 s e t   S t a t u s   =   2  
 	 	 w h e r e   C a t e g o r y   I N   ( 3 , 4 )   a n d   S t a t u s   =   1  
    
    
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - -   4 .   L o o k u p   t h e   N o d e I D   f o r   e a c h   n o d e   d e f i n i t i o n  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 4 ' , G e t D a t e ( )  
  
 	 s e l e c t   t . S t a g e T r i p l e I D ,  
 	 	 	 t . s C a t e g o r y ,   t . s N o d e I D ,   t . s V i e w S e c u r i t y G r o u p ,   t . s E d i t S e c u r i t y G r o u p ,  
 	 	 	 t . p C a t e g o r y ,   t . p N o d e I D ,   t . p V i e w S e c u r i t y G r o u p ,   t . p E d i t S e c u r i t y G r o u p ,  
 	 	 	 t . o C a t e g o r y ,   t . o N o d e I D ,   t . o V i e w S e c u r i t y G r o u p ,   t . o E d i t S e c u r i t y G r o u p ,   t . o O b j e c t T y p e ,  
 	 	 	 c o n v e r t ( b i n a r y ( 2 0 ) , N U L L )   T r i p l e H a s h ,  
 	 	 	 t . T r i p l e I D ,   t . t V i e w S e c u r i t y G r o u p ,   t . W e i g h t ,   t . S o r t O r d e r ,   t . R e i t i f i c a t i o n ,  
 	 	 	 t . s V a l u e H a s h ,   t . p V a l u e H a s h ,   t . o V a l u e H a s h ,   t . G r a p h ,  
 	 	 	 1   S t a t u s  
 	 	 i n t o   # T r i p l e C o m p a c t  
 	 	 f r o m   # T r i p l e H a s h   t  
 	 u p d a t e   t  
 	 	 s e t   t . s N o d e I D   =   I s N u l l ( t . s N o d e I D , s . N o d e I D ) ,  
 	 	 	 t . p N o d e I D   =   I s N u l l ( t . p N o d e I D , p . N o d e I D ) ,  
 	 	 	 t . o N o d e I D   =   I s N u l l ( t . o N o d e I D , o . N o d e I D )  
 	 	 f r o m   # T r i p l e C o m p a c t   t  
 	 	 	 l e f t   o u t e r   j o i n   # n o d e s   s   o n   t . s N o d e I D   i s   n u l l   a n d   t . s C a t e g o r y   =   s . C a t e g o r y   a n d   t . s V a l u e H a s h   =   s . I n t e r n a l H a s h  
 	 	 	 l e f t   o u t e r   j o i n   # n o d e s   p   o n   t . p N o d e I D   i s   n u l l   a n d   t . p C a t e g o r y   =   p . C a t e g o r y   a n d   t . p V a l u e H a s h   =   p . I n t e r n a l H a s h  
 	 	 	 l e f t   o u t e r   j o i n   # n o d e s   o   o n   t . o N o d e I D   i s   n u l l   a n d   t . o C a t e g o r y   =   o . C a t e g o r y   a n d   t . o V a l u e H a s h   =   o . I n t e r n a l H a s h  
 	 d e l e t e  
 	 	 f r o m   # T r i p l e C o m p a c t  
 	 	 w h e r e   s N o d e I D   I S   N U L L   O R   p N o d e I D   I S   N U L L   O R   o N o d e I D   I S   N U L L  
 	 u p d a t e   # T r i p l e C o m p a c t  
 	 	 s e t   T r i p l e H a s h   =   	 	 	  
 	 	 	 c o n v e r t ( b i n a r y ( 2 0 ) , H a s h B y t e s ( ' s h a 1 ' ,  
 	 	 	 	 c o n v e r t ( n v a r c h a r ( m a x ) ,  
 	 	 	 	 	 + N ' " '  
 	 	 	 	 	 + N ' < # ' + c o n v e r t ( n v a r c h a r ( m a x ) , s N o d e I D ) + N ' >   '  
 	 	 	 	 	 + N ' < # ' + c o n v e r t ( n v a r c h a r ( m a x ) , p N o d e I D ) + N ' >   '  
 	 	 	 	 	 + N ' < # ' + c o n v e r t ( n v a r c h a r ( m a x ) , o N o d e I D ) + N ' >   . '  
 	 	 	 	 	 + N ' " '  
 	 	 	 	 	 + N ' ^ ^ h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # S t a t e m e n t '  
 	 	 	 	 )  
 	 	 	 ) )  
 	 c r e a t e   n o n c l u s t e r e d   i n d e x   i d x _ s t a t u s   o n   # T r i p l e C o m p a c t   ( s t a t u s )  
  
    
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - -   5 .   U p d a t e   o r   i n s e r t   t r i p l e s  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 5 ' , G e t D a t e ( )  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   E x i s t i n g   t r i p l e s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 5 . 1 ' , G e t D a t e ( )  
  
 	 - -   F i n d   e x i s t i n g   T r i p l e I D s  
 	 u p d a t e   t  
 	 	 s e t   t . T r i p l e I D   =   v . T r i p l e I D ,   t . s t a t u s   =   2  
 	 	 f r o m   # T r i p l e C o m p a c t   t ,   [ R D F . ] . T r i p l e   v  
 	 	 w h e r e   t . T r i p l e H a s h   =   v . T r i p l e H a s h   a n d   t . s t a t u s   =   1  
 	 - -   U p d a t e   a t t r i b u t e s   o f   e x i s t i n g   T r i p l e I D s  
 	 u p d a t e   v  
 	 	 s e t   v . V i e w S e c u r i t y G r o u p   =   t . V i e w S e c u r i t y G r o u p ,   v . W e i g h t   =   t . W e i g h t ,   v . S o r t O r d e r   =   t . S o r t O r d e r  
 	 	 f r o m   [ R D F . ] . T r i p l e   v ,   (  
 	 	 	 s e l e c t   T r i p l e I D ,   m i n ( t V i e w S e c u r i t y G r o u p )   V i e w S e c u r i t y G r o u p ,   m a x ( W e i g h t )   W e i g h t ,   m i n ( S o r t O r d e r )   S o r t O r d e r  
 	 	 	 f r o m   # T r i p l e C o m p a c t  
 	 	 	 w h e r e   s t a t u s   =   2  
 	 	 	 g r o u p   b y   T r i p l e I D  
 	 	 )   t  
 	 	 w h e r e   v . T r i p l e I D   =   t . T r i p l e I D  
 	 	 	 a n d   ( v . V i e w S e c u r i t y G r o u p   < >   t . V i e w S e c u r i t y G r o u p   O R   v . W e i g h t   < >   t . W e i g h t   O R   v . S o r t O r d e r   < >   t . S o r t O r d e r )  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   N e w   t r i p l e s   w i t h o u t   d e p e n d e n c i e s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 5 . 2 ' , G e t D a t e ( )  
  
 	 - -   C r e a t e   n e w   t r i p l e s  
 	 i n s e r t   i n t o   [ R D F . ] . T r i p l e   ( V i e w S e c u r i t y G r o u p ,   S u b j e c t ,   P r e d i c a t e ,   O b j e c t ,   T r i p l e H a s h ,   W e i g h t ,   O b j e c t T y p e ,   S o r t O r d e r ,   G r a p h )  
 	 	 s e l e c t   m i n ( t V i e w S e c u r i t y G r o u p ) ,   s N o d e I D ,   p N o d e I D ,   o N o d e I D ,   T r i p l e H a s h ,   m a x ( W e i g h t ) ,   m a x ( c a s t ( o O b j e c t T y p e   a s   t i n y i n t ) ) ,   m i n ( S o r t O r d e r ) ,   m i n ( G r a p h )  
 	 	 	 f r o m   # T r i p l e C o m p a c t  
 	 	 	 w h e r e   s t a t u s   =   1  
 	 	 	 g r o u p   b y   s N o d e I D ,   p N o d e I D ,   o N o d e I D ,   T r i p l e H a s h  
 	 s e l e c t   @ N e w T r i p l e s   =   @ N e w T r i p l e s   +   @ @ R O W C O U N T  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 5 . 2 . 1 ' , G e t D a t e ( )  
  
 	 u p d a t e   t  
 	 	 s e t   t . T r i p l e I D   =   v . T r i p l e I D ,   t . s t a t u s   =   2  
 	 	 f r o m   # T r i p l e C o m p a c t   t ,   [ R D F . ] . T r i p l e   v  
 	 	 w h e r e   t . s t a t u s   =   1   a n d   t . T r i p l e H a s h   =   v . T r i p l e H a s h  
  
  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - -   6 .   U p d a t e   n o d e   a t t r i b u t e s  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 6 ' , G e t D a t e ( )  
    
 	 c r e a t e   t a b l e   # n A t t r i b u t e s   (  
 	 	 N o d e I D   b i g i n t   p r i m a r y   k e y ,  
 	 	 V i e w S e c u r i t y G r o u p   b i g i n t ,  
 	 	 E d i t S e c u r i t y G r o u p   b i g i n t ,  
 	 	 O b j e c t T y p e   b i t  
 	 )  
 	 i n s e r t   i n t o   # n A t t r i b u t e s   ( N o d e I D ,   V i e w S e c u r i t y G r o u p ,   E d i t S e c u r i t y G r o u p ,   O b j e c t T y p e )  
 	 	 s e l e c t   N o d e I D ,   m i n ( V i e w S e c u r i t y G r o u p ) ,   m i n ( E d i t S e c u r i t y G r o u p ) ,   m a x ( O b j e c t T y p e )  
 	 	 f r o m   (  
 	 	 	 s e l e c t 	 ( c a s e   w h e n   n = 0   t h e n   s N o d e I D   w h e n   n = 1   t h e n   p N o d e I D   e l s e   o N o d e I D   e n d )   N o d e I D ,    
 	 	 	 	 	 ( c a s e   w h e n   n = 0   t h e n   s V i e w S e c u r i t y G r o u p   w h e n   n = 1   t h e n   p V i e w S e c u r i t y G r o u p   e l s e   o V i e w S e c u r i t y G r o u p   e n d )   V i e w S e c u r i t y G r o u p ,    
 	 	 	 	 	 ( c a s e   w h e n   n = 0   t h e n   s E d i t S e c u r i t y G r o u p   w h e n   n = 1   t h e n   p E d i t S e c u r i t y G r o u p   e l s e   o E d i t S e c u r i t y G r o u p   e n d )   E d i t S e c u r i t y G r o u p ,    
 	 	 	 	 	 ( c a s e   w h e n   n = 2   t h e n   c a s t ( o O b j e c t T y p e   a s   t i n y i n t )   e l s e   0   e n d )   O b j e c t T y p e  
 	 	 	 f r o m   # T r i p l e C o m p a c t   t ,   [ U t i l i t y . M a t h ] . N   n  
 	 	 	 w h e r e   n   < =   2  
 	 	 	 	 a n d   ( ( n = 0   a n d   s N o d e I D   i s   n o t   n u l l )   o r   ( n = 1   a n d   p N o d e I D   i s   n o t   n u l l )   o r   ( n = 2   a n d   o N o d e I D   i s   n o t   n u l l ) )  
 	 	 )   t  
 	 	 g r o u p   b y   N o d e I D  
 	 u p d a t e   n  
 	 	 s e t   n . V i e w S e c u r i t y G r o u p   =   a . V i e w S e c u r i t y G r o u p ,   n . E d i t S e c u r i t y G r o u p   =   a . E d i t S e c u r i t y G r o u p ,   n . O b j e c t T y p e   =   a . O b j e c t T y p e  
 	 	 f r o m   [ R D F . ] . N o d e   n ,   # n A t t r i b u t e s   a  
 	 	 w h e r e   n . N o d e I D   =   a . N o d e I D  
 	 	 	 a n d   ( n . V i e w S e c u r i t y G r o u p   < >   a . V i e w S e c u r i t y G r o u p   O R   n . E d i t S e c u r i t y G r o u p   < >   a . E d i t S e c u r i t y G r o u p   O R   n . O b j e c t T y p e   < >   a . O b j e c t T y p e )  
 	 u p d a t e   t  
 	 	 s e t   t . O b j e c t T y p e   =   a . O b j e c t T y p e  
 	 	 f r o m   [ R D F . ] . T r i p l e   t ,   # n A t t r i b u t e s   a  
 	 	 w h e r e   t . O b j e c t   =   a . N o d e I D    
 	 	 	 a n d   ( t . O b j e c t T y p e   < >   a . O b j e c t T y p e )  
  
  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - -   7 .   S a v e   a   l i s t   o f   w h i c h   s t a g e   t r i p l e s   w e r e   p r o c e s s e d  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 7 . 1 ' , G e t D a t e ( )  
  
 	 i n s e r t   i n t o   [ R D F . S t a g e ] . [ T r i p l e . M a p ]   ( S t a g e T r i p l e I D ,   T r i p l e I D )  
 	 	 s e l e c t   S t a g e T r i p l e I D ,   T r i p l e I D  
 	 	 	 f r o m   # T r i p l e C o m p a c t  
 	 	 	 w h e r e   s t a t u s   =   2  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' 7 . 2 ' , G e t D a t e ( )  
  
 	 u p d a t e   t  
 	 	 s e t   t . S t a t u s   =   ( c a s e   w h e n   c . s t a t u s   =   2   t h e n   2   e l s e   n u l l   e n d )  
 	 	 f r o m   [ r d f . s t a g e ] . t r i p l e   t  
 	 	 	 I N N E R   J O I N   # T r i p l e H a s h   p   O N   t . S t a g e T r i p l e I D   =   p . S t a g e T r i p l e I D  
 	 	 	 L E F T   O U T E R   J O I N   # T r i p l e C o m p a c t   c   O N   t . S t a g e T r i p l e I D   =   c . S t a g e T r i p l e I D  
  
  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - -   W r a p   u p  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  
 	 i n s e r t   i n t o   # D e b u g   ( x , d )   s e l e c t   ' X ' , G e t D a t e ( )  
  
 	 / *  
 	 	 s e l e c t   q . * ,   d a t e d i f f ( m s , q . d , r . d )  
 	 	 f r o m   # D e b u g   q ,   # D e b u g   r  
 	 	 w h e r e   q . i   =   r . i - 1  
 	 * /  
  
 	 i f   @ S h o w C o u n t s   =   1  
 	 b e g i n  
 	 	 s e l e c t   @ P r o c e s s e d R e c o r d s   =   ( s e l e c t   c o u n t ( * )   f r o m   # T r i p l e C o m p a c t   w h e r e   s t a t u s   =   2 )  
 	 	 s e l e c t   @ N e w N o d e s   N e w N o d e s ,   @ N e w T r i p l e s   N e w T r i p l e s ,   @ F o u n d R e c o r d s   F o u n d R e c o r d s ,   @ P r o c e s s e d R e c o r d s   R e c o r d s P r o c e s s e d  
 	 e n d  
  
 	 I F   @ I s R u n n i n g I n L o o p   =   0  
 	 B E G I N  
 	 	 - -   T u r n   o n   r e a l - t i m e   i n d e x i n g  
 	 	 A L T E R   F U L L T E X T   I N D E X   O N   [ R D F . ] . N o d e   S E T   C H A N G E _ T R A C K I N G   A U T O ;  
 	    
 	 	 - -   K i c k   o f f   p o p u l a t i o n   F T   C a t a l o g   a n d   i n d e x  
 	 	 A L T E R   F U L L T E X T   I N D E X   O N   [ R D F . ] . N o d e   S T A R T   F U L L   P O P U L A T I O N    
 	 E N D  
 	    
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A l t e r i n g   [ R D F . S t a g e ] . [ L o a d T r i p l e s F r o m O n t o l o g y ] '  
 G O  
 A L T E R   p r o c e d u r e   [ R D F . S t a g e ] . [ L o a d T r i p l e s F r o m O n t o l o g y ]  
 	 @ O W L   N V A R C H A R ( 1 0 0 )   =   N U L L ,  
 	 @ T r u n c a t e   B I T   =   0  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
    
 	 i f   @ T r u n c a t e   =   1  
 	 	 t r u n c a t e   t a b l e   [ R D F . S t a g e ] . T r i p l e  
    
 	 i n s e r t   i n t o   [ R D F . S t a g e ] . T r i p l e   (  
 	 	 	 s U R I , s V i e w S e c u r i t y G r o u p , s E d i t S e c u r i t y G r o u p ,  
 	 	 	 p P r o p e r t y , p V i e w S e c u r i t y G r o u p , p E d i t S e c u r i t y G r o u p ,  
 	 	 	 o V a l u e , o O b j e c t T y p e , o V i e w S e c u r i t y G r o u p , o E d i t S e c u r i t y G r o u p ,  
 	 	 	 t V i e w S e c u r i t y G r o u p , W e i g h t , S o r t O r d e r , G r a p h )  
 	 	 s e l e c t 	 S u b j e c t ,   - 1 ,   - 5 0 ,  
 	 	 	 	 P r e d i c a t e ,   - 1 ,   - 5 0 ,  
 	 	 	 	 O b j e c t ,   ( c a s e   w h e n   O b j e c t   l i k e   ' h t t p % '   t h e n   0   e l s e   1   e n d ) ,   - 1 ,   - 5 0 ,  
 	 	 	 	 - 1 ,   1 ,   r o w _ n u m b e r ( )   o v e r   ( p a r t i t i o n   b y   S u b j e c t ,   P r e d i c a t e   o r d e r   b y   O b j e c t ) ,  
 	 	 	 	 G r a p h  
 	 	 f r o m   [ O n t o l o g y . I m p o r t ] . T r i p l e  
 	 	 w h e r e   O W L   =   I s N u l l ( @ O W L , O W L )  
    
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A l t e r i n g   [ O n t o l o g y . ] . [ A d d P r o p e r t y ] '  
 G O  
 A L T E R   P R O C E D U R E   [ O n t o l o g y . ] . [ A d d P r o p e r t y ]  
 	 @ O W L   n v a r c h a r ( 1 0 0 ) ,  
 	 @ P r o p e r t y U R I   v a r c h a r ( 4 0 0 ) ,  
 	 @ P r o p e r t y N a m e   v a r c h a r ( m a x ) ,  
 	 @ O b j e c t T y p e   b i t ,  
 	 @ P r o p e r t y G r o u p U R I   v a r c h a r ( 4 0 0 )   =   n u l l ,  
 	 @ S o r t O r d e r   i n t   =   n u l l ,  
 	 @ C l a s s U R I   v a r c h a r ( 4 0 0 )   =   n u l l ,  
 	 @ N e t w o r k P r o p e r t y U R I   v a r c h a r ( 4 0 0 )   =   n u l l ,  
 	 @ I s D e t a i l   b i t   =   n u l l ,  
 	 @ L i m i t   i n t   =   n u l l ,  
 	 @ I n c l u d e D e s c r i p t i o n   b i t   =   n u l l ,  
 	 @ I n c l u d e N e t w o r k   b i t   =   n u l l ,  
 	 @ S e a r c h W e i g h t   f l o a t   =   n u l l ,  
 	 @ C u s t o m D i s p l a y   b i t   =   n u l l ,  
 	 @ C u s t o m E d i t   b i t   =   n u l l ,  
 	 @ V i e w S e c u r i t y G r o u p   b i g i n t   =   n u l l ,  
 	 @ E d i t S e c u r i t y G r o u p   b i g i n t   =   n u l l ,  
 	 @ E d i t P e r m i s s i o n s S e c u r i t y G r o u p   b i g i n t   =   n u l l ,  
 	 @ E d i t E x i s t i n g S e c u r i t y G r o u p   b i g i n t   =   n u l l ,  
 	 @ E d i t A d d N e w S e c u r i t y G r o u p   b i g i n t   =   n u l l ,  
 	 @ E d i t A d d E x i s t i n g S e c u r i t y G r o u p   b i g i n t   =   n u l l ,  
 	 @ E d i t D e l e t e S e c u r i t y G r o u p   b i g i n t   =   n u l l ,  
 	 @ M i n C a r d i n a l i t y   i n t   =   n u l l ,  
 	 @ M a x C a r d i n a l i t y   i n t   =   n u l l ,  
 	 @ C u s t o m E d i t M o d u l e   x m l   =   n u l l ,  
 	 @ R e S o r t C l a s s P r o p e r t y   b i t   =   1  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   [ O n t o l o g y . I m p o r t ] . [ T r i p l e ]  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 D E C L A R E   @ L o a d R D F   B I T  
 	 S E L E C T   @ L o a d R D F   =   0  
  
 	 - -   G e t   G r a p h  
 	 D E C L A R E   @ G r a p h   B I G I N T  
 	 S E L E C T   @ G r a p h   =   ( S E L E C T   G r a p h   F R O M   [ O n t o l o g y . I m p o r t ] . [ O W L ]   W H E R E   N a m e   =   @ O W L )  
  
 	 - -   I n s e r t   T y p e   r e c o r d  
 	 I F   N O T   E X I S T S   ( S E L E C T   *  
 	 	 	 	 	 F R O M   [ O n t o l o g y . I m p o r t ] . [ T r i p l e ]  
 	 	 	 	 	 W H E R E   O W L   =   @ O W L   a n d   S u b j e c t   =   @ P r o p e r t y U R I   a n d   P r e d i c a t e   =   ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # t y p e ' )  
 	 B E G I N  
 	 	 I N S E R T   I N T O   [ O n t o l o g y . I m p o r t ] . [ T r i p l e ]   ( O W L ,   G r a p h ,   S u b j e c t ,   P r e d i c a t e ,   O b j e c t )  
 	 	 	 S E L E C T   @ O W L ,   @ G r a p h ,   @ P r o p e r t y U R I ,  
 	 	 	 	 ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # t y p e ' ,  
 	 	 	 	 ( C A S E   W H E N   @ O b j e c t T y p e   =   1   T H E N   ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # D a t a t y p e P r o p e r t y '  
 	 	 	 	 	 	 E L S E   ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # O b j e c t P r o p e r t y '   E N D )  
 	 	 S E L E C T   @ L o a d R D F   =   1  
 	 E N D  
 	  
 	 - -   I n s e r t   L a b e l   r e c o r d  
 	 I F   N O T   E X I S T S   ( S E L E C T   *  
 	 	 	 	 	 F R O M   [ O n t o l o g y . I m p o r t ] . [ T r i p l e ]  
 	 	 	 	 	 W H E R E   O W L   =   @ O W L   a n d   S u b j e c t   =   @ P r o p e r t y U R I   a n d   P r e d i c a t e   =   ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # l a b e l ' )  
 	 B E G I N  
 	 	 I N S E R T   I N T O   [ O n t o l o g y . I m p o r t ] . [ T r i p l e ]   ( O W L ,   G r a p h ,   S u b j e c t ,   P r e d i c a t e ,   O b j e c t )  
 	 	 	 S E L E C T   @ O W L ,   @ G r a p h ,   @ P r o p e r t y U R I ,  
 	 	 	 	 ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # l a b e l ' ,  
 	 	 	 	 @ P r o p e r t y N a m e  
 	 	 S E L E C T   @ L o a d R D F   =   1  
 	 E N D  
  
 	 - -   L o a d   R D F  
 	 I F   @ L o a d R D F   =   1  
 	 B E G I N  
 	 	 E X E C   [ R D F . S t a g e ] . [ L o a d T r i p l e s F r o m O n t o l o g y ]   @ O W L   =   @ O W L ,   @ T r u n c a t e   =   1  
 	 	 E X E C   [ R D F . S t a g e ] . [ P r o c e s s T r i p l e s ]  
 	 E N D  
 	  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   [ O n t o l o g y . ] . [ P r o p e r t y G r o u p P r o p e r t y ]  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 I F   N O T   E X I S T S   ( S E L E C T   *   F R O M   [ O n t o l o g y . ] . P r o p e r t y G r o u p P r o p e r t y   W H E R E   P r o p e r t y U R I   =   @ P r o p e r t y U R I )  
 	 B E G I N  
 	  
 	 	 - -   V a l i d a t e   t h e   P r o p e r t y G r o u p U R I  
 	 	 S E L E C T   @ P r o p e r t y G r o u p U R I   =   I s N u l l ( ( S E L E C T   T O P   1   P r o p e r t y G r o u p U R I    
 	 	 	 	 	 	 	 	 	 	 	 F R O M   [ O n t o l o g y . ] . P r o p e r t y G r o u p  
 	 	 	 	 	 	 	 	 	 	 	 W H E R E   P r o p e r t y G r o u p U R I   =   @ P r o p e r t y G r o u p U R I  
 	 	 	 	 	 	 	 	 	 	 	 	 A N D   @ P r o p e r t y G r o u p U R I   I S   N O T   N U L L  
 	 	 	 	 	 	 	 	 	 	 	 ) , ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # P r o p e r t y G r o u p O v e r v i e w ' )  
 	 	  
 	 	 - -   V a l i d a t e   t h e   S o r t O r d e r  
 	 	 D E C L A R E   @ M a x S o r t O r d e r   I N T  
 	 	 S E L E C T   @ M a x S o r t O r d e r   =   I s N u l l ( ( S E L E C T   M A X ( S o r t O r d e r )  
 	 	 	 	 	 	 	 	 	 	 F R O M   [ O n t o l o g y . ] . P r o p e r t y G r o u p P r o p e r t y  
 	 	 	 	 	 	 	 	 	 	 W H E R E   P r o p e r t y G r o u p U R I   =   @ P r o p e r t y G r o u p U R I ) , 0 )  
 	 	 S E L E C T   @ S o r t O r d e r   =   ( C A S E   W H E N   @ S o r t O r d e r   I S   N U L L   T H E N   @ M a x S o r t O r d e r + 1  
 	 	 	 	 	 	 	 	 	 W H E N   @ S o r t O r d e r   >   @ M a x S o r t O r d e r   T H E N   @ M a x S o r t O r d e r + 1  
 	 	 	 	 	 	 	 	 	 E L S E   @ S o r t O r d e r   E N D )  
  
 	 	 - -   S h i f t   S o r t O r d e r   o f   e x i s t i n g   r e c o r d s  
 	 	 U P D A T E   [ O n t o l o g y . ] . P r o p e r t y G r o u p P r o p e r t y  
 	 	 	 S E T   S o r t O r d e r   =   S o r t O r d e r   +   1  
 	 	 	 W H E R E   P r o p e r t y G r o u p U R I   =   @ P r o p e r t y G r o u p U R I   A N D   S o r t O r d e r   > =   @ S o r t O r d e r  
 	 	  
 	 	 - -   I n s e r t   n e w   p r o p e r t y  
 	 	 I N S E R T   I N T O   [ O n t o l o g y . ] . P r o p e r t y G r o u p P r o p e r t y   ( P r o p e r t y G r o u p U R I ,   P r o p e r t y U R I ,   S o r t O r d e r ,   _ N u m b e r O f N o d e s )  
 	 	 	 S E L E C T   @ P r o p e r t y G r o u p U R I ,   @ P r o p e r t y U R I ,   @ S o r t O r d e r ,   0  
  
 	 E N D  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   [ O n t o l o g y . ] . [ C l a s s P r o p e r t y ]  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 I F   ( @ C l a s s U R I   I S   N O T   N U L L )   A N D   N O T   E X I S T S   (  
 	 	 S E L E C T   *  
 	 	 F R O M   [ O n t o l o g y . ] . [ C l a s s P r o p e r t y ]  
 	 	 W H E R E   C l a s s   =   @ C l a s s U R I   A N D   P r o p e r t y   =   @ P r o p e r t y U R I  
 	 	 	 A N D   (   ( N e t w o r k P r o p e r t y   I S   N U L L   A N D   @ N e t w o r k P r o p e r t y U R I   I S   N U L L )   O R   ( N e t w o r k P r o p e r t y   =   @ N e t w o r k P r o p e r t y U R I )   )  
 	 )  
 	 B E G I N  
  
 	 	 - -   G e t   t h e   C l a s s P r o p e r t y I D 	  
 	 	 D E C L A R E   @ C l a s s P r o p e r t y I D   I N T  
 	 	 S E L E C T   @ C l a s s P r o p e r t y I D   =   I s N u l l ( ( S E L E C T   M A X ( C l a s s P r o p e r t y I D )  
 	 	 	 	 	 	 	 	 	 	 	 F R O M   [ O n t o l o g y . ] . C l a s s P r o p e r t y ) , 0 ) + 1  
 	 	 - -   I n s e r t   t h e   n e w   p r o p e r t y  
 	 	 I N S E R T   I N T O   [ O n t o l o g y . ] . [ C l a s s P r o p e r t y ]   (  
 	 	 	 	 C l a s s P r o p e r t y I D ,  
 	 	 	 	 C l a s s ,   N e t w o r k P r o p e r t y ,   P r o p e r t y ,  
 	 	 	 	 I s D e t a i l ,   L i m i t ,   I n c l u d e D e s c r i p t i o n ,   I n c l u d e N e t w o r k ,   S e a r c h W e i g h t ,  
 	 	 	 	 C u s t o m D i s p l a y ,   C u s t o m E d i t ,   V i e w S e c u r i t y G r o u p ,  
 	 	 	 	 E d i t S e c u r i t y G r o u p ,   E d i t P e r m i s s i o n s S e c u r i t y G r o u p ,   E d i t E x i s t i n g S e c u r i t y G r o u p ,   E d i t A d d N e w S e c u r i t y G r o u p ,   E d i t A d d E x i s t i n g S e c u r i t y G r o u p ,   E d i t D e l e t e S e c u r i t y G r o u p ,  
 	 	 	 	 M i n C a r d i n a l i t y ,   M a x C a r d i n a l i t y ,   C u s t o m E d i t M o d u l e ,  
 	 	 	 	 _ N u m b e r O f N o d e s ,   _ N u m b e r O f T r i p l e s 	 	  
 	 	 	 )  
 	 	 	 S E L E C T 	 @ C l a s s P r o p e r t y I D ,  
 	 	 	 	 	 @ C l a s s U R I ,   @ N e t w o r k P r o p e r t y U R I ,   @ P r o p e r t y U R I ,  
 	 	 	 	 	 I s N u l l ( @ I s D e t a i l , 1 ) ,   @ L i m i t ,   I s N u l l ( @ I n c l u d e D e s c r i p t i o n , 0 ) ,   I s N u l l ( @ I n c l u d e N e t w o r k , 0 ) ,  
 	 	 	 	 	 I s N u l l ( @ S e a r c h W e i g h t , ( C A S E   W H E N   @ O b j e c t T y p e   =   0   T H E N   0   E L S E   0 . 5   E N D ) ) ,  
 	 	 	 	 	 I s N u l l ( @ C u s t o m D i s p l a y , 0 ) ,   I s N u l l ( @ C u s t o m E d i t , 0 ) ,   I s N u l l ( @ V i e w S e c u r i t y G r o u p , - 1 ) ,  
 	 	 	 	 	 I s N u l l ( @ E d i t S e c u r i t y G r o u p , - 4 0 ) ,  
 	 	 	 	 	 C o a l e s c e ( @ E d i t P e r m i s s i o n s S e c u r i t y G r o u p , @ E d i t S e c u r i t y G r o u p , - 4 0 ) ,  
 	 	 	 	 	 C o a l e s c e ( @ E d i t E x i s t i n g S e c u r i t y G r o u p , @ E d i t S e c u r i t y G r o u p , - 4 0 ) ,  
 	 	 	 	 	 C o a l e s c e ( @ E d i t A d d N e w S e c u r i t y G r o u p , @ E d i t S e c u r i t y G r o u p , - 4 0 ) ,  
 	 	 	 	 	 C o a l e s c e ( @ E d i t A d d E x i s t i n g S e c u r i t y G r o u p , @ E d i t S e c u r i t y G r o u p , - 4 0 ) ,  
 	 	 	 	 	 C o a l e s c e ( @ E d i t D e l e t e S e c u r i t y G r o u p , @ E d i t S e c u r i t y G r o u p , - 4 0 ) ,  
 	 	 	 	 	 I s N u l l ( @ M i n C a r d i n a l i t y , 0 ) ,  
 	 	 	 	 	 @ M a x C a r d i n a l i t y ,  
 	 	 	 	 	 @ C u s t o m E d i t M o d u l e ,  
 	 	 	 	 	 0 ,   0  
  
 	 	 - -   R e - s o r t   t h e   t a b l e  
 	 	 I F   @ R e S o r t C l a s s P r o p e r t y   =   1  
 	 	 	 u p d a t e   x  
 	 	 	 	 s e t   x . C l a s s P r o p e r t y I D   =   y . k  
 	 	 	 	 f r o m   [ O n t o l o g y . ] . C l a s s P r o p e r t y   x ,   (  
 	 	 	 	 	 s e l e c t   * ,   r o w _ n u m b e r ( )   o v e r   ( o r d e r   b y   ( c a s e   w h e n   N e t w o r k P r o p e r t y   i s   n u l l   t h e n   0   e l s e   1   e n d ) ,   C l a s s ,   N e t w o r k P r o p e r t y ,   I s D e t a i l ,   I n c l u d e N e t w o r k ,   P r o p e r t y )   k  
 	 	 	 	 	 	 f r o m   [ O n t o l o g y . ] . C l a s s P r o p e r t y  
 	 	 	 	 )   y  
 	 	 	 	 w h e r e   x . C l a s s   =   y . C l a s s   a n d   x . P r o p e r t y   =   y . P r o p e r t y  
 	 	 	 	 	 a n d   ( ( x . N e t w o r k P r o p e r t y   i s   n u l l   a n d   y . N e t w o r k P r o p e r t y   i s   n u l l )   o r   ( x . N e t w o r k P r o p e r t y   =   y . N e t w o r k P r o p e r t y ) )  
  
 	 E N D  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   U p d a t e   D e r i v e d   F i e l d s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 E X E C   [ O n t o l o g y . ] . U p d a t e D e r i v e d F i e l d s  
 	  
 	  
 	 / *  
 	  
 	 - -   E x a m p l e  
 	 e x e c   [ O n t o l o g y . ] . A d d P r o p e r t y  
 	 	 @ O W L   =   ' P R N S _ 1 . 0 ' ,  
 	 	 @ P r o p e r t y U R I   =   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # e m a i l E n c r y p t e d ' ,  
 	 	 @ P r o p e r t y N a m e   =   ' e m a i l   e n c r y p t e d ' ,  
 	 	 @ O b j e c t T y p e   =   1 ,  
 	 	 @ P r o p e r t y G r o u p U R I   =   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # P r o p e r t y G r o u p A d d r e s s ' ,  
 	 	 @ S o r t O r d e r   =   2 0 ,  
 	 	 @ C l a s s U R I   =   ' h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / P e r s o n ' ,  
 	 	 @ N e t w o r k P r o p e r t y U R I   =   n u l l ,  
 	 	 @ I s D e t a i l   =   0 ,  
 	 	 @ S e a r c h W e i g h t   =   0 ,  
 	 	 @ C u s t o m D i s p l a y   =   1 ,  
 	 	 @ C u s t o m E d i t   =   1  
  
 	 * /  
 	  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A l t e r i n g   [ R D F . ] . [ G e t P r e s e n t a t i o n X M L ] '  
 G O  
  
 A L T E R   P R O C E D U R E   [ R D F . ] . [ G e t P r e s e n t a t i o n X M L ]  
 @ s u b j e c t   B I G I N T = N U L L ,   @ p r e d i c a t e   B I G I N T = N U L L ,   @ o b j e c t   B I G I N T = N U L L ,   @ s u b j e c t T y p e   B I G I N T = N U L L ,   @ o b j e c t T y p e   B I G I N T = N U L L ,   @ S e s s i o n I D   U N I Q U E I D E N T I F I E R = N U L L ,   @ E d i t M o d e   B I T = 0 ,   @ r e t u r n X M L   B I T = 1 ,   @ P r e s e n t a t i o n X M L   X M L = N U L L   O U T P U T  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
 	 d e c l a r e   @ t y p e I D   b i g i n t  
 	 s e l e c t   @ t y p e I D   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # t y p e ' )  
  
 	 s e l e c t   @ s u b j e c t   =   n u l l   w h e r e   @ s u b j e c t   =   0  
 	 s e l e c t   @ p r e d i c a t e   =   n u l l   w h e r e   @ p r e d i c a t e   =   0  
 	 s e l e c t   @ o b j e c t   =   n u l l   w h e r e   @ o b j e c t   =   0  
  
 	 d e c l a r e   @ S e c u r i t y G r o u p L i s t X M L   x m l  
 	 s e l e c t   @ S e c u r i t y G r o u p L i s t X M L   =   N U L L  
  
 	 d e c l a r e   @ N e t w o r k N o d e   b i g i n t  
 	 d e c l a r e   @ C o n n e c t i o n N o d e   b i g i n t  
 	 s e l e c t 	 @ N e t w o r k N o d e   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # N e t w o r k ' ) ,  
 	 	 	 @ C o n n e c t i o n N o d e   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # C o n n e c t i o n ' )  
  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   D e t e r m i n e   t h e   P r e s e n t a t i o n T y p e   ( P   =   p r o f i l e ,   N   =   n e t w o r k ,   C   =   c o n n e c t i o n )  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 d e c l a r e   @ P r e s e n t a t i o n T y p e   c h a r ( 1 )  
 	 s e l e c t   @ P r e s e n t a t i o n T y p e   =   ( c a s e   w h e n   I s N u l l ( @ o b j e c t , @ o b j e c t T y p e )   i s   n o t   n u l l   A N D   @ p r e d i c a t e   i s   n o t   n u l l   A N D   I s N u l l ( @ s u b j e c t , @ s u b j e c t T y p e )   i s   n o t   n u l l   t h e n   ' C '  
 	 	 	 	 	 	 	 	 	 w h e n   @ p r e d i c a t e   i s   n o t   n u l l   A N D   I s N u l l ( @ s u b j e c t , @ s u b j e c t T y p e )   i s   n o t   n u l l   t h e n   ' N '  
 	 	 	 	 	 	 	 	 	 w h e n   I s N u l l ( @ s u b j e c t , @ s u b j e c t T y p e )   i s   n o t   n u l l   t h e n   ' P '  
 	 	 	 	 	 	 	 	 	 e l s e   N U L L   e n d )  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   D e t e r m i n e   w h e t h e r   t h e   u s e r   c a n   e d i t   t h i s   p r o f i l e  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 D E C L A R E   @ C a n E d i t   B I T  
 	 S E L E C T   @ C a n E d i t   =   0  
 	 D E C L A R E   @ S e c u r i t y G r o u p I D   B I G I N T ,   @ H a s S p e c i a l V i e w A c c e s s   B I T ,   @ H a s S p e c i a l E d i t A c c e s s   B I T  
 	 E X E C   [ R D F . S e c u r i t y ] . G e t S e s s i o n S e c u r i t y G r o u p   @ S e s s i o n I D ,   @ S e c u r i t y G r o u p I D   O U T P U T ,   @ H a s S p e c i a l V i e w A c c e s s   O U T P U T ,   @ H a s S p e c i a l E d i t A c c e s s   O U T P U T  
 	 C R E A T E   T A B L E   # S e c u r i t y G r o u p N o d e s   ( S e c u r i t y G r o u p N o d e   B I G I N T   P R I M A R Y   K E Y )  
 	 I F   ( @ P r e s e n t a t i o n T y p e   =   ' P ' )   A N D   ( @ S e s s i o n I D   I S   N O T   N U L L )  
 	 B E G I N  
 	 	 - -   G e t   S e c u r i t y G r o u p   n o d e s  
 	 	 I N S E R T   I N T O   # S e c u r i t y G r o u p N o d e s   ( S e c u r i t y G r o u p N o d e )   E X E C   [ R D F . S e c u r i t y ] . G e t S e s s i o n S e c u r i t y G r o u p N o d e s   @ S e s s i o n I D ,   @ S u b j e c t  
 	 	 S E L E C T   @ C a n E d i t   =   1  
 	 	 	 F R O M   [ R D F . ] . N o d e  
 	 	 	 W H E R E   N o d e I D   =   @ s u b j e c t  
 	 	 	 	 A N D   (   ( E d i t S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( E d i t S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l E d i t A c c e s s   =   1 )   O R   ( E d i t S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) )   )  
 	 	 - -   G e t   n a m e s / d e s c r i p t i o n s   o f   d i f f e r e n t   S e c u r i t y G r o u p s  
 	 	 I F   @ C a n E d i t   =   1   A N D   @ E d i t M o d e   =   1  
 	 	 B E G I N  
 	 	 	 ; W I T H   a   A S   (  
 	 	 	 	 S E L E C T   1   x ,   m . N o d e I D   S e c u r i t y G r o u p I D ,   ' O n l y   M e '   L a b e l ,   ' O n l y   m e   a n d   s p e c i a l   a u t h o r i z e d   u s e r s   w h o   m a n a g e   t h i s   w e b s i t e . '   D e s c r i p t i o n  
 	 	 	 	 	 F R O M   [ U s e r . S e s s i o n ] . [ S e s s i o n ]   s ,   [ R D F . S t a g e ] . [ I n t e r n a l N o d e M a p ]   m ,   [ R D F . ] . N o d e   n  
 	 	 	 	 	 W H E R E   s . S e s s i o n I D   =   @ S e s s i o n I D   A N D   s . U s e r I D   I S   N O T   N U L L  
 	 	 	 	 	 	 A N D   m . I n t e r n a l I D   =   s . U s e r I D   A N D   m . C l a s s   =   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # U s e r '   A N D   m . I n t e r n a l T y p e   =   ' U s e r '  
 	 	 	 	 	 	 A N D   n . N o d e I D   =   @ S u b j e c t   A N D   n . E d i t S e c u r i t y G r o u p   =   m . N o d e I D    
 	 	 	 ) ,   b   A S   (  
 	 	 	 	 S E L E C T   2   x ,   n . E d i t S e c u r i t y G r o u p   S e c u r i t y G r o u p I D ,   ' O w n e r '   L a b e l ,   ' O n l y   '   +   I s N u l l ( M a x ( o . V a l u e ) , ' ' )   +   '   a n d   s p e c i a l   a u t h o r i z e d   u s e r s   w h o   m a n a g e   t h i s   w e b s i t e . '   D e s c r i p t i o n  
 	 	 	 	 	 F R O M   [ R D F . ] . N o d e   n ,   [ R D F . ] . T r i p l e   t ,   [ R D F . ] . N o d e   o  
 	 	 	 	 	 W H E R E   n . N o d e I D   =   @ S u b j e c t   A N D   n . E d i t S e c u r i t y G r o u p   >   0  
 	 	 	 	 	 	 A N D   n . E d i t S e c u r i t y G r o u p   N O T   I N   ( S E L E C T   S e c u r i t y G r o u p I D   F R O M   a )  
 	 	 	 	 	 	 A N D   t . S u b j e c t   =   n . N o d e I D    
 	 	 	 	 	 	 A N D   t . P r e d i c a t e   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # l a b e l ' )    
 	 	 	 	 	 	 A N D   t . O b j e c t   =   o . N o d e I D  
 	 	 	 	 	 	 A N D   (   ( n . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( n . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( n . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) )   )  
 	 	 	 	 	 	 A N D   (   ( t . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( t . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( t . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) )   )  
 	 	 	 	 	 	 A N D   (   ( o . V i e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( o . V i e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l V i e w A c c e s s   =   1 )   O R   ( o . V i e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) )   )  
 	 	 	 	 	 G R O U P   B Y   n . E d i t S e c u r i t y G r o u p  
 	 	 	 ) ,   c   A S   (  
 	 	 	 	 S E L E C T   3   x ,   S e c u r i t y G r o u p I D ,   L a b e l ,   D e s c r i p t i o n  
 	 	 	 	 	 F R O M   [ R D F . S e c u r i t y ] . [ G r o u p ]  
 	 	 	 	 	 W H E R E   S e c u r i t y G r o u p I D   b e t w e e n   @ S e c u r i t y G r o u p I D   a n d   - 1  
 	 	 	 	 U N I O N   A L L   S E L E C T   *   F R O M   a  
 	 	 	 	 U N I O N   A L L   S E L E C T   *   F R O M   b  
 	 	 	 )  
 	 	 	 S E L E C T   @ S e c u r i t y G r o u p L i s t X M L   =   (  
 	 	 	 	 S E L E C T 	 S e c u r i t y G r o u p I D   " @ I D " ,  
 	 	 	 	 	 	 L a b e l   " @ L a b e l " ,  
 	 	 	 	 	 	 D e s c r i p t i o n   " @ D e s c r i p t i o n "  
 	 	 	 	 	 F R O M   c  
 	 	 	 	 	 O R D E R   B Y   x ,   S e c u r i t y G r o u p I D  
 	 	 	 	 	 F O R   X M L   P A T H ( ' S e c u r i t y G r o u p ' ) ,   T Y P E  
 	 	 	 )  
 	 	 E N D  
 	 E N D  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   G e t   t h e   P r e s e n t a t i o n I D   b a s e d   o n   t y p e  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 d e c l a r e   @ P r e s e n t a t i o n I D   i n t  
 	 s e l e c t   @ P r e s e n t a t i o n I D   =   (  
 	 	 	 s e l e c t   t o p   1   P r e s e n t a t i o n I D  
 	 	 	 	 f r o m   [ O n t o l o g y . P r e s e n t a t i o n ] . [ X M L ]  
 	 	 	 	 w h e r e   t y p e   =   ( c a s e   w h e n   @ E d i t M o d e   =   1   t h e n   ' E '   e l s e   I s N u l l ( @ P r e s e n t a t i o n T y p e , ' P ' )   e n d )  
 	 	 	 	 	 A N D 	 ( _ S u b j e c t N o d e   I S   N U L L  
 	 	 	 	 	 	 	 O R   _ S u b j e c t N o d e   =   @ s u b j e c t T y p e  
 	 	 	 	 	 	 	 O R   _ S u b j e c t N o d e   I N   ( s e l e c t   o b j e c t   f r o m   [ R D F . ] . T r i p l e   w h e r e   @ s u b j e c t   i s   n o t   n u l l   a n d   s u b j e c t = @ s u b j e c t   a n d   p r e d i c a t e = @ t y p e I D )  
 	 	 	 	 	 	 )  
 	 	 	 	 	 A N D 	 ( _ P r e d i c a t e N o d e   I S   N U L L  
 	 	 	 	 	 	 	 O R   _ P r e d i c a t e N o d e   =   @ p r e d i c a t e  
 	 	 	 	 	 	 )  
 	 	 	 	 	 A N D 	 ( _ O b j e c t N o d e   I S   N U L L  
 	 	 	 	 	 	 	 O R   _ O b j e c t N o d e   =   @ o b j e c t T y p e  
 	 	 	 	 	 	 	 O R   _ O b j e c t N o d e   I N   ( s e l e c t   o b j e c t   f r o m   [ R D F . ] . T r i p l e   w h e r e   @ o b j e c t   i s   n o t   n u l l   a n d   s u b j e c t = @ o b j e c t   a n d   p r e d i c a t e = @ t y p e I D )  
 	 	 	 	 	 	 )  
 	 	 	 	 o r d e r   b y 	 ( c a s e   w h e n   _ O b j e c t N o d e   i s   n u l l   t h e n   1   e l s e   0   e n d ) ,  
 	 	 	 	 	 	 	 ( c a s e   w h e n   _ P r e d i c a t e N o d e   i s   n u l l   t h e n   1   e l s e   0   e n d ) ,  
 	 	 	 	 	 	 	 ( c a s e   w h e n   _ S u b j e c t N o d e   i s   n u l l   t h e n   1   e l s e   0   e n d ) ,  
 	 	 	 	 	 	 	 P r e s e n t a t i o n I D  
 	 	 )  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   G e t   t h e   P r o p e r t y L i s t X M L   b a s e d   o n   t y p e  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 d e c l a r e   @ P r o p e r t y L i s t X M L   x m l  
 	 i f   @ E d i t M o d e   =   0  
 	 b e g i n  
 	 	 - -   V i e w   p r o p e r t i e s  
 	 	 s e l e c t   @ P r o p e r t y L i s t X M L   =   (  
 	 	 	 s e l e c t   P r o p e r t y G r o u p U R I   " @ U R I " ,   _ P r o p e r t y G r o u p L a b e l   " @ L a b e l " ,   S o r t O r d e r   " @ S o r t O r d e r " ,   x . q u e r y ( ' . ' )  
 	 	 	 f r o m   (  
 	 	 	 	 s e l e c t   P r o p e r t y G r o u p U R I ,   _ P r o p e r t y G r o u p L a b e l ,   S o r t O r d e r ,  
 	 	 	 	 (  
 	 	 	 	 	 s e l e c t 	 a . U R I   " @ U R I " ,    
 	 	 	 	 	 	 	 a . T a g N a m e   " @ T a g N a m e " ,    
 	 	 	 	 	 	 	 a . L a b e l   " @ L a b e l " ,    
 	 	 	 	 	 	 	 p . S o r t O r d e r   " @ S o r t O r d e r " ,  
 	 	 	 	 	 	 	 ( c a s e   w h e n   a . C u s t o m D i s p l a y   =   1   t h e n   ' t r u e '   e l s e   ' f a l s e '   e n d )   " @ C u s t o m D i s p l a y " ,  
 	 	 	 	 	 	 	 c a s t ( a . C u s t o m D i s p l a y M o d u l e   a s   x m l )  
 	 	 	 	 	 f r o m   [ o n t o l o g y . ] . P r o p e r t y G r o u p P r o p e r t y   p ,   (  
 	 	 	 	 	 	 s e l e c t   N o d e I D ,  
 	 	 	 	 	 	 	 m a x ( U R I )   U R I ,    
 	 	 	 	 	 	 	 m a x ( T a g N a m e )   T a g N a m e ,    
 	 	 	 	 	 	 	 m a x ( L a b e l )   L a b e l ,  
 	 	 	 	 	 	 	 m a x ( C u s t o m D i s p l a y )   C u s t o m D i s p l a y ,  
 	 	 	 	 	 	 	 m a x ( C u s t o m D i s p l a y M o d u l e )   C u s t o m D i s p l a y M o d u l e  
 	 	 	 	 	 	 f r o m   (  
 	 	 	 	 	 	 	 	 s e l e c t  
 	 	 	 	 	 	 	 	 	 c . _ P r o p e r t y N o d e   N o d e I D ,  
 	 	 	 	 	 	 	 	 	 c . P r o p e r t y   U R I ,  
 	 	 	 	 	 	 	 	 	 c . _ T a g N a m e   T a g N a m e ,  
 	 	 	 	 	 	 	 	 	 c . _ P r o p e r t y L a b e l   L a b e l ,  
 	 	 	 	 	 	 	 	 	 c a s t ( c . C u s t o m D i s p l a y   a s   t i n y i n t )   C u s t o m D i s p l a y ,  
 	 	 	 	 	 	 	 	 	 I s N u l l ( c a s t ( c . C u s t o m D i s p l a y M o d u l e   a s   n v a r c h a r ( m a x ) ) , c a s t ( p . C u s t o m D i s p l a y M o d u l e   a s   n v a r c h a r ( m a x ) ) )   C u s t o m D i s p l a y M o d u l e  
 	 	 	 	 	 	 	 	 f r o m   [ O n t o l o g y . ] . C l a s s P r o p e r t y   c  
 	 	 	 	 	 	 	 	 	 l e f t   o u t e r   j o i n   [ O n t o l o g y . ] . P r o p e r t y G r o u p P r o p e r t y   p  
 	 	 	 	 	 	 	 	 	 o n   c . P r o p e r t y   =   p . P r o p e r t y U R I  
 	 	 	 	 	 	 	 	 w h e r e   c . _ C l a s s N o d e   i n   (  
 	 	 	 	 	 	 	 	 	 s e l e c t   o b j e c t    
 	 	 	 	 	 	 	 	 	 	 f r o m   [ R D F . ] . T r i p l e    
 	 	 	 	 	 	 	 	 	 	 w h e r e   s u b j e c t = @ s u b j e c t   a n d   p r e d i c a t e = @ t y p e I D   a n d   @ p r e d i c a t e   i s   n u l l   a n d   @ o b j e c t   i s   n u l l  
 	 	 	 	 	 	 	 	 	 u n i o n   a l l  
 	 	 	 	 	 	 	 	 	 s e l e c t   @ N e t w o r k N o d e  
 	 	 	 	 	 	 	 	 	 	 w h e r e   @ s u b j e c t   i s   n o t   n u l l   a n d   @ p r e d i c a t e   i s   n o t   n u l l   a n d   @ o b j e c t   i s   n u l l  
 	 	 	 	 	 	 	 	 	 u n i o n   a l l  
 	 	 	 	 	 	 	 	 	 s e l e c t   @ C o n n e c t i o n N o d e  
 	 	 	 	 	 	 	 	 	 	 w h e r e   @ s u b j e c t   i s   n o t   n u l l   a n d   @ p r e d i c a t e   i s   n o t   n u l l   a n d   @ o b j e c t   i s   n o t   n u l l  
 	 	 	 	 	 	 	 	 )  
 	 	 	 	 	 	 	 	 a n d   1   =   ( c a s e 	 w h e n   c . _ N e t w o r k P r o p e r t y N o d e   i s   n u l l   a n d   @ p r e d i c a t e   i s   n u l l   t h e n   1  
 	 	 	 	 	 	 	 	 	 	 	 	 w h e n   c . _ N e t w o r k P r o p e r t y N o d e   i s   n u l l   a n d   @ p r e d i c a t e   i s   n o t   n u l l   a n d   @ o b j e c t   i s   n u l l   a n d   c . _ C l a s s N o d e   =   @ N e t w o r k N o d e   t h e n   1  
 	 	 	 	 	 	 	 	 	 	 	 	 w h e n   c . _ N e t w o r k P r o p e r t y N o d e   i s   n u l l   a n d   @ p r e d i c a t e   i s   n o t   n u l l   a n d   @ o b j e c t   i s   n o t   n u l l   a n d   c . _ C l a s s N o d e   =   @ C o n n e c t i o n N o d e   t h e n   1  
 	 	 	 	 	 	 	 	 	 	 	 	 w h e n   c . _ N e t w o r k P r o p e r t y N o d e   =   @ p r e d i c a t e   a n d   @ o b j e c t   i s   n o t   n u l l   t h e n   1  
 	 	 	 	 	 	 	 	 	 	 	 	 e l s e   0   e n d )  
 	 	 	 	 	 	 	 )   t  
 	 	 	 	 	 	 g r o u p   b y   N o d e I D  
 	 	 	 	 	 )   a  
 	 	 	 	 	 w h e r e   p . _ P r o p e r t y N o d e   =   a . N o d e I D   a n d   p . _ P r o p e r t y G r o u p N o d e   =   g . _ P r o p e r t y G r o u p N o d e  
 	 	 	 	 	 o r d e r   b y   p . S o r t O r d e r  
 	 	 	 	 	 f o r   x m l   p a t h ( ' P r o p e r t y ' ) ,   t y p e  
 	 	 	 	 )   x  
 	 	 	 	 f r o m   [ o n t o l o g y . ] . P r o p e r t y G r o u p   g  
 	 	 	 )   t  
 	 	 	 w h e r e   x   i s   n o t   n u l l  
 	 	 	 o r d e r   b y   S o r t O r d e r  
 	 	 	 f o r   x m l   p a t h ( ' P r o p e r t y G r o u p ' ) ,   t y p e  
 	 	 )  
 	 e n d  
 	 e l s e  
 	 b e g i n  
 	 	 - -   E d i t   p r o p e r t i e s  
 	 	 s e l e c t   @ P r o p e r t y L i s t X M L   =   (  
 	 	 	 s e l e c t   P r o p e r t y G r o u p U R I   " @ U R I " ,   _ P r o p e r t y G r o u p L a b e l   " @ L a b e l " ,   S o r t O r d e r   " @ S o r t O r d e r " ,   x . q u e r y ( ' . ' )  
 	 	 	 f r o m   (  
 	 	 	 	 s e l e c t   P r o p e r t y G r o u p U R I ,   _ P r o p e r t y G r o u p L a b e l ,   S o r t O r d e r ,  
 	 	 	 	 (  
 	 	 	 	 	 s e l e c t 	 a . U R I   " @ U R I " ,    
 	 	 	 	 	 	 	 a . T a g N a m e   " @ T a g N a m e " ,    
 	 	 	 	 	 	 	 a . L a b e l   " @ L a b e l " ,    
 	 	 	 	 	 	 	 p . S o r t O r d e r   " @ S o r t O r d e r " ,  
 	 	 	 	 	 	 	 I s N u l l ( s . V i e w S e c u r i t y G r o u p , a . V i e w S e c u r i t y G r o u p )   " @ V i e w S e c u r i t y G r o u p " ,  
 	 	 	 	 	 	 	 ( c a s e   w h e n   a . C u s t o m E d i t   =   1   t h e n   ' t r u e '   e l s e   ' f a l s e '   e n d )   " @ C u s t o m E d i t " ,  
 	 	 	 	 	 	 	 ( c a s e   w h e n   a . E d i t P e r m i s s i o n s   =   1   t h e n   ' t r u e '   e l s e   ' f a l s e '   e n d )   " @ E d i t P e r m i s s i o n s " ,  
 	 	 	 	 	 	 	 ( c a s e   w h e n   a . E d i t E x i s t i n g   =   1   t h e n   ' t r u e '   e l s e   ' f a l s e '   e n d )   " @ E d i t E x i s t i n g " ,  
 	 	 	 	 	 	 	 ( c a s e   w h e n   a . E d i t A d d N e w   =   1   t h e n   ' t r u e '   e l s e   ' f a l s e '   e n d )   " @ E d i t A d d N e w " ,  
 	 	 	 	 	 	 	 ( c a s e   w h e n   a . E d i t A d d E x i s t i n g   =   1   t h e n   ' t r u e '   e l s e   ' f a l s e '   e n d )   " @ E d i t A d d E x i s t i n g " ,  
 	 	 	 	 	 	 	 ( c a s e   w h e n   a . E d i t D e l e t e   =   1   t h e n   ' t r u e '   e l s e   ' f a l s e '   e n d )   " @ E d i t D e l e t e " ,  
 	 	 	 	 	 	 	 a . M i n C a r d i n a l i t y   " @ M i n C a r d i n a l i t y " ,  
 	 	 	 	 	 	 	 a . M a x C a r d i n a l i t y   " @ M a x C a r d i n a l i t y " ,  
 	 	 	 	 	 	 	 a . O b j e c t T y p e   " @ O b j e c t T y p e " ,  
 	 	 	 	 	 	 	 ( c a s e   w h e n   a . H a s D a t a F e e d   =   1   t h e n   ' t r u e '   e l s e   ' f a l s e '   e n d )   " @ H a s D a t a F e e d " ,  
 	 	 	 	 	 	 	 c a s t ( a . C u s t o m E d i t M o d u l e   a s   x m l )  
 	 	 	 	 	 f r o m   [ o n t o l o g y . ] . P r o p e r t y G r o u p P r o p e r t y   p   i n n e r   j o i n   (  
 	 	 	 	 	 	 s e l e c t   N o d e I D ,  
 	 	 	 	 	 	 	 m a x ( U R I )   U R I ,    
 	 	 	 	 	 	 	 m a x ( T a g N a m e )   T a g N a m e ,    
 	 	 	 	 	 	 	 m a x ( L a b e l )   L a b e l ,  
 	 	 	 	 	 	 	 m a x ( V i e w S e c u r i t y G r o u p )   V i e w S e c u r i t y G r o u p ,  
 	 	 	 	 	 	 	 m a x ( C u s t o m E d i t )   C u s t o m E d i t ,  
 	 	 	 	 	 	 	 m a x ( E d i t P e r m i s s i o n s )   E d i t P e r m i s s i o n s ,  
 	 	 	 	 	 	 	 m a x ( E d i t E x i s t i n g )   E d i t E x i s t i n g ,  
 	 	 	 	 	 	 	 m a x ( E d i t A d d N e w )   E d i t A d d N e w ,  
 	 	 	 	 	 	 	 m a x ( E d i t A d d E x i s t i n g )   E d i t A d d E x i s t i n g ,  
 	 	 	 	 	 	 	 m a x ( E d i t D e l e t e )   E d i t D e l e t e ,  
 	 	 	 	 	 	 	 m i n ( M i n C a r d i n a l i t y )   M i n C a r d i n a l i t y ,  
 	 	 	 	 	 	 	 m a x ( M a x C a r d i n a l i t y )   M a x C a r d i n a l i t y ,  
 	 	 	 	 	 	 	 m a x ( c a s t ( O b j e c t T y p e   a s   t i n y i n t ) )   O b j e c t T y p e ,  
 	 	 	 	 	 	 	 m a x ( H a s D a t a F e e d )   H a s D a t a F e e d ,  
 	 	 	 	 	 	 	 m a x ( C u s t o m E d i t M o d u l e )   C u s t o m E d i t M o d u l e  
 	 	 	 	 	 	 f r o m   (  
 	 	 	 	 	 	 	 	 s e l e c t  
 	 	 	 	 	 	 	 	 	 c . _ P r o p e r t y N o d e   N o d e I D ,  
 	 	 	 	 	 	 	 	 	 c . P r o p e r t y   U R I ,  
 	 	 	 	 	 	 	 	 	 c . _ T a g N a m e   T a g N a m e ,  
 	 	 	 	 	 	 	 	 	 c . _ P r o p e r t y L a b e l   L a b e l ,  
 	 	 	 	 	 	 	 	 	 c . V i e w S e c u r i t y G r o u p ,  
 	 	 	 	 	 	 	 	 	 c a s t ( c . C u s t o m E d i t   a s   t i n y i n t )   C u s t o m E d i t ,  
 	 	 	 	 	 	 	 	 	 ( c a s e   w h e n   (   ( E d i t P e r m i s s i o n s S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( E d i t P e r m i s s i o n s S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l E d i t A c c e s s   =   1 )   O R   ( E d i t P e r m i s s i o n s S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) )   )   t h e n   1   e l s e   0   e n d )   E d i t P e r m i s s i o n s ,  
 	 	 	 	 	 	 	 	 	 ( c a s e   w h e n   (   ( E d i t E x i s t i n g S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( E d i t E x i s t i n g S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l E d i t A c c e s s   =   1 )   O R   ( E d i t E x i s t i n g S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) )   )   t h e n   1   e l s e   0   e n d )   E d i t E x i s t i n g ,  
 	 	 	 	 	 	 	 	 	 ( c a s e   w h e n   (   ( E d i t A d d N e w S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( E d i t A d d N e w S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l E d i t A c c e s s   =   1 )   O R   ( E d i t A d d N e w S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) )   )   t h e n   1   e l s e   0   e n d )   E d i t A d d N e w ,  
 	 	 	 	 	 	 	 	 	 ( c a s e   w h e n   (   ( E d i t A d d E x i s t i n g S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( E d i t A d d E x i s t i n g S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l E d i t A c c e s s   =   1 )   O R   ( E d i t A d d E x i s t i n g S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) )   )   t h e n   1   e l s e   0   e n d )   E d i t A d d E x i s t i n g ,  
 	 	 	 	 	 	 	 	 	 ( c a s e   w h e n   (   ( E d i t D e l e t e S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( E d i t D e l e t e S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l E d i t A c c e s s   =   1 )   O R   ( E d i t D e l e t e S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) )   )   t h e n   1   e l s e   0   e n d )   E d i t D e l e t e ,  
 	 	 	 	 	 	 	 	 	 c . M i n C a r d i n a l i t y ,  
 	 	 	 	 	 	 	 	 	 c . M a x C a r d i n a l i t y ,  
 	 	 	 	 	 	 	 	 	 c . _ O b j e c t T y p e   O b j e c t T y p e ,  
 	 	 	 	 	 	 	 	 	 ( c a s e   w h e n   d . _ P r o p e r t y N o d e   i s   n u l l   t h e n   0   e l s e   1   e n d )   H a s D a t a F e e d ,  
 	 	 	 	 	 	 	 	 	 I s N u l l ( c a s t ( c . C u s t o m E d i t M o d u l e   a s   n v a r c h a r ( m a x ) ) , c a s t ( p . C u s t o m E d i t M o d u l e   a s   n v a r c h a r ( m a x ) ) )   C u s t o m E d i t M o d u l e  
 	 	 	 	 	 	 	 	 f r o m   [ O n t o l o g y . ] . C l a s s P r o p e r t y   c  
 	 	 	 	 	 	 	 	 	 l e f t   o u t e r   j o i n   (  
 	 	 	 	 	 	 	 	 	 	 s e l e c t   d i s t i n c t   _ C l a s s N o d e ,   _ P r o p e r t y N o d e  
 	 	 	 	 	 	 	 	 	 	 f r o m   [ O n t o l o g y . ] . D a t a M a p  
 	 	 	 	 	 	 	 	 	 	 w h e r e   N e t w o r k P r o p e r t y   i s   n u l l   a n d   _ C l a s s N o d e   i s   n o t   n u l l   a n d   _ P r o p e r t y N o d e   i s   n o t   n u l l   a n d   I s A u t o F e e d   =   1  
 	 	 	 	 	 	 	 	 	 )   d  
 	 	 	 	 	 	 	 	 	 	 o n   c . _ C l a s s N o d e   =   d . _ C l a s s N o d e   a n d   c . _ P r o p e r t y N o d e   =   d . _ P r o p e r t y N o d e  
 	 	 	 	 	 	 	 	 	 l e f t   o u t e r   j o i n   [ O n t o l o g y . ] . P r o p e r t y G r o u p P r o p e r t y   p  
 	 	 	 	 	 	 	 	 	 	 o n   c . P r o p e r t y   =   p . P r o p e r t y U R I  
 	 	 	 	 	 	 	 	 w h e r e   c . _ C l a s s N o d e   i n   (  
 	 	 	 	 	 	 	 	 	 s e l e c t   o b j e c t    
 	 	 	 	 	 	 	 	 	 	 f r o m   [ R D F . ] . T r i p l e    
 	 	 	 	 	 	 	 	 	 	 w h e r e   s u b j e c t = @ s u b j e c t   a n d   p r e d i c a t e = @ t y p e I D   a n d   @ p r e d i c a t e   i s   n u l l   a n d   @ o b j e c t   i s   n u l l  
 	 	 	 	 	 	 	 	 )  
 	 	 	 	 	 	 	 	 a n d   c . P r o p e r t y   i s   n o t   n u l l  
 	 	 	 	 	 	 	 	 a n d   c . N e t w o r k P r o p e r t y   i s   n u l l  
 	 	 	 	 	 	 	 	 a n d   (   ( E d i t S e c u r i t y G r o u p   B E T W E E N   @ S e c u r i t y G r o u p I D   A N D   - 1 )   O R   ( E d i t S e c u r i t y G r o u p   >   0   A N D   @ H a s S p e c i a l E d i t A c c e s s   =   1 )   O R   ( E d i t S e c u r i t y G r o u p   I N   ( S E L E C T   *   F R O M   # S e c u r i t y G r o u p N o d e s ) )   )  
 	 	 	 	 	 	 	 )   t  
 	 	 	 	 	 	 g r o u p   b y   N o d e I D  
 	 	 	 	 	 )   a  
 	 	 	 	 	 o n   p . _ P r o p e r t y N o d e   =   a . N o d e I D   a n d   p . _ P r o p e r t y G r o u p N o d e   =   g . _ P r o p e r t y G r o u p N o d e  
 	 	 	 	 	 l e f t   o u t e r   j o i n   [ R D F . S e c u r i t y ] . N o d e P r o p e r t y   s  
 	 	 	 	 	 o n   s . N o d e I D   =   @ s u b j e c t   a n d   s . P r o p e r t y   =   p . _ P r o p e r t y N o d e    
 	 	 	 	 	 o r d e r   b y   p . S o r t O r d e r  
 	 	 	 	 	 f o r   x m l   p a t h ( ' P r o p e r t y ' ) ,   t y p e  
 	 	 	 	 )   x  
 	 	 	 	 f r o m   [ o n t o l o g y . ] . P r o p e r t y G r o u p   g  
 	 	 	 )   t  
 	 	 	 w h e r e   x   i s   n o t   n u l l  
 	 	 	 o r d e r   b y   S o r t O r d e r  
 	 	 	 f o r   x m l   p a t h ( ' P r o p e r t y G r o u p ' ) ,   t y p e  
 	 	 )  
 	 e n d 	  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   C o m b i n e   t h e   P r e s e n t a t i o n X M L   w i t h   p r o p e r t y   i n f o r m a t i o n  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 s e l e c t   @ P r e s e n t a t i o n X M L   =   (  
 	 	 s e l e c t  
 	 	 	 P r e s e n t a t i o n X M L . v a l u e ( ' P r e s e n t a t i o n [ 1 ] / @ P r e s e n t a t i o n C l a s s [ 1 ] ' , ' v a r c h a r ( m a x ) ' )   " @ P r e s e n t a t i o n C l a s s " ,  
 	 	 	 P r e s e n t a t i o n X M L . v a l u e ( ' P r e s e n t a t i o n [ 1 ] / P a g e O p t i o n s [ 1 ] / @ C o l u m n s [ 1 ] ' , ' v a r c h a r ( m a x ) ' )   " P a g e O p t i o n s / @ C o l u m n s " ,  
 	 	 	 ( c a s e   w h e n   @ C a n E d i t   =   1   t h e n   ' t r u e '   e l s e   N U L L   e n d )   " P a g e O p t i o n s / @ C a n E d i t " ,  
 	 	 	 ( c a s e   w h e n   @ C a n E d i t   =   1   t h e n   ' t r u e '   e l s e   N U L L   e n d )   " C a n E d i t " ,  
 	 	 	 P r e s e n t a t i o n X M L . q u e r y ( ' P r e s e n t a t i o n [ 1 ] / W i n d o w N a m e [ 1 ] ' ) ,  
 	 	 	 P r e s e n t a t i o n X M L . q u e r y ( ' P r e s e n t a t i o n [ 1 ] / P a g e C o l u m n s [ 1 ] ' ) ,  
 	 	 	 P r e s e n t a t i o n X M L . q u e r y ( ' P r e s e n t a t i o n [ 1 ] / P a g e T i t l e [ 1 ] ' ) ,  
 	 	 	 P r e s e n t a t i o n X M L . q u e r y ( ' P r e s e n t a t i o n [ 1 ] / P a g e B a c k L i n k N a m e [ 1 ] ' ) ,  
 	 	 	 P r e s e n t a t i o n X M L . q u e r y ( ' P r e s e n t a t i o n [ 1 ] / P a g e B a c k L i n k U R L [ 1 ] ' ) ,  
 	 	 	 P r e s e n t a t i o n X M L . q u e r y ( ' P r e s e n t a t i o n [ 1 ] / P a g e S u b T i t l e [ 1 ] ' ) ,  
 	 	 	 P r e s e n t a t i o n X M L . q u e r y ( ' P r e s e n t a t i o n [ 1 ] / P a g e D e s c r i p t i o n [ 1 ] ' ) ,  
 	 	 	 P r e s e n t a t i o n X M L . q u e r y ( ' P r e s e n t a t i o n [ 1 ] / P a n e l T a b T y p e [ 1 ] ' ) ,  
 	 	 	 P r e s e n t a t i o n X M L . q u e r y ( ' P r e s e n t a t i o n [ 1 ] / P a n e l L i s t [ 1 ] ' ) ,  
 	 	 	 P r e s e n t a t i o n X M L . q u e r y ( ' P r e s e n t a t i o n [ 1 ] / E x p a n d R D F L i s t [ 1 ] ' ) ,  
 	 	 	 @ P r o p e r t y L i s t X M L   " P r o p e r t y L i s t " ,  
 	 	 	 @ S e c u r i t y G r o u p L i s t X M L   " S e c u r i t y G r o u p L i s t "  
 	 	 f r o m   [ O n t o l o g y . P r e s e n t a t i o n ] . [ X M L ]  
 	 	 w h e r e   p r e s e n t a t i o n i d   =   @ P r e s e n t a t i o n I D  
 	 	 f o r   x m l   p a t h ( ' P r e s e n t a t i o n ' ) ,   t y p e  
 	 )  
 	  
 	 i f   @ r e t u r n X M L   =   1  
 	 	 s e l e c t   @ P r e s e n t a t i o n X M L   P r e s e n t a t i o n X M L  
  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A l t e r i n g   [ P r o f i l e . C a c h e ] . [ P e r s o n . U p d a t e P e r s o n ] '  
 G O  
 A L T E R   p r o c e d u r e   [ P r o f i l e . C a c h e ] . [ P e r s o n . U p d a t e P e r s o n ]  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
    
 	 D E C L A R E   @ E r r M s g   n v a r c h a r ( 4 0 0 0 ) ,   @ E r r S e v e r i t y   i n t , @ p r o c   V A R C H A R ( 2 0 0 ) , @ d a t e   D A T E T I M E , @ a u d i t i d   U N I Q U E I D E N T I F I E R , @ r o w s   B I G I N T    
 	 S E L E C T   @ p r o c   =   O B J E C T _ N A M E ( @ @ P R O C I D ) , @ d a t e = G E T D A T E ( )   	  
 	 E X E C   [ P r o f i l e . C a c h e ] . [ P r o c e s s . A d d A u d i t U p d a t e ]   @ a u d i t i d = @ a u d i t i d   O U T P U T , @ P r o c e s s N a m e   = @ p r o c , @ P r o c e s s S t a r t D a t e = @ d a t e , @ i n s e r t _ n e w _ r e c o r d = 1  
    
    
    
 	 S E L E C T   p 2 . * ,  
 	 	 	 	   ( S E L E C T   C A S T ( ( S E L E C T   p . p e r s o n i d                                                                                                                                                                                               " P e r s o n I D " ,  
 	 	 	 	 	 d i s p l a y n a m e                                                                                                                                                                                             " N a m e / F u l l N a m e " ,  
 	 	 	 	 	 f i r s t n a m e                                                                                                                                                                                                 " N a m e / F i r s t N a m e " ,  
 	 	 	 	 	 N U L L                                                                                                                                                                                                           " N a m e / M i d d l e N a m e " ,  
 	 	 	 	 	 l a s t n a m e                                                                                                                                                                                                   " N a m e / L a s t N a m e " ,  
 	 	 	 	 	 N U L L                                                                                                                                                                                                           " N a m e / S u f f i x S t r i n g " ,    
 	 	 	 	 	 a d d r e s s l i n e 1                                                                                                                                                                                           " A d d r e s s / A d d r e s s 1 " ,  
 	 	 	 	 	 a d d r e s s l i n e 2                                                                                                                                                                                           " A d d r e s s / A d d r e s s 2 " ,  
 	 	 	 	 	 a d d r e s s l i n e 3                                                                                                                                                                                           " A d d r e s s / A d d r e s s 3 " ,  
 	 	 	 	 	 a d d r e s s l i n e 4                                                                                                                                                                                           " A d d r e s s / A d d r e s s 4 " ,  
 	 	 	 	 	 p h o n e                                                                                                                                                                                                         " A d d r e s s / T e l e p h o n e " ,  
 	 	 	 	 	 L T R I M ( R T R I M ( f a x ) )                                                                                                                                                                                 " A d d r e s s / F a x " ,  
 	 	 	 	 	 l a t i t u d e                                                                                                                                                                                                   " A d d r e s s / L a t i t u d e " ,  
 	 	 	 	 	 l o n g i t u d e                                                                                                                                                                                                 " A d d r e s s / L o n g i t u d e " ,  
 	 	 	 	 	 ( S E L E C T   p e r s o n f i l t e r c a t e g o r y   " P e r s o n F i l t e r / @ C a t e g o r y " ,  
 	 	 	 	 	 	 	 	 	 p e r s o n f i l t e r                   " P e r s o n F i l t e r "  
 	 	 	 	 	 	   F R O M   [ P r o f i l e . D a t a ] . [ P e r s o n . F i l t e r R e l a t i o n s h i p ]     p t r  
 	 	 	 	 	       J O I N   [ P r o f i l e . D a t a ] . [ P e r s o n . F i l t e r ]   p f   O N   p f . p e r s o n f i l t e r i d   =   p t r . p e r s o n f i l t e r i d  
 	 	 	 	 	 	 W H E R E   p t r . p e r s o n i d   =   p . p e r s o n i d  
 	 	 	 	 	 	 O R D E R   B Y   p e r s o n f i l t e r s o r t   A S C  
 	 	 	 	 	   F O R   X M L   P A T H ( ' ' ) , T Y P E )   A S   " P e r s o n F i l t e r L i s t " ,  
 	 	 	 	 	 ' t r u e '                                                                                                                                                                                                       " A f f i l i a t i o n L i s t / @ V i s i b l e " ,  
 	 	 	 	 	 ( S E L E C T   C A S E    
 	 	 	 	 	 	 	 	 	 	 W H E N   i s p r i m a r y   =   1   T H E N   ' t r u e '  
 	 	 	 	 	 	 	 	 	 	 E L S E   ' f a l s e '  
 	 	 	 	 	 	 	 	 	 E N D   " A f f i l i a t i o n / @ P r i m a r y " ,  
 	 	 	 	 	 	 	 	 	 R O W _ N U M B E R ( )  
 	 	 	 	 	 	 	 	 	 O V E R ( P A R T I T I O N   B Y   p . p e r s o n i d   O R D E R   B Y   i n s t i t u t i o n n a m e )   " A f f i l i a t i o n / A f f i l i a t i o n I D " ,  
 	 	 	 	 	 	 	 	 	 i n s t i t u t i o n a b b r e v i a t i o n                                                                 " A f f i l i a t i o n / I n s t i t u t i o n A b b r e v i a t i o n " ,  
 	 	 	 	 	 	 	 	 	 i n s t i t u t i o n n a m e                                                                                 " A f f i l i a t i o n / I n s t i t u t i o n N a m e " ,  
 	 	 	 	 	 	 	 	 	 d e p a r t m e n t n a m e                                                                                   " A f f i l i a t i o n / D e p a r t m e n t N a m e " ,  
 	 	 	 	 	 	 	 	 	 d i v i s i o n n a m e                                                                               " A f f i l i a t i o n / D i v i s i o n N a m e " ,  
 	 	 	 	 	 	 	 	 	 t i t l e                                                                                                     " A f f i l i a t i o n / J o b T i t l e " ,  
 	 	 	 	 	 	 	 	 	 f r . f a c u l t y r a n k s o r t 	 	 	 	 	 	 	 	 	 	 " A f f i l i a t i o n / F a c u l t y T y p e / @ F a c u l t y T y p e S o r t " ,  
 	 	 	 	 	 	 	 	 	 f r . f a c u l t y r a n k                                                                                     " A f f i l i a t i o n / F a c u l t y T y p e "  
 	 	 	 	 	 	   F R O M   [ P r o f i l e . D a t a ] . [ P e r s o n . A f f i l i a t i o n ]   p 2    
 	 	 	     L E F T   J O I N   [ P r o f i l e . D a t a ] . [ O r g a n i z a t i o n . I n s t i t u t i o n ]   i n s   O N   p 2 . i n s t i t u t i o n i d   =   i n s . i n s t i t u t i o n i d    
 	 	 	 	 L E F T   J O I N   [ P r o f i l e . D a t a ] . [ O r g a n i z a t i o n . D e p a r t m e n t ]   d p   	 O N   d p . d e p a r t m e n t i d   =   p 2 . d e p a r t m e n t i d    
 	 	 	     L E F T   J O I N   [ P r o f i l e . D a t a ] . [ P e r s o n . F a c u l t y R a n k ]   f r   	 O N   f r . f a c u l t y r a n k i d   =   p 2 . f a c u l t y r a n k i d  
 	 	 	 	 	 	 W H E R E   p 2 . p e r s o n i d   =   p . p e r s o n i d  
 	 	 	 	 	 	 O R D E R   B Y   i s p r i m a r y   D E S C  
 	 	 	 	 	   F O R   X M L 	 	 P A T H ( ' ' ) , T Y P E )   A S   " A f f i l i a t i o n L i s t " ,  
    
    
    
 	 	 	 	 	 ( S E L E C T   T O P   1   f r . f a c u l t y r a n k s o r t  
 	 	 	 	 	 	 F R O M   [ P r o f i l e . D a t a ] . [ P e r s o n . A f f i l i a t i o n ]   p 2    
 	 	 	 	 	 	 	 I N N E R   J O I N   [ P r o f i l e . D a t a ] . [ P e r s o n . F a c u l t y R a n k ]   f r  
 	 	 	 	 	 	 	 	 O N   f r . f a c u l t y r a n k i d   =   p 2 . f a c u l t y r a n k i d  
 	 	 	 	 	 	 W H E R E   p 2 . p e r s o n i d   =   p . p e r s o n i d  
 	 	 	 	 	 	 O R D E R   B Y   f r . f a c u l t y r a n k s o r t ) 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 " A c a d e m i c R a n k / @ A c a d e m i c R a n k S o r t " ,  
 	 	 	 	 	 ( S E L E C T   T O P   1   f r . f a c u l t y r a n k    
 	 	 	 	 	 	 F R O M   [ P r o f i l e . D a t a ] . [ P e r s o n . A f f i l i a t i o n ]   p 2    
 	 	 	 	 	 	 	 I N N E R   J O I N   [ P r o f i l e . D a t a ] . [ P e r s o n . F a c u l t y R a n k ]   f r  
 	 	 	 	 	 	 	 	 O N   f r . f a c u l t y r a n k i d   =   p 2 . f a c u l t y r a n k i d  
 	 	 	 	 	 	 W H E R E   p 2 . p e r s o n i d   =   p . p e r s o n i d  
 	 	 	 	 	 	 O R D E R   B Y   f r . f a c u l t y r a n k s o r t ) 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 " A c a d e m i c R a n k " ,  
    
    
    
    
 	 	 	 	 	 ' t r u e '                                                                                                                                                                                                       " P r o f i l e U R L / @ V i s i b l e " ,  
 	 	 	 	 	 ( S E L E C T   V A L U E  
 	 	 	 	 	 	   F R O M   [ F r a m e w o r k . ] . [ P a r a m e t e r ]  
 	 	 	 	 	 	 W H E R E   v a l u e   =   ' P r o f i l e s U R L ' )   +     C A S T ( p . p e r s o n i d   A S   V A R C H A R ( 2 0 ) )   " P r o f i l e U R L " ,    
 	 	 	 	 	 ' t r u e '   " E m a i l I m a g e U r l / @ V i s i b l e " ,  
 	 	 	 	 	 e m a i l a d d r                                                                                                                                                                                                 " E m a i l I m a g e U r l " ,  
 	 	 	 	 	 C A S E    
 	 	 	 	 	 	 W H E N   s h o w p h o t o   =   ' Y '   T H E N   ' t r u e '  
 	 	 	 	 	 	 E L S E   ' f a l s e '  
 	 	 	 	 	 E N D                                                                                           " P h o t o U r l / @ V i s i b l e " ,  
 	 	 	 	 	 C A S E    
 	 	 	 	 	 	 W H E N   s h o w p h o t o   =   ' Y '   T H E N   ' '  
 	 	 	 	 	 	 E L S E   ' '  
 	 	 	 	 	 E N D                  
         F R O M   [ P r o f i l e . D a t a ] . v w P e r s o n   p  
 	 	 W H E R E   p . p e r s o n i d   =   p 2 . p e r s o n i d  
 	 	 F O R   X M L     P A T H ( ' ' ) , T Y P E )   A S   X M L ) )   p e r s o n _ x m l ,  
 	 	 0   H a s P u b l i c a t i o n s ,   0   H a s S N A ,   0   R e a c h 1 ,   0   R e a c h 2 ,   c a s t ( 0   a s   f l o a t )   C l o s e n e s s ,   c a s t ( 0   a s   f l o a t )   B e t w e e n n e s s  
 	 i n t o   # c a c h e _ p e r s o n  
 	 F R O M   [ P r o f i l e . D a t a ] . v w p e r s o n   p 2  
    
 	 s e l e c t   p . p e r s o n i d ,    
 	 	 	 i s n u l l ( i . n , 0 )   N u m P u b l i c a t i o n s ,  
 	 	 	 ( c a s e   w h e n   i s n u l l ( i . n , 0 )   >   0   t h e n   1   e l s e   0   e n d )   H a s P u b l i c a t i o n s ,  
 	 	 	 ( c a s e   w h e n   i s n u l l ( s . c l u s t e r s i z e , 0 ) > 1 0 0 0   t h e n   1   e l s e   0   e n d )   H a s S N A ,  
 	 	 	 i s n u l l ( d . N u m P e o p l e , 0 )   R e a c h 1 ,  
 	 	 	 i s n u l l ( r . N u m P e o p l e , 0 )   R e a c h 2 ,  
 	 	 	 i s n u l l ( c . C l o s e n e s s , 0 )   C l o s e n e s s ,  
 	 	 	 i s n u l l ( b . b , 0 )   B e t w e e n n e s s  
 	 	 i n t o   # c a c h e _ s n a  
 	 	 f r o m   # c a c h e _ p e r s o n   p  
 	 	 	 l e f t   o u t e r   j o i n   ( s e l e c t   p e r s o n i d ,   c o u n t ( * )   n   f r o m   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P e r s o n . I n c l u d e ]   g r o u p   b y   p e r s o n i d )   i   o n   p . p e r s o n i d   =   i . p e r s o n i d  
 	 	 	 l e f t   o u t e r   j o i n   ( s e l e c t   *   f r o m   [ P r o f i l e . C a c h e ] . [ S N A . C o a u t h o r . R e a c h ]   w h e r e   d i s t a n c e   =   1 )   d   o n   p . p e r s o n i d   =   d . p e r s o n i d  
 	 	 	 l e f t   o u t e r   j o i n   ( s e l e c t   *   f r o m   [ P r o f i l e . C a c h e ] . [ S N A . C o a u t h o r . R e a c h ]   w h e r e   d i s t a n c e   =   2 )   r   o n   p . p e r s o n i d   =   r . p e r s o n i d  
 	 	 	 l e f t   o u t e r   j o i n   ( s e l e c t   p e r s o n i d ,   s u m ( c a s t ( N u m P e o p l e   a s   f l o a t ) * D i s t a n c e ) / s u m ( c a s t ( N u m P e o p l e   a s   f l o a t ) )   c l o s e n e s s   f r o m   [ P r o f i l e . C a c h e ] . [ S N A . C o a u t h o r . R e a c h ]   w h e r e   d i s t a n c e   <   9 9   g r o u p   b y   p e r s o n i d )   c   o n   p . p e r s o n i d   =   c . p e r s o n i d  
 	 	 	 l e f t   o u t e r   j o i n   ( s e l e c t   p e r s o n i d ,   s u m ( c a s t ( N u m P e o p l e   a s   i n t ) )   c l u s t e r s i z e   f r o m   [ P r o f i l e . C a c h e ] . [ S N A . C o a u t h o r . R e a c h ]   w h e r e   d i s t a n c e   <   9 9   g r o u p   b y   p e r s o n i d )   s   o n   p . p e r s o n i d   =   s . p e r s o n i d  
 	 	 	 l e f t   o u t e r   j o i n   ( s e l e c t   *   f r o m   [ P r o f i l e . C a c h e ] . [ S N A . C o a u t h o r . B e t w e e n n e s s ] )   b   o n   p . p e r s o n i d   =   b . p e r s o n i d  
 	 a l t e r   t a b l e   # c a c h e _ s n a   a d d   p r i m a r y   k e y   ( p e r s o n i d )  
    
 	 u p d a t e   p  
 	 	 s e t   p . N u m P u b l i c a t i o n s   =   s . N u m P u b l i c a t i o n s ,  
 	 	 	 p . H a s P u b l i c a t i o n s   =   s . H a s P u b l i c a t i o n s ,  
 	 	 	 p . H a s S N A   =   s . H a s S N A ,  
 	 	 	 p . R e a c h 1   =   s . R e a c h 1 ,  
 	 	 	 p . R e a c h 2   =   s . R e a c h 2 ,  
 	 	 	 p . C l o s e n e s s   =   s . C l o s e n e s s ,  
 	 	 	 p . B e t w e e n n e s s   =   s . B e t w e e n n e s s  
 	 	 f r o m   # c a c h e _ p e r s o n   p   i n n e r   j o i n   # c a c h e _ s n a   s   o n   p . p e r s o n i d   =   s . p e r s o n i d  
    
 	 B E G I N   T R Y  
 	 	 B E G I N   T R A N  
 	 	 	 T R U N C A T E   T A B L E   [ P r o f i l e . C a c h e ] . P e r s o n  
 	 	 	 I N S E R T   I N T O   [ P r o f i l e . C a c h e ] . P e r s o n  
 	 	 	 	 S E L E C T   *   F R O M   # c a c h e _ p e r s o n  
 	 	 	 S E L E C T   @ r o w s   =   @ @ R O W C O U N T  
 	 	 C O M M I T  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 - - C h e c k   s u c c e s s  
 	 	 I F   @ @ T R A N C O U N T   >   0     R O L L B A C K  
 	 	 S E L E C T   @ d a t e = G E T D A T E ( )  
 	 	 E X E C   [ P r o f i l e . C a c h e ] . [ P r o c e s s . A d d A u d i t U p d a t e ]   @ a u d i t i d = @ a u d i t i d   O U T P U T , @ P r o c e s s N a m e   = @ p r o c , @ P r o c e s s E n d D a t e = @ d a t e , @ e r r o r   =   1 , @ i n s e r t _ n e w _ r e c o r d = 0  
 	 	 - - R a i s e   a n   e r r o r   w i t h   t h e   d e t a i l s   o f    
    
 S E L E C T 	 @ E r r S e v e r i t y = E R R O R _ S E V E R I T Y   ( )  
 R A I S E R R O R ( @ E r r M s g ,   @ E r r S e v e r i t y ,   1 )  
 	 E N D   C A T C H  
    
 	 S E L E C T   @ d a t e = G E T D A T E ( )  
 	 E X E C   [ P r o f i l e . C a c h e ] . [ P r o c e s s . A d d A u d i t U p d a t e ]   @ a u d i t i d = @ a u d i t i d   O U T P U T , @ P r o c e s s N a m e   = @ p r o c , @ P r o c e s s E n d D a t e = @ d a t e , @ P r o c e s s e d R o w s   =   @ r o w s , @ i n s e r t _ n e w _ r e c o r d = 0  
    
 E N D  
  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A l t e r i n g   [ O n t o l o g y . ] . [ v w P r o p e r t y T a l l ] '  
 G O  
 A L T E R   V I E W   [ O n t o l o g y . ] . [ v w P r o p e r t y T a l l ]  
 A S  
 w i t h   a   a s   (  
 	 	 s e l e c t   d i s t i n c t   S u b j e c t   P r o p e r t y ,   c a s t ( S u b j e c t   a s   v a r b i n a r y ( m a x ) )   x P r o p e r t y  
 	 	 	 f r o m   [ O n t o l o g y . I m p o r t ] . [ T r i p l e ]   b  
 	 	 	 w h e r e   G r a p h   i s   n o t   n u l l  
 	 	 	 	 a n d   P r e d i c a t e   =   ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # t y p e '  
 	 	 	 	 a n d   O b j e c t   i n   ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # D a t a t y p e P r o p e r t y ' , ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # O b j e c t P r o p e r t y ' )  
 	 ) ,   b   a s   (  
 	 	 s e l e c t   t . S u b j e c t   P r o p e r t y ,   t . P r e d i c a t e ,   t . O b j e c t   V a l u e ,    
 	 	 	 t . _ S u b j e c t N o d e   P r o p e r t y N o d e ,   t . _ P r e d i c a t e N o d e   P r e d i c a t e N o d e ,   t . _ O b j e c t N o d e   V a l u e N o d e ,  
 	 	 	 a . x P r o p e r t y  
 	 	 f r o m   a ,   [ O n t o l o g y . I m p o r t ] . [ T r i p l e ]   t  
 	 	 w h e r e   t . G r a p h   i s   n o t   n u l l  
 	 	 	 a n d   a . x P r o p e r t y   =   c a s t ( t . S u b j e c t   a s   v a r b i n a r y ( m a x ) )  
 	 ) ,   c   a s   (  
 	 	 s e l e c t   m . O b j e c t   P r o p e r t y ,   p . P r e d i c a t e ,   p . O b j e c t   V a l u e ,  
 	 	 	 	 m . _ O b j e c t N o d e   P r o p e r t y N o d e ,   p . _ P r e d i c a t e N o d e   P r e d i c a t e N o d e ,   p . _ O b j e c t N o d e   V a l u e N o d e ,  
 	 	 	 	 c a s t ( m . O b j e c t   a s   v a r b i n a r y ( m a x ) )   x P r o p e r t y  
 	 	 	 f r o m   [ O n t o l o g y . I m p o r t ] . [ T r i p l e ]   t ,   [ O n t o l o g y . I m p o r t ] . [ T r i p l e ]   m ,   [ O n t o l o g y . I m p o r t ] . [ T r i p l e ]   p ,   a  
 	 	 	 w h e r e   t . G r a p h   i s   n o t   n u l l  
 	 	 	 	 a n d   t . P r e d i c a t e   =   ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # t y p e '  
 	 	 	 	 a n d   t . O b j e c t   =   ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # R e s t r i c t i o n '  
 	 	 	 	 a n d   m . G r a p h   i s   n o t   n u l l  
 	 	 	 	 a n d   m . O W L   =   t . O W L  
 	 	 	 	 a n d   c a s t ( m . S u b j e c t   a s   v a r b i n a r y ( m a x ) )   =   c a s t ( t . S u b j e c t   a s   v a r b i n a r y ( m a x ) )  
 	 	 	 	 a n d   m . P r e d i c a t e   =   ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # o n P r o p e r t y '  
 	 	 	 	 a n d   p . G r a p h   i s   n o t   n u l l  
 	 	 	 	 a n d   p . O W L   =   t . O W L  
 	 	 	 	 a n d   c a s t ( p . S u b j e c t   a s   v a r b i n a r y ( m a x ) )   =   c a s t ( t . S u b j e c t   a s   v a r b i n a r y ( m a x ) )  
 	 	 	 	 a n d   n o t   ( p . P r e d i c a t e   =   t . P r e d i c a t e   a n d   p . O b j e c t   =   t . O b j e c t )  
 	 	 	 	 a n d   n o t   ( p . P r e d i c a t e   =   m . P r e d i c a t e   a n d   p . O b j e c t   =   m . O b j e c t )  
 	 	 	 	 a n d   c a s t ( m . O b j e c t   a s   v a r b i n a r y ( m a x ) )   =   a . x P r o p e r t y  
 	 ) ,   d   a s   (  
 	 	 s e l e c t   *   f r o m   b  
 	 	 u n i o n   a l l  
 	 	 s e l e c t   *   f r o m   c  
 	 ) ,   e   a s   (  
 	 	 s e l e c t   d i s t i n c t   P r o p e r t y ,    
 	 	 	 ( c a s e   w h e n   P r e d i c a t e   i n   ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # s o m e V a l u e s F r o m ' , ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # a l l V a l u e s F r o m ' )    
 	 	 	 	 t h e n   ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # r a n g e '    
 	 	 	 	 e l s e   P r e d i c a t e   e n d )   P r e d i c a t e ,  
 	 	 	 V a l u e ,  
 	 	 	 P r o p e r t y N o d e ,  
 	 	 	 ( c a s e   w h e n   P r e d i c a t e   i n   ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # s o m e V a l u e s F r o m ' , ' h t t p : / / w w w . w 3 . o r g / 2 0 0 2 / 0 7 / o w l # a l l V a l u e s F r o m ' )    
 	 	 	 	 t h e n   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # r a n g e ' )  
 	 	 	 	 e l s e   P r e d i c a t e N o d e   e n d )   P r e d i c a t e N o d e ,  
 	 	 	 V a l u e N o d e ,  
 	 	 	 x P r o p e r t y  
 	 	 f r o m   d  
 	 )  
 	 s e l e c t   P r o p e r t y ,   P r e d i c a t e ,   V a l u e ,   P r o p e r t y N o d e ,   P r e d i c a t e N o d e ,   V a l u e N o d e  
 	 	 f r o m   e ;  
  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A l t e r i n g   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . G e t P e r s o n I n f o F o r D i s a m b i g u a t i o n ] '  
 G O  
 A L T E R   p r o c e d u r e   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . G e t P e r s o n I n f o F o r D i s a m b i g u a t i o n ]    
 A S  
 B E G I N  
 S E T   n o c o u n t     O N ;  
    
    
 D E C L A R E     @ s e a r c h   X M L ,  
 	 	   @ b a t c h I D   U N I Q U E I D E N T I F I E R ,  
 	 	   @ b a t c h c o u n t   I N T ,  
 	 	   @ t h r e s h o l d   F L O A T  
    
 - - S E T   C u s t o m   T h r e s h o l d   b a s e d   o n   i n t e r n a l   I n s t i t u t i o n a l   L o g i c ,   d e f a u l t   i s   . 9 8  
 S E L E C T   @ t h r e s h o l d   =   . 9 8  
    
 S E L E C T   @ b a t c h I D = N E W I D ( )  
    
 S E L E C T   p e r s o n i d ,    
 	 	 	   ( S E L E C T   I S N U L L ( R T R I M ( f i r s t n a m e ) , ' ' )     " N a m e / F i r s t " ,  
 	 	 	 	 	 	 	   I S N U L L ( R T R I M ( m i d d l e n a m e ) , ' ' )   " N a m e / M i d d l e " ,  
 	 	 	 	 	 	 	   I S N U L L ( R T R I M ( p . l a s t n a m e ) , ' ' )   " N a m e / L a s t " ,  
 	 	 	 	 	 	 	   I S N U L L ( R T R I M ( s u f f i x ) , ' ' )           " N a m e / S u f f i x " ,  
 	 	 	 	 	 	 	   C A S E    
 	 	 	 	 	 	 	 	   W H E N   a . n   i s   n o t   n u l l   o r   b . n   i s   n o t   n u l l    
 	 	 	 	 	 	 	 	 	         / *     B e l o w   i s   e x a m p l e   o f   a   c u s t o m   p i e c e   o f   l o g i c   t o   a l t e r   t h e   d i s a m b i g u a t i o n   b y   t e l l i n g   t h e   d i s a m b i g u a t i o n   s e r v i c e  
 	 	 	 	 	 	 	 	 	 	 t o   R e q u i r e   F i r s t   N a m e   u s a g e   i n   t h e   a l g o r i t h m   f o r   f a c u l t y   w h o   a r e   l o w e r   i n   r a n k   * /  
 	 	 	 	 	 	 	 	 	 o r   f a c u l t y r a n k s o r t   >   4    
 	 	 	 	 	 	 	 	 	 T H E N   ' t r u e '  
 	 	 	 	 	 	 	 	   E L S E   ' f a l s e '  
 	 	 	 	 	 	 	   E N D   " R e q u i r e F i r s t N a m e " ,  
 	 	 	 	 	 	 	   d . c n t 	 	 	 	 	 	 	 	 	 	 	 	 	 " L o c a l D u p l i c a t e N a m e s " ,  
 	 	 	 	 	 	 	   @ t h r e s h o l d 	 	 	 	 	 	 	 	 	 	 	 	 " M a t c h T h r e s h o l d " ,  
 	 	 	 	 	 	 	   ( S E L E C T   D I S T I N C T   I S N U L L ( L T R I M ( I S N U L L ( e m a i l a d d r e s s , p . e m a i l a d d r ) ) , ' ' )   E m a i l  
 	 	 	 	 	 	 	 	 	 F R O M   [ P r o f i l e . D a t a ] . [ P e r s o n . A f f i l i a t i o n ]   p a  
 	 	 	 	 	 	 	 	   W H E R E   p a . p e r s o n i d   =   p . p e r s o n i d  
 	 	 	 	 	 	 	 	 F O R   X M L   P A T H ( ' ' ) , T Y P E )   A S   " E m a i l L i s t " ,  
 	 	 	 	 	 	 	   ( S E L E C T   A f f i l i a t i o n  
 	 	 	 	 	 	 	 	 	 F R O M   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . D i s a m b i g u a t i o n A f f i l i a t i o n ]  
 	 	 	 	 	 	 	 	 F O R   X M L   P A T H ( ' ' ) , T Y P E )   A S   " A f f i l i a t i o n L i s t " ,  
 	 	 	 	 	 	 	 ( S E L E C T   P M I D  
 	 	 	 	 	 	 	       F R O M   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P e r s o n . A d d ]  
 	 	 	 	 	 	 	     W H E R E   p e r s o n i d   = p 2 . p e r s o n i d  
 	 	 	 	 	 	         F O R   X M L   P A T H ( ' ' ) , R O O T ( ' P M I D A d d L i s t ' ) , T Y P E ) ,  
 	 	 	 	 	 	 	 ( S E L E C T   P M I D  
 	 	 	 	 	 	 	       F R O M   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P e r s o n . E x c l u d e ]  
 	 	 	 	 	 	 	     W H E R E   p e r s o n i d   = p 2 . p e r s o n i d  
 	 	 	 	 	 	         F O R   X M L   P A T H ( ' ' ) , R O O T ( ' P M I D E x c l u d e L i s t ' ) , T Y P E )  
 	 	 	 	 	 F R O M   [ P r o f i l e . D a t a ] . P e r s o n   p  
 	 	 	 	 	 	       L E F T   J O I N   (    
 	 	 	 	 	 	 	 	  
 	 	 	 	 	 	 	 	 	       - - c a s e   1  
 	 	 	 	 	 	 	 	 	 	 S E L E C T   L E F T ( f i r s t n a m e , 1 )     f ,  
 	 	 	 	 	 	 	 	 	 	 	 	 	   L E F T ( m i d d l e n a m e , 1 )   m ,  
 	 	 	 	 	 	 	 	 	 	 	 	 	   l a s t n a m e ,  
 	 	 	 	 	 	 	 	 	 	 	 	 	   C O U N T ( *   )                     n  
 	 	 	 	 	 	 	 	 	 	     F R O M   [ P r o f i l e . D a t a ] . P e r s o n  
 	 	 	 	 	 	 	 	 	 	   G R O U P   B Y   L E F T ( f i r s t n a m e , 1 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 	 	   L E F T ( m i d d l e n a m e , 1 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 	 	   l a s t n a m e  
 	 	 	 	 	 	 	 	 	 	 H A V I N G   C O U N T ( *   )   >   1  
 	 	 	 	 	 	 	 	 	 ) A   O N   a . l a s t n a m e   =   p . l a s t n a m e  
 	 	 	 	 	 	 	 	 	     a n d   a . f = l e f t ( f i r s t n a m e , 1 )  
 	 	 	 	 	 	 	 	 	     a n d   a . m   =   l e f t ( m i d d l e n a m e , 1 )  
 	 	 	 	 	 L E F T   J O I N   ( 	 	 	      
    
 	 	 	 	 	 	 	 	 	 - - c a s e   2  
 	 	 	 	 	 	 	 	 	 S E L E C T   L E F T ( f i r s t n a m e , 1 )   f ,  
 	 	 	 	 	 	 	 	 	 	 	 	   l a s t n a m e ,  
 	 	 	 	 	 	 	 	 	 	 	 	   C O U N T ( *   )                   n  
 	 	 	 	 	 	 	 	 	     F R O M   [ P r o f i l e . D a t a ] . P e r s o n  
 	 	 	 	 	 	 	 	 	   G R O U P   B Y   L E F T ( f i r s t n a m e , 1 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 	   l a s t n a m e  
 	 	 	 	 	 	 	 	 	 H A V I N G   C O U N T ( *   )   >   1  
 	 	 	 	 	 	 	 	 	 	 	 	   A N D   S U M ( C A S E    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   W H E N   m i d d l e n a m e   =   ' '   T H E N   1  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   E L S E   0  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	   E N D )   >   0  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	  
 	 	 	 	 	 	 	 	 ) B   o n   b . f   =   l e f t ( f i r s t n a m e , 1 )  
 	 	 	 	 	 	 	 	     a n d   b . l a s t n a m e   =   p . l a s t n a m e  
 	 	 	 	 	   L E F T   J O I N   (   S E L E C T   [ U t i l i t y . N L P ] . [ f n N a m e P a r t 1 ] ( f i r s t n a m e ) F ,  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 l a s t n a m e ,  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 C O U N T ( * ) c n t  
 	 	 	 	 	 	 	 	 	 	 	 	 	   f r o m   [ P r o f i l e . D a t a ] . P e r s o n    
 	 	 	 	 	 	 	 	 	 	 	 	   G R O U P   B Y   [ U t i l i t y . N L P ] . [ f n N a m e P a r t 1 ] ( f i r s t n a m e ) ,    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 	 l a s t n a m e  
 	 	 	 	 	 	 	 	 	 	 	 ) d   o n   d . f   =   [ U t i l i t y . N L P ] . [ f n N a m e P a r t 1 ] ( p 2 . f i r s t n a m e )  
 	 	 	 	 	 	 	 	 	 	 	 	 a n d   d . l a s t n a m e   =   p 2 . l a s t n a m e  
    
 	 	 	 	 	 	 	 	 	 	    
 	 	 	 	   W H E R E   p . p e r s o n i d   =   p 2 . p e r s o n i d  
 	 	 	 	    
 	 	 	 	 F O R   X M L   P A T H ( ' ' ) , R O O T ( ' F i n d P M I D s ' ) )   X M L - - a s   x m l )  
     I N T O   # b a t c h  
     F R O M   [ P r o f i l e . D a t a ] . v w p e r s o n     p 2  
      
        
 S E L E C T   @ b a t c h c o u n t = @ @ R O W C O U N T  
    
 S E L E C T   @ B a t c h I D , @ b a t c h c o u n t , *  
     F R O M   # b a t c h    
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ O n t o l o g y . P r e s e n t a t i o n ] . [ P a n e l ] '  
 G O  
 C R E A T E   T A B L E   [ O n t o l o g y . P r e s e n t a t i o n ] . [ P a n e l ]  
 (  
 [ P r e s e n t a t i o n I D ]   [ i n t ]   N O T   N U L L ,  
 [ T y p e ]   [ v a r c h a r ]   ( 1 0 0 )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N O T   N U L L ,  
 [ T a b S o r t ]   [ i n t ]   N O T   N U L L ,  
 [ T a b T y p e ]   [ v a r c h a r ]   ( 1 0 0 )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N U L L ,  
 [ A l i a s ]   [ v a r c h a r ]   ( m a x )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N U L L ,  
 [ N a m e ]   [ v a r c h a r ]   ( m a x )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N U L L ,  
 [ I c o n ]   [ v a r c h a r ]   ( m a x )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N U L L ,  
 [ D i s p l a y R u l e ]   [ v a r c h a r ]   ( m a x )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N U L L ,  
 [ M o d u l e X M L ]   [ x m l ]   N U L L  
 )  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   p r i m a r y   k e y   [ P K _ _ P a n e l _ _ F 5 0 6 4 D 5 6 4 9 5 A A D B A ]   o n   [ O n t o l o g y . P r e s e n t a t i o n ] . [ P a n e l ] '  
 G O  
 A L T E R   T A B L E   [ O n t o l o g y . P r e s e n t a t i o n ] . [ P a n e l ]   A D D   C O N S T R A I N T   [ P K _ _ P a n e l _ _ F 5 0 6 4 D 5 6 4 9 5 A A D B A ]   P R I M A R Y   K E Y   C L U S T E R E D     ( [ P r e s e n t a t i o n I D ] ,   [ T y p e ] ,   [ T a b S o r t ] )  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ O n t o l o g y . P r e s e n t a t i o n ] . [ G e n e r a l ] '  
 G O  
 C R E A T E   T A B L E   [ O n t o l o g y . P r e s e n t a t i o n ] . [ G e n e r a l ]  
 (  
 [ P r e s e n t a t i o n I D ]   [ i n t ]   N O T   N U L L ,  
 [ T y p e ]   [ c h a r ]   ( 1 )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N O T   N U L L ,  
 [ S u b j e c t ]   [ n v a r c h a r ]   ( 4 0 0 )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N U L L ,  
 [ P r e d i c a t e ]   [ n v a r c h a r ]   ( 4 0 0 )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N U L L ,  
 [ O b j e c t ]   [ n v a r c h a r ]   ( 4 0 0 )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N U L L ,  
 [ P a g e C o l u m n s ]   [ i n t ]   N U L L ,  
 [ W i n d o w N a m e ]   [ v a r c h a r ]   ( m a x )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N U L L ,  
 [ P a g e T i t l e ]   [ v a r c h a r ]   ( m a x )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N U L L ,  
 [ P a g e B a c k L i n k N a m e ]   [ v a r c h a r ]   ( m a x )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N U L L ,  
 [ P a g e B a c k L i n k U R L ]   [ v a r c h a r ]   ( m a x )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N U L L ,  
 [ P a g e S u b T i t l e ]   [ v a r c h a r ]   ( m a x )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N U L L ,  
 [ P a g e D e s c r i p t i o n ]   [ v a r c h a r ]   ( m a x )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N U L L ,  
 [ P a n e l T a b T y p e ]   [ v a r c h a r ]   ( m a x )   C O L L A T E   S Q L _ L a t i n 1 _ G e n e r a l _ C P 1 _ C I _ A S   N U L L ,  
 [ E x p a n d R D F L i s t ]   [ x m l ]   N U L L  
 )  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   p r i m a r y   k e y   [ P K _ _ G e n e r a l _ _ B 3 6 1 3 E 3 C 3 E D D 1 F 4 7 ]   o n   [ O n t o l o g y . P r e s e n t a t i o n ] . [ G e n e r a l ] '  
 G O  
 A L T E R   T A B L E   [ O n t o l o g y . P r e s e n t a t i o n ] . [ G e n e r a l ]   A D D   P R I M A R Y   K E Y   C L U S T E R E D     ( [ P r e s e n t a t i o n I D ] )  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ O n t o l o g y . P r e s e n t a t i o n ] . [ C o n v e r t X M L 2 T a b l e s ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ O n t o l o g y . P r e s e n t a t i o n ] . [ C o n v e r t X M L 2 T a b l e s ]  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
 	 t r u n c a t e   t a b l e   [ O n t o l o g y . P r e s e n t a t i o n ] . [ G e n e r a l ]  
 	 i n s e r t   i n t o   [ O n t o l o g y . P r e s e n t a t i o n ] . [ G e n e r a l ]  
 	 	 s e l e c t 	 P r e s e n t a t i o n I D ,    
 	 	 	 	 T y p e ,  
 	 	 	 	 S u b j e c t ,  
 	 	 	 	 P r e d i c a t e ,  
 	 	 	 	 O b j e c t ,  
 	 	 	 	 P r e s e n t a t i o n X M L . v a l u e ( ' P r e s e n t a t i o n [ 1 ] / P a g e O p t i o n s [ 1 ] / @ C o l u m n s [ 1 ] ' , ' v a r c h a r ( m a x ) ' )   P a g e C o l u m n s ,  
 	 	 	 	 P r e s e n t a t i o n X M L . v a l u e ( ' P r e s e n t a t i o n [ 1 ] / W i n d o w N a m e [ 1 ] ' , ' v a r c h a r ( m a x ) ' )   W i n d o w N a m e ,  
 	 	 	 	 P r e s e n t a t i o n X M L . v a l u e ( ' P r e s e n t a t i o n [ 1 ] / P a g e T i t l e [ 1 ] ' , ' v a r c h a r ( m a x ) ' )   P a g e T i t l e ,  
 	 	 	 	 P r e s e n t a t i o n X M L . v a l u e ( ' P r e s e n t a t i o n [ 1 ] / P a g e B a c k L i n k N a m e [ 1 ] ' , ' v a r c h a r ( m a x ) ' )   P a g e B a c k L i n k N a m e ,  
 	 	 	 	 P r e s e n t a t i o n X M L . v a l u e ( ' P r e s e n t a t i o n [ 1 ] / P a g e B a c k L i n k U R L [ 1 ] ' , ' v a r c h a r ( m a x ) ' )   P a g e B a c k L i n k U R L ,  
 	 	 	 	 P r e s e n t a t i o n X M L . v a l u e ( ' P r e s e n t a t i o n [ 1 ] / P a g e S u b T i t l e [ 1 ] ' , ' v a r c h a r ( m a x ) ' )   P a g e S u b T i t l e ,  
 	 	 	 	 P r e s e n t a t i o n X M L . v a l u e ( ' P r e s e n t a t i o n [ 1 ] / P a g e D e s c r i p t i o n [ 1 ] ' , ' v a r c h a r ( m a x ) ' )   P a g e D e s c r i p t i o n ,  
 	 	 	 	 P r e s e n t a t i o n X M L . v a l u e ( ' P r e s e n t a t i o n [ 1 ] / P a n e l T a b T y p e [ 1 ] ' , ' v a r c h a r ( m a x ) ' )   P a n e l T a b T y p e ,  
 	 	 	 	 ( C A S E   W H E N   C A S T ( P r e s e n t a t i o n X M L . q u e r y ( ' P r e s e n t a t i o n [ 1 ] / E x p a n d R D F L i s t [ 1 ] / * ' )   A S   N V A R C H A R ( M A X ) )   < >   ' '  
 	 	 	 	 	 T H E N   P r e s e n t a t i o n X M L . q u e r y ( ' P r e s e n t a t i o n [ 1 ] / E x p a n d R D F L i s t [ 1 ] / * ' )  
 	 	 	 	 	 E L S E   N U L L   E N D )   E x p a n d R D F L i s t  
 	 	 	 f r o m   [ O n t o l o g y . P r e s e n t a t i o n ] . [ X M L ]  
  
 	 t r u n c a t e   t a b l e   [ O n t o l o g y . P r e s e n t a t i o n ] . [ P a n e l ]  
 	 i n s e r t   i n t o   [ O n t o l o g y . P r e s e n t a t i o n ] . [ P a n e l ]  
 	 	 s e l e c t 	 o . P r e s e n t a t i o n I D ,  
 	 	 	 	 p . x . v a l u e ( ' @ T y p e ' , ' v a r c h a r ( m a x ) ' )   T y p e ,    
 	 	 	 	 I s N u l l ( p . x . v a l u e ( ' @ T a b S o r t ' , ' v a r c h a r ( m a x ) ' ) , - 1 )   T a b S o r t ,    
 	 	 	 	 p . x . v a l u e ( ' @ T a b T y p e ' , ' v a r c h a r ( m a x ) ' )   T a b T y p e ,  
 	 	 	 	 p . x . v a l u e ( ' @ A l i a s ' , ' v a r c h a r ( m a x ) ' )   A l i a s ,  
 	 	 	 	 p . x . v a l u e ( ' @ N a m e ' , ' v a r c h a r ( m a x ) ' )   N a m e ,  
 	 	 	 	 p . x . v a l u e ( ' @ I c o n ' , ' v a r c h a r ( m a x ) ' )   I c o n ,  
 	 	 	 	 p . x . v a l u e ( ' @ D i s p l a y R u l e ' , ' v a r c h a r ( m a x ) ' )   D i s p l a y R u l e ,  
 	 	 	 	 ( C A S E   W H E N   C A S T ( p . x . q u e r y ( ' . / * ' )   A S   N V A R C H A R ( M A X ) )   < >   ' '  
 	 	 	 	 	 T H E N   p . x . q u e r y ( ' . / * ' )  
 	 	 	 	 	 E L S E   N U L L   E N D )   M o d u l e X M L  
 	 	 	 f r o m   [ O n t o l o g y . P r e s e n t a t i o n ] . [ X M L ]   o   C R O S S   A P P L Y   o . P r e s e n t a t i o n X M L . n o d e s ( ' P r e s e n t a t i o n [ 1 ] / P a n e l L i s t [ 1 ] / P a n e l ' )   a s   p ( x )  
 	 	 	 w h e r e   p . x . v a l u e ( ' @ T y p e ' , ' v a r c h a r ( m a x ) ' )   < >   ' '  
  
 	 - -   S E L E C T   *   F R O M   [ O n t o l o g y . P r e s e n t a t i o n ] . [ G e n e r a l ]  
 	 - -   S E L E C T   *   F R O M   [ O n t o l o g y . P r e s e n t a t i o n ] . [ P a n e l ]  
  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ O n t o l o g y . P r e s e n t a t i o n ] . [ C o n v e r t T a b l e s 2 X M L ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ O n t o l o g y . P r e s e n t a t i o n ] . [ C o n v e r t T a b l e s 2 X M L ]  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
 	 T R U N C A T E   T A B L E   [ O n t o l o g y . P r e s e n t a t i o n ] . [ X M L ]  
 	 I N S E R T   I N T O   [ O n t o l o g y . P r e s e n t a t i o n ] . [ X M L ]  
 	 	 S E L E C T   P r e s e n t a t i o n I D ,   T y p e ,   S u b j e c t ,   P r e d i c a t e ,   O b j e c t ,  
 	 	 	 ( S E L E C T 	 ( C A S E   T y p e   W H E N   ' P '   T H E N   ' p r o f i l e '   W H E N   ' N '   T H E N   ' n e t w o r k '   W H E N   ' C '   T H E N   ' c o n n e c t i o n '   W H E N   ' E '   T H E N   ' p r o f i l e '   E N D )   " @ P r e s e n t a t i o n C l a s s " ,  
 	 	 	 	 	 P a g e C o l u m n s   " P a g e O p t i o n s / @ C o l u m n s " ,  
 	 	 	 	 	 W i n d o w N a m e ,  
 	 	 	 	 	 P a g e C o l u m n s ,  
 	 	 	 	 	 P a g e T i t l e ,  
 	 	 	 	 	 P a g e B a c k L i n k N a m e ,  
 	 	 	 	 	 P a g e B a c k L i n k U R L ,  
 	 	 	 	 	 P a g e S u b T i t l e ,  
 	 	 	 	 	 P a g e D e s c r i p t i o n ,  
 	 	 	 	 	 P a n e l T a b T y p e ,  
 	 	 	 	 	 ( S E L E C T 	 T y p e   " P a n e l / @ T y p e " ,  
 	 	 	 	 	 	 	 ( C A S E   W H E N   T a b S o r t   =   - 1   T H E N   N U L L   E L S E   T a b S o r t   E N D )   " P a n e l / @ T a b S o r t " ,  
 	 	 	 	 	 	 	 T a b T y p e   " P a n e l / @ T a b T y p e " ,  
 	 	 	 	 	 	 	 A l i a s   " P a n e l / @ A l i a s " ,  
 	 	 	 	 	 	 	 N a m e   " P a n e l / @ N a m e " ,  
 	 	 	 	 	 	 	 I c o n   " P a n e l / @ I c o n " ,  
 	 	 	 	 	 	 	 D i s p l a y R u l e   " P a n e l / @ D i s p l a y R u l e " ,  
 	 	 	 	 	 	 	 M o d u l e X M L   " P a n e l "  
 	 	 	 	 	 	 F R O M   [ O n t o l o g y . P r e s e n t a t i o n ] . [ P a n e l ]   p  
 	 	 	 	 	 	 W H E R E   p . P r e s e n t a t i o n I D   =   g . P r e s e n t a t i o n I D  
 	 	 	 	 	 	 F O R   X M L   P A T H ( ' ' ) ,   T Y P E  
 	 	 	 	 	 )   P a n e l L i s t ,  
 	 	 	 	 	 E x p a n d R D F L i s t   E x p a n d R D F L i s t  
 	 	 	 	 F O R   X M L   P A T H ( ' P r e s e n t a t i o n ' ) ,   T Y P E  
 	 	 	 )   P r e s e n t a t i o n X M L ,  
 	 	 	 [ R D F . ] . f n U R I 2 N o d e I D ( s u b j e c t )   _ S u b j e c t N o d e ,  
 	 	 	 [ R D F . ] . f n U R I 2 N o d e I D ( p r e d i c a t e )   _ P r e d i c a t e N o d e ,  
 	 	 	 [ R D F . ] . f n U R I 2 N o d e I D ( o b j e c t )   _ O b j e c t N o d e  
 	 	 F R O M   [ O n t o l o g y . P r e s e n t a t i o n ] . [ G e n e r a l ]   g  
  
 	 - -   S E L E C T   *   F R O M   [ O n t o l o g y . P r e s e n t a t i o n ] . [ X M L ]  
  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' R e f r e s h i n g   [ P r o f i l e . D a t a ] . [ v w P e r s o n . S e c u r i t y G r o u p ] '  
 G O  
 E X E C   s p _ r e f r e s h v i e w   N ' [ P r o f i l e . D a t a ] . [ v w P e r s o n . S e c u r i t y G r o u p ] '  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A l t e r i n g   [ O n t o l o g y . ] . [ C l e a n U p ] '  
 G O  
 A L T E R   P R O C E D U R E   [ O n t o l o g y . ] . [ C l e a n U p ]  
 	 @ A c t i o n   v a r c h a r ( 1 0 0 )   =   N U L L  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
 	 - -   T h i s   s t o r e d   p r o c e d u r e   c o n t a i n s   c o d e   t o   h e l p   d e v e l o p e r s   m a n a g e  
 	 - -   c o n t e n t   i n   s e v e r a l   o n t o l o g y   t a b l e s .  
 	  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   V i e w   t h e   c o n t e n t s   o f   t h e   t a b l e s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 i f   @ A c t i o n   =   ' S h o w T a b l e s '  
 	 b e g i n  
 	 	 s e l e c t   *   f r o m   [ O n t o l o g y . ] . C l a s s G r o u p  
 	 	 s e l e c t   *   f r o m   [ O n t o l o g y . ] . C l a s s G r o u p C l a s s  
 	 	 s e l e c t   *   f r o m   [ O n t o l o g y . ] . C l a s s P r o p e r t y  
 	 	 s e l e c t   *   f r o m   [ O n t o l o g y . ] . D a t a M a p  
 	 	 s e l e c t   *   f r o m   [ O n t o l o g y . ] . N a m e s p a c e  
 	 	 s e l e c t   *   f r o m   [ O n t o l o g y . ] . O W L  
 	 	 s e l e c t   *   f r o m   [ O n t o l o g y . ] . P r e s e n t a t i o n  
 	 	 s e l e c t   *   f r o m   [ O n t o l o g y . ] . P r o p e r t y G r o u p  
 	 	 s e l e c t   *   f r o m   [ O n t o l o g y . ] . P r o p e r t y G r o u p P r o p e r t y  
 	 	 s e l e c t   *   f r o m   [ O n t o l o g y . I m p o r t ] . [ T r i p l e ]  
 	 e n d  
 	  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   I n s e r t   m i s s i n g   r e c o r d s ,   u s e   d e f a u l t   v a l u e s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 i f   @ A c t i o n   =   ' A d d M i s s i n g R e c o r d s '  
 	 b e g i n  
  
 	 	 i n s e r t   i n t o   [ O n t o l o g y . ] . C l a s s P r o p e r t y   ( C l a s s P r o p e r t y I D ,   C l a s s ,   N e t w o r k P r o p e r t y ,   P r o p e r t y ,   I s D e t a i l ,   L i m i t ,   I n c l u d e D e s c r i p t i o n ,   I n c l u d e N e t w o r k ,   S e a r c h W e i g h t ,   C u s t o m D i s p l a y ,   C u s t o m E d i t ,   V i e w S e c u r i t y G r o u p ,   E d i t S e c u r i t y G r o u p ,   E d i t P e r m i s s i o n s S e c u r i t y G r o u p ,   E d i t E x i s t i n g S e c u r i t y G r o u p ,   E d i t A d d N e w S e c u r i t y G r o u p ,   E d i t A d d E x i s t i n g S e c u r i t y G r o u p ,   E d i t D e l e t e S e c u r i t y G r o u p ,   M i n C a r d i n a l i t y ,   M a x C a r d i n a l i t y ,   C u s t o m E d i t M o d u l e )  
 	 	 	 s e l e c t   C l a s s P r o p e r t y I D ,   C l a s s ,   N e t w o r k P r o p e r t y ,   P r o p e r t y ,   I s D e t a i l ,   L i m i t ,   I n c l u d e D e s c r i p t i o n ,   I n c l u d e N e t w o r k ,   S e a r c h W e i g h t ,   C u s t o m D i s p l a y ,   C u s t o m E d i t ,   V i e w S e c u r i t y G r o u p ,   E d i t S e c u r i t y G r o u p ,   E d i t P e r m i s s i o n s S e c u r i t y G r o u p ,   E d i t E x i s t i n g S e c u r i t y G r o u p ,   E d i t A d d N e w S e c u r i t y G r o u p ,   E d i t A d d E x i s t i n g S e c u r i t y G r o u p ,   E d i t D e l e t e S e c u r i t y G r o u p ,   M i n C a r d i n a l i t y ,   M a x C a r d i n a l i t y ,   C u s t o m E d i t M o d u l e  
 	 	 	 	 f r o m   [ O n t o l o g y . ] . v w M i s s i n g C l a s s P r o p e r t y  
  
 	 	 i n s e r t   i n t o   [ O n t o l o g y . ] . P r o p e r t y G r o u p P r o p e r t y   ( P r o p e r t y G r o u p U R I ,   P r o p e r t y U R I ,   S o r t O r d e r )  
 	 	 	 s e l e c t   P r o p e r t y G r o u p U R I ,   P r o p e r t y U R I ,   S o r t O r d e r  
 	 	 	 	 f r o m   [ O n t o l o g y . ] . v w M i s s i n g P r o p e r t y G r o u p P r o p e r t y  
  
 	 e n d  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   U p d a t e   I D s   u s i n g   t h e   d e f a u l t   s o r t   o r d e r  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 i f   @ A c t i o n   =   ' U p d a t e I D s '  
 	 b e g i n  
 	 	  
 	 	 u p d a t e   x  
 	 	 	 s e t   x . C l a s s P r o p e r t y I D   =   y . k  
 	 	 	 f r o m   [ O n t o l o g y . ] . C l a s s P r o p e r t y   x ,   (  
 	 	 	 	 s e l e c t   * ,   r o w _ n u m b e r ( )   o v e r   ( o r d e r   b y   ( c a s e   w h e n   N e t w o r k P r o p e r t y   i s   n u l l   t h e n   0   e l s e   1   e n d ) ,   C l a s s ,   N e t w o r k P r o p e r t y ,   I s D e t a i l ,   I n c l u d e N e t w o r k ,   P r o p e r t y )   k  
 	 	 	 	 	 f r o m   [ O n t o l o g y . ] . C l a s s P r o p e r t y  
 	 	 	 )   y  
 	 	 	 w h e r e   x . C l a s s   =   y . C l a s s   a n d   x . P r o p e r t y   =   y . P r o p e r t y  
 	 	 	 	 a n d   ( ( x . N e t w o r k P r o p e r t y   i s   n u l l   a n d   y . N e t w o r k P r o p e r t y   i s   n u l l )   o r   ( x . N e t w o r k P r o p e r t y   =   y . N e t w o r k P r o p e r t y ) )  
  
 	 	 u p d a t e   x  
 	 	 	 s e t   x . D a t a M a p I D   =   y . k  
 	 	 	 f r o m   [ O n t o l o g y . ] . D a t a M a p   x ,   (  
 	 	 	 	 s e l e c t   * ,   r o w _ n u m b e r ( )   o v e r   ( o r d e r   b y 	 ( c a s e   w h e n   P r o p e r t y   i s   n u l l   t h e n   0   w h e n   N e t w o r k P r o p e r t y   i s   n u l l   t h e n   1   e l s e   2   e n d ) ,    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 ( c a s e   w h e n   C l a s s   =   ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # U s e r '   t h e n   0   e l s e   1   e n d ) ,    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 C l a s s ,  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 ( c a s e   w h e n   N e t w o r k P r o p e r t y   =   ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # t y p e '   t h e n   0   w h e n   N e t w o r k P r o p e r t y   =   ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # l a b e l '   t h e n   1   e l s e   2   e n d ) ,  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 N e t w o r k P r o p e r t y ,    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 ( c a s e   w h e n   P r o p e r t y   =   ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # t y p e '   t h e n   0   w h e n   P r o p e r t y   =   ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # l a b e l '   t h e n   1   e l s e   2   e n d ) ,  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 M a p T a b l e ,  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 P r o p e r t y  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 )   k  
 	 	 	 	 	 f r o m   [ O n t o l o g y . ] . D a t a M a p  
 	 	 	 )   y  
 	 	 	 w h e r e   x . C l a s s   =   y . C l a s s   a n d   x . s I n t e r n a l T y p e   =   y . s I n t e r n a l T y p e  
 	 	 	 	 a n d   ( ( x . P r o p e r t y   i s   n u l l   a n d   y . P r o p e r t y   i s   n u l l )   o r   ( x . P r o p e r t y   =   y . P r o p e r t y ) )  
 	 	 	 	 a n d   ( ( x . N e t w o r k P r o p e r t y   i s   n u l l   a n d   y . N e t w o r k P r o p e r t y   i s   n u l l )   o r   ( x . N e t w o r k P r o p e r t y   =   y . N e t w o r k P r o p e r t y ) )  
  
 	 	 u p d a t e   x  
 	 	 	 s e t   x . P r e s e n t a t i o n I D   =   y . k  
 	 	 	 f r o m   [ O n t o l o g y . ] . P r e s e n t a t i o n   x ,   (  
 	 	 	 	 s e l e c t   * ,   r o w _ n u m b e r ( )   o v e r   ( o r d e r   b y 	 ( c a s e   w h e n   T y p e   =   ' E '   t h e n   1   e l s e   0   e n d ) ,    
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 S u b j e c t ,  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 ( c a s e   T y p e   w h e n   ' P '   t h e n   1   w h e n   ' N '   t h e n   2   e l s e   3   e n d ) ,  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 P r e d i c a t e ,   O b j e c t  
 	 	 	 	 	 	 	 	 	 	 	 	 	 	 )   k  
 	 	 	 	 	 f r o m   [ O n t o l o g y . ] . P r e s e n t a t i o n  
 	 	 	 )   y  
 	 	 	 w h e r e   x . T y p e   =   y . T y p e  
 	 	 	 	 a n d   ( ( x . S u b j e c t   i s   n u l l   a n d   y . S u b j e c t   i s   n u l l )   o r   ( x . S u b j e c t   =   y . S u b j e c t ) )  
 	 	 	 	 a n d   ( ( x . P r e d i c a t e   i s   n u l l   a n d   y . P r e d i c a t e   i s   n u l l )   o r   ( x . P r e d i c a t e   =   y . P r e d i c a t e ) )  
 	 	 	 	 a n d   ( ( x . O b j e c t   i s   n u l l   a n d   y . O b j e c t   i s   n u l l )   o r   ( x . O b j e c t   =   y . O b j e c t ) ) 	  
  
 	 e n d  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   U p d a t e   d e r i v e d   a n d   c a l c u l a t e d   f i e l d s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 i f   @ A c t i o n   =   ' U p d a t e F i e l d s '  
 	 b e g i n  
 	 	 e x e c   [ O n t o l o g y . ] . U p d a t e D e r i v e d F i e l d s  
 	 	 e x e c   [ O n t o l o g y . ] . U p d a t e C o u n t s  
 	 e n d  
          
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A l t e r i n g   [ U s e r . S e s s i o n ] . [ C r e a t e S e s s i o n ] '  
 G O  
 A L T E R   p r o c e d u r e   [ U s e r . S e s s i o n ] . [ C r e a t e S e s s i o n ]  
         @ R e q u e s t I P   V A R C H A R ( 1 6 ) ,  
         @ U s e r A g e n t   V A R C H A R ( 5 0 0 )   =   N U L L ,  
         @ U s e r I D   V A R C H A R ( 2 0 0 )   =   N U L L ,  
 	 @ S e s s i o n P e r s o n N o d e I D   B I G I N T   =   N U L L   O U T P U T ,  
 	 @ S e s s i o n P e r s o n U R I   V A R C H A R ( 4 0 0 )   =   N U L L   O U T P U T  
 A S    
 B E G I N  
    
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N   ;  
  
 	 - -   S e e   i f   t h e r e   i s   a   P e r s o n I D   a s s o c i a t e d   w i t h   t h e   u s e r 	  
 	 D E C L A R E   @ P e r s o n I D   I N T  
 	 I F   @ U s e r I D   I S   N O T   N U L L  
 	 	 S E L E C T   @ P e r s o n I D   =   P e r s o n I D  
 	 	 	 F R O M   [ U s e r . A c c o u n t ] . [ U s e r ]  
 	 	 	 W H E R E   U s e r I D   =   @ U s e r I D  
  
 	 - -   G e t   t h e   N o d e I D   a n d   U R I   o f   t h e   P e r s o n I D  
 	 I F   @ P e r s o n I D   I S   N O T   N U L L  
 	 B E G I N  
 	 	 S E L E C T   @ S e s s i o n P e r s o n N o d e I D   =   m . N o d e I D ,   @ S e s s i o n P e r s o n U R I   =   p . V a l u e   +   C A S T ( m . N o d e I D   A S   V A R C H A R ( 5 0 ) )  
 	 	 	 F R O M   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   m ,   [ F r a m e w o r k . ] . [ P a r a m e t e r ]   p  
 	 	 	 W H E R E   m . I n t e r n a l I D   =   @ P e r s o n I D  
 	 	 	 	 A N D   m . I n t e r n a l T y p e   =   ' p e r s o n '  
 	 	 	 	 A N D   m . C l a s s   =   ' h t t p : / / x m l n s . c o m / f o a f / 0 . 1 / P e r s o n '  
 	 	 	 	 A N D   p . P a r a m e t e r I D   =   ' b a s e U R I '  
 	 E N D  
  
    
         D E C L A R E   @ S e s s i o n I D   U N I Q U E I D E N T I F I E R  
   B E G I N   T R Y    
 	 B E G I N   T R A N S A C T I O N  
    
 	 	 - -   C r e a t e   a   S e s s i o n I D  
 	 	 S E L E C T   @ S e s s i o n I D   =   N E W I D ( )  
    
 	 	 - -   C r e a t e   t h e   S e s s i o n   t a b l e   r e c o r d  
 	 	 I N S E R T   I N T O   [ U s e r . S e s s i o n ] . S e s s i o n  
 	 	 	 ( 	 S e s s i o n I D ,  
 	 	 	 	 C r e a t e D a t e ,  
 	 	 	 	 L a s t U s e d D a t e ,  
 	 	 	 	 L o g i n D a t e ,  
 	 	 	 	 L o g o u t D a t e ,  
 	 	 	 	 R e q u e s t I P ,  
 	 	 	 	 U s e r I D ,  
 	 	 	 	 U s e r N o d e ,  
 	 	 	 	 P e r s o n I D ,  
 	 	 	 	 U s e r A g e n t ,  
 	 	 	 	 I s B o t  
 	 	 	 )  
                         S E L E C T     @ S e s s i o n I D   ,  
                                         G E T D A T E ( )   ,  
                                         G E T D A T E ( )   ,  
                                         C A S E   W H E N   @ U s e r I D   I S   N U L L   T H E N   N U L L  
                                                   E L S E   G E T D A T E ( )  
                                         E N D   ,  
                                         N U L L   ,  
                                         @ R e q u e s t I P   ,  
                                         @ U s e r I D   ,  
 	 	 	 	 	 ( S E L E C T   N o d e I D   F R O M   [ U s e r . A c c o u n t ] . [ U s e r ]   W H E R E   U s e r I D   =   @ U s e r I D   A N D   @ U s e r I D   I S   N O T   N U L L ) ,  
                                         @ P e r s o n I D ,  
                                         @ U s e r A g e n t ,  
                                         0  
                                          
                 - -   C h e c k   i f   b o t  
                 I F   @ U s e r A g e n t   I S   N O T   N U L L   A N D   E X I S T S   ( S E L E C T   *   F R O M   [ U s e r . S e s s i o n ] . [ B o t ]   W H E R E   @ U s e r A g e n t   L I K E   U s e r A g e n t )  
 	 	 	 U P D A T E   [ U s e r . S e s s i o n ] . S e s s i o n  
 	 	 	 	 S E T   I s B o t   =   1  
 	 	 	 	 W H E R E   S e s s i o n I D   =   @ S e s s i o n I D  
  
 	 	 - -   C r e a t e   a   n o d e  
 	 	 D E C L A R E   @ E r r o r   I N T  
 	 	 D E C L A R E   @ N o d e I D   B I G I N T  
 	 	 E X E C   [ R D F . ] . [ G e t S t o r e N o d e ] 	 @ D e f a u l t U R I   =   1 ,  
 	 	 	 	 	 	 	 	 	 @ S e s s i o n I D   =   @ S e s s i o n I D ,  
 	 	 	 	 	 	 	 	 	 @ V i e w S e c u r i t y G r o u p   =   0 ,  
 	 	 	 	 	 	 	 	 	 @ E d i t S e c u r i t y G r o u p   =   - 5 0 ,  
 	 	 	 	 	 	 	 	 	 @ E r r o r   =   @ E r r o r   O U T P U T ,  
 	 	 	 	 	 	 	 	 	 @ N o d e I D   =   @ N o d e I D   O U T P U T  
  
 	 	 - -   I f   n o   e r r o r . . .  
 	 	 I F   ( @ E r r o r   =   0 )   A N D   ( @ N o d e I D   I S   N O T   N U L L )  
 	 	 B E G I N  
 	 	 	 - -   U p d a t e   t h e   S e s s i o n   r e c o r d   w i t h   t h e   N o d e I D  
 	 	 	 U P D A T E   [ U s e r . S e s s i o n ] . S e s s i o n  
 	 	 	 	 S E T   N o d e I D   =   @ N o d e I D  
 	 	 	 	 W H E R E   S e s s i o n I D   =   @ S e s s i o n I D  
  
 	 	 	 - -   U p d a t e   t h e   V i e w S e c u r i t y G r o u p   o f   t h e   s e s s i o n   n o d e  
 	 	 	 U P D A T E   [ R D F . ] . N o d e  
 	 	 	 	 S E T   V i e w S e c u r i t y G r o u p   =   @ N o d e I D  
 	 	 	 	 W H E R E   N o d e I D   =   @ N o d e I D  
    
 	 	 	 - -   A d d   p r o p e r t i e s   t o   t h e   n o d e  
 	 	 	 D E C L A R E   @ T y p e I D   B I G I N T  
 	 	 	 D E C L A R E   @ S e s s i o n C l a s s   B I G I N T  
 	 	 	 D E C L A R E   @ T r i p l e I D   B I G I N T  
 	 	 	 S E L E C T 	 @ T y p e I D   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # t y p e ' ) ,  
 	 	 	 	 	 @ S e s s i o n C l a s s   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / p r o f i l e s . c a t a l y s t . h a r v a r d . e d u / o n t o l o g y / p r n s # S e s s i o n ' )  
 	 	 	 E X E C   [ R D F . ] . [ G e t S t o r e T r i p l e ] 	 @ S u b j e c t I D   =   @ N o d e I D ,  
 	 	 	 	 	 	 	 	 	 	 	 @ P r e d i c a t e I D   =   @ T y p e I D ,  
 	 	 	 	 	 	 	 	 	 	 	 @ O b j e c t I D   =   @ S e s s i o n C l a s s ,  
 	 	 	 	 	 	 	 	 	 	 	 @ V i e w S e c u r i t y G r o u p   =   @ N o d e I D ,  
 	 	 	 	 	 	 	 	 	 	 	 @ W e i g h t   =   1 ,  
 	 	 	 	 	 	 	 	 	 	 	 @ S o r t O r d e r   =   1 ,  
 	 	 	 	 	 	 	 	 	 	 	 @ S e s s i o n I D   =   @ S e s s i o n I D ,  
 	 	 	 	 	 	 	 	 	 	 	 @ E r r o r   =   @ E r r o r   O U T P U T ,  
 	 	 	 	 	 	 	 	 	 	 	 @ T r i p l e I D   =   @ T r i p l e I D   O U T P U T  
 	 	 E N D  
  
 	 C O M M I T   T R A N S A C T I O N  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 D E C L A R E   @ E r r M s g   n v a r c h a r ( 4 0 0 0 ) ,   @ E r r S e v e r i t y   i n t  
 	 	 - - C h e c k   s u c c e s s  
 	 	 I F   @ @ T R A N C O U N T   >   0     R O L L B A C K  
    
 	 	 - -   R a i s e   a n   e r r o r   w i t h   t h e   d e t a i l s   o f   t h e   e x c e p t i o n  
 	 	 S E L E C T   @ E r r M s g   =     E R R O R _ M E S S A G E ( ) ,  
 	 	 	 	 	   @ E r r S e v e r i t y   =   E R R O R _ S E V E R I T Y ( )  
    
 	 	 R A I S E R R O R ( @ E r r M s g ,   @ E r r S e v e r i t y ,   1 )  
 	 	 	    
 	 E N D   C A T C H 	 	  
  
    
         S E L E C T   *  
 	 	 F R O M   [ U s e r . S e s s i o n ] . [ S e s s i o n ]  
 	 	 W H E R E   S e s s i o n I D   =   @ S e s s i o n I D   A N D   @ S e s s i o n I D   I S   N O T   N U L L  
    
 E N D  
  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ F r a m e w o r k . ] . [ v w D a t a b a s e O b j e c t s ] '  
 G O  
  
 C R E A T E   V I E W   [ F r a m e w o r k . ] . [ v w D a t a b a s e O b j e c t s ]   A S  
 	 S E L E C T   o . t y p e ,   o . t y p e _ d e s c ,   ' [ ' + s . n a m e + ' ] . [ ' + o . n a m e + ' ] '   f u l l _ n a m e ,   s . n a m e   s c h e m a _ n a m e ,   o . n a m e ,    
 	 	 	 o . o b j e c t _ i d ,   o . p r i n c i p a l _ i d ,   o . s c h e m a _ i d ,   o . p a r e n t _ o b j e c t _ i d ,    
 	 	 	 o . c r e a t e _ d a t e ,   o . m o d i f y _ d a t e ,   o . i s _ m s _ s h i p p e d ,   o . i s _ p u b l i s h e d ,   o . i s _ s c h e m a _ p u b l i s h e d  
 	 	 F R O M   s y s . o b j e c t s   o ,   s y s . s c h e m a s   s  
 	 	 W H E R E   o . s c h e m a _ i d   =   s . s c h e m a _ i d  
 	 U N I O N   A L L  
 	 S E L E C T   ' @ ' ,   ' S C H E M A ' ,   ' [ ' + n a m e + ' ] ' ,   n a m e ,   n a m e ,  
 	 	 	 N U L L ,   p r i n c i p a l _ i d ,   s c h e m a _ i d ,   n u l l ,    
 	 	 	 n u l l ,   n u l l ,   n u l l ,   n u l l ,   n u l l  
 	 	 F R O M   s y s . s c h e m a s  
  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
  
 P R I N T   N ' A l t e r i n g   [ R D F . S e m W e b ] . [ v w P r i v a t e _ L i t e r a l s ] '  
 G O  
  
 A L T E R   V I E W   [ R D F . S e m W e b ] . [ v w P r i v a t e _ L i t e r a l s ]   A S  
 	 S E L E C T   0   i d ,   ' v e r : 1 ' + c h a r ( 1 0 ) + ' g u i d : c 8 b c f 6 0 e 1 d 3 5 4 e b f 9 d 8 c e c d 5 c 0 2 a 2 1 8 2 ' + c h a r ( 1 0 )   v a l u e ,   n u l l   l a n g u a g e ,   n u l l   d a t a t y p e ,   n u l l   h a s h  
 	 U N I O N   A L L  
 	 S E L E C T   n . N o d e I D   i d ,   n . v a l u e ,   n . l a n g u a g e ,   n . d a t a t y p e ,   b . S e m W e b H a s h   h a s h  
 	 	 F R O M   [ R D F . ] . N o d e   n ,   [ R D F . S e m W e b ] . [ v w H a s h 2 B a s e 6 4 ]   b   - - W I T H   ( N O E X P A N D )  
 	 	 W H E R E   n . N o d e I D   =   b . N o d e I D   A N D   n . O b j e c t T y p e   =   1  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
  
 P R I N T   N ' C r e a t i n g   [ F r a m e w o r k . ] . [ v w D a t a b a s e C o d e ] '  
 G O  
  
 C R E A T E   V I E W   [ F r a m e w o r k . ] . [ v w D a t a b a s e C o d e ]   A S  
 	 S E L E C T   o . t y p e ,   o . t y p e _ d e s c ,   o . f u l l _ n a m e ,    
 	 	 o . o b j e c t _ i d ,   o . c r e a t e _ d a t e ,   o . m o d i f y _ d a t e ,  
 	 	 c . n u m b e r ,   c . c o l i d ,   c . t e x t ,  
 	 	 o . s c h e m a _ n a m e ,   o . n a m e ,  
 	 	 o . p r i n c i p a l _ i d ,   o . s c h e m a _ i d ,   o . p a r e n t _ o b j e c t _ i d ,  
 	 	 o . i s _ m s _ s h i p p e d ,   o . i s _ p u b l i s h e d ,   o . i s _ s c h e m a _ p u b l i s h e d  
 	 F R O M   [ F r a m e w o r k . ] . v w D a t a b a s e O b j e c t s   o ,   s y s c o m m e n t s   c  
 	 W H E R E   c . i d   =   o . o b j e c t _ i d  
  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ S e a r c h . C a c h e ] . [ P r i v a t e . U p d a t e C a c h e ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ S e a r c h . C a c h e ] . [ P r i v a t e . U p d a t e C a c h e ]  
  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
  
 	 d e c l a r e   @ t y p e I D   b i g i n t  
 	 s e l e c t   @ t y p e I D   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # t y p e ' )  
  
 	 d e c l a r e   @ l a b e l I D   b i g i n t  
 	 s e l e c t   @ l a b e l I D   =   [ R D F . ] . f n U R I 2 N o d e I D ( ' h t t p : / / w w w . w 3 . o r g / 2 0 0 0 / 0 1 / r d f - s c h e m a # l a b e l ' )  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   N o d e M a p  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 s e l e c t   t . S u b j e c t   N o d e I D ,   c . _ P r o p e r t y N o d e   P r o p e r t y ,   m a x ( S e a r c h W e i g h t )   S e a r c h W e i g h t  
 	 	 i n t o   # n  
 	 	 f r o m   [ O n t o l o g y . ] . C l a s s P r o p e r t y   c ,   [ R D F . ] . T r i p l e   t ,   [ R D F . ] . N o d e   n  
 	 	 w h e r e   t . P r e d i c a t e   =   @ t y p e I D   a n d   t . o b j e c t   =   c . _ C l a s s N o d e   a n d   c . S e a r c h W e i g h t   >   0  
 	 	 	 a n d   t . S u b j e c t   =   n . N o d e I D  
 	 	 	 a n d   t . V i e w S e c u r i t y G r o u p   b e t w e e n   - 3 0   a n d   - 1  
 	 	 	 a n d   n . V i e w S e c u r i t y G r o u p   b e t w e e n   - 3 0   a n d   - 1  
 	 	 g r o u p   b y   t . S u b j e c t ,   c . _ P r o p e r t y N o d e  
 	 c r e a t e   u n i q u e   c l u s t e r e d   i n d e x   i d x _ n p   o n   # n ( N o d e I D , P r o p e r t y )  
  
 	 c r e a t e   t a b l e   # s   (  
 	 	 N o d e I D   b i g i n t   n o t   n u l l ,  
 	 	 M a t c h e d B y N o d e I D   b i g i n t   n o t   n u l l ,  
 	 	 D i s t a n c e   i n t ,  
 	 	 P a t h s   i n t ,  
 	 	 W e i g h t   f l o a t  
 	 )  
 	 a l t e r   t a b l e   # s   a d d   p r i m a r y   k e y   ( N o d e I D ,   M a t c h e d B y N o d e I D )  
  
 	 i n s e r t   i n t o   # s   ( N o d e I D ,   M a t c h e d B y N o d e I D ,   D i s t a n c e ,   P a t h s ,   W e i g h t )  
 	 	 s e l e c t   x . N o d e I D ,   t . O b j e c t ,   1 ,   c o u n t ( * ) ,   1 - e x p ( s u m ( l o g ( c a s e   w h e n   x . S e a r c h W e i g h t * t . W e i g h t   >   0 . 9 9 9 9 9 9   t h e n   0 . 0 0 0 0 0 1   e l s e   1 - x . S e a r c h W e i g h t * t . W e i g h t   e n d ) ) )  
 	 	 	 f r o m   # n   x ,   [ R D F . ] . T r i p l e   t ,   [ R D F . ] . N o d e   n  
 	 	 	 w h e r e   x . N o d e I D   =   t . s u b j e c t   a n d   x . P r o p e r t y   =   t . p r e d i c a t e   a n d   x . S e a r c h W e i g h t * t . W e i g h t   >   0  
 	 	 	 	 a n d   t . O b j e c t   =   n . N o d e I D  
 	 	 	 	 a n d   t . V i e w S e c u r i t y G r o u p   b e t w e e n   - 3 0   a n d   - 1  
 	 	 	 	 a n d   n . V i e w S e c u r i t y G r o u p   b e t w e e n   - 3 0   a n d   - 1  
 	 	 	 g r o u p   b y   x . N o d e I D ,   t . O b j e c t  
  
 	 d e c l a r e   @ i   i n t  
 	 s e l e c t   @ i   =   1  
 	 w h i l e   @ i   <   1 0  
 	 b e g i n  
 	 	 i n s e r t   i n t o   # s   ( N o d e I D ,   M a t c h e d B y N o d e I D ,   D i s t a n c e ,   P a t h s ,   W e i g h t )  
 	 	 	 s e l e c t   s . N o d e I D ,   t . M a t c h e d B y N o d e I D ,   @ i + 1 ,   c o u n t ( * ) ,   1 - e x p ( s u m ( l o g ( c a s e   w h e n   s . W e i g h t * t . W e i g h t   >   0 . 9 9 9 9 9 9   t h e n   0 . 0 0 0 0 0 1   e l s e   1 - s . W e i g h t * t . W e i g h t   e n d ) ) )  
 	 	 	 	 f r o m   # s   s ,   # s   t  
 	 	 	 	 w h e r e   s . M a t c h e d B y N o d e I D   =   t . N o d e I D  
 	 	 	 	 	 a n d   s . D i s t a n c e   =   @ i  
 	 	 	 	 	 a n d   t . D i s t a n c e   =   1  
 	 	 	 	 	 a n d   t . N o d e I D   < >   s . N o d e I D  
 	 	 	 	 	 a n d   n o t   e x i s t s   (  
 	 	 	 	 	 	 s e l e c t   *  
 	 	 	 	 	 	 f r o m   # s   u  
 	 	 	 	 	 	 w h e r e   u . N o d e I D   =   s . N o d e I D   a n d   u . M a t c h e d B y N o d e I D   =   t . M a t c h e d B y N o d e I D  
 	 	 	 	 	 )  
 	 	 	 	 g r o u p   b y   s . N o d e I D ,   t . M a t c h e d B y N o d e I D  
 	 	 i f   @ @ R O W C O U N T   =   0  
 	 	 	 s e l e c t   @ i   =   1 0  
 	 	 s e l e c t   @ i   =   @ i   +   1  
 	 e n d  
  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   N o d e S u m m a r y   ( P a r t   1 )  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 s e l e c t   t . s u b j e c t   N o d e I D ,   m i n ( c a s e   w h e n   l e n ( n . V a l u e ) > 5 0 0   t h e n   l e f t ( n . V a l u e , 4 9 7 ) + ' . . . '   e l s e   n . V a l u e   e n d )   L a b e l  
 	 	 i n t o   # l  
 	 	 f r o m   [ R D F . ] . T r i p l e   t ,   [ R D F . ] . N o d e   n  
 	 	 w h e r e   t . p r e d i c a t e   =   @ l a b e l I D   a n d   t . o b j e c t   =   n . N o d e I D  
 	 	 	 a n d   t . s u b j e c t   i n   ( s e l e c t   N o d e I D   f r o m   # s )  
 	 	 	 a n d   t . V i e w S e c u r i t y G r o u p   b e t w e e n   - 3 0   a n d   - 1  
 	 	 	 a n d   n . V i e w S e c u r i t y G r o u p   b e t w e e n   - 3 0   a n d   - 1  
 	 	 g r o u p   b y   t . s u b j e c t  
  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   N o d e C l a s s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 s e l e c t   d i s t i n c t   l . N o d e I D ,   t . O b j e c t  
 	 	 i n t o   # c  
 	 	 f r o m   [ R D F . ] . N o d e   l ,   [ R D F . ] . T r i p l e   t ,   [ R D F . ] . N o d e   n  
 	 	 w h e r e   l . N o d e I D   =   t . s u b j e c t   a n d   t . p r e d i c a t e   =   @ t y p e I D   a n d   t . o b j e c t   =   n . N o d e I D  
 	 	 	 a n d   t . V i e w S e c u r i t y G r o u p   b e t w e e n   - 3 0   a n d   - 1  
 	 	 	 a n d   n . V i e w S e c u r i t y G r o u p   b e t w e e n   - 3 0   a n d   - 1  
 	 	 	 a n d   l . V i e w S e c u r i t y G r o u p   b e t w e e n   - 3 0   a n d   - 1  
  
 	 c r e a t e   u n i q u e   c l u s t e r e d   i n d e x   i d x _ n o   o n   # c ( N o d e I D ,   O b j e c t )  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   N o d e S u m m a r y   ( P a r t   2 )  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 C R E A T E   I N D E X   i d x _ c   O N   # c   ( [ O b j e c t ] )   I N C L U D E   ( [ N o d e I D ] ) 	 	 	 	 	 	 	  
 	 C R E A T E   I N D E X   i d x _ l   O N   # l   ( [ N o d e I D ] )   I N C L U D E   ( [ L a b e l ] ) 	  
  
 	 s e l e c t   N o d e I D ,   L a b e l ,   C l a s s N a m e ,   r o w _ n u m b e r ( )   o v e r   ( o r d e r   b y   L a b e l ,   N o d e I D )   S o r t O r d e r  
 	 	 i n t o   # l 2  
 	 	 f r o m   (  
 	 	 	 s e l e c t   l . N o d e I D ,   l . L a b e l ,   d . _ C l a s s N a m e   C l a s s N a m e ,  
 	 	 	 	 r o w _ n u m b e r ( )   o v e r   ( p a r t i t i o n   b y   l . N o d e I D   o r d e r   b y   I s N u l l ( d . _ T r e e D e p t h , 0 )   d e s c ,   d . _ C l a s s N a m e )   k  
 	 	 	 f r o m   # l   l  
 	 	 	 	 i n n e r   j o i n   # c   c   o n   l . N o d e I D   =   c . N o d e I D  
 	 	 	 	 i n n e r   j o i n   [ O n t o l o g y . ] . C l a s s G r o u p C l a s s   g   o n   c . O b j e c t   =   g . _ C l a s s N o d e  
 	 	 	 	 l e f t   o u t e r   j o i n   [ O n t o l o g y . ] . C l a s s T r e e D e p t h   d   o n   c . O b j e c t   =   d . _ C l a s s N o d e  
 	 	 )   t  
 	 	 w h e r e   k   =   1  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   N o d e R D F  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 s e l e c t   n . N o d e I D ,   c . _ P r o p e r t y N o d e   P r o p e r t y N o d e ,   m a x ( L i m i t )   L i m i t ,   m a x ( c a s t ( c . I n c l u d e D e s c r i p t i o n   a s   t i n y i n t ) )   I n c l u d e D e s c r i p t i o n ,   m a x ( _ T a g N a m e )   T a g N a m e  
 	 	 i n t o   # N o d e P r o p e r t y E x p a n d  
 	 	 f r o m   # c   n ,   [ O n t o l o g y . ] . C l a s s P r o p e r t y   c ,   [ R D F . ] . N o d e   p  
 	 	 w h e r e   n . O b j e c t   =   c . _ C l a s s N o d e  
 	 	 	 a n d   c . _ N e t w o r k P r o p e r t y N o d e   i s   n u l l  
 	 	 	 a n d   c . I s D e t a i l   =   0  
 	 	 	 a n d   c . _ P r o p e r t y N o d e   =   p . N o d e I D  
 	 	 	 a n d   p . V i e w S e c u r i t y G r o u p   b e t w e e n   - 3 0   a n d   - 1  
 	 	 g r o u p   b y   n . N o d e I D ,   c . _ P r o p e r t y N o d e  
 	 - - [ 1 0 7 4 0 3 1 2   i n   0 0 : 0 0 : 3 1 ]  
  
 	 s e l e c t   e . N o d e I D ,   o . N o d e I D   E x p a n d N o d e I D ,   e . I n c l u d e D e s c r i p t i o n ,   e . T a g N a m e ,   o . O b j e c t T y p e ,   o . V a l u e ,   o . L a n g u a g e ,   o . D a t a T y p e  
 	 	 i n t o   # N o d e P r o p e r t y V a l u e  
 	 	 f r o m   # N o d e P r o p e r t y E x p a n d   e ,   [ R D F . ] . T r i p l e   t ,   [ R D F . ] . N o d e   o  
 	 	 w h e r e   t . s u b j e c t   =   e . N o d e I D  
 	 	 	 a n d   t . p r e d i c a t e   =   e . P r o p e r t y N o d e  
 	 	 	 a n d   t . o b j e c t   =   o . N o d e I D  
 	 	 	 a n d   t . V i e w S e c u r i t y G r o u p   b e t w e e n   - 3 0   a n d   - 1  
 	 	 	 a n d   o . V i e w S e c u r i t y G r o u p   b e t w e e n   - 3 0   a n d   - 1  
 	 	 	 a n d   ( ( e . L i m i t   i s   n u l l )   o r   ( t . S o r t O r d e r   < =   e . L i m i t ) )  
 	 - - [ 8 6 4 6 8 4 9   i n   0 0 : 0 1 : 3 1 ]  
  
 	 s e l e c t   N o d e I D ,   E x p a n d N o d e I D ,  
 	 	 	 ' _ T A G L T _ ' + t a g N a m e  
 	 	 	 + ( c a s e   w h e n   O b j e c t T y p e   =   0   t h e n   '   r d f : r e s o u r c e = " ' + V a l u e + ' " / _ T A G G T _ '    
 	 	 	 	 	 e l s e   ' _ T A G G T _ ' + V a l u e + ' _ T A G L T _ / ' + t a g N a m e + ' _ T A G G T _ '   e n d )  
 	 	 	 T a g V a l u e  
 	 	 i n t o   # N o d e P r o p e r t y T a g T e m p  
 	 	 f r o m   (  
 	 	 	 s e l e c t   N o d e I D ,   E x p a n d N o d e I D ,   T a g N a m e ,   O b j e c t T y p e ,   L a n g u a g e ,   D a t a T y p e ,  
 	 	 	 	 ( c a s e   w h e n   c h a r i n d e x ( c h a r ( 0 ) , c a s t ( V a l u e   a s   v a r c h a r ( m a x ) ) )   >   0  
 	 	 	 	 	 	 t h e n   r e p l a c e ( r e p l a c e ( r e p l a c e ( r e p l a c e ( c a s t ( V a l u e   a s   v a r c h a r ( m a x ) ) , c h a r ( 0 ) , ' ' ) , ' & ' , ' & a m p ; ' ) , ' < ' , ' & l t ; ' ) , ' > ' , ' & g t ; ' )  
 	 	 	 	 	 	 e l s e   r e p l a c e ( r e p l a c e ( r e p l a c e ( V a l u e , ' & ' , ' & a m p ; ' ) , ' < ' , ' & l t ; ' ) , ' > ' , ' & g t ; ' )  
 	 	 	 	 	 	 e n d )   V a l u e  
 	 	 	 	 f r o m   # N o d e P r o p e r t y V a l u e  
 	 	 )   t  
 	 - - [ 9 1 6 2 1 7 7   i n   0 0 : 0 3 : 3 9 ]  
  
 	 c r e a t e   n o n c l u s t e r e d   i n d e x   i d x _ n   o n   # N o d e P r o p e r t y T a g T e m p ( N o d e I D )  
 	 - - [ 0 0 : 0 0 : 0 7 ]  
  
 	 s e l e c t   N o d e I D ,   E x p a n d N o d e I D ,   T a g V a l u e ,   r o w _ n u m b e r ( )   o v e r   ( p a r t i t i o n   b y   N o d e I D   o r d e r   b y   T a g V a l u e )   k  
 	 	 i n t o   # N o d e P r o p e r t y T a g  
 	 	 f r o m   # N o d e P r o p e r t y T a g T e m p  
 	 - - [ 9 1 6 2 1 7 7   i n   0 0 : 0 0 : 3 4 ]  
 	  
 	 c r e a t e   n o n c l u s t e r e d   i n d e x   i d x _ n k   o n   # N o d e P r o p e r t y T a g ( N o d e I D , k )  
 	 - - [ 0 0 : 0 0 : 0 7 ]  
 	 c r e a t e   n o n c l u s t e r e d   i n d e x   i d x _ k n   o n   # N o d e P r o p e r t y T a g ( k , N o d e I D )  
 	 - - [ 0 0 : 0 0 : 1 0 ]  
  
 	 s e l e c t   N o d e I D ,   T a g V a l u e   T a g s  
 	 	 i n t o   # N o d e T a g s  
 	 	 f r o m   # N o d e P r o p e r t y T a g  
 	 	 w h e r e   k   =   1  
 	 d e c l a r e   @ k   i n t  
 	 s e l e c t   @ k   =   2  
 	 w h i l e   ( @ k   >   0 )   a n d   ( @ k   <   2 5 )  
 	 b e g i n  
 	 	 u p d a t e   t  
 	 	 	 s e t   t . T a g s   =   t . T a g s   +   p . T a g V a l u e  
 	 	 	 f r o m   # N o d e T a g s   t  
 	 	 	 	 i n n e r   j o i n   # N o d e P r o p e r t y T a g   p  
 	 	 	 	 	 o n   t . N o d e I D   =   p . N o d e I D   a n d   p . k   =   @ k  
 	 	 i f   @ @ R O W C O U N T   =   0  
 	 	 	 s e l e c t   @ k   =   - 1  
 	 	 e l s e  
 	 	 	 s e l e c t   @ k   =   @ k   +   1 	 	 	  
 	 e n d  
 	 - - [ 4 1 6 2 6 5 9   i n   0 0 : 0 5 : 0 1 ]  
  
 	 c r e a t e   u n i q u e   c l u s t e r e d   i n d e x   i d x _ n   o n   # N o d e T a g s ( N o d e I D )  
 	 - - [ 0 0 : 0 0 : 1 6 ]  
 	 	  
 	 / * 	  
 	 s e l e c t   N o d e I D ,  
 	 	 	 c a s t ( (  
 	 	 	 	 s e l e c t   b . T a g V a l u e + ' ' 	  
 	 	 	 	 	 f r o m   # N o d e P r o p e r t y T a g   b  
 	 	 	 	 	 w h e r e   b . N o d e I D   =   a . N o d e I D  
 	 	 	 	 	 o r d e r   b y   b . T a g V a l u e  
 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 )   a s   n v a r c h a r ( m a x ) )  
 	 	 	 T a g s  
 	 	 i n t o   # N o d e T a g s  
 	 	 f r o m   # N o d e P r o p e r t y T a g   a  
 	 	 g r o u p   b y   N o d e I D  
 	 - - [ 3 7 6 4 7 8 3   i n   0 0 : 1 3 : 1 8 ]  
 	 * /  
 	  
 	 s e l e c t   t . N o d e I D ,    
 	 	 	 ' _ T A G L T _ r d f : D e s c r i p t i o n   r d f : a b o u t = " '   +   r e p l a c e ( r e p l a c e ( r e p l a c e ( n . V a l u e , ' & ' , ' & a m p ; ' ) , ' < ' , ' & l t ; ' ) , ' > ' , ' & g t ; ' )   +   ' " _ T A G G T _ '  
 	 	 	 +   t . T a g s  
 	 	 	 +   ' _ T A G L T _ / r d f : D e s c r i p t i o n _ T A G G T _ '  
 	 	 	 R D F  
 	 	 i n t o   # N o d e R D F  
 	 	 f r o m   # N o d e T a g s   t ,   [ R D F . ] . N o d e   n  
 	 	 w h e r e   t . N o d e I D   =   n . N o d e I D  
 	 - - [ 4 1 6 2 6 5 9   i n   0 0 : 0 1 : 4 0 ]  
  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   N o d e E x p a n d  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 s e l e c t   d i s t i n c t   N o d e I D ,   E x p a n d N o d e I D  
 	 	 i n t o   # N o d e E x p a n d  
 	 	 f r o m   # N o d e P r o p e r t y V a l u e  
 	 	 w h e r e   I n c l u d e D e s c r i p t i o n   =   1  
 	 - - [ 5 3 7 0 8 0 3   i n   0 0 : 0 0 : 0 6 ]  
  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   N o d e P r e f i x  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 c r e a t e   t a b l e   # N o d e P r e f i x   (  
 	 	 P r e f i x   v a r c h a r ( 8 0 0 )   n o t   n u l l ,  
 	 	 N o d e I D   b i g i n t   n o t   n u l l  
 	 )  
 	 i n s e r t   i n t o   # N o d e P r e f i x   ( P r e f i x , N o d e I D )  
 	 	 s e l e c t   l e f t ( V a l u e , 8 0 0 ) ,   N o d e I D  
 	 	 	 f r o m   [ R D F . ] . N o d e  
 	 	 	 w h e r e   V i e w S e c u r i t y G r o u p   b e t w e e n   - 3 0   a n d   - 1  
 	 - - [ 5 7 1 0 7 7 5   i n   0 0 : 0 0 : 0 9 ]  
 	 a l t e r   t a b l e   # N o d e P r e f i x   a d d   p r i m a r y   k e y   ( P r e f i x ,   N o d e I D )  
 	 - - [ 0 0 : 0 0 : 1 3 ]  
  
  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 - -   U p d a t e   a c t u a l   t a b l e s  
 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 B E G I N   T R Y  
 	 	 B E G I N   T R A N  
 	 	  
 	 	 	 t r u n c a t e   t a b l e   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e M a p ]  
 	 	 	 i n s e r t   i n t o   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e M a p ]  
 	 	 	 	 s e l e c t   *   f r o m   # s  
 	 	 	 t r u n c a t e   t a b l e   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e S u m m a r y ]  
 	 	 	 i n s e r t   i n t o   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e S u m m a r y ]  
 	 	 	 	 s e l e c t   *   f r o m   # l 2  
 	 	 	 t r u n c a t e   t a b l e   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e C l a s s ]  
 	 	 	 i n s e r t   i n t o   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e C l a s s ]  
 	 	 	 	 s e l e c t   *   f r o m   # c  
 	 	 	 	 	  
  
 	 	 	 t r u n c a t e   t a b l e   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e E x p a n d ]  
 	 	 	 i n s e r t   i n t o   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e E x p a n d ]   ( N o d e I D ,   E x p a n d N o d e I D )  
 	 	 	 	 s e l e c t   N o d e I D ,   E x p a n d N o d e I D  
 	 	 	 	 	 f r o m   # N o d e E x p a n d  
 	 	 	 - - [ 5 3 7 0 8 0 3   i n   0 0 : 0 0 : 1 7 ]  
  
 	 	 	 t r u n c a t e   t a b l e   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e R D F ]  
 	 	 	 i n s e r t   i n t o   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e R D F ]   ( N o d e I D ,   R D F )  
 	 	 	 	 s e l e c t   N o d e I D ,   R D F  
 	 	 	 	 	 f r o m   # N o d e R D F  
 	 	 	 - - [ 3 7 6 4 7 8 3   i n   0 0 : 0 0 : 3 0 ]  
  
 	 	 	 t r u n c a t e   t a b l e   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e P r e f i x ]  
 	 	 	 i n s e r t   i n t o   [ S e a r c h . C a c h e ] . [ P r i v a t e . N o d e P r e f i x ]   ( P r e f i x ,   N o d e I D )  
 	 	 	 	 s e l e c t   P r e f i x ,   N o d e I D  
 	 	 	 	 	 f r o m   # N o d e P r e f i x  
 	 	 	 - - [ 8 0 0 1 2 3 8   i n   0 0 : 0 0 : 5 7 ]  
  
 	 	 C O M M I T  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 - - C h e c k   s u c c e s s  
 	 	 I F   @ @ T R A N C O U N T   >   0     R O L L B A C K  
 	 	 - - R a i s e   a n   e r r o r   w i t h   t h e   d e t a i l s   o f   t h e   e x c e p t i o n  
 	 	 D E C L A R E   @ E r r M s g   n v a r c h a r ( 4 0 0 0 ) ,   @ E r r S e v e r i t y   i n t  
 	 	 S E L E C T   @ E r r M s g   =   E R R O R _ M E S S A G E ( ) ,   @ E r r S e v e r i t y   =   E R R O R _ S E V E R I T Y ( )  
 	 	 R A I S E R R O R ( @ E r r M s g ,   @ E r r S e v e r i t y ,   1 )  
 	 E N D   C A T C H  
    
  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' R e f r e s h i n g   [ O n t o l o g y . ] . [ v w P r o p e r t y W i d e ] '  
 G O  
 E X E C   s p _ r e f r e s h v i e w   N ' [ O n t o l o g y . ] . [ v w P r o p e r t y W i d e ] '  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ F r a m e w o r k . ] . [ C r e a t e I n s t a l l D a t a ] '  
 G O  
 C R E A T E   p r o c e d u r e   [ F r a m e w o r k . ] . [ C r e a t e I n s t a l l D a t a ]  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
 	 d e c l a r e   @ x   x m l  
  
 	 s e l e c t   @ x   =   (  
 	 	 s e l e c t  
 	 	 	 (  
 	 	 	 	 s e l e c t  
 	 	 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 	 	 	 - -   [ F r a m e w o r k . ]  
 	 	 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 	 	 	 (  
 	 	 	 	 	 	 s e l e c t 	 ' [ F r a m e w o r k . ] . [ P a r a m e t e r ] '   ' T a b l e / @ N a m e ' ,  
 	 	 	 	 	 	 	 	 (  
 	 	 	 	 	 	 	 	 	 s e l e c t 	 P a r a m e t e r I D   ' P a r a m e t e r I D ' ,    
 	 	 	 	 	 	 	 	 	 	 	 V a l u e   ' V a l u e '  
 	 	 	 	 	 	 	 	 	 f r o m   [ F r a m e w o r k . ] . [ P a r a m e t e r ]  
 	 	 	 	 	 	 	 	 	 f o r   x m l   p a t h ( ' R o w ' ) ,   t y p e  
 	 	 	 	 	 	 	 	 )   ' T a b l e '  
 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 	 ) ,  
 	 	 	 	 	 (  
 	 	 	 	 	 	 s e l e c t 	 ' [ F r a m e w o r k . ] . [ R e s t P a t h ] '   ' T a b l e / @ N a m e ' ,  
 	 	 	 	 	 	 	 	 (  
 	 	 	 	 	 	 	 	 	 s e l e c t 	 A p p l i c a t i o n N a m e   ' A p p l i c a t i o n N a m e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 R e s o l v e r   ' R e s o l v e r '  
 	 	 	 	 	 	 	 	 	 f r o m   [ F r a m e w o r k . ] . [ R e s t P a t h ]  
 	 	 	 	 	 	 	 	 	 f o r   x m l   p a t h ( ' R o w ' ) ,   t y p e  
 	 	 	 	 	 	 	 	 )   ' T a b l e '  
 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 	 ) ,  
 	 	 	 	 	 (  
 	 	 	 	 	 	 s e l e c t 	 ' [ F r a m e w o r k . ] . [ J o b ] '   ' T a b l e / @ N a m e ' ,  
 	 	 	 	 	 	 	 	 (  
 	 	 	 	 	 	 	 	 	 s e l e c t 	 J o b I D   ' J o b I D ' ,  
 	 	 	 	 	 	 	 	 	 	 	 J o b G r o u p   ' J o b G r o u p ' ,  
 	 	 	 	 	 	 	 	 	 	 	 S t e p   ' S t e p ' ,  
 	 	 	 	 	 	 	 	 	 	 	 I s A c t i v e   ' I s A c t i v e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 S c r i p t   ' S c r i p t ' ,  
 	 	 	 	 	 	 	 	 	 	 	 S t a t u s   ' S t a t u s ' ,  
 	 	 	 	 	 	 	 	 	 	 	 L a s t S t a r t   ' L a s t S t a r t ' ,  
 	 	 	 	 	 	 	 	 	 	 	 L a s t E n d   ' L a s t E n d ' ,  
 	 	 	 	 	 	 	 	 	 	 	 E r r o r C o d e   ' E r r o r C o d e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 E r r o r M s g   ' E r r o r M s g '  
 	 	 	 	 	 	 	 	 	 f r o m   [ F r a m e w o r k . ] . [ J o b ]  
 	 	 	 	 	 	 	 	 	 f o r   x m l   p a t h ( ' R o w ' ) ,   t y p e  
 	 	 	 	 	 	 	 	 )   ' T a b l e '  
 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 	 ) ,  
 	 	 	 	 	 (  
 	 	 	 	 	 	 s e l e c t 	 ' [ F r a m e w o r k . ] . [ J o b G r o u p ] '   ' T a b l e / @ N a m e ' ,  
 	 	 	 	 	 	 	 	 (  
 	 	 	 	 	 	 	 	 	 S E L E C T     J o b G r o u p   ' J o b G r o u p ' ,  
 	 	 	 	 	 	 	 	 	 	 	 N a m e   ' N a m e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 T y p e   ' T y p e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 D e s c r i p t i o n   ' D e s c r i p t i o n ' 	  
 	 	 	 	 	 	 	 	 	 f r o m   [ F r a m e w o r k . ] . J o b G r o u p  
 	 	 	 	 	 	 	 	 	 f o r   x m l   p a t h ( ' R o w ' ) ,   t y p e  
 	 	 	 	 	 	 	 	 )   ' T a b l e '  
 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 	 ) ,  
 	 	 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 	 	 	 - -   [ O n t o l o g y . ]  
 	 	 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 	 	 	 (  
 	 	 	 	 	 	 s e l e c t 	 ' [ O n t o l o g y . ] . [ C l a s s G r o u p ] '   ' T a b l e / @ N a m e ' ,  
 	 	 	 	 	 	 	 	 (  
 	 	 	 	 	 	 	 	 	 s e l e c t 	 C l a s s G r o u p U R I   ' C l a s s G r o u p U R I ' ,  
 	 	 	 	 	 	 	 	 	 	 	 _ C l a s s G r o u p L a b e l   ' C l a s s G r o u p L a b e l ' ,  
 	 	 	 	 	 	 	 	 	 	 	 S o r t O r d e r   ' S o r t O r d e r '  
 	 	 	 	 	 	 	 	 	 f r o m   [ O n t o l o g y . ] . [ C l a s s G r o u p ]  
 	 	 	 	 	 	 	 	 	 f o r   x m l   p a t h ( ' R o w ' ) ,   t y p e  
 	 	 	 	 	 	 	 	 )   ' T a b l e '  
 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 	 ) ,  
 	 	 	 	 	 (  
 	 	 	 	 	 	 s e l e c t 	 ' [ O n t o l o g y . ] . [ C l a s s G r o u p C l a s s ] '   ' T a b l e / @ N a m e ' ,  
 	 	 	 	 	 	 	 	 (  
 	 	 	 	 	 	 	 	 	 s e l e c t 	 C l a s s G r o u p U R I   ' C l a s s G r o u p U R I ' ,  
 	 	 	 	 	 	 	 	 	 	 	 C l a s s U R I   ' C l a s s U R I ' ,  
 	 	 	 	 	 	 	 	 	 	 	 _ C l a s s L a b e l   ' C l a s s L a b e l ' ,  
 	 	 	 	 	 	 	 	 	 	 	 S o r t O r d e r   ' S o r t O r d e r '  
 	 	 	 	 	 	 	 	 	 f r o m   [ O n t o l o g y . ] . [ C l a s s G r o u p C l a s s ]  
 	 	 	 	 	 	 	 	 	 f o r   x m l   p a t h ( ' R o w ' ) ,   t y p e  
 	 	 	 	 	 	 	 	 )   ' T a b l e '  
 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 	 ) ,  
 	 	 	 	 	 (  
 	 	 	 	 	 	 s e l e c t 	 ' [ O n t o l o g y . ] . [ C l a s s P r o p e r t y ] '   ' T a b l e / @ N a m e ' ,  
 	 	 	 	 	 	 	 	 (  
 	 	 	 	 	 	 	 	 	 s e l e c t 	 C l a s s P r o p e r t y I D   ' C l a s s P r o p e r t y I D ' ,  
 	 	 	 	 	 	 	 	 	 	 	 C l a s s   ' C l a s s ' ,  
 	 	 	 	 	 	 	 	 	 	 	 N e t w o r k P r o p e r t y   ' N e t w o r k P r o p e r t y ' ,  
 	 	 	 	 	 	 	 	 	 	 	 P r o p e r t y   ' P r o p e r t y ' ,  
 	 	 	 	 	 	 	 	 	 	 	 I s D e t a i l   ' I s D e t a i l ' ,  
 	 	 	 	 	 	 	 	 	 	 	 L i m i t   ' L i m i t ' ,  
 	 	 	 	 	 	 	 	 	 	 	 I n c l u d e D e s c r i p t i o n   ' I n c l u d e D e s c r i p t i o n ' ,  
 	 	 	 	 	 	 	 	 	 	 	 I n c l u d e N e t w o r k   ' I n c l u d e N e t w o r k ' ,  
 	 	 	 	 	 	 	 	 	 	 	 S e a r c h W e i g h t   ' S e a r c h W e i g h t ' ,  
 	 	 	 	 	 	 	 	 	 	 	 C u s t o m D i s p l a y   ' C u s t o m D i s p l a y ' ,  
 	 	 	 	 	 	 	 	 	 	 	 C u s t o m E d i t   ' C u s t o m E d i t ' ,  
 	 	 	 	 	 	 	 	 	 	 	 V i e w S e c u r i t y G r o u p   ' V i e w S e c u r i t y G r o u p ' ,  
 	 	 	 	 	 	 	 	 	 	 	 E d i t S e c u r i t y G r o u p   ' E d i t S e c u r i t y G r o u p ' ,  
 	 	 	 	 	 	 	 	 	 	 	 E d i t P e r m i s s i o n s S e c u r i t y G r o u p   ' E d i t P e r m i s s i o n s S e c u r i t y G r o u p ' ,  
 	 	 	 	 	 	 	 	 	 	 	 E d i t E x i s t i n g S e c u r i t y G r o u p   ' E d i t E x i s t i n g S e c u r i t y G r o u p ' ,  
 	 	 	 	 	 	 	 	 	 	 	 E d i t A d d N e w S e c u r i t y G r o u p   ' E d i t A d d N e w S e c u r i t y G r o u p ' ,  
 	 	 	 	 	 	 	 	 	 	 	 E d i t A d d E x i s t i n g S e c u r i t y G r o u p   ' E d i t A d d E x i s t i n g S e c u r i t y G r o u p ' ,  
 	 	 	 	 	 	 	 	 	 	 	 E d i t D e l e t e S e c u r i t y G r o u p   ' E d i t D e l e t e S e c u r i t y G r o u p ' ,  
 	 	 	 	 	 	 	 	 	 	 	 M i n C a r d i n a l i t y   ' M i n C a r d i n a l i t y ' ,  
 	 	 	 	 	 	 	 	 	 	 	 M a x C a r d i n a l i t y   ' M a x C a r d i n a l i t y ' ,  
 	 	 	 	 	 	 	 	 	 	 	 C u s t o m D i s p l a y M o d u l e   ' C u s t o m D i s p l a y M o d u l e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 C u s t o m E d i t M o d u l e   ' C u s t o m E d i t M o d u l e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 _ C l a s s N o d e   ' _ C l a s s N o d e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 _ N e t w o r k P r o p e r t y N o d e   ' _ N e t w o r k P r o p e r t y N o d e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 _ P r o p e r t y N o d e   ' _ P r o p e r t y N o d e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 _ T a g N a m e   ' _ T a g N a m e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 _ P r o p e r t y L a b e l   ' _ P r o p e r t y L a b e l ' ,    
 	 	 	 	 	 	 	 	 	 	 	 _ N u m b e r O f N o d e s   ' _ N u m b e r O f N o d e s ' ,  
 	 	 	 	 	 	 	 	 	 	 	 _ N u m b e r O f T r i p l e s   ' _ N u m b e r O f T r i p l e s '  
 	 	 	 	 	 	 	 	 	 f r o m   [ O n t o l o g y . ] . C l a s s P r o p e r t y  
 	 	 	 	 	 	 	 	 	 f o r   x m l   p a t h ( ' R o w ' ) ,   t y p e  
 	 	 	 	 	 	 	 	 )   ' T a b l e '  
 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 	 ) ,  
 	 	 	 	 	 (  
 	 	 	 	 	 	 s e l e c t 	 ' [ O n t o l o g y . ] . [ D a t a M a p ] '   ' T a b l e / @ N a m e ' ,  
 	 	 	 	 	 	  
 	 	 	 	 	 	 	 	 (  
 	 	 	 	 	 	 	 	 	 s e l e c t     D a t a M a p I D   ' D a t a M a p I D ' ,  
 	 	 	 	 	 	 	 	 	 	 	 D a t a M a p G r o u p   ' D a t a M a p G r o u p ' ,  
 	 	 	 	 	 	 	 	 	 	 	 I s A u t o F e e d   ' I s A u t o F e e d ' ,  
 	 	 	 	 	 	 	 	 	 	 	 G r a p h   ' G r a p h ' ,  
 	 	 	 	 	 	 	 	 	 	 	 C l a s s   ' C l a s s ' ,  
 	 	 	 	 	 	 	 	 	 	 	 N e t w o r k P r o p e r t y   ' N e t w o r k P r o p e r t y ' ,  
 	 	 	 	 	 	 	 	 	 	 	 P r o p e r t y   ' P r o p e r t y ' ,  
 	 	 	 	 	 	 	 	 	 	 	 M a p T a b l e   ' M a p T a b l e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 s I n t e r n a l T y p e   ' s I n t e r n a l T y p e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 s I n t e r n a l I D   ' s I n t e r n a l I D ' ,  
 	 	 	 	 	 	 	 	 	 	 	 c C l a s s   ' c C l a s s ' ,  
 	 	 	 	 	 	 	 	 	 	 	 c I n t e r n a l T y p e   ' c I n t e r n a l T y p e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 c I n t e r n a l I D   ' c I n t e r n a l I D ' ,  
 	 	 	 	 	 	 	 	 	 	 	 o C l a s s   ' o C l a s s ' ,  
 	 	 	 	 	 	 	 	 	 	 	 o I n t e r n a l T y p e   ' o I n t e r n a l T y p e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 o I n t e r n a l I D   ' o I n t e r n a l I D ' ,  
 	 	 	 	 	 	 	 	 	 	 	 o V a l u e   ' o V a l u e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 o D a t a T y p e   ' o D a t a T y p e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 o L a n g u a g e   ' o L a n g u a g e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 o S t a r t D a t e   ' o S t a r t D a t e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 o S t a r t D a t e P r e c i s i o n   ' o S t a r t D a t e P r e c i s i o n ' ,  
 	 	 	 	 	 	 	 	 	 	 	 o E n d D a t e   ' o E n d D a t e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 o E n d D a t e P r e c i s i o n   ' o E n d D a t e P r e c i s i o n ' ,  
 	 	 	 	 	 	 	 	 	 	 	 o O b j e c t T y p e   ' o O b j e c t T y p e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 W e i g h t   ' W e i g h t ' ,  
 	 	 	 	 	 	 	 	 	 	 	 O r d e r B y   ' O r d e r B y ' ,  
 	 	 	 	 	 	 	 	 	 	 	 V i e w S e c u r i t y G r o u p   ' V i e w S e c u r i t y G r o u p ' ,  
 	 	 	 	 	 	 	 	 	 	 	 E d i t S e c u r i t y G r o u p   ' E d i t S e c u r i t y G r o u p ' ,  
 	 	 	 	 	 	 	 	 	 	 	 _ C l a s s N o d e   ' _ C l a s s N o d e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 _ N e t w o r k P r o p e r t y N o d e   ' _ N e t w o r k P r o p e r t y N o d e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 _ P r o p e r t y N o d e   ' _ P r o p e r t y N o d e '  
 	 	 	 	 	 	 	 	 	 f r o m   [ O n t o l o g y . ] . [ D a t a M a p ]  
 	 	 	 	 	 	 	 	 	 f o r   x m l   p a t h ( ' R o w ' ) ,   t y p e  
 	 	 	 	 	 	 	 	 )   ' T a b l e '  
 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 	 ) ,  
 	 	 	 	 	 (  
 	 	 	 	 	 	 s e l e c t 	 ' [ O n t o l o g y . ] . [ N a m e s p a c e ] '   ' T a b l e / @ N a m e ' ,  
 	 	 	 	 	 	 	 	 (  
 	 	 	 	 	 	 	 	 	 s e l e c t 	 U R I   ' U R I ' ,  
 	 	 	 	 	 	 	 	 	 	 	 P r e f i x   ' P r e f i x '  
 	 	 	 	 	 	 	 	 	 f r o m   [ O n t o l o g y . ] . [ N a m e s p a c e ]  
 	 	 	 	 	 	 	 	 	 f o r   x m l   p a t h ( ' R o w ' ) ,   t y p e  
 	 	 	 	 	 	 	 	 )   ' T a b l e '  
 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 	 ) ,  
 	 	 	 	 	 (  
 	 	 	 	 	 	 s e l e c t 	 ' [ O n t o l o g y . ] . [ P r o p e r t y G r o u p ] '   ' T a b l e / @ N a m e ' ,  
 	 	 	 	 	 	 	 	 (  
 	 	 	 	 	 	 	 	 	 s e l e c t 	 P r o p e r t y G r o u p U R I   ' P r o p e r t y G r o u p U R I ' ,  
 	 	 	 	 	 	 	 	 	 	 	 S o r t O r d e r   ' S o r t O r d e r ' ,  
 	 	 	 	 	 	 	 	 	 	 	 _ P r o p e r t y G r o u p L a b e l   ' _ P r o p e r t y G r o u p L a b e l ' ,  
 	 	 	 	 	 	 	 	 	 	 	 _ P r o p e r t y G r o u p N o d e   ' _ P r o p e r t y G r o u p N o d e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 _ N u m b e r O f N o d e s   ' _ N u m b e r O f N o d e s '  
 	 	 	 	 	 	 	 	 	 f r o m   [ O n t o l o g y . ] . [ P r o p e r t y G r o u p ]  
 	 	 	 	 	 	 	 	 	 f o r   x m l   p a t h ( ' R o w ' ) ,   t y p e  
 	 	 	 	 	 	 	 	 )   ' T a b l e '  
 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 	 ) ,  
 	 	 	 	 	 (  
 	 	 	 	 	 	 s e l e c t 	 ' [ O n t o l o g y . ] . [ P r o p e r t y G r o u p P r o p e r t y ] '   ' T a b l e / @ N a m e ' ,  
 	 	 	 	 	 	 	 	 (  
 	 	 	 	 	 	 	 	 	 s e l e c t 	 P r o p e r t y G r o u p U R I   ' P r o p e r t y G r o u p U R I ' ,  
 	 	 	 	 	 	 	 	 	 	 	 P r o p e r t y U R I   ' P r o p e r t y U R I ' ,  
 	 	 	 	 	 	 	 	 	 	 	 S o r t O r d e r   ' S o r t O r d e r ' ,  
 	 	 	 	 	 	 	 	 	 	 	 C u s t o m D i s p l a y M o d u l e   ' C u s t o m D i s p l a y M o d u l e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 C u s t o m E d i t M o d u l e   ' C u s t o m E d i t M o d u l e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 _ P r o p e r t y G r o u p N o d e   ' _ P r o p e r t y G r o u p N o d e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 _ P r o p e r t y N o d e   ' _ P r o p e r t y N o d e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 _ T a g N a m e   ' _ T a g N a m e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 _ P r o p e r t y L a b e l   ' _ P r o p e r t y L a b e l ' ,  
 	 	 	 	 	 	 	 	 	 	 	 _ N u m b e r O f N o d e s   ' _ N u m b e r O f N o d e s '  
 	 	 	 	 	 	 	 	 	 f r o m   [ O n t o l o g y . ] . [ P r o p e r t y G r o u p P r o p e r t y ]  
 	 	 	 	 	 	 	 	 	 f o r   x m l   p a t h ( ' R o w ' ) ,   t y p e  
 	 	 	 	 	 	 	 	 )   ' T a b l e '  
 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 	 ) ,  
 	 	 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 	 	 	 - -   [ O n t o l o g y . P r e s e n t a t i o n ]  
 	 	 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 	 	 	 (  
 	 	 	 	 	 	 s e l e c t 	 ' [ O n t o l o g y . P r e s e n t a t i o n ] . [ X M L ] '   ' T a b l e / @ N a m e ' ,  
 	 	 	 	 	 	 	 	 (  
 	 	 	 	 	 	 	 	 	 s e l e c t 	 P r e s e n t a t i o n I D   ' P r e s e n t a t i o n I D ' ,    
 	 	 	 	 	 	 	 	 	 	 	 t y p e   ' t y p e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 s u b j e c t   ' s u b j e c t ' ,  
 	 	 	 	 	 	 	 	 	 	 	 p r e d i c a t e   ' p r e d i c a t e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 o b j e c t   ' o b j e c t ' ,  
 	 	 	 	 	 	 	 	 	 	 	 p r e s e n t a t i o n X M L   ' p r e s e n t a t i o n X M L '  
 	 	 	 	 	 	 	 	 	 f r o m   [ O n t o l o g y . P r e s e n t a t i o n ] . [ X M L ]  
 	 	 	 	 	 	 	 	 	 f o r   x m l   p a t h ( ' R o w ' ) ,   t y p e  
 	 	 	 	 	 	 	 	 )   ' T a b l e '  
 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 	 ) ,  
 	 	 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 	 	 	 - -   [ R D F . S e c u r i t y ]  
 	 	 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 	 	 	 (  
 	 	 	 	 	 	 s e l e c t 	 ' [ R D F . S e c u r i t y ] . [ G r o u p ] '   ' T a b l e / @ N a m e ' ,  
 	 	 	 	 	 	 	 	 (  
 	 	 	 	 	 	 	 	 	 s e l e c t 	 S e c u r i t y G r o u p I D   ' S e c u r i t y G r o u p I D ' ,  
 	 	 	 	 	 	 	 	 	 	 	 L a b e l   ' L a b e l ' ,  
 	 	 	 	 	 	 	 	 	 	 	 H a s S p e c i a l V i e w A c c e s s   ' H a s S p e c i a l V i e w A c c e s s ' ,  
 	 	 	 	 	 	 	 	 	 	 	 H a s S p e c i a l E d i t A c c e s s   ' H a s S p e c i a l E d i t A c c e s s ' ,  
 	 	 	 	 	 	 	 	 	 	 	 D e s c r i p t i o n   ' D e s c r i p t i o n '  
 	 	 	 	 	 	 	 	 	 f r o m   [ R D F . S e c u r i t y ] . [ G r o u p ]  
 	 	 	 	 	 	 	 	 	 f o r   x m l   p a t h ( ' R o w ' ) ,   t y p e  
 	 	 	 	 	 	 	 	 )   ' T a b l e '  
 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 	 ) ,  
 	 	 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 	 	 	 - -   [ U t i l i t y . N L P ]  
 	 	 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 	 	 	 (  
 	 	 	 	 	 	 s e l e c t 	 ' [ U t i l i t y . N L P ] . [ P a r s e P o r t e r S t e m m i n g ] '   ' T a b l e / @ N a m e ' ,  
 	 	 	 	 	 	 	 	 (  
 	 	 	 	 	 	 	 	 	 s e l e c t 	 s t e p   ' S t e p ' ,  
 	 	 	 	 	 	 	 	 	 	 	 O r d e r i n g   ' O r d e r i n g ' ,  
 	 	 	 	 	 	 	 	 	 	 	 p h r a s e 1   ' p h r a s e 1 ' ,  
 	 	 	 	 	 	 	 	 	 	 	 p h r a s e 2   ' p h r a s e 2 '  
 	 	 	 	 	 	 	 	 	 f r o m   [ U t i l i t y . N L P ] . P a r s e P o r t e r S t e m m i n g  
 	 	 	 	 	 	 	 	 	 f o r   x m l   p a t h ( ' R o w ' ) ,   t y p e  
 	 	 	 	 	 	 	 	 )   ' T a b l e '  
 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 	 ) ,  
 	 	 	 	 	 (  
 	 	 	 	 	 	 s e l e c t 	 ' [ U t i l i t y . N L P ] . [ S t o p W o r d ] '   ' T a b l e / @ N a m e ' ,  
 	 	 	 	 	 	 	 	 (  
 	 	 	 	 	 	 	 	 	 s e l e c t 	 w o r d   ' w o r d ' ,  
 	 	 	 	 	 	 	 	 	 	 	 s t e m   ' s t e m ' ,  
 	 	 	 	 	 	 	 	 	 	 	 s c o p e   ' s c o p e '  
 	 	 	 	 	 	 	 	 	 f r o m   [ U t i l i t y . N L P ] . [ S t o p W o r d ]  
 	 	 	 	 	 	 	 	 	 f o r   x m l   p a t h ( ' R o w ' ) ,   t y p e  
 	 	 	 	 	 	 	 	 )   ' T a b l e '  
 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 	 ) ,  
 	 	 	 	 	 (  
 	 	 	 	 	 	 s e l e c t 	 ' [ U t i l i t y . N L P ] . [ T h e s a u r u s . S o u r c e ] '   ' T a b l e / @ N a m e ' ,  
 	 	 	 	 	 	 	 	 (  
 	 	 	 	 	 	 	 	 	 s e l e c t 	 S o u r c e   ' S o u r c e ' ,  
 	 	 	 	 	 	 	 	 	 	 	 S o u r c e N a m e   ' S o u r c e N a m e '  
 	 	 	 	 	 	 	 	 	 f r o m   [ U t i l i t y . N L P ] . [ T h e s a u r u s . S o u r c e ]  
 	 	 	 	 	 	 	 	 	 f o r   x m l   p a t h ( ' R o w ' ) ,   t y p e  
 	 	 	 	 	 	 	 	 )   ' T a b l e '  
 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 	 ) ,  
 	 	 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 	 	 	 - -   [ U s e r . S e s s i o n ]  
 	 	 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 	 	 	 (  
 	 	 	 	 	 	 s e l e c t 	 ' [ U s e r . S e s s i o n ] . B o t '   ' T a b l e / @ N a m e ' ,  
 	 	 	 	 	 	 	 (  
 	 	 	 	 	 	 	 	 S E L E C T   U s e r A g e n t   ' U s e r A g e n t '    
 	 	 	 	 	 	 	 	     F R O M   [ U s e r . S e s s i o n ] . B o t  
 	 	 	 	     	 	 	 	 	 f o r   x m l   p a t h ( ' R o w ' ) ,   t y p e  
 	 	 	       	 	 	 	 )   ' T a b l e '      
 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 	 ) ,  
 	 	 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 	 	 	 - -   [ D i r e c t . ]  
 	 	 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 	 	 	 (  
 	 	 	 	 	 	 s e l e c t 	 ' [ D i r e c t . ] . [ S i t e s ] '   ' T a b l e / @ N a m e ' ,  
 	 	 	 	 	 	 	 (  
 	 	 	 	 	 	 	 	 S E L E C T   S i t e I D   ' S i t e I D ' ,  
 	 	 	 	 	 	 	 	 	 	 B o o t s t r a p U R L   ' B o o t s t r a p U R L ' ,  
 	 	 	 	 	 	 	 	 	 	 S i t e N a m e   ' S i t e N a m e ' ,  
 	 	 	 	 	 	 	 	 	 	 Q u e r y U R L   ' Q u e r y U R L ' ,  
 	 	 	 	 	 	 	 	 	 	 S o r t O r d e r   ' S o r t O r d e r ' ,  
 	 	 	 	 	 	 	 	 	 	 I s A c t i v e   ' I s A c t i v e '      
 	 	 	 	 	 	 	 	     F R O M   [ D i r e c t . ] . [ S i t e s ]    
 	 	 	   	 	 	 	 	 f o r   x m l   p a t h ( ' R o w ' ) ,   t y p e  
 	 	 	 	 	   	 	 )   ' T a b l e '        
 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   T Y P E  
 	 	 	 	 	 ) ,  
 	 	 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 	 	 	 - -   [ P r o f i l e . D a t a ]  
 	 	 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 	 	 	 (  
 	 	 	 	 	 	 s e l e c t 	 ' [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . T y p e ] '   ' T a b l e / @ N a m e ' ,  
 	 	 	 	 	 	 	 (  
 	 	 	 	 	 	 	 	 S E L E C T 	 p u b i d t y p e _ i d   ' p u b i d t y p e _ i d ' ,  
 	 	 	 	 	 	 	 	 	 	 n a m e   ' n a m e ' ,  
 	 	 	 	 	 	 	 	 	 	 s o r t _ o r d e r   ' s o r t _ o r d e r '  
 	 	 	 	 	 	 	 	     F R O M   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . T y p e ]  
 	 	 	 	     	 	 	 	 	 f o r   x m l   p a t h ( ' R o w ' ) ,   t y p e  
 	 	 	       	 	 	 	 )   ' T a b l e '      
 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 	 ) ,  
 	 	 	 	 	 (  
 	 	 	 	 	 	 s e l e c t 	 ' [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . M y P u b . C a t e g o r y ] '   ' T a b l e / @ N a m e ' ,  
 	 	 	 	 	 	 	 (  
 	 	 	 	 	 	 	 	 S E L E C T 	 H m s P u b C a t e g o r y   ' H m s P u b C a t e g o r y ' ,  
 	 	 	 	 	 	 	 	 	 	 C a t e g o r y N a m e   ' C a t e g o r y N a m e '  
 	 	 	 	 	 	 	 	     F R O M   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . M y P u b . C a t e g o r y ]  
 	 	 	 	     	 	 	 	 	 f o r   x m l   p a t h ( ' R o w ' ) ,   t y p e  
 	 	 	 	 	 	 	 )   ' T a b l e '      
 	 	 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 	 	 ) 	  
 	 	 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 	 	 )   ' I m p o r t '  
 	 	 f o r   x m l   p a t h ( ' ' ) ,   t y p e  
 	 )  
  
 	 i n s e r t   i n t o   [ F r a m e w o r k . ] . [ I n s t a l l D a t a ]   ( D a t a )  
 	 	 s e l e c t   @ x  
  
  
       - - U s e   t o   g e n e r a t e   s e l e c t   l i s t s   f o r   n e w   t a b l e s  
       - - S E L E C T         c . n a m e   +     '   ' ' '   +   n a m e   +   ' ' ' , '  
       - - F R O M   s y s . c o l u m n s   c      
       - - W H E R E   o b j e c t _ i d   I N   ( S E L E C T   o b j e c t _ i d   F R O M   s y s . t a b l e s   W H E R E   n a m e   =   ' P u b l i c a t i o n . M y P u b . C a t e g o r y ' )      
  
 E N D  
  
  
  
  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ O n t o l o g y . I m p o r t ] . [ C o n v e r t T r i p l e 2 O W L ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ O n t o l o g y . I m p o r t ] . [ C o n v e r t T r i p l e 2 O W L ]  
 	 @ O W L   v a r c h a r ( 5 0 ) ,  
 	 @ G r a p h   b i g i n t   =   N U L L  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
 	 - -   T h i s   s t o r e d   p r o c e d u r e   i s   c u r r e n t l y   o n l y   i n t e n d e d   f o r   u s e   w i t h   @ O W L   =   ' P R N S _ 1 . 0 '   ( a n d   @ G r a p h   =   3 )  
  
 	 s e l e c t   t . s u b j e c t ,   n . p r e f i x + ' : ' + r i g h t ( t . p r e d i c a t e , l e n ( t . p r e d i c a t e ) - l e n ( n . u r i ) )   p r e d i c a t e ,   t . o b j e c t  
 	 	 i n t o   # t  
 	 	 f r o m   [ O n t o l o g y . I m p o r t ] . T r i p l e   t ,   [ O n t o l o g y . ] . N a m e s p a c e   n  
 	 	 w h e r e   t . O W L   =   @ O W L   a n d   t . P r e d i c a t e   l i k e   n . U R I + ' % '  
 	 	 o r d e r   b y   t . s u b j e c t ,   p r e d i c a t e ,   t . o b j e c t  
 	    
 	 d e c l a r e   @ z   a s   v a r c h a r ( m a x )  
 	 d e c l a r e   @ s   a s   v a r c h a r ( 4 0 0 )  
 	 d e c l a r e   @ c   a s   v a r c h a r ( 4 0 0 )  
 	 s e l e c t   @ z   =   ' ' ,   @ s   =   ' ' ,   @ c   =   ' '  
 	 s e l e c t   @ z   =   @ z   +   ( c a s e   w h e n   s u b j e c t   < >   @ s   t h e n   @ c   +   ' < r d f : D e s c r i p t i o n   r d f : a b o u t = " ' + s u b j e c t + ' " > '   e l s e   ' '   e n d )  
 	 	 	 	 	 +   ' < ' + p r e d i c a t e + '   r d f : r e s o u r c e = " ' + o b j e c t + ' " / > ' ,  
 	 	 	 @ s   =   s u b j e c t ,  
 	 	 	 @ c   =   ' < / r d f : D e s c r i p t i o n > '  
 	 	 f r o m   # t  
 	 s e l e c t   @ z   =   @ z   +   @ c  
  
 	 d e c l a r e   @ x   a s   v a r c h a r ( m a x )  
 	 s e l e c t   @ x   =   ' < r d f : R D F '  
 	 s e l e c t   @ x   =   @ x   +   '   x m l n s : ' + P r e f i x + ' = " ' + U R I + ' " '    
 	 	 f r o m   [ O n t o l o g y . ] . N a m e s p a c e  
 	 s e l e c t   @ x   =   @ x   +   '   > '   +   @ z   +   ' < / r d f : R D F > '  
  
 	 - -   s e l e c t   c a s t ( @ x   a s   x m l )   R D F  
 	 B E G I N   T R Y  
 	 	 b e g i n   t r a n s a c t i o n  
  
 	 	 	 d e l e t e    
 	 	 	 	 f r o m   [ O n t o l o g y . I m p o r t ] . [ O W L ]    
 	 	 	 	 w h e r e   N a m e   =   @ O W L  
  
 	 	 	 i n s e r t   i n t o   [ O n t o l o g y . I m p o r t ] . [ O W L ]   ( N a m e ,   D a t a ,   G r a p h )  
 	 	 	 	 s e l e c t   @ O W L ,   c a s t ( @ x   a s   x m l ) ,   @ G r a p h  
  
 	 	 c o m m i t   t r a n s a c t i o n  
 	 E N D   T R Y  
 	 B E G I N   C A T C H  
 	 	 D E C L A R E   @ E r r M s g   n v a r c h a r ( 4 0 0 0 ) ,   @ E r r S e v e r i t y   i n t  
 	 	 - - C h e c k   s u c c e s s  
 	 	 I F   @ @ T R A N C O U N T   >   0     R O L L B A C K  
    
 	 	 - -   R a i s e   a n   e r r o r   w i t h   t h e   d e t a i l s   o f   t h e   e x c e p t i o n  
 	 	 S E L E C T   @ E r r M s g   =     E R R O R _ M E S S A G E ( ) ,  
 	 	 	 	 	   @ E r r S e v e r i t y   =   E R R O R _ S E V E R I T Y ( )  
    
 	 	 R A I S E R R O R ( @ E r r M s g ,   @ E r r S e v e r i t y ,   1 )  
 	 	 	    
 	 E N D   C A T C H 	 	  
  
  
 	 - -   s e l e c t   *   f r o m   [ O n t o l o g y . I m p o r t ] . [ O W L ]  
  
 E N D  
  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ S e a r c h . C a c h e ] . [ H i s t o r y . U p d a t e T o p S e a r c h P h r a s e ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ S e a r c h . C a c h e ] . [ H i s t o r y . U p d a t e T o p S e a r c h P h r a s e ]  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
 	 C R E A T E   T A B L E   # T o p S e a r c h P h r a s e   (  
 	 	 T i m e P e r i o d   C H A R ( 1 )   N O T   N U L L ,  
 	 	 P h r a s e   V A R C H A R ( 1 0 0 )   N O T   N U L L ,  
 	 	 N u m b e r O f Q u e r i e s   I N T  
 	 )  
  
 	 - -   G e t   t o p   d a y ,   w e e k ,   a n d   m o n t h   p h r a s e s  
 	  
 	 I N S E R T   I N T O   # T o p S e a r c h P h r a s e   ( T i m e P e r i o d ,   P h r a s e ,   N u m b e r O f Q u e r i e s )  
 	 	 S E L E C T   T O P   1 0   ' d ' ,   P h r a s e ,   C O U N T ( * )   n  
 	 	 	 F R O M   [ S e a r c h . ] . [ H i s t o r y . P h r a s e ]  
 	 	 	 W H E R E   N u m b e r O f C o n n e c t i o n s   >   0  
 	 	 	 	 A N D   L E N ( P h r a s e )   < =   1 0 0  
 	 	 	 	 A N D   I s B o t   =   0  
 	 	 	 	 A N D   E n d D a t e   > =   D A T E A D D ( D A Y , - 1 , G E T D A T E ( ) )  
 	 	 	 G R O U P   B Y   P h r a s e  
 	 	 	 O R D E R   B Y   n   D E S C  
  
 	 I N S E R T   I N T O   # T o p S e a r c h P h r a s e   ( T i m e P e r i o d ,   P h r a s e ,   N u m b e r O f Q u e r i e s )  
 	 	 S E L E C T   T O P   1 0   ' w ' ,   P h r a s e ,   C O U N T ( * )   n  
 	 	 	 F R O M   [ S e a r c h . ] . [ H i s t o r y . P h r a s e ]  
 	 	 	 W H E R E   N u m b e r O f C o n n e c t i o n s   >   0  
 	 	 	 	 A N D   L E N ( P h r a s e )   < =   1 0 0  
 	 	 	 	 A N D   I s B o t   =   0  
 	 	 	 	 A N D   E n d D a t e   > =   D A T E A D D ( W E E K , - 1 , G E T D A T E ( ) )  
 	 	 	 G R O U P   B Y   P h r a s e  
 	 	 	 O R D E R   B Y   n   D E S C  
  
 	 I N S E R T   I N T O   # T o p S e a r c h P h r a s e   ( T i m e P e r i o d ,   P h r a s e ,   N u m b e r O f Q u e r i e s )  
 	 	 S E L E C T   T O P   1 0   ' m ' ,   P h r a s e ,   C O U N T ( * )   n  
 	 	 	 F R O M   [ S e a r c h . ] . [ H i s t o r y . P h r a s e ]  
 	 	 	 W H E R E   N u m b e r O f C o n n e c t i o n s   >   0  
 	 	 	 	 A N D   L E N ( P h r a s e )   < =   1 0 0  
 	 	 	 	 A N D   I s B o t   =   0  
 	 	 	 	 A N D   E n d D a t e   > =   D A T E A D D ( M O N T H , - 1 , G E T D A T E ( ) )  
 	 	 	 G R O U P   B Y   P h r a s e  
 	 	 	 O R D E R   B Y   n   D E S C  
  
 	 - -   A d d   p h r a s e s   t o   t r y   t o   g e t   t o   1 0   p h r a s e s   p e r   t i m e   p e r i o d  
  
 	 D E C L A R E   @ n   I N T  
 	  
 	 S E L E C T   @ n   =   1 0   -   ( S E L E C T   C O U N T ( * )   F R O M   # T o p S e a r c h P h r a s e   W H E R E   T i m e P e r i o d   =   ' d ' )  
 	 I F   @ n   >   0  
 	 	 I N S E R T   I N T O   # T o p S e a r c h P h r a s e   ( T i m e P e r i o d ,   P h r a s e ,   N u m b e r O f Q u e r i e s )  
 	 	 	 S E L E C T   T O P ( @ n )   ' d ' ,   P h r a s e ,   0  
 	 	 	 	 F R O M   # T o p S e a r c h P h r a s e  
 	 	 	 	 W H E R E   T i m e P e r i o d   =   ' w '  
 	 	 	 	 	 A N D   P h r a s e   N O T   I N   ( S E L E C T   P h r a s e   F R O M   # T o p S e a r c h P h r a s e   W H E R E   T i m e P e r i o d   =   ' d ' )  
 	 	 	 	 O R D E R   B Y   N u m b e r O f Q u e r i e s   D E S C  
  
 	 S E L E C T   @ n   =   1 0   -   ( S E L E C T   C O U N T ( * )   F R O M   # T o p S e a r c h P h r a s e   W H E R E   T i m e P e r i o d   =   ' d ' )  
 	 I F   @ n   >   0  
 	 	 I N S E R T   I N T O   # T o p S e a r c h P h r a s e   ( T i m e P e r i o d ,   P h r a s e ,   N u m b e r O f Q u e r i e s )  
 	 	 	 S E L E C T   T O P ( @ n )   ' d ' ,   P h r a s e ,   0  
 	 	 	 	 F R O M   # T o p S e a r c h P h r a s e  
 	 	 	 	 W H E R E   T i m e P e r i o d   =   ' m '  
 	 	 	 	 	 A N D   P h r a s e   N O T   I N   ( S E L E C T   P h r a s e   F R O M   # T o p S e a r c h P h r a s e   W H E R E   T i m e P e r i o d   =   ' d ' )  
 	 	 	 	 O R D E R   B Y   N u m b e r O f Q u e r i e s   D E S C  
  
 	 S E L E C T   @ n   =   1 0   -   ( S E L E C T   C O U N T ( * )   F R O M   # T o p S e a r c h P h r a s e   W H E R E   T i m e P e r i o d   =   ' w ' )  
 	 I F   @ n   >   0  
 	 	 I N S E R T   I N T O   # T o p S e a r c h P h r a s e   ( T i m e P e r i o d ,   P h r a s e ,   N u m b e r O f Q u e r i e s )  
 	 	 	 S E L E C T   T O P ( @ n )   ' w ' ,   P h r a s e ,   0  
 	 	 	 	 F R O M   # T o p S e a r c h P h r a s e  
 	 	 	 	 W H E R E   T i m e P e r i o d   =   ' m '  
 	 	 	 	 	 A N D   P h r a s e   N O T   I N   ( S E L E C T   P h r a s e   F R O M   # T o p S e a r c h P h r a s e   W H E R E   T i m e P e r i o d   =   ' w ' )  
 	 	 	 	 O R D E R   B Y   N u m b e r O f Q u e r i e s   D E S C  
  
 	 - -   U p d a t e   t h e   c a c h e   t a b l e  
  
 	 T R U N C A T E   T A B L E   [ S e a r c h . C a c h e ] . [ H i s t o r y . T o p S e a r c h P h r a s e ]  
 	 I N S E R T   I N T O   [ S e a r c h . C a c h e ] . [ H i s t o r y . T o p S e a r c h P h r a s e ]   ( T i m e P e r i o d ,   P h r a s e ,   N u m b e r O f Q u e r i e s )  
 	 	 S E L E C T   T i m e P e r i o d ,   P h r a s e ,   N u m b e r O f Q u e r i e s    
 	 	 	 F R O M   # T o p S e a r c h P h r a s e  
  
 	 - - D R O P   T A B L E   # T o p S e a r c h P h r a s e  
 	 - - S E L E C T   *   F R O M   [ S e a r c h . C a c h e ] . [ H i s t o r y . T o p S e a r c h P h r a s e ]  
 	  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ F r a m e w o r k . ] . [ C h a n g e B a s e U R I ] '  
 G O  
 C R E A T E   p r o c e d u r e   [ F r a m e w o r k . ] . [ C h a n g e B a s e U R I ]  
 	 @ o l d B a s e U R I   v a r c h a r ( 1 0 0 0 ) ,  
 	 @ n e w B a s e U R I   v a r c h a r ( 1 0 0 0 )  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
    
         / *    
    
 	 E X A M P L E :  
    
 	 e x e c   [ F r a m e w o r k . ] . u s p C h a n g e B a s e U R I 	 @ o l d B a s e U R I   =   ' h t t p : / / c o n n e c t s . c a t a l y s t . h a r v a r d . e d u / p r o f i l e s / p r o f i l e / ' ,  
 	 	 	 	 	 	 	 	 	 	 @ n e w B a s e U R I   =   ' h t t p : / / d e v . c o n n e c t s . c a t a l y s t . h a r v a r d . e d u / p r o f i l e s / p r o f i l e / '  
    
 	 * /  
    
 	 U P D A T E   [ F r a m e w o r k . ] . [ P a r a m e t e r ]  
 	 	 S E T   V a l u e   =   @ n e w B a s e U R I  
 	 	 W H E R E   P a r a m e t e r I D   =   ' b a s e U R I '  
    
 	 U P D A T E   [ R D F . ] . [ N o d e ]  
 	 	 S E T   V a l u e   =   @ n e w B a s e U R I   +   s u b s t r i n g ( v a l u e , l e n ( @ o l d B a s e U R I ) + 1 , l e n ( v a l u e ) ) ,  
 	 	 	 V a l u e H a s h   =   [ R D F . ] . [ f n V a l u e H a s h ] ( L a n g u a g e , D a t a T y p e , @ n e w B a s e U R I   +   s u b s t r i n g ( v a l u e , l e n ( @ o l d B a s e U R I ) + 1 , l e n ( v a l u e ) ) )  
 	 	 W H E R E   V a l u e   L I K E   @ o l d B a s e U R I   +   ' % '  
    
 	 U P D A T E   m  
 	 	 S E T   m . V a l u e H a s h   =   n . V a l u e H a s h  
 	 	 F R O M   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   m ,   [ R D F . ] . [ N o d e ]   n  
 	 	 W H E R E   m . N o d e I D   =   n . N o d e I D  
    
 	 E X E C   [ S e a r c h . C a c h e ] . [ P u b l i c . U p d a t e C a c h e ]  
  
 	 E X E C   [ S e a r c h . C a c h e ] . [ P r i v a t e . U p d a t e C a c h e ]  
  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A l t e r i n g   [ R D F . S t a g e ] . [ P r o c e s s D a t a M a p ] '  
 G O  
 A L T E R   P R O C E D U R E   [ R D F . S t a g e ] . [ P r o c e s s D a t a M a p ]  
 	 @ D a t a M a p I D   I N T   =   N U L L ,  
 	 @ D a t a M a p G r o u p M i n   I N T   =   N U L L ,  
 	 @ D a t a M a p G r o u p M a x   I N T   =   N U L L ,  
 	 @ A u t o F e e d O n l y   B I T   =   1 ,  
 	 @ I n t e r n a l I d I n   N V A R C H A R ( M A X )   =   N U L L ,  
 	 @ S h o w C o u n t s   B I T   =   0 ,  
 	 @ S a v e L o g   B I T   =   1 ,  
 	 @ T u r n O f f I n d e x i n g   B I T   =   1  
 A S  
    
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - -   C r e a t e   a   q u e u e   o f   D a t a M a p   i t e m s   t o   p r o c e s s  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  
 	 C R E A T E   T A B L E   # Q u e u e ( D a t a M a p I D     I N T   )  
 	 I F   @ D a t a M a p I D   I S   N U L L  
 	 B E G I N  
 	 	 I N S E R T   I N T O   # Q u e u e  
 	 	 S E L E C T   D a t a M a p I D 	 	 	  
 	 	 	 F R O M   [ O n t o l o g y . ] . D a t a M a p  
 	 	 	 W H E R E   D a t a M a p G r o u p   > =   I s N u l l ( @ D a t a M a p G r o u p M i n , D a t a M a p G r o u p )  
 	 	 	 	 A N D   D a t a M a p G r o u p   < =   I s N u l l ( @ D a t a M a p G r o u p M a x , D a t a M a p G r o u p )  
 	 	 	 	 A N D   ( @ A u t o F e e d O n l y   =   0   O R   I s A u t o F e e d   =   1 )  
 	 	 	 O R D E R   B Y   D a t a M a p I D  
 	 E N D    
 	 E L S E    
 	 B E G I N  
 	 	 I N S E R T   I N T O   # Q u e u e  
 	 	 S E L E C T   @ D a t a M a p I D      
 	 E N D  
  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - -   L o o p   t h r o u g h   e a c h   D a t a M a p   i t e m   i n   t h e   q u e u e  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  
 	 - -   T u r n   o f f   r e a l - t i m e   i n d e x i n g  
 	 I F   @ T u r n O f f I n d e x i n g   =   1  
 	 	 A L T E R   F U L L T E X T   I N D E X   O N   [ R D F . ] . N o d e   S E T   C H A N G E _ T R A C K I N G   O F F    
  
 	 - -   D o   t h e   l o o p 	  
 	 W H I L E   ( S E L E C T   C O U N T ( * )   F R O M   # Q u e u e )   >   0  
 	 B E G I N  
 	 	  
 	 	 S E L E C T   @ D a t a M a p I D   =   ( S E L E C T   T O P   1   D a t a M a p I D   F R O M   # Q u e u e )  
 	 	  
 	 	 D E C L A R E   @ S t a r t D a t e   D A T E T I M E  
 	 	 S E L E C T   @ S t a r t D a t e   =   G e t D a t e ( )  
  
 	 	 D E C L A R E   @ N e w N o d e s   B I G I N T  
 	 	 D E C L A R E   @ U p d a t e d N o d e s   B I G I N T  
 	 	 D E C L A R E   @ E x i s t i n g N o d e s   B I G I N T  
 	 	 D E C L A R E   @ D e l e t e d N o d e s   B I G I N T  
 	 	 D E C L A R E   @ T o t a l N o d e s   B I G I N T  
 	 	 D E C L A R E   @ N e w T r i p l e s   B I G I N T  
 	 	 D E C L A R E   @ U p d a t e d T r i p l e s   B I G I N T  
 	 	 D E C L A R E   @ E x i s t i n g T r i p l e s   B I G I N T  
 	 	 D E C L A R E   @ D e l e t e d T r i p l e s   B I G I N T  
 	 	 D E C L A R E   @ T o t a l T r i p l e s   B I G I N T  
  
 	 	 S E L E C T 	 @ N e w N o d e s = 0 ,   @ U p d a t e d N o d e s = 0 ,   @ E x i s t i n g N o d e s = 0 ,   @ D e l e t e d N o d e s = 0 ,   @ T o t a l N o d e s = 0 ,  
 	 	 	 	 @ N e w T r i p l e s = 0 ,   @ U p d a t e d T r i p l e s = 0 ,   @ E x i s t i n g T r i p l e s = 0 ,   @ D e l e t e d T r i p l e s = 0 ,   @ T o t a l T r i p l e s = 0  
  
 	 	 D E C L A R E   @ s   n v a r c h a r ( m a x )  
  
 	 	 D E C L A R E   @ b a s e U R I   N V A R C H A R ( 4 0 0 )  
 	 	 S E L E C T   @ b a s e U R I   =   v a l u e   F R O M   [ F r a m e w o r k . ] . P a r a m e t e r   W H E R E   P a r a m e t e r I D   =   ' b a s e U R I '  
  
 	 	 - -   D e t e r m i n e   t h e   D a t a M a p T y p e   a n d   v a l i d a t e   t h e   r e c o r d  
 	 	 D E C L A R E   @ D a t a M a p T y p e   I N T  
 	 	 S E L E C T   @ D a t a M a p T y p e   =   ( C A S E 	 W H E N   ( M a p T a b l e   I S   N U L L )   O R   ( C l a s s   I S   N U L L )   O R   ( s I n t e r n a l T y p e   I S   N U L L )   O R   ( s I n t e r n a l I D   I S   N U L L )   T H E N   N U L L  
 	 	 	 	 	 	 	 	 	 W H E N   P r o p e r t y   I S   N U L L   T H E N   1  
 	 	 	 	 	 	 	 	 	 W H E N   ( N e t w o r k P r o p e r t y   I S   N U L L )    
 	 	 	 	 	 	 	 	 	 	 	 A N D   ( o C l a s s   I S   N O T   N U L L )   A N D   ( o I n t e r n a l I D   I S   N O T   N U L L )   A N D   ( o I n t e r n a l I D   I S   N O T   N U L L )   T H E N   2  
 	 	 	 	 	 	 	 	 	 W H E N   ( N e t w o r k P r o p e r t y   I S   N U L L )    
 	 	 	 	 	 	 	 	 	 	 	 A N D   ( o V a l u e   I S   N O T   N U L L )   T H E N   3  
 	 	 	 	 	 	 	 	 	 W H E N   ( N e t w o r k P r o p e r t y   I S   N O T   N U L L )    
 	 	 	 	 	 	 	 	 	 	 	 A N D   ( c I n t e r n a l I D   I S   N O T   N U L L )   A N D   ( c I n t e r n a l I D   I S   N O T   N U L L )   A N D   ( c I n t e r n a l I D   I S   N O T   N U L L )    
 	 	 	 	 	 	 	 	 	 	 	 A N D   ( o C l a s s   I S   N O T   N U L L )   A N D   ( o I n t e r n a l I D   I S   N O T   N U L L )   A N D   ( o I n t e r n a l I D   I S   N O T   N U L L )   T H E N   4  
 	 	 	 	 	 	 	 	 	 W H E N   ( N e t w o r k P r o p e r t y   I S   N O T   N U L L )    
 	 	 	 	 	 	 	 	 	 	 	 A N D   ( c I n t e r n a l I D   I S   N O T   N U L L )   A N D   ( c I n t e r n a l I D   I S   N O T   N U L L )   A N D   ( c I n t e r n a l I D   I S   N O T   N U L L )    
 	 	 	 	 	 	 	 	 	 	 	 A N D   ( o V a l u e   I S   N O T   N U L L )   T H E N   5  
 	 	 	 	 	 	 	 	 	 E L S E   N U L L   E N D )  
 	 	 	 F R O M   [ O n t o l o g y . ] . D a t a M a p  
 	 	 	 W H E R E   D a t a M a p I D   =   @ D a t a M a p I D  
  
  
 	 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 	 - -   D a t a M a p T y p e   =   1   ( N o d e s )  
 	 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  
 	 	 I F   @ D a t a M a p T y p e   =   1  
 	 	 B E G I N  
  
 	 	 	 S E L E C T   @ s   =   ' '  
 	 	 	 	 	 + ' S E L E C T   C l a s s ,   I n t e r n a l T y p e ,   I n t e r n a l I D ,   '  
 	 	 	 	 	 + ' 	 	 c o a l e s c e ( m a x ( c a s e   w h e n   V i e w S e c u r i t y G r o u p   <   0   t h e n   V i e w S e c u r i t y G r o u p   e l s e   n u l l   e n d ) , m a x ( V i e w S e c u r i t y G r o u p ) , - 1 )   V i e w S e c u r i t y G r o u p ,   '  
 	 	 	 	 	 + ' 	 	 c o a l e s c e ( m a x ( c a s e   w h e n   E d i t S e c u r i t y G r o u p   <   0   t h e n   E d i t S e c u r i t y G r o u p   e l s e   n u l l   e n d ) , m a x ( E d i t S e c u r i t y G r o u p ) , - 4 0 )   E d i t S e c u r i t y G r o u p ,   '  
 	 	 	 	 	 + ' 	 	 N U L L   I n t e r n a l H a s h   '  
 	 	 	 	 	 - - + ' 	 	 H A S H B Y T E S ( ' ' s h a 1 ' ' , N ' ' " ' ' + C A S T ( r e p l a c e ( C l a s s + N ' ' ^ ^ ' ' + I n t e r n a l T y p e + N ' ' ^ ^ ' ' + I n t e r n a l I D , N ' ' " ' ' , N ' ' \ " ' ' )   A S   N V A R C H A R ( M A X ) ) + N ' ' " ' ' )   I n t e r n a l H a s h   '  
 	 	 	 	 	 + ' 	 F R O M   ( '  
 	 	 	 	 	 + ' 	 	 S E L E C T   '  
 	 	 	 	 	 + ' 	 	 	 ' ' ' + r e p l a c e ( C l a s s , ' ' ' ' , ' ' ) + ' ' '   C l a s s , '  
 	 	 	 	 	 + ' 	 	 	 ' ' ' + r e p l a c e ( s I n t e r n a l T y p e , ' ' ' ' , ' ' ) + ' ' '   I n t e r n a l T y p e , '  
 	 	 	 	 	 + ' 	 	 	 C A S T ( ' + s I n t e r n a l I D + '   A S   N V A R C H A R ( 3 0 0 ) )   I n t e r n a l I D , '  
 	 	 	 	 	 + ' 	 	 	 ' + I s N u l l ( V i e w S e c u r i t y G r o u p , ' N U L L ' ) + '   V i e w S e c u r i t y G r o u p , '  
 	 	 	 	 	 + ' 	 	 	 ' + I s N u l l ( E d i t S e c u r i t y G r o u p , ' N U L L ' ) + '   E d i t S e c u r i t y G r o u p '  
 	 	 	 	 	 + ' 	 	 F R O M   ' + M a p T a b l e  
 	 	 	 	 	 + ( C A S E   W H E N   @ I n t e r n a l I d I n   I S   N O T   N U L L   T H E N   ' W H E R E   ' + s I n t e r n a l I D + '   I N   ( ' + @ I n t e r n a l I d I n + ' ) '   E L S E   ' '   E N D )  
 	 	 	 	 	 + ' 	 )   t '  
 	 	 	 	 	 + ' 	 W H E R E   C l a s s   I S   N O T   N U L L   A N D   I n t e r n a l T y p e   I S   N O T   N U L L   A N D   I n t e r n a l I D   I S   N O T   N U L L   '  
 	 	 	 	 	 + ' 	 G R O U P   B Y   C l a s s ,   I n t e r n a l T y p e ,   I n t e r n a l I D   '  
 	 	 	 	 F R O M   [ O n t o l o g y . ] . D a t a M a p  
 	 	 	 	 W H E R E   D a t a M a p I D   =   @ D a t a M a p I D  
  
 	 	 	 - -   G e t   t h e   n o d e s  
 	 	 	 C R E A T E   T A B L E   # N o d e   (  
 	 	 	 	 C l a s s   n v a r c h a r ( 4 0 0 ) ,  
 	 	 	 	 I n t e r n a l T y p e   n v a r c h a r ( 3 0 0 ) ,  
 	 	 	 	 I n t e r n a l I D   n v a r c h a r ( 1 0 0 ) ,  
 	 	 	 	 V i e w S e c u r i t y G r o u p   b i g i n t ,  
 	 	 	 	 E d i t S e c u r i t y G r o u p   b i g i n t ,  
 	 	 	 	 I n t e r n a l H a s h   b i n a r y ( 2 0 )  
 	 	 	 )  
 	 	 	 I N S E R T   I N T O   # N o d e   ( C l a s s ,   I n t e r n a l T y p e ,   I n t e r n a l I D ,   V i e w S e c u r i t y G r o u p ,   E d i t S e c u r i t y G r o u p ,   I n t e r n a l H a s h )  
 	 	 	 	 E X E C   s p _ e x e c u t e s q l   @ s  
 	 	 	 S E L E C T   @ T o t a l N o d e s   =   @ @ R O W C O U N T  
  
 	 	 	 C R E A T E   N O N C L U S T E R E D   I N D E X   i d x _ C l a s s T y p e I D   o n   # N o d e ( C l a s s , I n t e r n a l T y p e , I n t e r n a l I D )  
  
 	 	 	 - -   U p d a t e   s e c u r i t y   g r o u p s   o f   d e l e t e d   n o d e s  
 	 	 	 I F   @ I n t e r n a l I d I n   I S   N U L L  
 	 	 	 B E G I N  
 	 	 	 	 U P D A T E   n  
 	 	 	 	 	 S E T 	 n . V i e w S e c u r i t y G r o u p   =   0 ,  
 	 	 	 	 	 	 n . E d i t S e c u r i t y G r o u p   =   - 5 0  
 	 	 	 	 	 F R O M   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   m    
 	 	 	 	 	 	 I N N E R   J O I N   [ O n t o l o g y . ] . D a t a M a p   o   O N   m . C l a s s   =   o . C l a s s   A N D   m . I n t e r n a l T y p e   =   o . s I n t e r n a l T y p e   a n d   o . D a t a M a p I D   =   @ D a t a M a p I D  
 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . ] . N o d e   n   O N   m . N o d e I D   =   n . N o d e I D  
 	 	 	 	 	 	 L E F T   O U T E R   J O I N   # N o d e   x   O N   m . C l a s s   =   x . C l a s s   A N D   m . I n t e r n a l T y p e   =   x . I n t e r n a l T y p e   a n d   m . I n t e r n a l I D   =   x . I n t e r n a l I D  
 	 	 	 	 	 W H E R E   x . C l a s s   I S   N U L L  
 	 	 	 E N D  
 	 	 	 S E L E C T   @ D e l e t e d N o d e s   =   @ @ R O W C O U N T  
  
 	 	 	 - -   U p d a t e   s e c u r i t y   g r o u p s   o f   e x i s t i n g   n o d e s   i f   n e e d e d  
 	 	 	 U P D A T E   n  
 	 	 	 	 S E T 	 n . V i e w S e c u r i t y G r o u p   =   I s N u l l ( x . V i e w S e c u r i t y G r o u p , n . V i e w S e c u r i t y G r o u p ) ,  
 	 	 	 	 	 n . E d i t S e c u r i t y G r o u p   =   I s N u l l ( x . E d i t S e c u r i t y G r o u p , n . E d i t S e c u r i t y G r o u p )  
 	 	 	 	 F R O M   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   m    
 	 	 	 	 	 I N N E R   J O I N   # N o d e   x   O N   m . C l a s s   =   x . C l a s s   A N D   m . I n t e r n a l T y p e   =   x . I n t e r n a l T y p e   a n d   m . I n t e r n a l I D   =   x . I n t e r n a l I D  
 	 	 	 	 	 I N N E R   J O I N   [ R D F . ] . N o d e   n   O N   m . N o d e I D   =   n . N o d e I D  
 	 	 	 	 	 	 A N D   ( n . V i e w S e c u r i t y G r o u p   < >   I s N u l l ( x . V i e w S e c u r i t y G r o u p , n . V i e w S e c u r i t y G r o u p )  
 	 	 	 	 	 	 	 	 O R   n . E d i t S e c u r i t y G r o u p   < >   I s N u l l ( x . E d i t S e c u r i t y G r o u p , n . E d i t S e c u r i t y G r o u p ) )  
 	 	 	 S E L E C T   @ U p d a t e d N o d e s   =   @ @ R O W C O U N T  
  
 	 	 	 - -   C r e a t e   n e w   n o d e s  
 	 	 	 I N S E R T   I N T O   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   ( C l a s s ,   I n t e r n a l T y p e ,   I n t e r n a l I D ,   V i e w S e c u r i t y G r o u p ,   E d i t S e c u r i t y G r o u p ,   S t a t u s ,   I n t e r n a l H a s h )  
 	 	 	 	 S E L E C T   C l a s s ,   I n t e r n a l T y p e ,   I n t e r n a l I D ,   I s N u l l ( V i e w S e c u r i t y G r o u p , - 1 ) ,   I s N u l l ( E d i t S e c u r i t y G r o u p , - 4 0 ) ,   0   S t a t u s ,  
 	 	 	 	 	 	 H A S H B Y T E S ( ' s h a 1 ' , N ' " ' + C A S T ( r e p l a c e ( C l a s s + N ' ^ ^ ' + I n t e r n a l T y p e + N ' ^ ^ ' + I n t e r n a l I D , N ' " ' , N ' \ " ' )   A S   N V A R C H A R ( 4 0 0 0 ) ) + N ' " ' )   I n t e r n a l H a s h  
 	 	 	 	 	 F R O M   # N o d e   x  
 	 	 	 	 	 W H E R E   N O T   E X I S T S   (  
 	 	 	 	 	 	 S E L E C T   *  
 	 	 	 	 	 	 F R O M   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   m  
 	 	 	 	 	 	 W H E R E   m . C l a s s   =   x . C l a s s   A N D   m . I n t e r n a l T y p e   =   x . I n t e r n a l T y p e   a n d   m . I n t e r n a l I D   =   x . I n t e r n a l I D  
 	 	 	 	 	 )  
 	 	 	 I N S E R T   I N T O   [ R D F . ] . N o d e   ( V a l u e H a s h ,   L a n g u a g e ,   D a t a T y p e ,   V a l u e ,   I n t e r n a l N o d e M a p I D ,   O b j e c t T y p e ,   V i e w S e c u r i t y G r o u p ,   E d i t S e c u r i t y G r o u p )  
 	 	 	 	 S E L E C T   I n t e r n a l H a s h ,   N U L L ,   N U L L ,   C l a s s + N ' ^ ^ ' + I n t e r n a l T y p e + N ' ^ ^ ' + I n t e r n a l I D ,   I n t e r n a l N o d e M a p I D ,   0 ,   V i e w S e c u r i t y G r o u p ,   E d i t S e c u r i t y G r o u p  
 	 	 	 	 	 F R O M   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p  
 	 	 	 	 	 W H E R E   S t a t u s   =   0  
 	 	 	 U P D A T E   m  
 	 	 	 	 S E T 	 m . N o d e I D   =   n . N o d e I D ,    
 	 	 	 	 	 m . V a l u e H a s h   =   H A S H B Y T E S ( ' s h a 1 ' , N ' " ' + @ b a s e U R I + C A S T ( n . N o d e I D   A S   N V A R C H A R ( 5 0 ) ) + N ' " ' )  
 	 	 	 	 F R O M   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   m ,   [ R D F . ] . N o d e   n  
 	 	 	 	 W H E R E   m . S t a t u s   =   0   A N D   m . I n t e r n a l H a s h   =   n . V a l u e H a s h  
 	 	 	 U P D A T E   n  
 	 	 	 	 S E T   n . V a l u e H a s h   =   m . V a l u e H a s h ,   n . V a l u e   =   @ b a s e U R I + C A S T ( n . N o d e I D   A S   N V A R C H A R ( 5 0 ) )  
 	 	 	 	 F R O M   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   m ,   [ R D F . ] . N o d e   n  
 	 	 	 	 W H E R E   m . S t a t u s   =   0   A N D   m . N o d e I D   =   n . N o d e I D  
 	 	 	 U P D A T E   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p  
 	 	 	 	 S E T   V i e w S e c u r i t y G r o u p   =   N U L L ,   E d i t S e c u r i t y G r o u p   =   N U L L ,   S t a t u s   =   3  
 	 	 	 	 W H E R E   S t a t u s   =   0  
 	 	 	 S E L E C T   @ N e w N o d e s   =   @ @ R O W C O U N T  
 	 	 	  
 	 	 	 S E L E C T   @ E x i s t i n g N o d e s   =   @ T o t a l N o d e s   -   @ N e w N o d e s  
  
 	 	 	 D R O P   T A B L E   # N o d e  
  
 	 	 E N D  
  
 	 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 	 - -   D a t a M a p T y p e   I N   ( 2 , 3 , 4 , 5 )   ( T r i p l e s )  
 	 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  
 	 	 I F   @ D a t a M a p T y p e   I N   ( 2 , 3 , 4 , 5 )  
 	 	 B E G I N  
 	 	 	 C R E A T E   T A B L E   # T r i p l e   (  
 	 	 	 	 S u b j e c t   b i g i n t ,  
 	 	 	 	 P r e d i c a t e   b i g i n t ,  
 	 	 	 	 O b j e c t   b i g i n t ,  
 	 	 	 	 T r i p l e I D   b i g i n t ,  
 	 	 	 	 L a n g u a g e   n v a r c h a r ( 2 5 5 ) ,  
 	 	 	 	 D a t a T y p e   n v a r c h a r ( 2 5 5 ) ,  
 	 	 	 	 V a l u e   n v a r c h a r ( m a x ) ,  
 	 	 	 	 V a l u e H a s h   b i n a r y ( 2 0 ) ,  
 	 	 	 	 W e i g h t   f l o a t ,  
 	 	 	 	 S o r t O r d e r   i n t ,  
 	 	 	 	 O b j e c t T y p e   b i t ,  
 	 	 	 	 V i e w S e c u r i t y G r o u p   b i g i n t ,  
 	 	 	 	 E d i t S e c u r i t y G r o u p   b i g i n t ,  
 	 	 	 	 R e i t i f i c a t i o n T r i p l e I D   b i g i n t ,  
 	 	 	 	 R e i t i f i c a t i o n   b i g i n t ,  
 	 	 	 	 T r i p l e H a s h   b i n a r y ( 2 0 ) ,  
 	 	 	 	 G r a p h   b i g i n t ,  
 	 	 	 	 S t a t u s   t i n y i n t  
 	 	 	 )  
 	 	 	 C R E A T E   N O N C L U S T E R E D   I N D E X   i d x _ s t a t u s   o n   # T r i p l e ( S t a t u s )  
  
 	 	 	 / *  
 	 	 	 S t a t u s e s :  
 	 	 	 0   -   U p d a t e   t r i p l e  
 	 	 	 1   -   D e l e t e   t r i p l e  
 	 	 	 2   -   N e w   t r i p l e   f r o m   e n t i t y  
 	 	 	 3   -   N e w   t r i p l e   f r o m   v a l u e  
 	 	 	 4   -   N e w   t r i p l e   f r o m   r e i t i f i c a t i o n   a n d   e n t i t y  
 	 	 	 5   -   N e w   t r i p l e   f r o m   r e i t i f i c a t i o n   a n d   v a l u e  
 	 	 	 * / 	 	  
  
 	 	 	 D E C L A R E   @ O b j e c t T y p e   B I T  
 	 	 	 D E C L A R E   @ P r o p e r t y N o d e   B I G I N T  
 	 	 	 S E L E C T   @ O b j e c t T y p e   =   o O b j e c t T y p e ,   @ P r o p e r t y N o d e   =   _ P r o p e r t y N o d e  
 	 	 	 	 F R O M   [ O n t o l o g y . ] . D a t a M a p  
 	 	 	 	 W H E R E   D a t a M a p I D   =   @ D a t a M a p I D  
 	 	  
 	 	 	 S E L E C T   @ s   =   '  
 	 	 	 	 	 	 S E L E C T    
 	 	 	 	 	 	 	 ' ' ' + r e p l a c e ( C l a s s , ' ' ' ' , ' ' ) + ' ' '   s C l a s s ,  
 	 	 	 	 	 	 	 ' ' ' + r e p l a c e ( s I n t e r n a l T y p e , ' ' ' ' , ' ' ) + ' ' '   s I n t e r n a l T y p e ,  
 	 	 	 	 	 	 	 C A S T ( ' + s I n t e r n a l I D + '   A S   N V A R C H A R ( 3 0 0 ) )   s I n t e r n a l I D ,  
 	 	 	 	 	 	 	 ' + I s N u l l ( c a s t ( _ N e t w o r k P r o p e r t y N o d e   a s   n v a r c h a r ( 5 0 ) ) , ' N U L L ' ) + '   N e t w o r k P r e d i c a t e ,  
 	 	 	 	 	 	 	 ' + c a s t ( _ P r o p e r t y N o d e   a s   n v a r c h a r ( 5 0 ) ) + '   p r e d i c a t e ,  
 	 	 	 	 	 	 	 ' + I s N u l l ( ' ' ' ' + r e p l a c e ( c C l a s s , ' ' ' ' , ' ' ) + ' ' ' ' , ' N U L L ' ) + '   c C l a s s ,  
 	 	 	 	 	 	 	 ' + I s N u l l ( ' ' ' ' + r e p l a c e ( c I n t e r n a l T y p e , ' ' ' ' , ' ' ) + ' ' ' ' , ' N U L L ' ) + '   c I n t e r n a l T y p e ,  
 	 	 	 	 	 	 	 C A S T ( ' + I s N u l l ( c I n t e r n a l I D , ' N U L L ' ) + '   A S   N V A R C H A R ( 3 0 0 ) )   c I n t e r n a l I D ,  
 	 	 	 	 	 	 	 ' + I s N u l l ( ' ' ' ' + r e p l a c e ( o C l a s s , ' ' ' ' , ' ' ) + ' ' ' ' , ' N U L L ' ) + '   o C l a s s ,  
 	 	 	 	 	 	 	 ' + I s N u l l ( ' ' ' ' + r e p l a c e ( o I n t e r n a l T y p e , ' ' ' ' , ' ' ) + ' ' ' ' , ' N U L L ' ) + '   o I n t e r n a l T y p e ,  
 	 	 	 	 	 	 	 C A S T ( ' + I s N u l l ( o I n t e r n a l I D , ' N U L L ' ) + '   A S   N V A R C H A R ( 3 0 0 ) )   o I n t e r n a l I D ,  
 	 	 	 	 	 	 	 C A S T ( ' + I s N u l l ( ' ' ' ' + r e p l a c e ( o L a n g u a g e , ' ' ' ' , ' ' ) + ' ' ' ' , ' N U L L ' ) + '   A S   N V A R C H A R ( 2 5 5 ) )   L a n g u a g e ,  
 	 	 	 	 	 	 	 C A S T ( ' + I s N u l l ( ' ' ' ' + r e p l a c e ( o D a t a T y p e , ' ' ' ' , ' ' ) + ' ' ' ' , ' N U L L ' ) + '   A S   N V A R C H A R ( 2 5 5 ) )   D a t a T y p e ,  
 	 	 	 	 	 	 	 C A S T ( ' + I s N u l l ( o V a l u e , ' N U L L ' ) + '   A S   N V A R C H A R ( M A X ) )   V a l u e ,  
 	 	 	 	 	 	 	 ' + I s N u l l ( V i e w S e c u r i t y G r o u p , ' N U L L ' ) + '   V i e w S e c u r i t y G r o u p ,  
 	 	 	 	 	 	 	 ' + I s N u l l ( E d i t S e c u r i t y G r o u p , ' N U L L ' ) + '   E d i t S e c u r i t y G r o u p ,  
 	 	 	 	 	 	 	 I s N u l l ( ' + I s N u l l ( W e i g h t , 1 ) + ' , 1 )   W e i g h t ,  
 	 	 	 	 	 	 	 ' + I s N u l l ( c a s t ( G r a p h   a s   v a r c h a r ( 5 0 ) ) , ' N U L L ' ) + '   G r a p h ,  
 	 	 	 	 	 	 	 ' + ( C A S E   W H E N   @ D a t a M a p T y p e   I N   ( 3 , 5 )   T H E N   ' H A S H B Y T E S ( ' ' s h a 1 ' ' , C O N V E R T ( n v a r c h a r ( 4 0 0 0 ) , N ' ' " ' ' + r e p l a c e ( i s n u l l ( C A S T ( ' + I s N u l l ( o V a l u e , ' N U L L ' ) + '   A S   N V A R C H A R ( M A X ) ) , N ' ' ' ' ) , N ' ' " ' ' , N ' ' \ " ' ' ) + ' ' " ' ' + I s N u l l ( N ' ' " @ ' ' + r e p l a c e ( C A S T ( ' + I s N u l l ( ' ' ' ' + r e p l a c e ( o L a n g u a g e , ' ' ' ' , ' ' ) + ' ' ' ' , ' N U L L ' ) + '   A S   N V A R C H A R ( 2 5 5 ) ) , N ' ' @ ' ' , N ' ' ' ' ) , N ' ' ' ' ) + I s N u l l ( N ' ' " ^ ^ ' ' + r e p l a c e ( C A S T ( ' + I s N u l l ( ' ' ' ' + r e p l a c e ( o D a t a T y p e , ' ' ' ' , ' ' ) + ' ' ' ' , ' N U L L ' ) + '   A S   N V A R C H A R ( 2 5 5 ) ) , N ' ' ^ ' ' , N ' ' ' ' ) , N ' ' ' ' ) ) )   V a l u e H a s h ,   '   E L S E   ' '   E N D ) + '  
 	 	 	 	 	 	 	 R O W _ N U M B E R ( )   O V E R   ( P A R T I T I O N   B Y   ' + s I n t e r n a l I D + '  
 	 	 	 	 	 	 	 	 O R D E R   B Y   ' + I s N u l l ( O r d e r B y + ' , ' , ' ' ) + c o a l e s c e ( o I n t e r n a l I D + ' , ' , ' I s N u l l ( ' + o V a l u e + ' , N U L L ) , ' , ' ' ) + s I n t e r n a l I D + I s N u l l ( ' , ' + c I n t e r n a l I D , ' ' ) + ' )   S o r t O r d e r  
 	 	 	 	 	 	 F R O M   ' + M a p T a b l e  
 	 	 	 	 	 	 + ( C A S E 	 W H E N   @ I n t e r n a l I d I n   I S   N O T   N U L L   A N D   @ D a t a M a p T y p e   I N   ( 3 , 5 )    
 	 	 	 	 	 	 	 	 	 T H E N   '   W H E R E   ( ' + s I n t e r n a l I D + '   I N   ( ' + @ I n t e r n a l I d I n + ' ) )   A N D   ( I s N u l l ( C A S T ( ' + I s N u l l ( o V a l u e , ' N U L L ' ) + '   A S   N V A R C H A R ( M A X ) ) , ' ' ' ' )   < >   ' ' ' ' )   '    
 	 	 	 	 	 	 	 	 W H E N   @ I n t e r n a l I d I n   I S   N O T   N U L L  
 	 	 	 	 	 	 	 	 	 T H E N   '   W H E R E   ' + s I n t e r n a l I D + '   I N   ( ' + @ I n t e r n a l I d I n + ' ) '  
 	 	 	 	 	 	 	 	 W H E N   @ D a t a M a p T y p e   I N   ( 3 , 5 )  
 	 	 	 	 	 	 	 	 	 T H E N   '   W H E R E   I s N u l l ( C A S T ( ' + I s N u l l ( o V a l u e , ' N U L L ' ) + '   A S   N V A R C H A R ( M A X ) ) , ' ' ' ' )   < >   ' ' ' '   '  
 	 	 	 	 	 	 	 	 E L S E   ' '    
 	 	 	 	 	 	 	 E N D )  
 	 	 	 	 F R O M   [ O n t o l o g y . ] . D a t a M a p  
 	 	 	 	 W H E R E   D a t a M a p I D   =   @ D a t a M a p I D  
  
  
 	 	 	 I F   @ D a t a M a p T y p e   =   2 0 0  
 	 	 	 	 S E L E C T   @ s   =   '  
 	 	 	 	 	 C R E A T E   T A B L E   # T e m p   (  
 	 	 	 	 	 	 	 	 	 	 	 s C l a s s   N V A R C H A R ( 4 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 s I n t e r n a l T y p e   N V A R C H A R ( 3 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 s I n t e r n a l I D   N V A R C H A R ( 1 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 N e t w o r k P r e d i c a t e   B I G I N T ,  
 	 	 	 	 	 	 	 	 	 	 	 p r e d i c a t e   B I G I N T ,  
 	 	 	 	 	 	 	 	 	 	 	 c C l a s s   N V A R C H A R ( 4 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 c I n t e r n a l T y p e   N V A R C H A R ( 3 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 c I n t e r n a l I D   N V A R C H A R ( 1 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 o C l a s s   N V A R C H A R ( 4 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 o I n t e r n a l T y p e   N V A R C H A R ( 3 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 o I n t e r n a l I D   N V A R C H A R ( 1 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 L a n g u a g e   N V A R C H A R ( 2 5 5 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 D a t a T y p e   N V A R C H A R ( 2 5 5 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 V a l u e   N V A R C H A R ( M A X ) ,  
 	 	 	 	 	 	 	 	 	 	 	 V i e w S e c u r i t y G r o u p   B I G I N T ,  
 	 	 	 	 	 	 	 	 	 	 	 E d i t S e c u r i t y G r o u p   B I G I N T ,  
 	 	 	 	 	 	 	 	 	 	 	 W e i g h t   F L O A T ,  
 	 	 	 	 	 	 	 	 	 	 	 G r a p h   B I G I N T ,    
 	 	 	 	 	 	 	 	 	 	 	 S o r t O r d e r   I N T  
 	 	 	 	 	 	 	 	 	 	 )  
 	 	 	 	 	 I N S E R T   I N T O   # T e m p  
 	 	 	 	 	 	 '   +   @ s   +   '   ;  
 	 	 	 	 	 ' + ( C A S E   W H E N   @ I n t e r n a l I d I n   I S   N O T   N U L L   T H E N   '  
 	 	 	 	 	 C R E A T E   T A B L E   # T e m p 2   ( N o d e I D   B I G I N T   P r i m a r y   K e y )  
 	 	 	 	 	 I N S E R T   I N T O   # T e m p 2  
 	 	 	 	 	 	 S E L E C T   N o d e I D  
 	 	 	 	 	 	 	 F R O M   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   s  
 	 	 	 	 	 	 	 W H E R E   s . C l a s s = ' ' ' + C l a s s + ' ' '   A N D   s . I n t e r n a l T y p e = ' ' ' + s I n t e r n a l T y p e + ' ' '   A N D   s . N o d e I D   I S   N O T   N U L L  
 	 	 	 	 	 	 	 	 A N D   s . I n t e r n a l I D   I N   ( ' + @ I n t e r n a l I d I n + ' )  
 	 	 	 	 	 '   E L S E   ' '   E N D ) + '  
 	 	 	 	 	 ; W I T H   a   A S   (  
 	 	 	 	 	 	 S E L E C T   s . N o d e I D   S u b j e c t ,   x . P r e d i c a t e ,   o . N o d e I D   O b j e c t ,   x . W e i g h t ,   x . S o r t O r d e r ,    
 	 	 	 	 	 	 	 	 I s N u l l ( p . V i e w S e c u r i t y G r o u p , x . V i e w S e c u r i t y G r o u p )   V i e w S e c u r i t y G r o u p ,   x . G r a p h  
 	 	 	 	 	 	 F R O M   # T e m p   x  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   s  
 	 	 	 	 	 	 	 	 O N   s . C l a s s = x . s C l a s s   A N D   s . I n t e r n a l T y p e = x . s I n t e r n a l T y p e   A N D   s . I n t e r n a l I D = x . s I n t e r n a l I D   A N D   s . N o d e I D   I S   N O T   N U L L  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   o  
 	 	 	 	 	 	 	 	 O N   o . C l a s s = x . o C l a s s   A N D   o . I n t e r n a l T y p e = x . o I n t e r n a l T y p e   A N D   o . I n t e r n a l I D = x . o I n t e r n a l I D   A N D   o . N o d e I D   I S   N O T   N U L L  
 	 	 	 	 	 	 	 L E F T   O U T E R   J O I N   [ R D F . S e c u r i t y ] . N o d e P r o p e r t y   p  
 	 	 	 	 	 	 	 	 O N   p . N o d e I D   =   s . N o d e I D   A N D   p . P r o p e r t y   =   ' + C A S T ( @ P r o p e r t y N o d e   a s   v a r c h a r ( 5 0 ) ) + '  
 	 	 	 	 	 ) ,   b   A S   (  
 	 	 	 	 	 	 S E L E C T   t . *  
 	 	 	 	 	 	 F R O M   ' + ( C A S E   W H E N   @ I n t e r n a l I d I n   I S   N O T   N U L L   T H E N   ' # T e m p 2 '   E L S E   ' [ R D F . S t a g e ] . I n t e r n a l N o d e M a p '   E N D ) + '   s  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   o  
 	 	 	 	 	 	 	 	 O N   o . C l a s s = ' ' ' + o C l a s s + ' ' '   A N D   o . I n t e r n a l T y p e = ' ' ' + o I n t e r n a l T y p e + ' ' '   A N D   o . N o d e I D   I S   N O T   N U L L  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . ] . T r i p l e   t  
 	 	 	 	 	 	 	 	 O N   t . S u b j e c t   =   s . N o d e I D   A N D   t . P r e d i c a t e   =   ' + c a s t ( _ P r o p e r t y N o d e   a s   v a r c h a r ( 5 0 ) ) + '   A N D   t . O b j e c t   =   o . N o d e I D  
 	 	 	 	 	 	 ' + ( C A S E   W H E N   @ I n t e r n a l I d I n   I S   N O T   N U L L   T H E N   ' '   E L S E   ' W H E R E   s . C l a s s = ' ' ' + C l a s s + ' ' '   A N D   s . I n t e r n a l T y p e = ' ' ' + s I n t e r n a l T y p e + ' ' '   A N D   s . N o d e I D   I S   N O T   N U L L '   E N D ) + '  
 	 	 	 	 	 )  
 	 	 	 	 	 S E L E C T   a . S u b j e c t ,   a . P r e d i c a t e ,   a . O b j e c t ,   b . T r i p l e I D ,    
 	 	 	 	 	 	 	 n u l l   L a n g u a g e ,   n u l l   D a t a T y p e ,   n u l l   V a l u e ,   n u l l   V a l u e H a s h ,  
 	 	 	 	 	 	 	 a . W e i g h t ,   a . S o r t O r d e r ,   0   O b j e c t T y p e ,   a . V i e w S e c u r i t y G r o u p ,   n u l l   E d i t S e c u r i t y G r o u p ,  
 	 	 	 	 	 	 	 n u l l   R e i t i f i c a t i o n T r i p l e I D ,   b . R e i t i f i c a t i o n ,   b . T r i p l e H a s h ,   a . G r a p h ,  
 	 	 	 	 	 	 	 ( C A S E 	 W H E N   b . T r i p l e I D   I S   N U L L   T H E N   2    
 	 	 	 	 	 	 	 	 	 W H E N   a . S u b j e c t   I S   N U L L   T H E N   1    
 	 	 	 	 	 	 	 	 	 E L S E   0   E N D )   S t a t u s  
 	 	 	 	 	 	 F R O M   a   F U L L   O U T E R   J O I N   b  
 	 	 	 	 	 	 	 	 O N   a . S u b j e c t   =   b . S u b j e c t   A N D   a . O b j e c t   =   b . O b j e c t  
 	 	 	 	 	 	 W H E R E 	 a . S u b j e c t   I S   N U L L  
 	 	 	 	 	 	 	 	 O R   b . T r i p l e I D   I S   N U L L  
 	 	 	 	 	 	 	 	 O R   a . W e i g h t   < >   b . W e i g h t  
 	 	 	 	 	 	 	 	 O R   a . S o r t O r d e r   < >   b . S o r t O r d e r  
 	 	 	 	 	 	 	 	 O R   a . V i e w S e c u r i t y G r o u p   < >   b . V i e w S e c u r i t y G r o u p  
 	 	 	 	 	 U N I O N   A L L  
 	 	 	 	 	 S E L E C T   C O U N T ( * ) , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , 1 0 0   F R O M   # T e m p  
 	 	 	 	 	 ' + ( C A S E   W H E N   @ I n t e r n a l I d I n   I S   N O T   N U L L   T H E N   ' O P T I O N   ( F O R C E   O R D E R ) '   E L S E   ' '   E N D ) 	    
 	 	 	 	 F R O M   [ O n t o l o g y . ] . D a t a M a p  
 	 	 	 	 W H E R E   D a t a M a p I D   =   @ D a t a M a p I D  
  
  
  
 	    
 	 	 	 I F   @ D a t a M a p T y p e   =   2  
 	 	 	 	 S E L E C T   @ s   =   '  
 	 	 	 	 	 C R E A T E   T A B L E   # T e m p   (  
 	 	 	 	 	 	 	 	 	 	 	 s C l a s s   N V A R C H A R ( 4 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 s I n t e r n a l T y p e   N V A R C H A R ( 3 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 s I n t e r n a l I D   N V A R C H A R ( 1 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 N e t w o r k P r e d i c a t e   B I G I N T ,  
 	 	 	 	 	 	 	 	 	 	 	 p r e d i c a t e   B I G I N T ,  
 	 	 	 	 	 	 	 	 	 	 	 c C l a s s   N V A R C H A R ( 4 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 c I n t e r n a l T y p e   N V A R C H A R ( 3 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 c I n t e r n a l I D   N V A R C H A R ( 1 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 o C l a s s   N V A R C H A R ( 4 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 o I n t e r n a l T y p e   N V A R C H A R ( 3 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 o I n t e r n a l I D   N V A R C H A R ( 1 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 L a n g u a g e   N V A R C H A R ( 2 5 5 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 D a t a T y p e   N V A R C H A R ( 2 5 5 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 V a l u e   N V A R C H A R ( M A X ) ,  
 	 	 	 	 	 	 	 	 	 	 	 V i e w S e c u r i t y G r o u p   B I G I N T ,  
 	 	 	 	 	 	 	 	 	 	 	 E d i t S e c u r i t y G r o u p   B I G I N T ,  
 	 	 	 	 	 	 	 	 	 	 	 W e i g h t   F L O A T ,  
 	 	 	 	 	 	 	 	 	 	 	 G r a p h   B I G I N T ,    
 	 	 	 	 	 	 	 	 	 	 	 S o r t O r d e r   I N T  
 	 	 	 	 	 	 	 	 	 	 )  
 	 	 	 	 	 I N S E R T   I N T O   # T e m p  
 	 	 	 	 	 	 '   +   @ s   +   '   ;  
 	 	 	 	 	 ; W I T H   a   A S   (  
 	 	 	 	 	 	 S E L E C T   s . N o d e I D   S u b j e c t ,   x . P r e d i c a t e ,   o . N o d e I D   O b j e c t ,   x . W e i g h t ,   x . S o r t O r d e r ,    
 	 	 	 	 	 	 	 	 I s N u l l ( p . V i e w S e c u r i t y G r o u p , x . V i e w S e c u r i t y G r o u p )   V i e w S e c u r i t y G r o u p ,   x . G r a p h  
 	 	 	 	 	 	 F R O M   # T e m p   x  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   s  
 	 	 	 	 	 	 	 	 O N   s . C l a s s = x . s C l a s s   A N D   s . I n t e r n a l T y p e = x . s I n t e r n a l T y p e   A N D   s . I n t e r n a l I D = x . s I n t e r n a l I D   A N D   s . N o d e I D   I S   N O T   N U L L  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   o  
 	 	 	 	 	 	 	 	 O N   o . C l a s s = x . o C l a s s   A N D   o . I n t e r n a l T y p e = x . o I n t e r n a l T y p e   A N D   o . I n t e r n a l I D = x . o I n t e r n a l I D   A N D   o . N o d e I D   I S   N O T   N U L L  
 	 	 	 	 	 	 	 L E F T   O U T E R   J O I N   [ R D F . S e c u r i t y ] . N o d e P r o p e r t y   p  
 	 	 	 	 	 	 	 	 O N   p . N o d e I D   =   s . N o d e I D   A N D   p . P r o p e r t y   =   ' + C A S T ( @ P r o p e r t y N o d e   a s   v a r c h a r ( 5 0 ) ) + '  
 	 	 	 	 	 ) ,   b   A S   (  
 	 	 	 	 	 	 S E L E C T   t . *  
 	 	 	 	 	 	 F R O M   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   s  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   o  
 	 	 	 	 	 	 	 	 O N   o . C l a s s = ' ' ' + o C l a s s + ' ' '   A N D   o . I n t e r n a l T y p e = ' ' ' + o I n t e r n a l T y p e + ' ' '   A N D   o . N o d e I D   I S   N O T   N U L L  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . ] . T r i p l e   t  
 	 	 	 	 	 	 	 	 O N   t . S u b j e c t   =   s . N o d e I D   A N D   t . P r e d i c a t e   =   ' + c a s t ( _ P r o p e r t y N o d e   a s   v a r c h a r ( 5 0 ) ) + '   A N D   t . O b j e c t   =   o . N o d e I D  
 	 	 	 	 	 	 W H E R E   s . C l a s s = ' ' ' + C l a s s + ' ' '   A N D   s . I n t e r n a l T y p e = ' ' ' + s I n t e r n a l T y p e + ' ' '   A N D   s . N o d e I D   I S   N O T   N U L L  
 	 	 	 	 	 	 	 ' + ( C A S E   W H E N   @ I n t e r n a l I d I n   I S   N O T   N U L L   T H E N   ' A N D   s . I n t e r n a l I D   I N   ( ' + @ I n t e r n a l I d I n + ' ) '   E L S E   ' '   E N D ) + '  
 	 	 	 	 	 )  
 	 	 	 	 	 S E L E C T   a . S u b j e c t ,   a . P r e d i c a t e ,   a . O b j e c t ,   b . T r i p l e I D ,    
 	 	 	 	 	 	 	 n u l l   L a n g u a g e ,   n u l l   D a t a T y p e ,   n u l l   V a l u e ,   n u l l   V a l u e H a s h ,  
 	 	 	 	 	 	 	 a . W e i g h t ,   a . S o r t O r d e r ,   0   O b j e c t T y p e ,   a . V i e w S e c u r i t y G r o u p ,   n u l l   E d i t S e c u r i t y G r o u p ,  
 	 	 	 	 	 	 	 n u l l   R e i t i f i c a t i o n T r i p l e I D ,   b . R e i t i f i c a t i o n ,   b . T r i p l e H a s h ,   a . G r a p h ,  
 	 	 	 	 	 	 	 ( C A S E 	 W H E N   b . T r i p l e I D   I S   N U L L   T H E N   2    
 	 	 	 	 	 	 	 	 	 W H E N   a . S u b j e c t   I S   N U L L   T H E N   1    
 	 	 	 	 	 	 	 	 	 E L S E   0   E N D )   S t a t u s  
 	 	 	 	 	 	 F R O M   a   F U L L   O U T E R   J O I N   b  
 	 	 	 	 	 	 	 	 O N   a . S u b j e c t   =   b . S u b j e c t   A N D   a . O b j e c t   =   b . O b j e c t  
 	 	 	 	 	 	 W H E R E 	 a . S u b j e c t   I S   N U L L  
 	 	 	 	 	 	 	 	 O R   b . T r i p l e I D   I S   N U L L  
 	 	 	 	 	 	 	 	 O R   a . W e i g h t   < >   b . W e i g h t  
 	 	 	 	 	 	 	 	 O R   a . S o r t O r d e r   < >   b . S o r t O r d e r  
 	 	 	 	 	 	 	 	 O R   a . V i e w S e c u r i t y G r o u p   < >   b . V i e w S e c u r i t y G r o u p  
 	 	 	 	 	 U N I O N   A L L  
 	 	 	 	 	 S E L E C T   C O U N T ( * ) , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , 1 0 0   F R O M   # T e m p  
 	 	 	 	 	 ' 	    
 	 	 	 	 F R O M   [ O n t o l o g y . ] . D a t a M a p  
 	 	 	 	 W H E R E   D a t a M a p I D   =   @ D a t a M a p I D  
  
 / *  
 	 	 	 	 	 	 S E L E C T   t . *  
 	 	 	 	 	 	 F R O M   [ O n t o l o g y . ] . D a t a M a p   m  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   s  
 	 	 	 	 	 	 	 	 O N   s . C l a s s = m . C l a s s   A N D   s . I n t e r n a l T y p e = m . s I n t e r n a l T y p e   A N D   s . N o d e I D   I S   N O T   N U L L  
 	 	 	 	 	 	 	 	 	 ' + ( C A S E   W H E N   @ I n t e r n a l I d I n   I S   N O T   N U L L   T H E N   ' A N D   s . I n t e r n a l I D   I N   ( ' + @ I n t e r n a l I d I n + ' ) '   E L S E   ' '   E N D ) + '  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   o  
 	 	 	 	 	 	 	 	 O N   o . C l a s s = m . o C l a s s   A N D   o . I n t e r n a l T y p e = m . o I n t e r n a l T y p e   A N D   o . N o d e I D   I S   N O T   N U L L  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . ] . T r i p l e   t  
 	 	 	 	 	 	 	 	 O N   t . S u b j e c t   =   s . N o d e I D   A N D   t . P r e d i c a t e   =   m . _ P r o p e r t y N o d e   A N D   t . O b j e c t   =   o . N o d e I D  
 	 	 	 	 	 	 W H E R E   m . D a t a M a p I D   =   ' + C A S T ( @ D a t a M a p I D   a s   v a r c h a r ( 5 0 ) ) + '  
 * /  
 	      
 	 	 	 I F   @ D a t a M a p T y p e   =   3  
 	 	 	 	 S E L E C T   @ s   =   '  
 	 	 	 	 	 C R E A T E   T A B L E   # T e m p   (  
 	 	 	 	 	 	 	 	 	 	 	 s C l a s s   N V A R C H A R ( 4 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 s I n t e r n a l T y p e   N V A R C H A R ( 3 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 s I n t e r n a l I D   N V A R C H A R ( 1 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 N e t w o r k P r e d i c a t e   B I G I N T ,  
 	 	 	 	 	 	 	 	 	 	 	 p r e d i c a t e   B I G I N T ,  
 	 	 	 	 	 	 	 	 	 	 	 c C l a s s   N V A R C H A R ( 4 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 c I n t e r n a l T y p e   N V A R C H A R ( 3 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 c I n t e r n a l I D   N V A R C H A R ( 1 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 o C l a s s   N V A R C H A R ( 4 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 o I n t e r n a l T y p e   N V A R C H A R ( 3 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 o I n t e r n a l I D   N V A R C H A R ( 1 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 L a n g u a g e   N V A R C H A R ( 2 5 5 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 D a t a T y p e   N V A R C H A R ( 2 5 5 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 V a l u e   N V A R C H A R ( M A X ) ,  
 	 	 	 	 	 	 	 	 	 	 	 V i e w S e c u r i t y G r o u p   B I G I N T ,  
 	 	 	 	 	 	 	 	 	 	 	 E d i t S e c u r i t y G r o u p   B I G I N T ,  
 	 	 	 	 	 	 	 	 	 	 	 W e i g h t   F L O A T ,  
 	 	 	 	 	 	 	 	 	 	 	 G r a p h   B I G I N T ,    
 	 	 	 	 	 	 	 	 	 	 	 V a l u e H a s h   B I N A R Y ( 2 0 ) ,    
 	 	 	 	 	 	 	 	 	 	 	 S o r t O r d e r   I N T  
 	 	 	 	 	 	 	 	 	 	 )  
 	 	 	 	 	 I N S E R T   I N T O   # T e m p    
 	 	 	 	 	 	 '   +   @ s   +   ' ;  
 	 	 	 	 	 ; W I T H   a   A S   (  
 	 	 	 	 	 	 S E L E C T   s . N o d e I D   S u b j e c t ,   x . P r e d i c a t e ,   o . N o d e I D   O b j e c t ,   x . W e i g h t ,   x . S o r t O r d e r ,    
 	 	 	 	 	 	 	 	 I s N u l l ( p . V i e w S e c u r i t y G r o u p , x . V i e w S e c u r i t y G r o u p )   V i e w S e c u r i t y G r o u p ,   x . G r a p h ,  
 	 	 	 	 	 	 	 	 x . V a l u e ,   x . L a n g u a g e ,   x . D a t a T y p e ,   x . V a l u e H a s h ,   x . E d i t S e c u r i t y G r o u p  
 	 	 	 	 	 	 F R O M   # T e m p   x  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   s  
 	 	 	 	 	 	 	 	 O N   s . C l a s s = x . s C l a s s   A N D   s . I n t e r n a l T y p e = x . s I n t e r n a l T y p e   A N D   s . I n t e r n a l I D = x . s I n t e r n a l I D   A N D   s . N o d e I D   I S   N O T   N U L L  
 	 	 	 	 	 	 	 L E F T   O U T E R   J O I N   [ R D F . ] . N o d e   o  
 	 	 	 	 	 	 	 	 O N   o . V a l u e H a s h = x . V a l u e H a s h  
 	 	 	 	 	 	 	 L E F T   O U T E R   J O I N   [ R D F . S e c u r i t y ] . N o d e P r o p e r t y   p  
 	 	 	 	 	 	 	 	 O N   p . N o d e I D   =   s . N o d e I D   A N D   p . P r o p e r t y   =   ' + C A S T ( @ P r o p e r t y N o d e   a s   v a r c h a r ( 5 0 ) ) + '  
 	 	 	 	 	 ) ,   b   A S   (  
 	 	 	 	 	 	 S E L E C T   t . *  
 	 	 	 	 	 	 F R O M   [ O n t o l o g y . ] . D a t a M a p   m  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   s  
 	 	 	 	 	 	 	 	 O N   s . C l a s s = ' ' ' + C l a s s + ' ' '   A N D   s . I n t e r n a l T y p e = ' ' ' + s I n t e r n a l T y p e + ' ' '   A N D   s . N o d e I D   I S   N O T   N U L L  
 	 	 	 	 	 	 	 	 	 ' + ( C A S E   W H E N   @ I n t e r n a l I d I n   I S   N O T   N U L L   T H E N   ' A N D   s . I n t e r n a l I D   I N   ( ' + @ I n t e r n a l I d I n + ' ) '   E L S E   ' '   E N D ) + '  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . ] . T r i p l e   t  
 	 	 	 	 	 	 	 	 O N   t . S u b j e c t   =   s . N o d e I D   A N D   t . P r e d i c a t e   =   m . _ P r o p e r t y N o d e   A N D   t . O b j e c t T y p e   =   ' + C A S T ( @ O b j e c t T y p e   a s   v a r c h a r ( 5 0 ) ) + '  
 	 	 	 	 	 	 W H E R E   m . D a t a M a p I D   =   ' + C A S T ( @ D a t a M a p I D   a s   v a r c h a r ( 5 0 ) ) + '  
 	 	 	 	 	 )  
 	 	 	 	 	 S E L E C T   a . S u b j e c t ,   a . P r e d i c a t e ,   a . O b j e c t ,   b . T r i p l e I D ,    
 	 	 	 	 	 	 	 a . L a n g u a g e ,   a . D a t a T y p e ,   a . V a l u e ,   a . V a l u e H a s h ,  
 	 	 	 	 	 	 	 a . W e i g h t ,   a . S o r t O r d e r ,   ' + C A S T ( @ O b j e c t T y p e   a s   v a r c h a r ( 5 0 ) ) + '   O b j e c t T y p e ,   a . V i e w S e c u r i t y G r o u p ,   a . E d i t S e c u r i t y G r o u p ,  
 	 	 	 	 	 	 	 n u l l   R e i t i f i c a t i o n T r i p l e I D ,   b . R e i t i f i c a t i o n ,   b . T r i p l e H a s h ,   a . G r a p h ,  
 	 	 	 	 	 	 	 ( C A S E 	 W H E N   b . T r i p l e I D   I S   N U L L   A N D   a . O b j e c t   I S   N U L L   T H E N   3    
 	 	 	 	 	 	 	 	 	 W H E N   b . T r i p l e I D   I S   N U L L   T H E N   2    
 	 	 	 	 	 	 	 	 	 W H E N   a . S u b j e c t   I S   N U L L   T H E N   1  
 	 	 	 	 	 	 	 	 	 E L S E   0   E N D )   S t a t u s  
 	 	 	 	 	 	 F R O M   a   F U L L   O U T E R   J O I N   b  
 	 	 	 	 	 	 	 	 O N   a . S u b j e c t   =   b . S u b j e c t   A N D   a . O b j e c t   =   b . O b j e c t   A N D   a . O b j e c t   I S   N O T   N U L L  
 	 	 	 	 	 	 W H E R E 	 a . S u b j e c t   I S   N U L L  
 	 	 	 	 	 	 	 	 O R   b . T r i p l e I D   I S   N U L L  
 	 	 	 	 	 	 	 	 O R   a . W e i g h t   < >   b . W e i g h t  
 	 	 	 	 	 	 	 	 O R   a . S o r t O r d e r   < >   b . S o r t O r d e r  
 	 	 	 	 	 	 	 	 O R   a . V i e w S e c u r i t y G r o u p   < >   b . V i e w S e c u r i t y G r o u p  
 	 	 	 	 	 U N I O N   A L L  
 	 	 	 	 	 S E L E C T   C O U N T ( * ) , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , 1 0 0   F R O M   # T e m p  
 	 	 	 	 	 '  
 	 	 	 	 F R O M   [ O n t o l o g y . ] . D a t a M a p  
 	 	 	 	 W H E R E   D a t a M a p I D   =   @ D a t a M a p I D  
  
 / *  
 	 	 	 	 	 	 S E L E C T   t . *  
 	 	 	 	 	 	 F R O M   [ O n t o l o g y . ] . D a t a M a p   m  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   s  
 	 	 	 	 	 	 	 	 O N   s . C l a s s = m . C l a s s   A N D   s . I n t e r n a l T y p e = m . s I n t e r n a l T y p e   A N D   s . N o d e I D   I S   N O T   N U L L  
 	 	 	 	 	 	 	 	 	 ' + ( C A S E   W H E N   @ I n t e r n a l I d I n   I S   N O T   N U L L   T H E N   ' A N D   s . I n t e r n a l I D   I N   ( ' + @ I n t e r n a l I d I n + ' ) '   E L S E   ' '   E N D ) + '  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . ] . T r i p l e   t  
 	 	 	 	 	 	 	 	 O N   t . S u b j e c t   =   s . N o d e I D   A N D   t . P r e d i c a t e   =   m . _ P r o p e r t y N o d e   A N D   t . O b j e c t T y p e   =   ' + C A S T ( @ O b j e c t T y p e   a s   v a r c h a r ( 5 0 ) ) + '  
 	 	 	 	 	 	 W H E R E   m . D a t a M a p I D   =   ' + C A S T ( @ D a t a M a p I D   a s   v a r c h a r ( 5 0 ) ) + '  
  
 	 	 	 	 	 	 S E L E C T   t . *  
 	 	 	 	 	 	 F R O M   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   s  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . ] . T r i p l e   t  
 	 	 	 	 	 	 	 	 O N   t . S u b j e c t   =   s . N o d e I D   A N D   t . P r e d i c a t e   =   ' + c a s t ( _ P r o p e r t y N o d e   a s   v a r c h a r ( 5 0 ) ) + '   A N D   t . O b j e c t T y p e   =   ' + C A S T ( @ O b j e c t T y p e   a s   v a r c h a r ( 5 0 ) ) + '  
 	 	 	 	 	 	 W H E R E   s . C l a s s = ' ' ' + C l a s s + ' ' '   A N D   s . I n t e r n a l T y p e = ' ' ' + s I n t e r n a l T y p e + ' ' '   A N D   s . N o d e I D   I S   N O T   N U L L  
 	 	 	 	 	 	 	 ' + ( C A S E   W H E N   @ I n t e r n a l I d I n   I S   N O T   N U L L   T H E N   ' A N D   s . I n t e r n a l I D   I N   ( ' + @ I n t e r n a l I d I n + ' ) '   E L S E   ' '   E N D ) + '  
  
 * /  
 	 	 	 	    
 	 	 	 I F   @ D a t a M a p T y p e   =   4  
 	 	 	 	 S E L E C T   @ s   =   '  
 	 	 	 	 	 W I T H   x   A S   (  
 	 	 	 	 	 	 ' + @ s + '  
 	 	 	 	 	 ) ,   a   A S   (  
 	 	 	 	 	 	 S E L E C T   t . R e i t i f i c a t i o n   S u b j e c t ,   x . P r e d i c a t e ,   o . N o d e I D   O b j e c t ,   x . W e i g h t ,   x . S o r t O r d e r ,    
 	 	 	 	 	 	 	 	 x . V i e w S e c u r i t y G r o u p ,   x . G r a p h ,  
 	 	 	 	 	 	 	 	 x . N e t w o r k P r e d i c a t e ,   t . T r i p l e I D ,   v . T r i p l e I D   E x i s t i n g T r i p l e I D  
 	 	 	 	 	 	 F R O M   x  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   s  
 	 	 	 	 	 	 	 	 O N   s . C l a s s = x . s C l a s s   A N D   s . I n t e r n a l T y p e = x . s I n t e r n a l T y p e   A N D   s . I n t e r n a l I D = x . s I n t e r n a l I D   A N D   s . N o d e I D   I S   N O T   N U L L  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   c  
 	 	 	 	 	 	 	 	 O N   c . C l a s s = x . c C l a s s   A N D   c . I n t e r n a l T y p e = x . c I n t e r n a l T y p e   A N D   c . I n t e r n a l I D = x . c I n t e r n a l I D   A N D   c . N o d e I D   I S   N O T   N U L L  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . ] . T r i p l e   t  
 	 	 	 	 	 	 	 	 O N   t . S u b j e c t   =   s . N o d e I D   A N D   t . P r e d i c a t e   =   x . N e t w o r k P r e d i c a t e   A N D   t . O b j e c t   =   c . N o d e I D  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   o  
 	 	 	 	 	 	 	 	 O N   o . C l a s s = x . o C l a s s   A N D   o . I n t e r n a l T y p e = x . o I n t e r n a l T y p e   A N D   o . I n t e r n a l I D = x . o I n t e r n a l I D   A N D   o . N o d e I D   I S   N O T   N U L L  
 	 	 	 	 	 	 	 L E F T   O U T E R   J O I N   [ R D F . ] . T r i p l e   v  
 	 	 	 	 	 	 	 	 O N   v . S u b j e c t   =   t . R e i t i f i c a t i o n   A N D   v . P r e d i c a t e   =   x . P r e d i c a t e   A N D   v . O b j e c t   =   o . N o d e I D  
 	 	 	 	 	 	 	 	 	 A N D   t . R e i t i f i c a t i o n   I S   N O T   N U L L   A N D   o . N o d e I D   I S   N O T   N U L L  
 	 	 	 	 	 ) ,   b   A S   (  
 	 	 	 	 	 	 S E L E C T   v . *  
 	 	 	 	 	 	 F R O M   [ O n t o l o g y . ] . D a t a M a p   m  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   s  
 	 	 	 	 	 	 	 	 O N   s . C l a s s = m . C l a s s   A N D   s . I n t e r n a l T y p e = m . s I n t e r n a l T y p e   A N D   s . N o d e I D   I S   N O T   N U L L  
 	 	 	 	 	 	 	 	 	 ' + ( C A S E   W H E N   @ I n t e r n a l I d I n   I S   N O T   N U L L   T H E N   ' A N D   s . I n t e r n a l I D   I N   ( ' + @ I n t e r n a l I d I n + ' ) '   E L S E   ' '   E N D ) + '  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   c  
 	 	 	 	 	 	 	 	 O N   c . C l a s s = m . c C l a s s   A N D   c . I n t e r n a l T y p e = m . c I n t e r n a l T y p e   A N D   c . N o d e I D   I S   N O T   N U L L  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . ] . T r i p l e   t  
 	 	 	 	 	 	 	 	 O N   t . S u b j e c t   =   s . N o d e I D   A N D   t . P r e d i c a t e   =   m . _ N e t w o r k P r o p e r t y N o d e   A N D   t . O b j e c t   =   c . N o d e I D   A N D   t . R e i t i f i c a t i o n   I S   N O T   N U L L  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   o  
 	 	 	 	 	 	 	 	 O N   o . C l a s s = m . o C l a s s   A N D   o . I n t e r n a l T y p e = m . o I n t e r n a l T y p e   A N D   o . N o d e I D   I S   N O T   N U L L  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . ] . T r i p l e   v  
 	 	 	 	 	 	 	 	 O N   v . S u b j e c t   =   t . R e i t i f i c a t i o n   A N D   v . P r e d i c a t e   =   m . _ P r o p e r t y N o d e   A N D   v . O b j e c t   =   o . N o d e I D  
 	 	 	 	 	 	 W H E R E   m . D a t a M a p I D   =   ' + C A S T ( @ D a t a M a p I D   a s   v a r c h a r ( 5 0 ) ) + '  
 	 	 	 	 	 )  
 	 	 	 	 	 S E L E C T   a . S u b j e c t ,   a . P r e d i c a t e ,   a . O b j e c t ,   b . T r i p l e I D ,    
 	 	 	 	 	 	 	 n u l l   L a n g u a g e ,   n u l l   D a t a T y p e ,   n u l l   V a l u e ,   n u l l   V a l u e H a s h ,  
 	 	 	 	 	 	 	 a . W e i g h t ,   a . S o r t O r d e r ,   0   O b j e c t T y p e ,   a . V i e w S e c u r i t y G r o u p ,   n u l l   E d i t S e c u r i t y G r o u p ,  
 	 	 	 	 	 	 	 a . T r i p l e I D   R e i t i f i c a t i o n T r i p l e I D ,   b . R e i t i f i c a t i o n ,   b . T r i p l e H a s h ,   a . G r a p h ,  
 	 	 	 	 	 	 	 ( C A S E 	 W H E N   ( b . T r i p l e I D   I S   N U L L )   A N D   ( a . T r i p l e I D   I S   N O T   N U L L )   A N D   ( a . O b j e c t   I S   N O T   N U L L )   A N D   ( a . E x i s t i n g T r i p l e I D   I S   N U L L )   A N D   ( a . S u b j e c t   I S   N U L L )   T H E N   4  
 	 	 	 	 	 	 	 	 	 W H E N   ( b . T r i p l e I D   I S   N U L L )   A N D   ( a . T r i p l e I D   I S   N O T   N U L L )   A N D   ( a . O b j e c t   I S   N O T   N U L L )   A N D   ( a . E x i s t i n g T r i p l e I D   I S   N U L L )   A N D   ( a . S u b j e c t   I S   N O T   N U L L )   T H E N   2  
 	 	 	 	 	 	 	 	 	 W H E N   ( b . T r i p l e I D   I S   N O T   N U L L )   A N D   ( ( a . T r i p l e I D   I S   N U L L )   O R   ( a . O b j e c t   I S   N U L L ) )   T H E N   1  
 	 	 	 	 	 	 	 	 	 W H E N   ( b . T r i p l e I D   I S   N O T   N U L L )   A N D   ( a . T r i p l e I D   I S   N O T   N U L L )   A N D   ( a . O b j e c t   I S   N O T   N U L L )   A N D   ( a . E x i s t i n g T r i p l e I D   I S   N O T   N U L L )   T H E N   0  
 	 	 	 	 	 	 	 	 	 E L S E   - 1   E N D )   S t a t u s  
 	 	 	 	 	 	 F R O M   a   F U L L   O U T E R   J O I N   b  
 	 	 	 	 	 	 	 	 O N   a . S u b j e c t   =   b . S u b j e c t   A N D   a . O b j e c t   =   b . O b j e c t  
 	 	 	 	 	 	 W H E R E 	 b . T r i p l e I D   I S   N U L L  
 	 	 	 	 	 	 	 	 O R   a . T r i p l e I D   I S   N U L L  
 	 	 	 	 	 	 	 	 O R   a . O b j e c t   I S   N U L L  
 	 	 	 	 	 	 	 	 O R   a . S u b j e c t   I S   N U L L  
 	 	 	 	 	 	 	 	 O R   a . E x i s t i n g T r i p l e I D   I S   N U L L  
 	 	 	 	 	 	 	 	 O R   a . W e i g h t   < >   b . W e i g h t  
 	 	 	 	 	 	 	 	 O R   a . S o r t O r d e r   < >   b . S o r t O r d e r  
 	 	 	 	 	 	 	 	 O R   a . V i e w S e c u r i t y G r o u p   < >   b . V i e w S e c u r i t y G r o u p  
 	 	 	 	 	 U N I O N   A L L  
 	 	 	 	 	 S E L E C T   C O U N T ( * ) , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , 1 0 0   F R O M   x  
 	 	 	 	 	 '  
  
 	 	 	 I F   @ D a t a M a p T y p e   =   5  
 	 	 	 	 S E L E C T   @ s   =   '   C R E A T E   T A B L E   # T e m p   (  
 	 	 	 	 	 	 	 	 	 	 	 s C l a s s   N V A R C H A R ( 4 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 s I n t e r n a l T y p e   N V A R C H A R ( 3 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 s I n t e r n a l I D   N V A R C H A R ( 1 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 N e t w o r k P r e d i c a t e   B I G I N T ,  
 	 	 	 	 	 	 	 	 	 	 	 p r e d i c a t e   B I G I N T ,  
 	 	 	 	 	 	 	 	 	 	 	 c C l a s s   N V A R C H A R ( 4 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 c I n t e r n a l T y p e   N V A R C H A R ( 3 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 c I n t e r n a l I D   N V A R C H A R ( 1 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 o C l a s s   N V A R C H A R ( 4 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 o I n t e r n a l T y p e   N V A R C H A R ( 3 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 o I n t e r n a l I D   N V A R C H A R ( 1 0 0 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 L a n g u a g e   N V A R C H A R ( 2 5 5 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 D a t a T y p e   N V A R C H A R ( 2 5 5 ) ,  
 	 	 	 	 	 	 	 	 	 	 	 V a l u e   N V A R C H A R ( M A X ) ,  
 	 	 	 	 	 	 	 	 	 	 	 V i e w S e c u r i t y G r o u p   B I G I N T ,  
 	 	 	 	 	 	 	 	 	 	 	 E d i t S e c u r i t y G r o u p   B I G I N T ,  
 	 	 	 	 	 	 	 	 	 	 	 W e i g h t   F L O A T ,  
 	 	 	 	 	 	 	 	 	 	 	 G r a p h   B I G I N T ,    
 	 	 	 	 	 	 	 	 	 	 	 V a l u e H a s h   B I N A R Y ( 2 0 ) ,    
 	 	 	 	 	 	 	 	 	 	 	 S o r t O r d e r   I N T  
 	 	 	 	 	 	 	 	 	 	 )  
 	 	 	 	 	 I N S E R T   I N T O   # T e m p    
 	 	 	 	 	 	 '   +   @ s   +   ' ;  
 	 	 	 	 	    
 	 	 	 	 	 	 S E L E C T   t . R e i t i f i c a t i o n   S u b j e c t ,   x . P r e d i c a t e ,   o . N o d e I D   O b j e c t ,   x . W e i g h t ,   x . S o r t O r d e r ,    
 	 	 	 	 	 	 	 	 x . V i e w S e c u r i t y G r o u p ,   x . G r a p h ,  
 	 	 	 	 	 	 	 	 x . N e t w o r k P r e d i c a t e ,   t . T r i p l e I D ,   v . T r i p l e I D   E x i s t i n g T r i p l e I D ,  
 	 	 	 	 	 	 	 	 x . V a l u e ,   x . L a n g u a g e ,   x . D a t a T y p e ,   x . V a l u e H a s h ,   x . E d i t S e c u r i t y G r o u p  
 	 	 	 	 	 	 i n t o   # a  
 	 	 	 	 	 	 F R O M   # T e m p   x  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   s  
 	 	 	 	 	 	 	 	 O N   s . C l a s s = x . s C l a s s   A N D   s . I n t e r n a l T y p e = x . s I n t e r n a l T y p e   A N D   s . I n t e r n a l I D = x . s I n t e r n a l I D   A N D   s . N o d e I D   I S   N O T   N U L L  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   c  
 	 	 	 	 	 	 	 	 O N   c . C l a s s = x . c C l a s s   A N D   c . I n t e r n a l T y p e = x . c I n t e r n a l T y p e   A N D   c . I n t e r n a l I D = x . c I n t e r n a l I D   A N D   c . N o d e I D   I S   N O T   N U L L  
 	 	 	 	 	 	 	 I N N E R   h a s h   J O I N   [ R D F . ] . T r i p l e   t  
 	 	 	 	 	 	 	 	 O N   t . S u b j e c t   =   s . N o d e I D   A N D   t . P r e d i c a t e   =   x . N e t w o r k P r e d i c a t e   A N D   t . O b j e c t   =   c . N o d e I D  
 	 	 	 	 	 	 	 L E F T   O U T E R   J O I N   [ R D F . ] . N o d e   o  
 	 	 	 	 	 	 	 	 O N   o . V a l u e H a s h = x . V a l u e H a s h  
 	 	 	 	 	 	 	 L E F T   O U T E R   J O I N   [ R D F . ] . T r i p l e   v  
 	 	 	 	 	 	 	 	 O N   v . S u b j e c t   =   t . R e i t i f i c a t i o n   A N D   v . P r e d i c a t e   =   x . P r e d i c a t e   A N D   v . O b j e c t   =   o . N o d e I D  
 	 	 	 	 	 	 	 	 	 A N D   t . R e i t i f i c a t i o n   I S   N O T   N U L L   A N D   o . N o d e I D   I S   N O T   N U L L  
 	 	 	 	 	    
 	 	 	 	 	 	 S E L E C T   v . *   I N T O   # b  
 	 	 	 	 	 	 F R O M   [ O n t o l o g y . ] . D a t a M a p   m  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   s  
 	 	 	 	 	 	 	 	 O N   s . C l a s s = m . C l a s s   A N D   s . I n t e r n a l T y p e = m . s I n t e r n a l T y p e   A N D   s . N o d e I D   I S   N O T   N U L L  
 	 	 	 	 	 	 	 	 	 ' + ( C A S E   W H E N   @ I n t e r n a l I d I n   I S   N O T   N U L L   T H E N   ' A N D   s . I n t e r n a l I D   I N   ( ' + @ I n t e r n a l I d I n + ' ) '   E L S E   ' '   E N D ) + '  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . S t a g e ] . I n t e r n a l N o d e M a p   c  
 	 	 	 	 	 	 	 	 O N   c . C l a s s = m . c C l a s s   A N D   c . I n t e r n a l T y p e = m . c I n t e r n a l T y p e   A N D   c . N o d e I D   I S   N O T   N U L L  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . ] . T r i p l e   t  
 	 	 	 	 	 	 	 	 O N   t . S u b j e c t   =   s . N o d e I D   A N D   t . P r e d i c a t e   =   m . _ N e t w o r k P r o p e r t y N o d e   A N D   t . O b j e c t   =   c . N o d e I D   A N D   t . R e i t i f i c a t i o n   I S   N O T   N U L L  
 	 	 	 	 	 	 	 I N N E R   J O I N   [ R D F . ] . T r i p l e   v  
 	 	 	 	 	 	 	 	 O N   v . S u b j e c t   =   t . R e i t i f i c a t i o n   A N D   v . P r e d i c a t e   =   m . _ P r o p e r t y N o d e   A N D   v . O b j e c t T y p e   =   ' + C A S T ( @ O b j e c t T y p e   a s   v a r c h a r ( 5 0 ) ) + '  
 	 	 	 	 	 	 W H E R E   m . D a t a M a p I D   =   ' + C A S T ( @ D a t a M a p I D   a s   v a r c h a r ( 5 0 ) ) + '  
 	 	 	 	 	    
 	 	 	 	 	 S E L E C T   a . S u b j e c t ,   a . P r e d i c a t e ,   a . O b j e c t ,   b . T r i p l e I D ,    
 	 	 	 	 	 	 	 a . L a n g u a g e ,   a . D a t a T y p e ,   a . V a l u e ,   a . V a l u e H a s h ,  
 	 	 	 	 	 	 	 a . W e i g h t ,   a . S o r t O r d e r ,   ' + C A S T ( @ O b j e c t T y p e   a s   v a r c h a r ( 5 0 ) ) + '   O b j e c t T y p e ,   a . V i e w S e c u r i t y G r o u p ,   a . E d i t S e c u r i t y G r o u p ,  
 	 	 	 	 	 	 	 a . T r i p l e I D   R e i t i f i c a t i o n T r i p l e I D ,   b . R e i t i f i c a t i o n ,   b . T r i p l e H a s h ,   a . G r a p h ,  
 	 	 	 	 	 	 	 ( C A S E 	 W H E N   ( b . T r i p l e I D   I S   N U L L )   A N D   ( a . T r i p l e I D   I S   N O T   N U L L )   A N D   ( a . O b j e c t   I S   N U L L )   A N D   ( a . E x i s t i n g T r i p l e I D   I S   N U L L )   A N D   ( a . S u b j e c t   I S   N U L L )   T H E N   5  
 	 	 	 	 	 	 	 	 	 W H E N   ( b . T r i p l e I D   I S   N U L L )   A N D   ( a . T r i p l e I D   I S   N O T   N U L L )   A N D   ( a . O b j e c t   I S   N O T   N U L L )   A N D   ( a . E x i s t i n g T r i p l e I D   I S   N U L L )   A N D   ( a . S u b j e c t   I S   N U L L )   T H E N   4  
 	 	 	 	 	 	 	 	 	 W H E N   ( b . T r i p l e I D   I S   N U L L )   A N D   ( a . T r i p l e I D   I S   N O T   N U L L )   A N D   ( a . O b j e c t   I S   N U L L )   A N D   ( a . E x i s t i n g T r i p l e I D   I S   N U L L )   A N D   ( a . S u b j e c t   I S   N O T   N U L L )   T H E N   3  
 	 	 	 	 	 	 	 	 	 W H E N   ( b . T r i p l e I D   I S   N U L L )   A N D   ( a . T r i p l e I D   I S   N O T   N U L L )   A N D   ( a . O b j e c t   I S   N O T   N U L L )   A N D   ( a . E x i s t i n g T r i p l e I D   I S   N U L L )   A N D   ( a . S u b j e c t   I S   N O T   N U L L )   T H E N   2  
 	 	 	 	 	 	 	 	 	 W H E N   ( b . T r i p l e I D   I S   N O T   N U L L )   A N D   ( a . T r i p l e I D   I S   N U L L )   T H E N   1  
 	 	 	 	 	 	 	 	 	 W H E N   ( b . T r i p l e I D   I S   N O T   N U L L )   A N D   ( a . T r i p l e I D   I S   N O T   N U L L )   A N D   ( a . O b j e c t   I S   N O T   N U L L )   A N D   ( a . E x i s t i n g T r i p l e I D   I S   N O T   N U L L )   T H E N   0  
 	 	 	 	 	 	 	 	 	 E L S E   - 1   E N D )   S t a t u s  
 	 	 	 	 	 	 F R O M   # a   a   F U L L   O U T E R   J O I N   # b   b  
 	 	 	 	 	 	 	 	 O N   a . S u b j e c t   =   b . S u b j e c t   A N D   a . O b j e c t   =   b . O b j e c t   A N D   a . O b j e c t   I S   N O T   N U L L  
 	 	 	 	 	 	 W H E R E 	 b . T r i p l e I D   I S   N U L L  
 	 	 	 	 	 	 	 	 O R   a . T r i p l e I D   I S   N U L L  
 	 	 	 	 	 	 	 	 O R   a . O b j e c t   I S   N U L L  
 	 	 	 	 	 	 	 	 O R   a . S u b j e c t   I S   N U L L  
 	 	 	 	 	 	 	 	 O R   a . E x i s t i n g T r i p l e I D   I S   N U L L  
 	 	 	 	 	 	 	 	 O R   a . W e i g h t   < >   b . W e i g h t  
 	 	 	 	 	 	 	 	 O R   a . S o r t O r d e r   < >   b . S o r t O r d e r  
 	 	 	 	 	 	 	 	 O R   a . V i e w S e c u r i t y G r o u p   < >   b . V i e w S e c u r i t y G r o u p  
 	 	 	 	 	 U N I O N   A L L  
 	 	 	 	 	 S E L E C T   C O U N T ( * ) , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , N U L L , 1 0 0   F R O M   # t e m p   x  
 	 	 	 	 	 '  
 - - p r i n t   @ s   r e t u r n  
 	 	 	 - - d e c l a r e   @ d   d a t e t i m e  
 	 	 	 - - s e l e c t   @ d   =   g e t d a t e ( ) 	 	 	 	 	  
 	 	 	 - - s e l e c t   @ d a t a m a p i d ,   r e p l a c e ( @ s , c h a r ( 1 0 ) , ' N E W L I N E ' )  
 	 	 	 - - r e t u r n  
 	 	 	 - - s e l e c t   @ D a t a M a p T y p e ,   @ s  
 	 	 	  
 	 	 	 I N S E R T   I N T O   # T r i p l e  
 	 	 	 	 E X E C   s p _ e x e c u t e s q l   @ s  
 	 	 	 - - s e l e c t   @ d a t a m a p i d ,   d a t e d i f f ( m s , @ d , g e t d a t e ( ) ) ,   ( s e l e c t   c o u n t ( * )   f r o m   # T r i p l e ) ,   r e p l a c e ( @ s , c h a r ( 1 0 ) , ' N E W L I N E ' )  
 	 	 	 - - s e l e c t   *   f r o m   # T r i p l e  
 	 	 	 - - r e t r u n  
 	 	 	 	  
 	 	 	 S E L E C T   @ T o t a l T r i p l e s   =   I s N u l l ( ( S E L E C T   M A X ( S u b j e c t )   F R O M   # T r i p l e   W H E R E   S t a t u s   =   1 0 0 ) , 0 )  
 	 	 	  
 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 	 - -   S t a t u s   0   -   U p d a t e   t r i p l e  
 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 	  
 	 	 	 U P D A T E   t  
 	 	 	 	 S E T 	 t . W e i g h t   =   I s N u l l ( x . W e i g h t , t . W e i g h t ) ,  
 	 	 	 	 	 t . S o r t O r d e r   =   I s N u l l ( x . S o r t O r d e r , t . S o r t O r d e r ) ,  
 	 	 	 	 	 t . O b j e c t T y p e   =   I s N u l l ( x . O b j e c t T y p e , t . O b j e c t T y p e )  
 	 	 	 	 F R O M   [ R D F . ] . T r i p l e   t ,   # T r i p l e   x  
 	 	 	 	 W H E R E   x . S t a t u s   =   0  
 	 	 	 	 	 A N D   t . T r i p l e I D   =   x . T r i p l e I D  
 	 	 	 S E L E C T   @ U p d a t e d T r i p l e s   =   @ @ R O W C O U N T  
  
 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 	 - -   S t a t u s   1   -   D e l e t e   t r i p l e  
 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 	 	 C R E A T E   T A B L E   # D e l e t e T r i p l e s   ( T r i p l e I D   B I G I N T   P R I M A R Y   K E Y )  
 	 	 	 C R E A T E   T A B L E   # D e l e t e N o d e s   ( N o d e I D   B I G I N T   P R I M A R Y   K E Y )  
 	 	 	 C R E A T E   T A B L E   # N e w D e l e t e T r i p l e s   ( T r i p l e I D   B I G I N T   P R I M A R Y   K E Y ,   R e i t i f i c a t i o n   B I G I N T )  
 	 	 	 C R E A T E   T A B L E   # N e w D e l e t e N o d e s   ( N o d e I D   B I G I N T   P R I M A R Y   K E Y )  
 	 	 	 D E C L A R E   @ N e w D e l e t e d T r i p l e s   B I G I N T  
 	 	 	 - -   G e t   t r i p l e s   t h a t   s h o u l d   b e   d e l e t e d  
 	 	 	 I N S E R T   I N T O   # N e w D e l e t e T r i p l e s   ( T r i p l e I D ,   R e i t i f i c a t i o n )  
 	 	 	 	 S E L E C T   T r i p l e I D ,   R e i t i f i c a t i o n  
 	 	 	 	 	 F R O M   # T r i p l e  
 	 	 	 	 	 W H E R E   S t a t u s   =   1  
 	 	 	 S E L E C T   @ N e w D e l e t e d T r i p l e s   =   @ @ R O W C O U N T  
 	 	 	 W H I L E   @ N e w D e l e t e d T r i p l e s   >   0  
 	 	 	 B E G I N  
 	 	 	 	 - -   G e t   r e i t i f i c a t i o n   n o d e s  
 	 	 	 	 I N S E R T   I N T O   # D e l e t e N o d e s ( N o d e I D )  
 	 	 	 	 	 S E L E C T   N o d e I D   F R O M   # N e w D e l e t e N o d e s  
 	 	 	 	 T R U N C A T E   T A B L E   # N e w D e l e t e N o d e s  
 	 	 	 	 I N S E R T   I N T O   # N e w D e l e t e N o d e s   ( N o d e I D )  
 	 	 	 	 	 S E L E C T   D I S T I N C T   R e i t i f i c a t i o n    
 	 	 	 	 	 	 F R O M   # N e w D e l e t e T r i p l e s    
 	 	 	 	 	 	 W H E R E   R e i t i f i c a t i o n   I S   N O T   N U L L   A N D   R e i t i f i c a t i o n   N O T   I N   ( S E L E C T   N o d e I D   F R O M   # D e l e t e N o d e s )  
 	 	 	 	 - -   G e t   t r i p l e s   u s i n g   r e i t i f i c a t i o n   n o d e s  
 	 	 	 	 I N S E R T   I N T O   # D e l e t e T r i p l e s   ( T r i p l e I D )  
 	 	 	 	 	 S E L E C T   T r i p l e I D   F R O M   # N e w D e l e t e T r i p l e s  
 	 	 	 	 T R U N C A T E   T A B L E   # N e w D e l e t e T r i p l e s  
 	 	 	 	 I N S E R T   I N T O   # N e w D e l e t e T r i p l e s   ( T r i p l e I D ,   R e i t i f i c a t i o n )  
 	 	 	 	 	 S E L E C T   t . T r i p l e I D ,   t . R e i t i f i c a t i o n  
 	 	 	 	 	 	 F R O M   [ R D F . ] . T r i p l e   t  
 	 	 	 	 	 	 j o i n     # N e w D e l e t e N o d e s   n   o n   t . s u b j e c t   =   n . N o d e I D    
 	 	 	 	 	 	 	 	 	 	 	         o r   t . p r e d i c a t e   =   n . N o d e I D    
 	 	 	 	 	 	 	 	 	 	 	         o r   t . o b j e c t   =   n . N o d e I D  
 	 	 	 	 	 	 	 w h e r e   t . T r i p l e I D   N O T   I N   ( S E L E C T   T r i p l e I D   F R O M   # D e l e t e T r i p l e s )  
 	 	 	 	 	 - - S E L E C T   t . T r i p l e I D ,   t . R e i t i f i c a t i o n  
 	 	 	 	 	 - - 	 F R O M   [ R D F . ] . T r i p l e   t ,   # N e w D e l e t e N o d e s   n  
 	 	 	 	 	 - - 	 W H E R E   t . s u b j e c t   =   n . N o d e I D    
 	 	 	 	 	 - - 	       o r   t . p r e d i c a t e   =   n . N o d e I D    
 	 	 	 	 	 - - 	       o r   t . o b j e c t   =   n . N o d e I D  
 	 	 	 	 	 - - 	 	 A N D   t . T r i p l e I D   N O T   I N   ( S E L E C T   T r i p l e I D   F R O M   # D e l e t e T r i p l e s )  
 	 	 	 	 S E L E C T   @ N e w D e l e t e d T r i p l e s   =   @ @ R O W C O U N T  
 	 	 	 E N D  
 	 	 	 - -   D e l e t e   t r i p l e s   a n d   r e i t i f i c a t i o n   n o d e s   a n d   t r i p l e s  
 	 	 	 D E L E T E    
 	 	 	 	 F R O M   [ R D F . ] . T r i p l e  
 	 	 	 	 W H E R E   T r i p l e I D   I N   ( S E L E C T   T r i p l e I D   F R O M   # D e l e t e T r i p l e s )  
 	 	 	 S E L E C T   @ D e l e t e d T r i p l e s   =   @ @ R O W C O U N T  
 	 	 	 D E L E T E    
 	 	 	 	 F R O M   [ R D F . ] . N o d e  
 	 	 	 	 W H E R E   N o d e I D   I N   ( S E L E C T   N o d e I D   F R O M   # D e l e t e N o d e s )  
 	 	 	 S E L E C T   @ D e l e t e d N o d e s   =   @ @ R O W C O U N T  
  
  
 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 	 - -   S t a t u s   4   &   5   -   C r e a t e   n e w   r e i t i f i c a t i o n s  
 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 	 	 U P D A T E   # T r i p l e  
 	 	 	 	 S E T   T r i p l e H a s h   =   H A S H B Y T E S ( ' s h a 1 ' , N ' " # T R I P L E ' + c a s t ( R e i t i f i c a t i o n T r i p l e I D   a s   n v a r c h a r ( 5 0 ) ) + N ' " ' )  
 	 	 	 	 W H E R E   S t a t u s   I N   ( 4 , 5 )  
 	 	 	 I N S E R T   I N T O   [ R D F . ] . N o d e   ( V a l u e H a s h ,   L a n g u a g e ,   D a t a T y p e ,   V a l u e ,   O b j e c t T y p e ,   V i e w S e c u r i t y G r o u p ,   E d i t S e c u r i t y G r o u p )  
 	 	 	 	 S E L E C T   D I S T I N C T   T r i p l e H a s h ,   N U L L ,   N U L L ,   ' # T R I P L E ' + C A S T ( R e i t i f i c a t i o n T r i p l e I D   A S   V A R C H A R ( 5 0 ) ) ,   0 ,   - 1 ,   - 5 0  
 	 	 	 	 	 F R O M   # T r i p l e  
 	 	 	 	 	 W H E R E   S t a t u s   I N   ( 4 , 5 )  
 	 	 	 S E L E C T   @ N e w N o d e s   =   @ N e w N o d e s   +   @ @ R O W C O U N T  
 	 	 	 U P D A T E   t  
 	 	 	 	 S E T 	 t . S u b j e c t   =   n . N o d e I D ,  
 	 	 	 	 	 t . T r i p l e H a s h   =   ( C A S E   W H E N   t . O b j e c t   I S   N U L L   T H E N   t . T r i p l e H a s h   E L S E   H A S H B Y T E S ( ' s h a 1 ' , N ' " < # ' + c o n v e r t ( n v a r c h a r ( 4 0 0 0 ) , n . N o d e I D ) + N ' >   < # ' + c o n v e r t ( n v a r c h a r ( 4 0 0 0 ) , t . P r e d i c a t e ) + N ' >   < # ' + c o n v e r t ( n v a r c h a r ( m a x ) , t . O b j e c t ) + N ' >   . " ^ ^ h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # S t a t e m e n t ' )   E N D )  
 	 	 	 	 F R O M   # T r i p l e   t ,   [ R D F . ] . N o d e   n  
 	 	 	 	 W H E R E   t . S t a t u s   I N   ( 4 , 5 )   A N D   t . T r i p l e H a s h   =   n . V a l u e H a s h  
 	 	 	 U P D A T E   v  
 	 	 	 	 S E T   v . R e i t i f i c a t i o n   =   t . S u b j e c t  
 	 	 	 	 F R O M   # T r i p l e   t ,   [ R D F . ] . T r i p l e   v  
 	 	 	 	 W H E R E   t . S t a t u s   I N   ( 4 , 5 )   A N D   t . R e i t i f i c a t i o n T r i p l e I D   =   v . T r i p l e I D  
 	 	 	 U P D A T E   n  
 	 	 	 	 S E T   n . V a l u e   =   @ b a s e U R I + c a s t ( n . N o d e I D   a s   n v a r c h a r ( 5 0 ) ) ,  
 	 	 	 	 	 n . V a l u e H a s h   =   H A S H B Y T E S ( ' s h a 1 ' , N ' " '   +   @ b a s e U R I   +   c a s t ( n . N o d e I D   a s   n v a r c h a r ( 5 0 ) )   +   N ' " ' )  
 	 	 	 	 F R O M   # T r i p l e   t ,   [ R D F . ] . N o d e   n  
 	 	 	 	 W H E R E   t . S t a t u s   I N   ( 4 , 5 )   A N D   t . S u b j e c t   =   n . N o d e I D  
 	 	 	 	  
 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 	 - -   S t a t u s   3   &   5   -   C r e a t e   n e w   l i t e r a l s  
 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 	 	 - -   C r e a t e   t h e   n e w   l i t e r a l s  
 	 	 	 I N S E R T   I N T O   [ R D F . ] . N o d e   ( V a l u e H a s h ,   L a n g u a g e ,   D a t a T y p e ,   V a l u e ,   O b j e c t T y p e ,   V i e w S e c u r i t y G r o u p ,   E d i t S e c u r i t y G r o u p )  
 	 	 	 	 S E L E C T   V a l u e H a s h ,   M A X ( L a n g u a g e ) ,   M A X ( D a t a T y p e ) ,   M A X ( V a l u e ) ,   M A X ( O b j e c t T y p e * 1 ) ,  
 	 	 	 	 	 	 I s N u l l ( M i n ( V i e w S e c u r i t y G r o u p ) , - 1 ) ,   I s N u l l ( M i n ( E d i t S e c u r i t y G r o u p ) , - 4 0 )  
 	 	 	 	 	 F R O M   # T r i p l e  
 	 	 	 	 	 W H E R E   S t a t u s   I N   ( 3 , 5 )  
 	 	 	 	 	 G R O U P   B Y   V a l u e H a s h  
 	 	 	 S E L E C T   @ N e w N o d e s   =   @ N e w N o d e s   +   @ @ R O W C O U N T  
 	 	 	 - -   U p d a t e   # T r i p l e   w i t h   t h e   N o d e I D   o f   t h e   n e w   l i t e r a l s  
 	 	 	 U P D A T E   t  
 	 	 	 	 S E T   t . O b j e c t   =   n . N o d e I D  
 	 	 	 	 F R O M   # T r i p l e   t ,   [ R D F . ] . N o d e   n  
 	 	 	 	 W H E R E   t . S t a t u s   I N   ( 3 , 5 )  
 	 	 	 	 	 A N D   t . V a l u e H a s h   =   n . V a l u e H a s h  
 	 	 	 	 	  
 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 	 	 	 - -   S t a t u s   2 ,   3 ,   4 ,   a n d   5   -   C r e a t e   n e w   t r i p l e  
 	 	 	 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
 	 	 	 - -   C r e a t e   t h e   n e w   t r i p l e s  
 	 	 	 I N S E R T   I N T O   [ R D F . ] . T r i p l e   ( S u b j e c t ,   P r e d i c a t e ,   O b j e c t ,   T r i p l e H a s h ,   W e i g h t ,   O b j e c t T y p e ,   S o r t O r d e r ,   V i e w S e c u r i t y G r o u p ,   G r a p h )  
 	 	 	 	 S E L E C T   S u b j e c t ,   P r e d i c a t e ,   O b j e c t ,   T r i p l e H a s h ,   M a x ( W e i g h t ) ,   M a x ( c a s t ( O b j e c t T y p e   a s   T i n y i n t ) ) ,   M i n ( S o r t O r d e r ) ,   M a x ( V i e w S e c u r i t y G r o u p ) ,   M i n ( G r a p h )  
 	 	 	 	 	 F R O M   (  
 	 	 	 	 	 	 S E L E C T   S u b j e c t ,   P r e d i c a t e ,   O b j e c t ,  
 	 	 	 	 	 	 	 H A S H B Y T E S ( ' s h a 1 ' , N ' " < # ' + c o n v e r t ( n v a r c h a r ( 4 0 0 0 ) , S u b j e c t ) + N ' >   < # ' + c o n v e r t ( n v a r c h a r ( 4 0 0 0 ) , P r e d i c a t e ) + N ' >   < # ' + c o n v e r t ( n v a r c h a r ( 4 0 0 0 ) , O b j e c t ) + N ' >   . " ^ ^ h t t p : / / w w w . w 3 . o r g / 1 9 9 9 / 0 2 / 2 2 - r d f - s y n t a x - n s # S t a t e m e n t ' )   T r i p l e H a s h ,  
 	 	 	 	 	 	 	 I s N u l l ( W e i g h t , 1 )   W e i g h t ,   I s N u l l ( O b j e c t T y p e , 1 )   O b j e c t T y p e ,   I s N u l l ( S o r t O r d e r , 1 )   S o r t O r d e r ,   I s N u l l ( V i e w S e c u r i t y G r o u p , - 1 )   V i e w S e c u r i t y G r o u p ,  
 	 	 	 	 	 	 	 G r a p h  
 	 	 	 	 	 	 F R O M   # T r i p l e  
 	 	 	 	 	 	 W H E R E   S t a t u s   I N   ( 2 , 3 , 4 , 5 )  
 	 	 	 	 	 )   t  
 	 	 	 	 	 G R O U P   B Y   S u b j e c t ,   P r e d i c a t e ,   O b j e c t ,   T r i p l e H a s h  
 	 	 	 S E L E C T   @ N e w T r i p l e s   =   @ @ R O W C O U N T  
  
 	 	 	 D R O P   T A B L E   # D e l e t e T r i p l e s    
 	 	 	 D R O P   T A B L E   # D e l e t e N o d e s    
 	 	 	 D R O P   T A B L E   # N e w D e l e t e T r i p l e s    
 	 	 	 D R O P   T A B L E   # N e w D e l e t e N o d e s        
 	 	 	  
 	 	 	 D R O P   T A B L E   # T r i p l e  
 	 	 	  
 	 	 E N D  
  
  
 	 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 	 - -   S a v e   L o g  
 	 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
 	 	 - - * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
  
 	 	 I N S E R T   I N T O   [ R D F . S t a g e ] . [ L o g . D a t a M a p ]   ( D a t a M a p I D ,   S t a r t D a t e ,   E n d D a t e ,   R u n T i m e M S ,   D a t a M a p T y p e ,  
 	 	 	 	 	 	 	 	 	 	 	 	 N e w N o d e s ,   U p d a t e d N o d e s ,   E x i s t i n g N o d e s ,   D e l e t e d N o d e s ,   T o t a l N o d e s ,  
 	 	 	 	 	 	 	 	 	 	 	 	 N e w T r i p l e s ,   U p d a t e d T r i p l e s ,   E x i s t i n g T r i p l e s ,   D e l e t e d T r i p l e s ,   T o t a l T r i p l e s )  
 	 	 	 S E L E C T 	 @ D a t a M a p I D ,   @ S t a r t D a t e ,   G e t D a t e ( ) ,   D a t e D i f f ( m s , @ S t a r t D a t e , G e t D a t e ( ) ) ,   @ D a t a M a p T y p e ,  
 	 	 	 	 	 @ N e w N o d e s ,   @ U p d a t e d N o d e s ,   @ E x i s t i n g N o d e s ,   @ D e l e t e d N o d e s ,   @ T o t a l N o d e s ,  
 	 	 	 	 	 @ N e w T r i p l e s ,   @ U p d a t e d T r i p l e s ,   @ E x i s t i n g T r i p l e s ,   @ D e l e t e d T r i p l e s ,   @ T o t a l T r i p l e s  
 	 	 	 	 W H E R E   @ S a v e L o g   =   1  
  
 	 	 I F   @ S h o w C o u n t s   =   1  
 	 	 	 S E L E C T   *   F R O M   [ R D F . S t a g e ] . [ L o g . D a t a M a p ]   W H E R E   L o g I D   =   @ @ I D E N T I T Y  
  
 	 	 D E L E T E   F R O M   # Q u e u e   W H E R E   D a t a M a p I D   =   @ D a t a M a p I D  
 	 	 	    
 	 E N D  
  
 	 I F   @ T u r n O f f I n d e x i n g   =   1  
 	 B E G I N  
 	 	 - -   T u r n   o n   r e a l - t i m e   i n d e x i n g  
 	 	 A L T E R   F U L L T E X T   I N D E X   O N   [ R D F . ] . N o d e   S E T   C H A N G E _ T R A C K I N G   A U T O ;  
 	 	 - -   K i c k   o f f   p o p u l a t i o n   F T   C a t a l o g   a n d   i n d e x  
 	 	 A L T E R   F U L L T E X T   I N D E X   O N   [ R D F . ] . N o d e   S T A R T   F U L L   P O P U L A T I O N    
 	 E N D  
 	  
 	 - -   s e l e c t   *   f r o m   [ O n t o l o g y . ] . D a t a M a p  
  
 E N D  
  
  
  
  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ F r a m e w o r k . ] . [ L o a d I n s t a l l D a t a ] '  
 G O  
 C R E A T E   p r o c e d u r e   [ F r a m e w o r k . ] . [ L o a d I n s t a l l D a t a ]  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
   D E C L A R E   @ x   X M L  
   S E L E C T   @ x   =   (   S E L E C T   T O P   1  
                                                 D a t a  
                               F R O M           [ F r a m e w o r k . ] . [ I n s t a l l D a t a ]  
                               O R D E R   B Y   I n s t a l l D a t a I D   D E S C  
                           )    
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -   [ F r a m e w o r k . ]  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
    
                            
 - -   [ F r a m e w o r k . ] . [ P a r a m e t e r ]  
 T R U N C A T E   T A B L E   [ F r a m e w o r k . ] . [ P a r a m e t e r ]  
 I N S E R T   I N T O   [ F r a m e w o r k . ] . P a r a m e t e r  
 	 (   P a r a m e t e r I D ,   V a l u e   )                  
 S E L E C T 	 R . x . v a l u e ( ' P a r a m e t e r I D [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' )   ,  
 	 	 R . x . v a l u e ( ' V a l u e [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' )  
 F R O M         (   S E L E C T  
 	 	 	 @ x . q u e r y  
 	 	 	 ( ' I m p o r t [ 1 ] / T a b l e [ @ N a m e = ' ' [ F r a m e w o r k . ] . [ P a r a m e t e r ] ' ' ] ' )  
 	 	 	 x  
 	 	 )   t  
 C R O S S   A P P L Y   x . n o d e s ( ' / / R o w ' )   A S   R   (   x   )  
  
      
                
 - -     [ F r a m e w o r k . ] . [ R e s t P a t h ]    
 I N S E R T   I N T O   [ F r a m e w o r k . ] . R e s t P a t h  
                 (   A p p l i c a t i o n N a m e ,   R e s o l v e r   )        
 S E L E C T     R . x . v a l u e ( ' A p p l i c a t i o n N a m e [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' )   ,  
                 R . x . v a l u e ( ' R e s o l v e r [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' )    
 F R O M         (   S E L E C T  
                                         @ x . q u e r y  
                                         ( ' I m p o r t [ 1 ] / T a b l e [ @ N a m e = ' ' [ F r a m e w o r k . ] . [ R e s t P a t h ] ' ' ] ' )  
                                         x  
                 )   t  
 C R O S S   A P P L Y   x . n o d e s ( ' / / R o w ' )   A S   R   (   x   )  
  
        
 - - [ F r a m e w o r k . ] . [ J o b ]  
 I N S E R T   I N T O   [ F r a m e w o r k . ] . J o b  
                 (   J o b I D ,  
 	 	     J o b G r o u p   ,  
                     S t e p   ,  
                     I s A c t i v e   ,  
                     S c r i p t   ,  
                     S t a t u s   ,  
                     L a s t S t a r t   ,  
                     L a s t E n d   ,  
                     E r r o r C o d e   ,  
                     E r r o r M s g  
                 )    
 S E L E C T 	 R . x . v a l u e ( ' J o b I D [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' J o b G r o u p [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' S t e p [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' I s A c t i v e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' S c r i p t [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' S t a t u s [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' L a s t S t a r t [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' L a s t E n d [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' E r r o r C o d e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' E r r o r M s g [ 1 ] ' , ' v a r c h a r ( m a x ) ' )  
 F R O M         (   S E L E C T  
                                     @ x . q u e r y  
                                     ( ' I m p o r t [ 1 ] / T a b l e [ @ N a m e = ' ' [ F r a m e w o r k . ] . [ J o b ] ' ' ] ' )  
                                     x  
             )   t  
 C R O S S   A P P L Y   x . n o d e s ( ' / / R o w ' )   A S   R   (   x   )  
  
 	  
 - - [ F r a m e w o r k . ] . [ J o b G r o u p ]  
 I N S E R T   I N T O   [ F r a m e w o r k . ] . J o b G r o u p  
                 (   J o b G r o u p ,   N a m e ,   T y p e ,   D e s c r i p t i o n   )    
 S E L E C T 	 R . x . v a l u e ( ' J o b G r o u p [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' N a m e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' T y p e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' D e s c r i p t i o n [ 1 ] ' , ' v a r c h a r ( m a x ) ' )  
 F R O M         (   S E L E C T  
                                     @ x . q u e r y  
                                     ( ' I m p o r t [ 1 ] / T a b l e [ @ N a m e = ' ' [ F r a m e w o r k . ] . [ J o b G r o u p ] ' ' ] ' )  
                                     x  
             )   t  
 C R O S S   A P P L Y   x . n o d e s ( ' / / R o w ' )   A S   R   (   x   )  
                
      
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -   [ O n t o l o g y . ]  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
    
   - - [ O n t o l o g y . ] . [ C l a s s G r o u p ]  
   T R U N C A T E   T A B L E   [ O n t o l o g y . ] . [ C l a s s G r o u p ]  
   I N S E R T   I N T O   [ O n t o l o g y . ] . C l a s s G r o u p  
                   (   C l a s s G r o u p U R I   ,  
                       _ C l a s s G r o u p L a b e l   ,  
                       S o r t O r d e r   ,  
                       _ C l a s s G r o u p N o d e   ,  
                       _ N u m b e r O f N o d e s  
                   )  
     S E L E C T     R . x . v a l u e ( ' C l a s s G r o u p U R I [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' )   ,  
                     R . x . v a l u e ( ' _ C l a s s G r o u p L a b e l [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' ) ,  
                     R . x . v a l u e ( ' S o r t O r d e r [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' ) ,  
                     R . x . v a l u e ( ' _ C l a s s G r o u p N o d e [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' ) ,  
                     R . x . v a l u e ( ' _ N u m b e r O f N o d e s [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' )  
     F R O M         (   S E L E C T  
                                             @ x . q u e r y  
                                             ( ' I m p o r t [ 1 ] / T a b l e [ @ N a m e = ' ' [ O n t o l o g y . ] . [ C l a s s G r o u p ] ' ' ] ' )  
                                             x  
                     )   t  
     C R O S S   A P P L Y   x . n o d e s ( ' / / R o w ' )   A S   R   (   x   )    
    
   - - [ O n t o l o g y . ] . [ C l a s s G r o u p C l a s s ]  
   T R U N C A T E   T A B L E   [ O n t o l o g y . ] . [ C l a s s G r o u p C l a s s ]  
   I N S E R T   I N T O   [ O n t o l o g y . ] . C l a s s G r o u p C l a s s  
                   (   C l a s s G r o u p U R I   ,  
                       C l a s s U R I   ,  
                       _ C l a s s L a b e l   ,  
                       S o r t O r d e r   ,  
                       _ C l a s s G r o u p N o d e   ,  
                       _ C l a s s N o d e   ,  
                       _ N u m b e r O f N o d e s  
                   )  
     S E L E C T     R . x . v a l u e ( ' C l a s s G r o u p U R I [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' )   ,  
                     R . x . v a l u e ( ' C l a s s U R I [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' ) ,  
                     R . x . v a l u e ( ' _ C l a s s L a b e l [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' ) ,  
                     R . x . v a l u e ( ' S o r t O r d e r [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' ) ,  
                     R . x . v a l u e ( ' _ C l a s s G r o u p N o d e [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' ) ,  
                     R . x . v a l u e ( ' _ C l a s s N o d e [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' ) ,  
                     R . x . v a l u e ( ' _ N u m b e r O f N o d e s [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' )    
     F R O M         (   S E L E C T  
                                             @ x . q u e r y  
                                             ( ' I m p o r t [ 1 ] / T a b l e [ @ N a m e = ' ' [ O n t o l o g y . ] . [ C l a s s G r o u p C l a s s ] ' ' ] ' )  
                                             x  
                     )   t  
     C R O S S   A P P L Y   x . n o d e s ( ' / / R o w ' )   A S   R   (   x   )  
  
      
 - - [ O n t o l o g y . ] . [ C l a s s P r o p e r t y ]  
 I N S E R T   I N T O   [ O n t o l o g y . ] . C l a s s P r o p e r t y  
                 (   C l a s s P r o p e r t y I D ,  
                     C l a s s   ,  
                     N e t w o r k P r o p e r t y   ,  
                     P r o p e r t y   ,  
                     I s D e t a i l   ,  
                     L i m i t   ,  
                     I n c l u d e D e s c r i p t i o n   ,  
                     I n c l u d e N e t w o r k   ,  
                     S e a r c h W e i g h t   ,  
                     C u s t o m D i s p l a y   ,  
                     C u s t o m E d i t   ,  
                     V i e w S e c u r i t y G r o u p   ,  
                     E d i t S e c u r i t y G r o u p   ,  
                     E d i t P e r m i s s i o n s S e c u r i t y G r o u p   ,  
                     E d i t E x i s t i n g S e c u r i t y G r o u p   ,  
                     E d i t A d d N e w S e c u r i t y G r o u p   ,  
                     E d i t A d d E x i s t i n g S e c u r i t y G r o u p   ,  
                     E d i t D e l e t e S e c u r i t y G r o u p   ,  
                     M i n C a r d i n a l i t y   ,  
                     M a x C a r d i n a l i t y   ,  
                     C u s t o m D i s p l a y M o d u l e   ,  
                     C u s t o m E d i t M o d u l e   ,  
                     [ _ C l a s s N o d e ]   ,  
                     [ _ N e t w o r k P r o p e r t y N o d e ]   ,  
                     [ _ P r o p e r t y N o d e ]   ,  
                     [ _ T a g N a m e ]   ,  
                     [ _ P r o p e r t y L a b e l ]   ,  
                     [ _ N u m b e r O f N o d e s ]   ,  
                     [ _ N u m b e r O f T r i p l e s ]  
                 )  
 S E L E C T     R . x . v a l u e ( ' C l a s s P r o p e r t y I D [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' C l a s s [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' N e t w o r k P r o p e r t y [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' P r o p e r t y [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' I s D e t a i l [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' L i m i t [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' I n c l u d e D e s c r i p t i o n [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' I n c l u d e N e t w o r k [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' S e a r c h W e i g h t [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' C u s t o m D i s p l a y [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' C u s t o m E d i t [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' V i e w S e c u r i t y G r o u p [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' E d i t S e c u r i t y G r o u p [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' E d i t P e r m i s s i o n s S e c u r i t y G r o u p [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' E d i t E x i s t i n g S e c u r i t y G r o u p [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' E d i t A d d N e w S e c u r i t y G r o u p [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' E d i t A d d E x i s t i n g S e c u r i t y G r o u p [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' E d i t D e l e t e S e c u r i t y G r o u p [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' M i n C a r d i n a l i t y [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' M a x C a r d i n a l i t y [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 ( c a s e   w h e n   C A S T ( R . x . q u e r y ( ' C u s t o m D i s p l a y M o d u l e [ 1 ] / * ' )   A S   N V A R C H A R ( M A X ) ) < > ' '   t h e n   R . x . q u e r y ( ' C u s t o m D i s p l a y M o d u l e [ 1 ] / * ' )   e l s e   N U L L   e n d ) ,  
 	 	 ( c a s e   w h e n   C A S T ( R . x . q u e r y ( ' C u s t o m E d i t M o d u l e [ 1 ] / * ' )   A S   N V A R C H A R ( M A X ) ) < > ' '   t h e n   R . x . q u e r y ( ' C u s t o m E d i t M o d u l e [ 1 ] / * ' )   e l s e   N U L L   e n d )   ,  
 	 	 R . x . v a l u e ( ' _ C l a s s N o d e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' _ N e t w o r k P r o p e r t y N o d e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' _ P r o p e r t y N o d e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' _ T a g N a m e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' _ P r o p e r t y L a b e l [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,    
 	 	 R . x . v a l u e ( ' _ N u m b e r O f N o d e s [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 R . x . v a l u e ( ' _ N u m b e r O f T r i p l e s [ 1 ] ' , ' v a r c h a r ( m a x ) ' )  
     F R O M         (   S E L E C T  
                                             @ x . q u e r y  
                                             ( ' I m p o r t [ 1 ] / T a b l e [ @ N a m e = ' ' [ O n t o l o g y . ] . [ C l a s s P r o p e r t y ] ' ' ] ' )  
                                             x  
                     )   t  
     C R O S S   A P P L Y   x . n o d e s ( ' / / R o w ' )   A S   R   (   x   )  
  
      
     - - [ O n t o l o g y . ] . [ D a t a M a p ]  
     T R U N C A T E   T A B L E   [ O n t o l o g y . ] . D a t a M a p  
     I N S E R T   I N T O   [ O n t o l o g y . ] . D a t a M a p  
                     (   D a t a M a p I D ,  
 	 	 	 D a t a M a p G r o u p   ,  
                         I s A u t o F e e d   ,  
                         G r a p h   ,  
                         C l a s s   ,  
                         N e t w o r k P r o p e r t y   ,  
                         P r o p e r t y   ,  
                         M a p T a b l e   ,  
                         s I n t e r n a l T y p e   ,  
                         s I n t e r n a l I D   ,  
                         c C l a s s   ,  
                         c I n t e r n a l T y p e   ,  
                         c I n t e r n a l I D   ,  
                         o C l a s s   ,  
                         o I n t e r n a l T y p e   ,  
                         o I n t e r n a l I D   ,  
                         o V a l u e   ,  
                         o D a t a T y p e   ,  
                         o L a n g u a g e   ,  
                         o S t a r t D a t e   ,  
                         o S t a r t D a t e P r e c i s i o n   ,  
                         o E n d D a t e   ,  
                         o E n d D a t e P r e c i s i o n   ,  
                         o O b j e c t T y p e   ,  
                         W e i g h t   ,  
                         O r d e r B y   ,  
                         V i e w S e c u r i t y G r o u p   ,  
                         E d i t S e c u r i t y G r o u p   ,  
                         [ _ C l a s s N o d e ]   ,  
                         [ _ N e t w o r k P r o p e r t y N o d e ]   ,  
                         [ _ P r o p e r t y N o d e ]  
                     )  
     S E L E C T         R . x . v a l u e ( ' D a t a M a p I D [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' D a t a M a p G r o u p [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' I s A u t o F e e d [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' G r a p h [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' C l a s s [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' N e t w o r k P r o p e r t y [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' P r o p e r t y [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' M a p T a b l e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' s I n t e r n a l T y p e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' s I n t e r n a l I D [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' c C l a s s [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' c I n t e r n a l T y p e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' c I n t e r n a l I D [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' o C l a s s [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' o I n t e r n a l T y p e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' o I n t e r n a l I D [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' o V a l u e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' o D a t a T y p e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' o L a n g u a g e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' o S t a r t D a t e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' o S t a r t D a t e P r e c i s i o n [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' o E n d D a t e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' o E n d D a t e P r e c i s i o n [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' o O b j e c t T y p e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' W e i g h t [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' O r d e r B y [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' V i e w S e c u r i t y G r o u p [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' E d i t S e c u r i t y G r o u p [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' _ C l a s s N o d e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' _ N e t w o r k P r o p e r t y N o d e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' _ P r o p e r t y N o d e [ 1 ] ' , ' v a r c h a r ( m a x ) ' )  
     F R O M         (   S E L E C T  
                                             @ x . q u e r y  
                                             ( ' I m p o r t [ 1 ] / T a b l e [ @ N a m e = ' ' [ O n t o l o g y . ] . [ D a t a M a p ] ' ' ] ' )  
                                             x  
                     )   t  
     C R O S S   A P P L Y   x . n o d e s ( ' / / R o w ' )   A S   R   (   x   )  
      
      
   - -   [ O n t o l o g y . ] . [ N a m e s p a c e ]  
   T R U N C A T E   T A B L E   [ O n t o l o g y . ] . [ N a m e s p a c e ]  
   I N S E R T   I N T O   [ O n t o l o g y . ] . [ N a m e s p a c e ]  
                 (   U R I   ,  
                     P r e f i x  
                 )  
     S E L E C T     R . x . v a l u e ( ' U R I [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' )   ,  
                     R . x . v a l u e ( ' P r e f i x [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' )  
     F R O M         (   S E L E C T  
                                             @ x . q u e r y  
                                             ( ' I m p o r t [ 1 ] / T a b l e [ @ N a m e = ' ' [ O n t o l o g y . ] . [ N a m e s p a c e ] ' ' ] ' )  
                                             x  
                     )   t  
     C R O S S   A P P L Y   x . n o d e s ( ' / / R o w ' )   A S   R   (   x   )  
      
  
       - - [ O n t o l o g y . ] . [ P r o p e r t y G r o u p ]  
       I N S E R T   I N T O   [ O n t o l o g y . ] . P r o p e r t y G r o u p  
                       (   P r o p e r t y G r o u p U R I   ,  
                           S o r t O r d e r   ,  
                           [ _ P r o p e r t y G r o u p L a b e l ]   ,  
                           [ _ P r o p e r t y G r o u p N o d e ]   ,  
                           [ _ N u m b e r O f N o d e s ]  
                       )    
 	 S E L E C T 	 R . x . v a l u e ( ' P r o p e r t y G r o u p U R I [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' S o r t O r d e r [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' _ P r o p e r t y G r o u p L a b e l [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,    
 	 	 	 R . x . v a l u e ( ' _ P r o p e r t y G r o u p N o d e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' _ N u m b e r O f N o d e s [ 1 ] ' , ' v a r c h a r ( m a x ) ' )  
 	   F R O M         (   S E L E C T  
                                             @ x . q u e r y  
                                             ( ' I m p o r t [ 1 ] / T a b l e [ @ N a m e = ' ' [ O n t o l o g y . ] . [ P r o p e r t y G r o u p ] ' ' ] ' )  
                                             x  
                     )   t  
     C R O S S   A P P L Y   x . n o d e s ( ' / / R o w ' )   A S   R   (   x   )  
      
      
 	 - - [ O n t o l o g y . ] . [ P r o p e r t y G r o u p P r o p e r t y ]  
 	 I N S E R T   I N T O   [ O n t o l o g y . ] . P r o p e r t y G r o u p P r o p e r t y  
 	                 (   P r o p e r t y G r o u p U R I   ,  
 	                     P r o p e r t y U R I   ,  
 	                     S o r t O r d e r   ,  
 	                     C u s t o m D i s p l a y M o d u l e   ,  
 	                     C u s t o m E d i t M o d u l e   ,  
 	                     [ _ P r o p e r t y G r o u p N o d e ]   ,  
 	                     [ _ P r o p e r t y N o d e ]   ,  
 	                     [ _ T a g N a m e ]   ,  
 	                     [ _ P r o p e r t y L a b e l ]   ,  
 	                     [ _ N u m b e r O f N o d e s ]  
 	                 )    
 	 S E L E C T 	 R . x . v a l u e ( ' P r o p e r t y G r o u p U R I [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' P r o p e r t y U R I [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' S o r t O r d e r [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 ( c a s e   w h e n   C A S T ( R . x . q u e r y ( ' C u s t o m D i s p l a y M o d u l e [ 1 ] / * ' )   A S   N V A R C H A R ( M A X ) ) < > ' '   t h e n   R . x . q u e r y ( ' C u s t o m D i s p l a y M o d u l e [ 1 ] / * ' )   e l s e   N U L L   e n d ) ,  
 	 	 	 ( c a s e   w h e n   C A S T ( R . x . q u e r y ( ' C u s t o m E d i t M o d u l e [ 1 ] / * ' )   A S   N V A R C H A R ( M A X ) ) < > ' '   t h e n   R . x . q u e r y ( ' C u s t o m E d i t M o d u l e [ 1 ] / * ' )   e l s e   N U L L   e n d ) ,  
 	 	 	 R . x . v a l u e ( ' _ P r o p e r t y G r o u p N o d e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' _ P r o p e r t y N o d e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' _ T a g N a m e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' _ P r o p e r t y L a b e l [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' _ N u m b e r O f N o d e s [ 1 ] ' , ' v a r c h a r ( m a x ) ' )  
 	   F R O M         (   S E L E C T  
                                             @ x . q u e r y  
                                             ( ' I m p o r t [ 1 ] / T a b l e [ @ N a m e = ' ' [ O n t o l o g y . ] . [ P r o p e r t y G r o u p P r o p e r t y ] ' ' ] ' )  
                                             x  
                     )   t  
     C R O S S   A P P L Y   x . n o d e s ( ' / / R o w ' )   A S   R   (   x   )  
      
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -   [ O n t o l o g y . P r e s e n t a t i o n ]  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
  
   - - [ O n t o l o g y . P r e s e n t a t i o n ] . [ X M L ]  
   I N S E R T   I N T O   [ O n t o l o g y . P r e s e n t a t i o n ] . [ X M L ]  
                   (   P r e s e n t a t i o n I D ,  
 	 	 	 t y p e   ,  
                       s u b j e c t   ,  
                       p r e d i c a t e   ,  
                       o b j e c t   ,  
                       p r e s e n t a t i o n X M L   ,  
                       _ S u b j e c t N o d e   ,  
                       _ P r e d i c a t e N o d e   ,  
                       _ O b j e c t N o d e  
                   )                
     S E L E C T     R . x . v a l u e ( ' P r e s e n t a t i o n I D [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' )   ,  
 	 	     R . x . v a l u e ( ' t y p e [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' )   ,  
                     R . x . v a l u e ( ' s u b j e c t [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' ) ,  
                     R . x . v a l u e ( ' p r e d i c a t e [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' ) ,  
                     R . x . v a l u e ( ' o b j e c t [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' ) ,  
                     ( c a s e   w h e n   C A S T ( R . x . q u e r y ( ' p r e s e n t a t i o n X M L [ 1 ] / * ' )   A S   N V A R C H A R ( M A X ) ) < > ' '   t h e n   R . x . q u e r y ( ' p r e s e n t a t i o n X M L [ 1 ] / * ' )   e l s e   N U L L   e n d )   ,    
                     R . x . v a l u e ( ' _ S u b j e c t N o d e [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' ) ,  
                     R . x . v a l u e ( ' _ P r e d i c a t e N o d e [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' ) ,  
                     R . x . v a l u e ( ' _ O b j e c t N o d e [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' )  
     F R O M         (   S E L E C T  
                                             @ x . q u e r y  
                                             ( ' I m p o r t [ 1 ] / T a b l e [ @ N a m e = ' ' [ O n t o l o g y . P r e s e n t a t i o n ] . [ X M L ] ' ' ] ' )  
                                             x  
                     )   t  
     C R O S S   A P P L Y   x . n o d e s ( ' / / R o w ' )   A S   R   (   x   )  
  
      
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -   [ R D F . S e c u r i t y ]  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
                            
   - -   [ R D F . S e c u r i t y ] . [ G r o u p ]  
   T R U N C A T E   T A B L E   [ R D F . S e c u r i t y ] . [ G r o u p ]  
   I N S E R T   I N T O   [ R D F . S e c u r i t y ] . [ G r o u p ]  
    
                   (   S e c u r i t y G r o u p I D   ,  
                       L a b e l   ,  
                       H a s S p e c i a l V i e w A c c e s s   ,  
                       H a s S p e c i a l E d i t A c c e s s   ,  
                       D e s c r i p t i o n  
                   )  
   S E L E C T       R . x . v a l u e ( ' S e c u r i t y G r o u p I D [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' )   ,  
                     R . x . v a l u e ( ' L a b e l [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' ) ,  
                     R . x . v a l u e ( ' H a s S p e c i a l V i e w A c c e s s [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' ) ,  
                     R . x . v a l u e ( ' H a s S p e c i a l E d i t A c c e s s [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' ) ,  
                     R . x . v a l u e ( ' D e s c r i p t i o n [ 1 ] ' ,   ' v a r c h a r ( m a x ) ' )  
     F R O M         (   S E L E C T  
                                             @ x . q u e r y  
                                             ( ' I m p o r t [ 1 ] / T a b l e [ @ N a m e = ' ' [ R D F . S e c u r i t y ] . [ G r o u p ] ' ' ] ' )  
                                             x  
                     )   t  
     C R O S S   A P P L Y   x . n o d e s ( ' / / R o w ' )   A S   R   (   x   )    
  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -   [ U t i l i t y . N L P ]  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
        
 	 - - [ U t i l i t y . N L P ] . [ P a r s e P o r t e r S t e m m i n g ]  
 	 I N S E R T   I N T O   [ U t i l i t y . N L P ] . P a r s e P o r t e r S t e m m i n g  
 	                 (   S t e p ,   O r d e r i n g ,   p h r a s e 1 ,   p h r a s e 2   )    
 	 S E L E C T 	 R . x . v a l u e ( ' S t e p [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' O r d e r i n g [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,    
 	 	 	 R . x . v a l u e ( ' p h r a s e 1 [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,    
 	 	 	 R . x . v a l u e ( ' p h r a s e 2 [ 1 ] ' , ' v a r c h a r ( m a x ) ' )  
 	   F R O M         (   S E L E C T  
                                             @ x . q u e r y  
                                             ( ' I m p o r t [ 1 ] / T a b l e [ @ N a m e = ' ' [ U t i l i t y . N L P ] . [ P a r s e P o r t e r S t e m m i n g ] ' ' ] ' )  
                                             x  
                     )   t  
     C R O S S   A P P L Y   x . n o d e s ( ' / / R o w ' )   A S   R   (   x   )  
 	  
 	 - - [ U t i l i t y . N L P ] . [ S t o p W o r d ]  
 	 I N S E R T   I N T O   [ U t i l i t y . N L P ] . S t o p W o r d  
 	                 (   w o r d ,   s t e m ,   s c o p e   )    
 	 S E L E C T 	 R . x . v a l u e ( ' w o r d [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' s t e m [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' s c o p e [ 1 ] ' , ' v a r c h a r ( m a x ) ' )  
 	   F R O M         (   S E L E C T  
                                             @ x . q u e r y  
                                             ( ' I m p o r t [ 1 ] / T a b l e [ @ N a m e = ' ' [ U t i l i t y . N L P ] . [ S t o p W o r d ] ' ' ] ' )  
                                             x  
                     )   t  
     C R O S S   A P P L Y   x . n o d e s ( ' / / R o w ' )   A S   R   (   x   )  
      
 	 - - [ U t i l i t y . N L P ] . [ T h e s a u r u s . S o u r c e ]  
 	 I N S E R T   I N T O   [ U t i l i t y . N L P ] . [ T h e s a u r u s . S o u r c e ]  
 	                 (   S o u r c e ,   S o u r c e N a m e   )    
 	 S E L E C T 	 R . x . v a l u e ( ' S o u r c e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' S o u r c e N a m e [ 1 ] ' , ' v a r c h a r ( m a x ) ' )  
 	   F R O M         (   S E L E C T  
                                             @ x . q u e r y  
                                             ( ' I m p o r t [ 1 ] / T a b l e [ @ N a m e = ' ' [ U t i l i t y . N L P ] . [ T h e s a u r u s . S o u r c e ] ' ' ] ' )  
                                             x  
                     )   t  
     C R O S S   A P P L Y   x . n o d e s ( ' / / R o w ' )   A S   R   (   x   )  
  
  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -   [ U s e r . S e s s i o n ]  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
  
     - - [ U s e r . S e s s i o n ] . B o t 	 	  
     I N S E R T   I N T O   [ U s e r . S e s s i o n ] . B o t     (   U s e r A g e n t   )  
       S E L E C T 	 R . x . v a l u e ( ' U s e r A g e n t [ 1 ] ' , ' v a r c h a r ( m a x ) ' )    
 	   F R O M         (   S E L E C T  
                                             @ x . q u e r y  
                                             ( ' I m p o r t [ 1 ] / T a b l e [ @ N a m e = ' ' [ U s e r . S e s s i o n ] . B o t ' ' ] ' )  
                                             x  
                     )   t  
     C R O S S   A P P L Y   x . n o d e s ( ' / / R o w ' )   A S   R   (   x   )  
      
      
      
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -   [ D i r e c t . ]  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
        
     - - [ D i r e c t . ] . [ S i t e s ]  
     I N S E R T   I N T O   [ D i r e c t . ] . [ S i t e s ]  
                     (   S i t e I D   ,  
                         B o o t s t r a p U R L   ,  
                         S i t e N a m e   ,  
                         Q u e r y U R L   ,  
                         S o r t O r d e r   ,  
                         I s A c t i v e  
                     )  
     S E L E C T 	 R . x . v a l u e ( ' S i t e I D [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' B o o t s t r a p U R L [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' S i t e N a m e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' Q u e r y U R L [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' S o r t O r d e r [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' I s A c t i v e [ 1 ] ' , ' v a r c h a r ( m a x ) ' )  
 	   F R O M         (   S E L E C T  
                                             @ x . q u e r y  
                                             ( ' I m p o r t [ 1 ] / T a b l e [ @ N a m e = ' ' [ D i r e c t . ] . [ S i t e s ] ' ' ] ' )  
                                             x  
                     )   t  
     C R O S S   A P P L Y   x . n o d e s ( ' / / R o w ' )   A S   R   (   x   )  
 	  
 	  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
 - -   [ P r o f i l e . D a t a ]  
 - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  
    
         - - [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . T y p e ] 	 	  
     I N S E R T   I N T O   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . T y p e ]  
                     (   p u b i d t y p e _ i d ,   n a m e ,   s o r t _ o r d e r   )  
                        
       S E L E C T 	 R . x . v a l u e ( ' p u b i d t y p e _ i d [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' n a m e [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' s o r t _ o r d e r [ 1 ] ' , ' v a r c h a r ( m a x ) ' )  
 	   F R O M         ( S E L E C T  
                                             @ x . q u e r y  
                                             ( ' I m p o r t [ 1 ] / T a b l e [ @ N a m e = ' ' [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . T y p e ] ' ' ] ' )  
                                             x  
                     )   t  
     C R O S S   A P P L Y   x . n o d e s ( ' / / R o w ' )   A S   R   (   x   )  
        
     - - [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . M y P u b . C a t e g o r y ]  
     T R U N C A T E   T A B L E   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . M y P u b . C a t e g o r y ]  
     I N S E R T   I N T O   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . M y P u b . C a t e g o r y ]  
                     (   [ H m s P u b C a t e g o r y ]   ,  
                         [ C a t e g o r y N a m e ]  
                     )    
       S E L E C T 	 R . x . v a l u e ( ' H m s P u b C a t e g o r y [ 1 ] ' , ' v a r c h a r ( m a x ) ' ) ,  
 	 	 	 R . x . v a l u e ( ' C a t e g o r y N a m e [ 1 ] ' , ' v a r c h a r ( m a x ) ' )  
 	   F R O M         ( S E L E C T  
                                             @ x . q u e r y  
                                             ( ' I m p o r t [ 1 ] / T a b l e [ @ N a m e = ' ' [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . M y P u b . C a t e g o r y ] ' ' ] ' )  
                                             x  
                     )   t  
     C R O S S   A P P L Y   x . n o d e s ( ' / / R o w ' )   A S   R   (   x   )  
      
      
     - -   U s e   t o   g e n e r a t e   s e l e c t   l i s t s   f o r   n e w   t a b l e s  
     - -   S E L E C T       ' R . x . v a l u e ( ' ' '   +   c . n a m e   +     ' [ 1 ] ' ' , '   +   ' ' ' v a r c h a r ( m a x ) ' ' ) ' +   ' , '   , *    
     - -   F R O M   s y s . c o l u m n s   c    
     - -   J O I N     s y s . t y p e s   t   O N   t . s y s t e m _ t y p e _ i d   =   c . s y s t e m _ t y p e _ i d    
     - -   W H E R E   o b j e c t _ i d   I N   ( S E L E C T   o b j e c t _ i d   F R O M   s y s . t a b l e s   W H E R E   n a m e   =   ' P u b l i c a t i o n . M y P u b . C a t e g o r y ' )    
     - - A N D   T . N A M E < > ' s y s n a m e ' O R D E R   B Y   c . c o l u m n _ i d  
 	    
 E N D  
  
  
  
  
  
  
  
  
  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ F r a m e w o r k . ] . [ L I C E N C E ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ F r a m e w o r k . ] . [ L I C E N C E ]  
 A S  
 B E G I N  
 P R I N T    
 '  
 C o p y r i g h t   ( c )   2 0 0 8 - 2 0 1 2   b y   t h e   P r e s i d e n t   a n d   F e l l o w s   o f   H a r v a r d   C o l l e g e .   A l l   r i g h t s   r e s e r v e d .     P r o f i l e s   R e s e a r c h   N e t w o r k i n g   S o f t w a r e   w a s   d e v e l o p e d   u n d e r   t h e   s u p e r v i s i o n   o f   G r i f f i n   M   W e b e r ,   M D ,   P h D . ,   a n d   H a r v a r d   C a t a l y s t :   T h e   H a r v a r d   C l i n i c a l   a n d   T r a n s l a t i o n a l   S c i e n c e   C e n t e r ,   w i t h   s u p p o r t   f r o m   t h e   N a t i o n a l   C e n t e r   f o r   R e s e a r c h   R e s o u r c e s   a n d   H a r v a r d   U n i v e r s i t y .  
    
 R e d i s t r i b u t i o n   a n d   u s e   i n   s o u r c e   a n d   b i n a r y   f o r m s ,   w i t h   o r   w i t h o u t   m o d i f i c a t i o n ,   a r e   p e r m i t t e d   p r o v i d e d   t h a t   t h e   f o l l o w i n g   c o n d i t i o n s   a r e   m e t :  
 	 *   R e d i s t r i b u t i o n s   o f   s o u r c e   c o d e   m u s t   r e t a i n   t h e   a b o v e   c o p y r i g h t   n o t i c e ,   t h i s   l i s t   o f   c o n d i t i o n s   a n d   t h e   f o l l o w i n g   d i s c l a i m e r .  
 	 *   R e d i s t r i b u t i o n s   i n   b i n a r y   f o r m   m u s t   r e p r o d u c e   t h e   a b o v e   c o p y r i g h t   n o t i c e ,   t h i s   l i s t   o f   c o n d i t i o n s   a n d   t h e   f o l l o w i n g   d i s c l a i m e r   i n   t h e   d o c u m e n t a t i o n   a n d / o r   o t h e r   m a t e r i a l s   p r o v i d e d   w i t h   t h e   d i s t r i b u t i o n .  
 	 *   N e i t h e r   t h e   n a m e   " H a r v a r d "   n o r   t h e   n a m e s   o f   i t s   c o n t r i b u t o r s   n o r   t h e   n a m e   " H a r v a r d   C a t a l y s t "   m a y   b e   u s e d   t o   e n d o r s e   o r   p r o m o t e   p r o d u c t s   d e r i v e d   f r o m   t h i s   s o f t w a r e   w i t h o u t   s p e c i f i c   p r i o r   w r i t t e n   p e r m i s s i o n .  
    
 T H I S   S O F T W A R E   I S   P R O V I D E D   B Y   T H E   C O P Y R I G H T   H O L D E R   ( P R E S I D E N T   A N D   F E L L O W S   O F   H A R V A R D   C O L L E G E )   A N D   C O N T R I B U T O R S   " A S   I S "   A N D   A N Y   E X P R E S S   O R   I M P L I E D   W A R R A N T I E S ,   I N C L U D I N G ,   B U T   N O T   L I M I T E D   T O ,   T H E   I M P L I E D   W A R R A N T I E S   O F   M E R C H A N T A B I L I T Y   A N D   F I T N E S S   F O R   A   P A R T I C U L A R   P U R P O S E   A R E   D I S C L A I M E D .   I N   N O   E V E N T   S H A L L   T H E   C O P Y R I G H T   H O L D E R   O R   C O N T R I B U T O R S   B E   L I A B L E   F O R   A N Y   D I R E C T ,   I N D I R E C T ,   I N C I D E N T A L ,   S P E C I A L ,   E X E M P L A R Y ,   O R   C O N S E Q U E N T I A L   D A M A G E S   ( I N C L U D I N G ,   B U T   N O T   L I M I T E D   T O ,   P R O C U R E M E N T   O F   S U B S T I T U T E   G O O D S   O R   S E R V I C E S ;   L O S S   O F   U S E ,   D A T A ,   O R   P R O F I T S ;   O R   B U S I N E S S   I N T E R R U P T I O N )   H O W E V E R   C A U S E D   A N D   O N   A N Y   T H E O R Y   O F   L I A B I L I T Y ,   W H E T H E R   I N   C O N T R A C T ,   S T R I C T   L I A B I L I T Y ,   O R   T O R T   ( I N C L U D I N G   N E G L I G E N C E   O R   O T H E R W I S E )   A R I S I N G   I N   A N Y   W A Y   O U T   O F   T H E   U S E   O F   T H I S   S O F T W A R E ,   E V E N   I F   A D V I S E D   O F   T H E   P O S S I B I L I T Y   O F   S U C H   D A M A G E .  
 '  
 E N D          
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ E d i t . F r a m e w o r k ] . [ R e s o l v e U R L ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ E d i t . F r a m e w o r k ] . [ R e s o l v e U R L ]  
 	 @ A p p l i c a t i o n N a m e   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 1   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 2   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 3   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 4   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 5   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 6   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 7   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 8   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 9   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ S e s s i o n I D   u n i q u e i d e n t i f i e r   =   n u l l ,  
 	 @ C o n t e n t T y p e   v a r c h a r ( 2 5 5 )   =   n u l l ,  
 	 @ R e s o l v e d   b i t   O U T P U T ,  
 	 @ E r r o r D e s c r i p t i o n   v a r c h a r ( m a x )   O U T P U T ,  
 	 @ R e s p o n s e U R L   v a r c h a r ( 1 0 0 0 )   O U T P U T ,  
 	 @ R e s p o n s e C o n t e n t T y p e   v a r c h a r ( 2 5 5 )   O U T P U T ,  
 	 @ R e s p o n s e S t a t u s C o d e   i n t   O U T P U T ,  
 	 @ R e s p o n s e R e d i r e c t   b i t   O U T P U T ,  
 	 @ R e s p o n s e I n c l u d e P o s t D a t a   b i t   O U T P U T  
  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
 	  
 	 - -   B y   d e f a u l t   w e   w e r e   n o t   a b l e   t o   r e s o l v e   t h e   U R L  
 	 S E L E C T   @ R e s o l v e d   =   0  
  
 	 - -   L o a d   p a r a m   v a l u e s   i n t o   a   t a b l e  
 	 D E C L A R E   @ p a r a m s   T A B L E   ( i d   i n t ,   v a l   v a r c h a r ( 1 0 0 0 ) )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 1 ,   @ p a r a m 1 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 2 ,   @ p a r a m 2 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 3 ,   @ p a r a m 3 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 4 ,   @ p a r a m 4 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 5 ,   @ p a r a m 5 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 6 ,   @ p a r a m 6 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 7 ,   @ p a r a m 7 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 8 ,   @ p a r a m 8 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 9 ,   @ p a r a m 9 )  
  
 	 D E C L A R E   @ M a x P a r a m   i n t  
 	 S E L E C T   @ M a x P a r a m   =   0  
 	 S E L E C T   @ M a x P a r a m   =   M A X ( i d )   F R O M   @ p a r a m s   W H E R E   v a l   >   ' '  
  
 	 D E C L A R E   @ T a b P a r a m   i n t  
 	 S E L E C T   @ T a b P a r a m   =   3  
  
 	 D E C L A R E   @ R E D I R E C T P A G E   V A R C H A R ( 2 5 5 )  
 	  
 	 S E L E C T   @ R E D I R E C T P A G E   =   ' ~ / e d i t / d e f a u l t . a s p x '  
  
  
 - - t h i s   i s   f o r   t h e   d i s p l a y   o f   t h e   p e o p l e   s e a r c h   r e s u l t s   i f   a   q u e r y I D   e x i s t s .  
 	 	 i f ( @ P a r a m 1 	 < > 	 ' '   a n d   I s N u m e r i c ( @ P a r a m 1 ) = 1 )  
 	 	 B E G I N  
  
 	 	 	 S E L E C T   @ R e s o l v e d   =   1 ,  
 	 	 	 	 @ E r r o r D e s c r i p t i o n   =   ' ' ,  
 	 	 	 	 @ R e s p o n s e U R L   =   @ R E D I R E C T P A G E     +   ' ? s u b j e c t = '   +   @ P a r a m 1 	 	 	 	 	 	 	  
 	 	 	 	  
 	 	 	 	 	  
 	 	 E N D 	 	  
  
  
 s e t 	 @ R e s p o n s e C o n t e n t T y p e   = ' '  
 s e t 	 @ R e s p o n s e S t a t u s C o d e     = ' '  
 s e t 	 @ R e s p o n s e R e d i r e c t   = 0  
 s e t 	 @ R e s p o n s e I n c l u d e P o s t D a t a   = 0  
  
  
  
  
  
  
  
  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ D i r e c t . F r a m e w o r k ] . [ R e s o l v e U R L ] '  
 G O  
 / *  
 d e c l a r e   @ r e s o l v e d   b i t  
 d e c l a r e   @ t   u n i q u e i d e n t i f i e r  
 s e t   @ t   =   ' 7 1 9 4 9 1 A F - F 4 B 2 - 4 8 C 0 - B 2 6 4 - 4 6 5 D 4 6 7 3 0 A B 1 ' ;  
 	 d e c l a r e   @ E r r o r D e s c r i p t i o n   v a r c h a r ( m a x )    
 	 d e c l a r e   @ R e s p o n s e U R L   v a r c h a r ( 1 0 0 0 )    
 	 d e c l a r e   @ R e s p o n s e C o n t e n t T y p e   v a r c h a r ( 2 5 5 )    
 	 d e c l a r e   @ R e s p o n s e S t a t u s C o d e   i n t    
 	 d e c l a r e   @ R e s p o n s e R e d i r e c t   b i t    
 	 d e c l a r e   @ R e s p o n s e I n c l u d e P o s t D a t a   b i t    
  
  
  
 e x e c   [ D i r e c t . F r a m e w o r k ] . [ R e s o l v e D i r e c t U R L ]   ' d i r e c t ' , ' d i r e c t s e r v i c e . a s p x ' ,   ' a s d f ' , ' ' , ' ' , ' ' , ' ' , ' ' , ' ' , ' ' , @ t , ' ' ,   @ r e s o l v e d   o u t p u t ,    
 	   @ E r r o r D e s c r i p t i o n   o u t p u t ,  
 	   @ R e s p o n s e U R L   o u t p u t ,  
 	   @ R e s p o n s e C o n t e n t T y p e   o u t p u t ,  
 	   @ R e s p o n s e S t a t u s C o d e   o u t p u t ,  
 	   @ R e s p o n s e R e d i r e c t   o u t p u t ,  
 	   @ R e s p o n s e I n c l u d e P o s t D a t a   o u t p u t  
  
  
  
 s e l e c t   @ R e s p o n s e U R L  
  
 * /  
 C R E A T E   P R O C E D U R E   [ D i r e c t . F r a m e w o r k ] . [ R e s o l v e U R L ]  
 	 @ A p p l i c a t i o n N a m e   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 1   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 2   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 3   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 4   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 5   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 6   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 7   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 8   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ p a r a m 9   v a r c h a r ( 1 0 0 0 )   =   ' ' ,  
 	 @ S e s s i o n I D   u n i q u e i d e n t i f i e r   =   n u l l ,  
 	 @ C o n t e n t T y p e   v a r c h a r ( 2 5 5 )   =   n u l l ,  
 	 @ R e s o l v e d   b i t   O U T P U T ,  
 	 @ E r r o r D e s c r i p t i o n   v a r c h a r ( m a x )   O U T P U T ,  
 	 @ R e s p o n s e U R L   v a r c h a r ( 1 0 0 0 )   O U T P U T ,  
 	 @ R e s p o n s e C o n t e n t T y p e   v a r c h a r ( 2 5 5 )   O U T P U T ,  
 	 @ R e s p o n s e S t a t u s C o d e   i n t   O U T P U T ,  
 	 @ R e s p o n s e R e d i r e c t   b i t   O U T P U T ,  
 	 @ R e s p o n s e I n c l u d e P o s t D a t a   b i t   O U T P U T  
  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
 	  
 	 - -   B y   d e f a u l t   w e   w e r e   n o t   a b l e   t o   r e s o l v e   t h e   U R L  
 	 S E L E C T   @ R e s o l v e d   =   0  
  
 	 - -   L o a d   p a r a m   v a l u e s   i n t o   a   t a b l e  
 	 D E C L A R E   @ p a r a m s   T A B L E   ( i d   i n t ,   v a l   v a r c h a r ( 1 0 0 0 ) )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 1 ,   @ p a r a m 1 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 2 ,   @ p a r a m 2 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 3 ,   @ p a r a m 3 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 4 ,   @ p a r a m 4 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 5 ,   @ p a r a m 5 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 6 ,   @ p a r a m 6 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 7 ,   @ p a r a m 7 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 8 ,   @ p a r a m 8 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 9 ,   @ p a r a m 9 )  
  
 	 D E C L A R E   @ M a x P a r a m   i n t  
 	 S E L E C T   @ M a x P a r a m   =   0  
 	 S E L E C T   @ M a x P a r a m   =   M A X ( i d )   F R O M   @ p a r a m s   W H E R E   v a l   >   ' '  
  
 	 D E C L A R E   @ T a b P a r a m   i n t  
 	 S E L E C T   @ T a b P a r a m   =   3  
  
 	 D E C L A R E   @ R E D I R E C T P A G E   V A R C H A R ( 2 5 5 )  
 	  
 	 S E L E C T   @ R E D I R E C T P A G E   =   ' ~ / d i r e c t / d e f a u l t . a s p x '  
  
 	 - -   R e t u r n   r e s u l t s  
 	 I F   ( @ E r r o r D e s c r i p t i o n   I S   N U L L )  
 	 B E G I N  
  
 	 	 i f ( @ A p p l i c a t i o n N a m e   =   ' d i r e c t '   a n d   @ p a r a m 1   < >   ' '   a n d   @ p a r a m 2   =   ' ' )  
 	 	 B E G I N  
 	 	 	 S E L E C T   @ R e s o l v e d   =   1 ,  
 	 	 	 	 @ E r r o r D e s c r i p t i o n   =   ' ' ,  
 	 	 	 	 @ R e s p o n s e U R L   =   @ R E D I R E C T P A G E   +   ' ? q u e r y i d = '   +   @ p a r a m 1  
 	 	 	 	 	  
 	 	 E N D  
  
  
 	 	 i f ( @ A p p l i c a t i o n N a m e   =   ' d i r e c t '   a n d   @ p a r a m 1   < >   ' '   a n d   @ p a r a m 2   < >   ' ' )  
 	 	 B E G I N  
 	 	 	 S E L E C T   @ R e s o l v e d   =   1 ,  
 	 	 	 	 @ E r r o r D e s c r i p t i o n   =   ' ' ,  
 	 	 	 	 @ R e s p o n s e U R L   =   @ R E D I R E C T P A G E   +   ' ? q u e r y i d = '   +   @ p a r a m 1   +   ' & s t o p = t r u e '  
 	 	 	 	 	  
 	 	 E N D  
 	  
 	 	 s e t 	 @ R e s p o n s e C o n t e n t T y p e   = ' '  
 	 	 s e t 	 @ R e s p o n s e S t a t u s C o d e     = ' '  
 	 	 s e t 	 @ R e s p o n s e R e d i r e c t   = 0  
 	 	 s e t 	 @ R e s p o n s e I n c l u d e P o s t D a t a   = 0  
 	 	 	 	  
 	 E N D  
  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ F r a m e w o r k . ] . [ L o a d X M L F i l e ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ F r a m e w o r k . ] . [ L o a d X M L F i l e ] ( @ F i l e P a t h   v a r c h a r ( m a x ) ,   @ T a b l e D e s t i n a t i o n   V A R C H A R ( M A X ) ,   @ D e s t i n a t i o n C o l u m n   V A R C H A R ( M A X ) ,   @ N a m e V a l u e   V A R C H A R ( M A X ) = N U L L   )  
 A S  
 B E G I N  
 	    
 	 S E T   N O C O U N T   O N ;  
  
 	 / *  
  
 	 T h i s   s t o r e d   p r o c e d u r e   i m p o r t s   t h e   c o n t e n t s   o f   a n   x m l   f i l e   i n t o   t h e    
 	 s p e c i f i e d   t a b l e   a n d   c o l u m n   f r o m   a   s u p p l i e d   f i l e p a t h .    
  
 	 I n p u t   p a r a m e t e r s :  
 	 	 @ F i l e P a t h 	 	 	 	 P a t h   w h e r e   x m l   d a t a   f i l e   e x i s t s ,   r e l a t i v e   t o   t h e   s q l   s e r v e r . 	 	      
 	 	 @ T a b l e D e s t i n a t i o n 	 	 T a b l e   w h e r e   d a t a   i s   t o   b e   s t o r e d  
 	 	 @ D e s t i n a t i o n C o l u m n 	 	 C o l u m n   w h e r e   d a t a   i s   t o   b e   s t o r e d  
 	 	 @ N a m e V a l u e 	 	 	 	 N a m e   o f   t h e   f i l e   ( o p t i o n a l )  
  
 	 T e s t   C a l l :  
 	 	 [ F r a m e w o r k . ] . [ u s p L o a d X M L F i l e ]   ' c : \ I n s t a l l D a t a . x m l ' ,   ' [ F r a m e w o r k . ] . [ I n s t a l l D a t a ] ' ,   ' D a t a ' ,   ' V I V O _ 1 . 4 '  
 	 	  
 	 * /  
  
 	 D E C L A R E   @ s q l   N V A R C H A R ( M A X )  
 	    
 	 S E L E C T   @ S Q L   =   ' I N S E R T   I N T O   '   +   @ T a b l e D e s t i n a t i o n   +   ' ( '   +   @ D e s t i n a t i o n C o l u m n   +   C A S E   W H E N   @ N a m e V a l u e   I S   N O T   N U L L   T H E N   ' , N a m e '   E L S E   ' '   E N D   +     ' )    
 	 	 	 	 	 	 	 	 	   S E L E C T     x X M L '   +   C A S E   W H E N   @ N a m e V a l u e   I S   N O T   N U L L   T H E N   ' , ' ' '   +   @ N a m e V a l u e   +   ' ' ' '   E L S E   ' '   E N D   +   '   F R O M       (   S E L E C T   C O N V E R T ( x m l ,   B u l k C o l u m n ,   2 )   F R O M   O P E N R O W S E T ( B U L K   ' ' '   +   @ F i l e P a t h   +   ' ' ' ,   S I N G L E _ B L O B )   A S   T   )   A S   x   (   x X M L   ) '      
 	    
 	 E X E C   S P _ E X E C U T E S Q L   @ S Q L    
  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' C r e a t i n g   [ S e a r c h . F r a m e w o r k ] . [ R e s o l v e U R L ] '  
 G O  
 C R E A T E   P R O C E D U R E   [ S e a r c h . F r a m e w o r k ] . [ R e s o l v e U R L ]  
 @ A p p l i c a t i o n N a m e   V A R C H A R   ( 1 0 0 0 ) = ' ' ,   @ p a r a m 1   V A R C H A R   ( 1 0 0 0 ) = ' ' ,   @ p a r a m 2   V A R C H A R   ( 1 0 0 0 ) = ' ' ,   @ p a r a m 3   V A R C H A R   ( 1 0 0 0 ) = ' ' ,   @ p a r a m 4   V A R C H A R   ( 1 0 0 0 ) = ' ' ,   @ p a r a m 5   V A R C H A R   ( 1 0 0 0 ) = ' ' ,   @ p a r a m 6   V A R C H A R   ( 1 0 0 0 ) = ' ' ,   @ p a r a m 7   V A R C H A R   ( 1 0 0 0 ) = ' ' ,   @ p a r a m 8   V A R C H A R   ( 1 0 0 0 ) = ' ' ,   @ p a r a m 9   V A R C H A R   ( 1 0 0 0 ) = ' ' ,   @ S e s s i o n I D   U N I Q U E I D E N T I F I E R = n u l l ,   @ C o n t e n t T y p e   V A R C H A R   ( 2 5 5 ) = n u l l ,   @ R e s o l v e d   B I T   O U T P U T ,   @ E r r o r D e s c r i p t i o n   V A R C H A R   ( M A X )   O U T P U T ,   @ R e s p o n s e U R L   V A R C H A R   ( 1 0 0 0 )   O U T P U T ,   @ R e s p o n s e C o n t e n t T y p e   V A R C H A R   ( 2 5 5 )   O U T P U T ,   @ R e s p o n s e S t a t u s C o d e   I N T   O U T P U T ,   @ R e s p o n s e R e d i r e c t   B I T   O U T P U T ,   @ R e s p o n s e I n c l u d e P o s t D a t a   B I T   O U T P U T  
 A S  
 B E G I N  
 	 - -   S E T   N O C O U N T   O N   a d d e d   t o   p r e v e n t   e x t r a   r e s u l t   s e t s   f r o m  
 	 - -   i n t e r f e r i n g   w i t h   S E L E C T   s t a t e m e n t s .  
 	 S E T   N O C O U N T   O N ;  
  
 	  
 	 - -   B y   d e f a u l t   w e   w e r e   n o t   a b l e   t o   r e s o l v e   t h e   U R L  
 	 S E L E C T   @ R e s o l v e d   =   0  
  
 	 - -   L o a d   p a r a m   v a l u e s   i n t o   a   t a b l e  
 	 D E C L A R E   @ p a r a m s   T A B L E   ( i d   i n t ,   v a l   v a r c h a r ( 1 0 0 0 ) )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 1 ,   @ p a r a m 1 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 2 ,   @ p a r a m 2 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 3 ,   @ p a r a m 3 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 4 ,   @ p a r a m 4 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 5 ,   @ p a r a m 5 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 6 ,   @ p a r a m 6 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 7 ,   @ p a r a m 7 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 8 ,   @ p a r a m 8 )  
 	 I N S E R T   I N T O   @ p a r a m s   ( i d ,   v a l )   V A L U E S   ( 9 ,   @ p a r a m 9 )  
  
 	 D E C L A R E   @ M a x P a r a m   i n t  
 	 S E L E C T   @ M a x P a r a m   =   0  
 	 S E L E C T   @ M a x P a r a m   =   M A X ( i d )   F R O M   @ p a r a m s   W H E R E   v a l   >   ' '  
  
 	 D E C L A R E   @ T a b P a r a m   i n t  
 	 S E L E C T   @ T a b P a r a m   =   3  
  
 	 D E C L A R E   @ R E D I R E C T P A G E   V A R C H A R ( 2 5 5 )  
 	  
 	 S E L E C T   @ R E D I R E C T P A G E   =   ' ~ / s e a r c h / d e f a u l t . a s p x '  
  
 	 - -   R e t u r n   r e s u l t s  
 	 I F   ( @ E r r o r D e s c r i p t i o n   I S   N U L L )  
 	 B E G I N  
  
  
 	 	 i f ( @ P a r a m 1 = ' a l l '   a n d   @ P a r a m 2 = ' ' )  
 	 	 B E G I N  
 	 	 	 S E L E C T   @ R e s o l v e d   =   1 ,  
 	 	 	 	 @ E r r o r D e s c r i p t i o n   =   ' ' ,  
 	 	 	 	 @ R e s p o n s e U R L   =   @ R E D I R E C T P A G E   +   ' ? t a b = a l l '  
 	 	 E N D 	 	  
  
  
 	 	 i f ( @ P a r a m 1 = ' a l l '   a n d   @ P a r a m 2 = ' r e s u l t s ' )  
 	 	 B E G I N                      
 	 	  
 	 	 	 S E L E C T   @ R e s o l v e d   =   1 ,  
 	 	 	 	 @ E r r o r D e s c r i p t i o n   =   ' ' ,  
 	 	 	 	 @ R e s p o n s e U R L   =   @ R E D I R E C T P A G E   +   ' ? t a b = a l l & a c t i o n = r e s u l t s '  
 	 	 	 	 	 	 	  
 	 	 E N D  
  
  
 	 	 i f ( @ P a r a m 1 = ' p e o p l e '   a n d   @ P a r a m 2 = ' ' )  
 	 	 B E G I N  
 	 	 	 S E L E C T   @ R e s o l v e d   =   1 ,  
 	 	 	 	 @ E r r o r D e s c r i p t i o n   =   ' ' ,  
 	 	 	 	 @ R e s p o n s e U R L   =   @ R E D I R E C T P A G E     +   ' ? t a b = p e o p l e ' 	 	 	 	  
 	 	 	 	 	  
 	 	 E N D 	 	  
 	 	 i f ( @ P a r a m 1 = ' p e o p l e '   a n d   @ P a r a m 2 = ' r e s u l t s ' )  
 	 	 B E G I N  
 	 	 	 S E L E C T   @ R e s o l v e d   =   1 ,  
 	 	 	 	 @ E r r o r D e s c r i p t i o n   =   ' ' ,  
 	 	 	 	 @ R e s p o n s e U R L   =   @ R E D I R E C T P A G E     +   ' ? t a b = p e o p l e & a c t i o n = r e s u l t s ' 	 	 	 	  
 	 	 	 	 	  
 	 	 E N D 	 	  
  
  
 s e t 	 @ R e s p o n s e C o n t e n t T y p e   = ' '  
 s e t 	 @ R e s p o n s e S t a t u s C o d e     = ' '  
 s e t 	 @ R e s p o n s e R e d i r e c t   = 0  
 s e t 	 @ R e s p o n s e I n c l u d e P o s t D a t a   = 0  
  
  
  
 	 	 	 	  
 	 E N D  
  
  
  
  
  
 E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A d d i n g   f o r e i g n   k e y s   t o   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . A c c e s s i o n ] '  
 G O  
 A L T E R   T A B L E   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . A c c e s s i o n ]   W I T H   N O C H E C K     A D D   C O N S T R A I N T   [ F K _ p m _ p u b s _ a c c e s s i o n s _ p m _ p u b s _ g e n e r a l ]   F O R E I G N   K E Y   ( [ P M I D ] )   R E F E R E N C E S   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . G e n e r a l ]   ( [ P M I D ] )  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A d d i n g   f o r e i g n   k e y s   t o   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . A u t h o r ] '  
 G O  
 A L T E R   T A B L E   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . A u t h o r ]   W I T H   N O C H E C K     A D D   C O N S T R A I N T   [ F K _ p m _ p u b s _ a u t h o r s _ p m _ p u b s _ g e n e r a l ]   F O R E I G N   K E Y   ( [ P M I D ] )   R E F E R E N C E S   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . G e n e r a l ]   ( [ P M I D ] )  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A d d i n g   f o r e i g n   k e y s   t o   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . C h e m i c a l ] '  
 G O  
 A L T E R   T A B L E   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . C h e m i c a l ]   W I T H   N O C H E C K     A D D   C O N S T R A I N T   [ F K _ p m _ p u b s _ c h e m i c a l s _ p m _ p u b s _ g e n e r a l ]   F O R E I G N   K E Y   ( [ P M I D ] )   R E F E R E N C E S   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . G e n e r a l ]   ( [ P M I D ] )  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A d d i n g   f o r e i g n   k e y s   t o   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . D a t a b a n k ] '  
 G O  
 A L T E R   T A B L E   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . D a t a b a n k ]   W I T H   N O C H E C K     A D D   C O N S T R A I N T   [ F K _ p m _ p u b s _ d a t a b a n k s _ p m _ p u b s _ g e n e r a l ]   F O R E I G N   K E Y   ( [ P M I D ] )   R E F E R E N C E S   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . G e n e r a l ]   ( [ P M I D ] )  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A d d i n g   f o r e i g n   k e y s   t o   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . G r a n t ] '  
 G O  
 A L T E R   T A B L E   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . G r a n t ]   W I T H   N O C H E C K     A D D   C O N S T R A I N T   [ F K _ p m _ p u b s _ g r a n t s _ p m _ p u b s _ g e n e r a l ]   F O R E I G N   K E Y   ( [ P M I D ] )   R E F E R E N C E S   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . G e n e r a l ]   ( [ P M I D ] )  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A d d i n g   f o r e i g n   k e y s   t o   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . I n v e s t i g a t o r ] '  
 G O  
 A L T E R   T A B L E   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . I n v e s t i g a t o r ]   W I T H   N O C H E C K     A D D   C O N S T R A I N T   [ F K _ p m _ p u b s _ i n v e s t i g a t o r s _ p m _ p u b s _ g e n e r a l ]   F O R E I G N   K E Y   ( [ P M I D ] )   R E F E R E N C E S   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . G e n e r a l ]   ( [ P M I D ] )  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A d d i n g   f o r e i g n   k e y s   t o   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . K e y w o r d ] '  
 G O  
 A L T E R   T A B L E   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . K e y w o r d ]   W I T H   N O C H E C K     A D D   C O N S T R A I N T   [ F K _ p m _ p u b s _ k e y w o r d s _ p m _ p u b s _ g e n e r a l ]   F O R E I G N   K E Y   ( [ P M I D ] )   R E F E R E N C E S   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . G e n e r a l ]   ( [ P M I D ] )  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A d d i n g   f o r e i g n   k e y s   t o   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . M e s h ] '  
 G O  
 A L T E R   T A B L E   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . M e s h ]   W I T H   N O C H E C K     A D D   C O N S T R A I N T   [ F K _ p m _ p u b s _ m e s h _ p m _ p u b s _ g e n e r a l ]   F O R E I G N   K E Y   ( [ P M I D ] )   R E F E R E N C E S   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . G e n e r a l ]   ( [ P M I D ] )  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A d d i n g   f o r e i g n   k e y s   t o   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . P u b T y p e ] '  
 G O  
 A L T E R   T A B L E   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . P u b T y p e ]   W I T H   N O C H E C K     A D D   C O N S T R A I N T   [ F K _ p m _ p u b s _ p u b t y p e s _ p m _ p u b s _ g e n e r a l ]   F O R E I G N   K E Y   ( [ P M I D ] )   R E F E R E N C E S   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . G e n e r a l ]   ( [ P M I D ] )  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' A d d i n g   f o r e i g n   k e y s   t o   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P e r s o n . I n c l u d e ] '  
 G O  
 A L T E R   T A B L E   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P e r s o n . I n c l u d e ]   W I T H   N O C H E C K     A D D   C O N S T R A I N T   [ F K _ p u b l i c a t i o n s _ i n c l u d e _ p m _ p u b s _ g e n e r a l ]   F O R E I G N   K E Y   ( [ P M I D ] )   R E F E R E N C E S   [ P r o f i l e . D a t a ] . [ P u b l i c a t i o n . P u b M e d . G e n e r a l ]   ( [ P M I D ] )  
 G O  
 I F   @ @ E R R O R < > 0   A N D   @ @ T R A N C O U N T > 0   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T = 0   B E G I N   I N S E R T   I N T O   # t m p E r r o r s   ( E r r o r )   S E L E C T   1   B E G I N   T R A N S A C T I O N   E N D  
 G O  
 P R I N T   N ' D r o p p i n g   s c h e m a t a '  
 G O  
 D R O P   S C H E M A   [ U s e r . I n f o ]  
 G O  
 I F   E X I S T S   ( S E L E C T   *   F R O M   # t m p E r r o r s )   R O L L B A C K   T R A N S A C T I O N  
 G O  
 I F   @ @ T R A N C O U N T > 0   B E G I N  
 P R I N T   ' T h e   d a t a b a s e   u p d a t e   s u c c e e d e d '  
 C O M M I T   T R A N S A C T I O N  
 E N D  
 E L S E   P R I N T   ' T h e   d a t a b a s e   u p d a t e   f a i l e d '  
 G O  
 D R O P   T A B L E   # t m p E r r o r s  
 G O  
 