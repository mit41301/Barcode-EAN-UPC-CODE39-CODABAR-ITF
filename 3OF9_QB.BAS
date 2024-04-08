                REM PROGRAM FOR BAR CODE PRINTER - CODE 3 OF 9
                DIM S$(108): DIM G%(786): ICG$ = "0"
FOR I = 0 TO 43
                READ X, Y$
                C% = VAL("&H" + Y$)
        WHILE C% <> 0
        S$(X) = RIGHT$(STR$(C% MOD 2), 1) + S$(X)
        C% = C% \ 2
        WEND
NEXT I
                INPUT "       Enter the String: "; U$
FOR I = 1 TO LEN(U$)
        X$ = X$ + S$(ASC(MID$(UCASE$(U$), I, 1))) + ICG$
NEXT I
                F$ = S$(42) + ICG$ + X$ + S$(42)
        SCREEN 11
                PRINT CHR$(42) + UCASE$(U$) + CHR$(42)
                GET (0, 0)-(8 * (LEN(U$) + 2), 14), G%
        CLS : PAINT (0, 0)
                FOR I = 1 TO LEN(U$) * 13 + 25
        LINE (I, 5)-(I, 25 + LEN(U$)), VAL(MID$(F$, I, 1)) XOR 1
                NEXT I
PUT (((LEN(U$) * 13 + 25) - (8 * (LEN(U$) + 2))) / 2, 30 + LEN(U$)), G%
                SLEEP
DATA 42,96d,32,9ad,36,925,37,a49,43,949,45,95b,46,cad,47,929,48,a6d
DATA 49,d2b,50,b2b,51,d95,52,a6b,53,d35,54,b35,55,a5b,56,d2d,57,b2d
DATA 65,d4b,66,b4b,67,da5,68,acb,69,d65,70,b65,71,a9b,72,d4d,73,b4d
DATA 74,acd,75,d53,76,b53,77,da9,78,ad3,79,d69,80,b69,81,ab3,82,d59
DATA 83,b59,84,ad9,85,cab,86,9ab,87,cd5,88,96b,89,cb5,90,9b5
                        END          'DATED 26.06.2002