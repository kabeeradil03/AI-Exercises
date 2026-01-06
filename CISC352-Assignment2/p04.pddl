(define (problem p4-dungeon)
  (:domain Dungeon)

  ; Come up with your own problem instance (see assignment for details)
  ; NOTE: You _may_ use new objects for this problem only.

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-1-2 loc-2-2 loc-2-3 loc-3-2 loc-3-4 loc-4-1 loc-4-2 loc-4-3 loc-4-4 - location
    c1222 c2223 c2232 c3242 c3444 c4142 c4243 c4344 - corridor
    key1 key2 key3 key4 key5 key6 - key
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-4-1)
    (arm-empty)

    ; Location <> Corridor Connections
    (corridor-exists-between c1222 loc-1-2 loc-2-2)
    (corridor-exists-between c1222 loc-2-2 loc-1-2)

    (corridor-exists-between c2223 loc-2-2 loc-2-3)
    (corridor-exists-between c2223 loc-2-3 loc-2-2)
    
    (corridor-exists-between c2232 loc-2-2 loc-3-2)
    (corridor-exists-between c2232 loc-3-2 loc-2-2)
    
    (corridor-exists-between c3242 loc-3-2 loc-4-2)
    (corridor-exists-between c3242 loc-4-2 loc-3-2)

    (corridor-exists-between c3444 loc-3-4 loc-4-4)
    (corridor-exists-between c3444 loc-4-4 loc-3-4)

    (corridor-exists-between c4142 loc-4-1 loc-4-2)
    (corridor-exists-between c4142 loc-4-2 loc-4-1)

    (corridor-exists-between c4243 loc-4-2 loc-4-3)
    (corridor-exists-between c4243 loc-4-3 loc-4-2)
    
    (corridor-exists-between c4344 loc-4-3 loc-4-4)
    (corridor-exists-between c4344 loc-4-4 loc-4-3)

    (connected-to c1222 loc-1-2)
    (connected-to c1222 loc-2-2)

    (connected-to c2223 loc-2-2)
    (connected-to c2223 loc-2-3)
    
    (connected-to c2232 loc-2-2)
    (connected-to c2232 loc-3-2)
    
    (connected-to c3242 loc-3-2)
    (connected-to c3242 loc-4-2)

    (connected-to c3444 loc-3-4)
    (connected-to c3444 loc-4-4)

    (connected-to c4142 loc-4-1)
    (connected-to c4142 loc-4-2)

    (connected-to c4243 loc-4-2)
    (connected-to c4243 loc-4-3)
    
    (connected-to c4344 loc-4-3)
    (connected-to c4344 loc-4-4)
    
    ; Key locations
    (has-key key1 loc-4-1)
    (has-key key2 loc-2-2)
    (has-key key3 loc-4-3)
    (has-key key4 loc-3-4)
    (has-key key5 loc-2-3)

    ; Locked corridors
    (is-locked c4142)
    (has-lock-colour red)

    (is-locked c4243)
    (has-lock-colour purple)

    (is-locked c3444)
    (has-lock-colour yellow)

    (is-locked c2223)
    (has-lock-colour green)

    (is-locked c1222)
    (has-lock-colour rainbow)
    
    ; Risky corridors
    (is-risky c4142)

    ; Key colours
    (has-colour key1 red)
    (has-colour key2 purple)
    (has-colour key3 yellow)
    (has-colour key4 green)
    (has-colour key5 rainbow)

    ; Key usage properties (one use, two use, etc)
    (one-use key1)
    (has-uses key1)
    (not(two-uses key1))

    (one-use key2)
    (has-uses key2)
    (not(two-uses key2))

    (one-use key3)
    (has-uses key3)
    (not(two-uses key3))

    (one-use key4)
    (has-uses key4)
    (not(two-uses key4))

    (one-use key5)
    (has-uses key5)
    (not(two-uses key5))

  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-1-2)
    )
  )

)