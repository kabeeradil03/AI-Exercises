(define (domain Dungeon)

    (:requirements
        :typing
        :negative-preconditions
        :conditional-effects
    )

    ; Do not modify the types
    (:types
        location colour key corridor
    )

    ; Do not modify the constants
    (:constants
        red yellow green purple rainbow - colour
    )

    ; You may introduce whatever predicates you would like to use
    (:predicates
        
        ;; hero information
        (hero-at ?loc - location)
        ; hero is at location loc
        (hero-moving-to ?loc - location)
        ; hero will move to location loc
        (is-holding ?k - key)
        ; hero is holding key k 
        (arm-empty)
        ; the hero's arm is empty
        
        ;; corridor information
        (corridor-exists-between ?cor - corridor ?startlocation ?endlocation - location)
        ; corridor cor exists between startlocation and endlocation
        (is-locked ?cor - corridor)
        ; corridor cor is locked
        (is-risky ?cor - corridor)
        ; corridor cor is risky
        (is-collapsed ?cor - corridor)
        ; corridor cor is collapsed
        (has-lock-colour ?cor - corridor ?col - colour)
        ; corridor cor is locked with a lock coloured col
        (connected-to ?cor - corridor ?loc - location)
        ; corridor cor is connected to location loc
      
        
        ;; key information
        (has-colour ?k - key ?col - colour) 
        ; key k has colour col
        (has-uses ?k - key)
        ; key k has uses
        (one-use ?k)
        ; key k has one use
        (two-uses ?k)
        ; key k has two uses
        
        ;; location informatioon
        (has-key ?k - key ?loc - location)
        ; key k is at location loc
        (is-messy ?loc - location) 
        ; location loc is messy

    )

    ; IMPORTANT: You should not change/add/remove the action names or parameters

    ;Hero can move if the
    ;    - hero is at current location ?from,
    ;    - hero will move to location ?to,
    ;    - corridor ?cor exists between the ?from and ?to locations
    ;    - there isn't a locked door in corridor ?cor
    ;Effects move the hero, and collapse the corridor if it's "risky" (also causing a mess in the ?to location)
    (:action move

        :parameters (?from ?to - location ?cor - corridor)

        :precondition (and  (hero-at ?from)
                            (corridor-exists-between ?cor ?from ?to)
                            (not (is-collapsed ?cor))
                            (not (is-locked ?cor))
                        )

        :effect (and 
                    (when (is-risky ?cor) 
                        (and (not(hero-at ?from))
                            (hero-at ?to)
                            (is-messy ?to)
                            (is-collapsed ?cor)
                        )
                    )
                    (when (not(is-risky ?cor))
                        (and (not (hero-at ?from))
                            (hero-at ?to)
                        )
                    )
                )
    )

    ;Hero can pick up a key if the
    ;    - hero is at current location ?loc,
    ;    - there is a key ?k at location ?loc,
    ;    - the hero's arm is free,
    ;    - the location is not messy
    ;Effect will have the hero holding the key and their arm no longer being free
    (:action pick-up

        :parameters (?loc - location ?k - key)

        :precondition (and  (hero-at ?loc)
                            (has-key ?k ?loc)
                            (arm-empty)
                            (not(is-messy ?loc))
                        )

        :effect (and (is-holding ?k)
                    (not(arm-empty))
                    (not (has-key ?k ?loc))
                )
    )

    ;Hero can drop a key if the
    ;    - hero is holding a key ?k,
    ;    - the hero is at location ?loc
    ;Effect will be that the hero is no longer holding the key
    (:action drop

        :parameters (?loc - location ?k - key)

        :precondition (and  (is-holding ?k)
                            (hero-at ?loc)
                        )

        :effect (and (not(is-holding ?k))
                    (arm-empty)
                    (has-key ?k ?loc)
                )
    )


    ;Hero can use a key for a corridor if
    ;    - the hero is holding a key ?k,
    ;    - the key still has some uses left,
    ;    - the corridor ?cor is locked with colour ?col,
    ;    - the key ?k is if the right colour ?col,
    ;    - the hero is at location ?loc
    ;    - the corridor is connected to the location ?loc
    ;Effect will be that the corridor is unlocked and the key usage will be updated if necessary
    (:action unlock

        :parameters (?loc - location ?cor - corridor ?col - colour ?k - key)

        :precondition (and  (is-holding ?k)
                            (has-uses ?k)
                            (has-lock-colour ?cor ?col)
                            (has-colour ?k ?col)
                            (hero-at ?loc)
                            (connected-to ?cor ?loc)
                        )

        :effect (and 
                    (when (two-uses ?k)
                        (and 
                            (not (is-locked ?cor))
                            (not (two-uses ?k))
                            (one-use ?k)
                            (has-uses ?k)
                        )
                    )
                    (when (one-use ?k)
                        (and (not (is-locked ?cor))
                        (not (one-use ?k))
                        (not (has-uses ?k)))
                    )
                    (when (has-uses ?k)
                        (not (is-locked ?cor)))
                )
    )

    ;Hero can clean a location if
    ;    - the hero is at location ?loc,
    ;    - the location is messy
    ;Effect will be that the location is no longer messy
    (:action clean

        :parameters (?loc - location)

        :precondition (and  (hero-at ?loc)
                            (is-messy ?loc)
                        )

        :effect (not(is-messy ?loc))
    )

)
