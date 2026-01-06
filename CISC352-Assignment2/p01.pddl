(define (problem p1-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-3-1 loc-1-2 loc-2-2 loc-3-2 loc-4-2 loc-2-3 loc-3-3 loc-2-4 loc-3-4 loc-4-4 - location
    key1 key2 key3 key4 - key
    c3132 c1222 c2232 c3242 c2223 c3233 c2333 c2324 c3334 c2434 c3444 - corridor  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-1-2)
    (arm-empty)
    
    
    ; Locationg <> Corridor Connections
    (corridor-exists-between c3132 loc-3-1 loc-3-2)
    (corridor-exists-between c3132 loc-3-2 loc-3-1)
    
    (corridor-exists-between c1222 loc-1-2 loc-2-2)
    (corridor-exists-between c1222 loc-2-2 loc-1-2)

    (corridor-exists-between c2232 loc-2-2 loc-3-2)
    (corridor-exists-between c2232 loc-3-2 loc-2-2)
   
    (corridor-exists-between c3242 loc-3-2 loc-4-2)
    (corridor-exists-between c3242 loc-4-2 loc-3-2)

    (corridor-exists-between c2223 loc-2-2 loc-2-3)
    (corridor-exists-between c2223 loc-2-3 loc-2-2)

    (corridor-exists-between c3233 loc-3-2 loc-3-3)
    (corridor-exists-between c3233 loc-3-3 loc-3-2)
    
    (corridor-exists-between c2333 loc-2-3 loc-3-3)
    (corridor-exists-between c2333 loc-3-3 loc-2-3)

    (corridor-exists-between c2324 loc-2-3 loc-2-4)
    (corridor-exists-between c2324 loc-2-4 loc-2-3)
    
    (corridor-exists-between c3334 loc-3-3 loc-3-4)
    (corridor-exists-between c3334 loc-3-4 loc-3-3)


    (corridor-exists-between c2434 loc-2-4 loc-3-4)
    (corridor-exists-between c2434 loc-3-4 loc-2-4)

    (corridor-exists-between c3444 loc-3-4 loc-4-4)
    (corridor-exists-between c3444 loc-4-4 loc-3-4)

    (connected-to c1222 loc-1-2)
    (connected-to c1222 loc-2-2)

    (connected-to c2232 loc-2-2)
    (connected-to c2232 loc-3-2)

    (connected-to c2223 loc-2-2)
    (connected-to c2223 loc-2-3)
    
    (connected-to c2333 loc-2-3)
    (connected-to c2333 loc-3-3)

    (connected-to c3233 loc-3-2)
    (connected-to c3233 loc-3-3)

    (connected-to c3132 loc-3-1)
    (connected-to c3132 loc-3-2)
    
    (connected-to c3334 loc-3-3)
    (connected-to c3334 loc-3-4)

    (connected-to c2324 loc-2-3)
    (connected-to c2324 loc-2-4)

    (connected-to c2434 loc-2-4)
    (connected-to c2434 loc-3-4)

    (connected-to c3242 loc-3-2)
    (connected-to c3242 loc-4-2)

    (connected-to c3444 loc-3-4)
    (connected-to c3444 loc-4-4)

    
    ; Key locations
    (has-key key1 loc-2-2)
    (has-key key3 loc-4-2)
    (has-key key2 loc-2-4)
    (has-key key4 loc-4-4)


    ; Locked corridors


    (is-locked c3132)
    (has-lock-colour c3132 rainbow)
    (is-locked c3242)
    (has-lock-colour c3242 purple)
    (is-locked c2324)
    (has-lock-colour c2324 red)
    (is-locked c2434)
    (has-lock-colour c2434 red)
    (is-locked c3444)
    (has-lock-colour c3444 yellow)



    ; Risky corridors
    (is-risky c2324)
    (is-risky c2434)

    ; Key colours
    (has-colour key1 red)
    (has-colour key2 yellow)
    (has-colour key3 rainbow)
    (has-colour key4 purple)


    ; Key usage properties (one use, two use, etc)
    (has-uses key1)
    (not (one-use key1))
    (not (two-uses key1))
    
    (has-uses key2)
    (one-use key4)
    (not(two-uses key4))

    (has-uses key3)
    (one-use key3)
    (not(two-uses key3))

    (has-uses key4)
    (one-use key2)
    (two-uses key2)


  ) 
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-3-1)
    )
  )

)