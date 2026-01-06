(define (problem p3-dungeon)
  (:domain Dungeon)

  ; Naming convention:
  ; - loc-{i}-{j} refers to the location at the i'th column and j'th row (starting in top left corner)
  ; - c{i}{j}{h}{k} refers to the corridor connecting loc-{i}-{j} and loc-{h}-{k}
  (:objects
    loc-3-4 loc-4-5 loc-1-2 loc-2-2 loc-3-2 loc-3-3 loc-2-5 loc-1-3 loc-2-1 loc-1-4 loc-3-5 loc-2-4 loc-4-4 loc-2-3 loc-4-3 - location
    c2122 c1222 c2232 c1213 c1223 c2223 c3223 c3233 c1323 c2333 c1314 c2314 c2324 c2334 c3334 c1424 c2434 c2425 c2535 c3545 c4544 c4443 - corridor
    key1 key2 key3 key4 key5 key6 - key
  )

  (:init

    ; Hero location and carrying status
    (hero-at loc-2-1)
    (arm-empty)

    ; Location <> Corridor Connections
    (corridor-exists-between c2122 loc-2-1 loc-2-2)
    (corridor-exists-between c2122 loc-2-2 loc-2-1)

    (corridor-exists-between c1222 loc-1-2 loc-2-2)
    (corridor-exists-between c1222 loc-2-2 loc-1-2)
    
    (corridor-exists-between c2232 loc-2-2 loc-3-2)
    (corridor-exists-between c2232 loc-3-2 loc-2-2)

    (corridor-exists-between c1213 loc-1-2 loc-1-3)
    (corridor-exists-between c1213 loc-1-3 loc-1-2)

    (corridor-exists-between c1223 loc-1-2 loc-2-3)
    (corridor-exists-between c1223 loc-2-3 loc-1-2)

    (corridor-exists-between c2223 loc-2-2 loc-2-3)
    (corridor-exists-between c2223 loc-2-3 loc-2-2)

    (corridor-exists-between c3223 loc-3-2 loc-2-3)
    (corridor-exists-between c3223 loc-2-3 loc-3-2)

    (corridor-exists-between c3233 loc-3-2 loc-3-3)
    (corridor-exists-between c3233 loc-3-3 loc-2-3)

    (corridor-exists-between c1323 loc-1-3 loc-2-3)
    (corridor-exists-between c1323 loc-2-3 loc-1-3)

    (corridor-exists-between c2333 loc-2-3 loc-3-3)
    (corridor-exists-between c2333 loc-3-3 loc-2-3)

    (corridor-exists-between c1314 loc-1-3 loc-1-4)
    (corridor-exists-between c1314 loc-1-4 loc-1-3)

    (corridor-exists-between c2314 loc-2-3 loc-1-4)
    (corridor-exists-between c2314 loc-1-4 loc-2-3)

    (corridor-exists-between c2324 loc-2-3 loc-2-4)
    (corridor-exists-between c2324 loc-2-4 loc-2-3)

    (corridor-exists-between c2334 loc-2-3 loc-3-4)
    (corridor-exists-between c2334 loc-3-4 loc-2-3)

    (corridor-exists-between c3334 loc-3-3 loc-3-4)
    (corridor-exists-between c3334 loc-3-4 loc-3-3)

    (corridor-exists-between c1424 loc-1-4 loc-2-4)
    (corridor-exists-between c1424 loc-2-4 loc-1-4)

    (corridor-exists-between c2434 loc-2-4 loc-3-4)
    (corridor-exists-between c2434 loc-3-4 loc-2-4)

    (corridor-exists-between c2425 loc-2-4 loc-2-5)
    (corridor-exists-between c2425 loc-2-5 loc-2-4)

    (corridor-exists-between c2535 loc-2-5 loc-3-5)
    (corridor-exists-between c2535 loc-3-5 loc-2-5)

    (corridor-exists-between c3545 loc-3-5 loc-4-5)
    (corridor-exists-between c3545 loc-4-5 loc-3-5)

    (corridor-exists-between c4544 loc-4-5 loc-4-4)
    (corridor-exists-between c4544 loc-4-4 loc-4-5)

    (corridor-exists-between c4443 loc-4-4 loc-4-3)
    (corridor-exists-between c4443 loc-4-3 loc-4-4)
    
    (connected-to c2122 loc-2-1)
    (connected-to c2122 loc-2-2)

    (connected-to c1222 loc-1-2)
    (connected-to c1222 loc-2-2)
    
    (connected-to c2232 loc-2-2)
    (connected-to c2232 loc-3-2)

    (connected-to c1213 loc-1-2)
    (connected-to c1213 loc-1-3)

    (connected-to c1223 loc-1-2)
    (connected-to c1223 loc-2-3)

    (connected-to c2223 loc-2-2)
    (connected-to c2223 loc-2-3)

    (connected-to c3223 loc-3-2)
    (connected-to c3223 loc-2-3)

    (connected-to c3233 loc-3-2)
    (connected-to c3233 loc-3-3)

    (connected-to c1323 loc-1-3)
    (connected-to c1323 loc-2-3)

    (connected-to c2333 loc-2-3)
    (connected-to c2333 loc-3-3)

    (connected-to c1314 loc-1-3)
    (connected-to c1314 loc-1-4)

    (connected-to c2314 loc-2-3)
    (connected-to c2314 loc-1-4)

    (connected-to c2324 loc-2-3)
    (connected-to c2324 loc-2-4)

    (connected-to c2334 loc-2-3)
    (connected-to c2334 loc-3-4)

    (connected-to c3334 loc-3-3)
    (connected-to c3334 loc-3-4)

    (connected-to c1424 loc-1-4)
    (connected-to c1424 loc-2-4)

    (connected-to c2434 loc-2-4)
    (connected-to c2434 loc-3-4)

    (connected-to c2425 loc-2-4)
    (connected-to c2425 loc-2-5)

    (connected-to c2535 loc-2-5)
    (connected-to c2535 loc-3-5)

    (connected-to c3545 loc-3-5)
    (connected-to c3545 loc-4-5)

    (connected-to c4544 loc-4-5)
    (connected-to c4544 loc-4-4)

    (connected-to c4443 loc-4-4)
    (connected-to c4443 loc-4-3)


    ; Key locations
    (has-key key1 loc-2-1)
    (has-key key2 loc-2-3)
    (has-key key3 loc-2-3)
    (has-key key4 loc-2-3)
    (has-key key5 loc-2-3)
    (has-key key6 loc-4-4)

    ; Locked corridors
    (is-locked c1223)
    (has-lock-colour c1223 red)
    
    (is-locked c2223)
    (has-lock-colour c2223 red)

    (is-locked c3223)
    (has-lock-colour c3223 red)

    (is-locked c1323)
    (has-lock-colour c1323 red)

    (is-locked c2333)
    (has-lock-colour c2333 red)

    (is-locked c2314)
    (has-lock-colour c2314 red)
    
    (is-locked c2324)
    (has-lock-colour c2324 red)

    (is-locked c2334)
    (has-lock-colour c2334 red)

    (is-locked c2425)
    (has-lock-colour c2425 purple)

    (is-locked c2535)
    (has-lock-colour c2535 green)

    (is-locked c3545)
    (has-lock-colour c3545 purple)

    (is-locked c4544)
    (has-lock-colour c4544 green)

    (is-locked c4443)
    (has-lock-colour c4443 rainbow)


    ; Risky corridors
    (is-risky c1223)
    (is-risky c2223)
    (is-risky c3223)
    (is-risky c1323)
    (is-risky c2333)
    (is-risky c2314)
    (is-risky c2324)
    (is-risky c2334)

    ; Key colours
    (has-colour key1 red)
    (has-colour key2 green)
    (has-colour key3 green)
    (has-colour key4 purple)
    (has-colour key5 purple)
    (has-colour key6 rainbow)


    ; Key usage properties (one use, two use, etc)
    (not(one-use key1))
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
    
    (one-use key6)
    (has-uses key6)
    (not(two-uses key6))
    
  )
  (:goal
    (and
      ; Hero's final location goes here
      (hero-at loc-4-3)
    )
  )

)