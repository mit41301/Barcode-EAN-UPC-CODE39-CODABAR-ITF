10 REM Interleaved 2 of 5 Code
20 Dim P$(30)
30 Dim G%(1000)
40 For I = 0 To 9
    50 Read N$
    60 N = Val("&h" + N$)
    70 EVP = 0
    80 For X = 0 To 3
        90 P$(I) = P$(I) + Right$(Str$(N Mod 2), 1)
        100 EVP = EVP Xor (N Mod 2)
        110 N = N \ 2
    120 Next X
    130 P$(I) = P$(I) + Right$(Str$(EVP), 1)
140 Next I
150 Input " Enter the No: "; U$
160 If Len(U$) Mod 2 = 1 Then U$ = Chr$(48) + U$
170 For K = 1 To Len(U$) Step 2
    180 OP$ = OP$ + P$(Val(Mid$(U$, K, 1)))
    190 EP$ = EP$ + P$(Val(Mid$(U$, K + 1, 1)))
200 Next K
210 For K = 1 To Len(OP$)
    220 FP$ = FP$ + Mid$(OP$, K, 1) + Mid$(EP$, K, 1)
230 Next K
240 Screen 2: KEY Off: Cls
250 Print U$
260 Get (0, 0)-(8 * Len(U$), 14), G%()
270 Cls
280 Paint (0, 0)
290 Z = 10
300 For I = 1 To Len(FP$) + 7
    310 For J = 0 To Val(Mid$("0000" + FP$ + "100", I, 1)) * 2
        320 Line (Z, 5)-(Z, 25), I Mod 2 Xor 1
        330 Z = Z + 1
    340 Next J
350 Next I
360 Put (20, 30), G%()
370 While InKey$ = ""
380 Wend
390 End
400 Data C,1,2,3,4,5,6,8,9,A
