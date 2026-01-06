(define (problem p2-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-2-1 loc-1-2 loc-2-2 loc-3-2 loc-4-2 loc-2-3 - location
    key1 key2 key3 key4 - key
    c2122 c1222 c2232 c3242 c2223 - corridor
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-2-2)
    (arm-empty)

    
    ; Locationg <> Corridor Connections
    (corridor-exists-between c2122 loc-2-1 loc-2-2)
    (corridor-exists-between c2122 loc-2-2 loc-2-1)
    
    (corridor-exists-between c1222 loc-1-2 loc-2-2)
    (corridor-exists-between c1222 loc-2-2 loc-1-2)
    
    (corridor-exists-between c2232 loc-2-2 loc-3-2)
    (corridor-exists-between c2232 loc-3-2 loc-2-2)
    
    (corridor-exists-between c3242 loc-3-2 loc-4-2)
    (corridor-exists-between c3242 loc-4-2 loc-3-2)
    
    (corridor-exists-between c2223 loc-2-2 loc-2-3)
    (corridor-exists-between c2223 loc-2-3 loc-2-2)
    
    (connected-to c2122 loc-2-1)
    (connected-to c2122 loc-2-2)
    
    (connected-to c1222 loc-1-2)
    (connected-to c1222 loc-2-2)
    
    (connected-to c2232 loc-2-2)
    (connected-to c2232 loc-3-2)
    
    (connected-to c3242 loc-3-2)
    (connected-to c3242 loc-4-2)
    
    (connected-to c2223 loc-2-2)
    (connected-to c2223 loc-2-3)
    
    ; Key locations
    (has-key key1 loc-2-1)
    (has-key key2 loc-1-2)
    (has-key key3 loc-2-2)
    (has-key key4 loc-2-3)

    ; Locked corridors
    (is-locked c2122)
    (has-lock-colour c2122 purple)
    
    (is-locked c1222)
    (has-lock-colour c1222 yellow)
    
    (is-locked c2232)
    (has-lock-colour c2232 yellow)
    
    (is-locked c2223)
    (has-lock-colour c2223 green)
    
    (is-locked c3242)
    (has-lock-colour c3242 rainbow)
    
    ; Risky corridors
    
    ; Key colours
    (has-colour key1 green)
    (has-colour key2 rainbow)
    (has-colour key3 purple)
    (has-colour key4 yellow)

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

    (not(one-use key4))
    (has-uses key4)
    (two-uses key4)

  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-4-2)
    )
  )

)
