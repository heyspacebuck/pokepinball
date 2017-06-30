_LoadStageDataBlueFieldTop: ; 0x1c165
	call asm_1e475
	call Func_1cb43
	call Func_1c3ee
	call Func_1e8f6
	callba Func_142fc
	ld a, $1
	ld [wd640], a
	call Func_1f18a
	callba Func_1404a
	call Func_1c203
	ret

_LoadStageDataBlueFieldBottom: ; 0x1c191
	call Func_1c1db
	call Func_1c4b6
	call Func_1c2cb
	call Func_1e627
	call Func_1c43c
	call Func_1c305
	call Func_1c3ee
	callba Func_14746
	callba Func_14707
	call Func_1c235
	call Func_1c21e
	call Func_1e8f6
	callba Func_142fc
	callba Func_1404a
	call Func_1c203
	ret

Func_1c1db: ; 0x1c1db
	ld a, [wd641]
	cp $0
	ret z
	ld a, $1
	ld [wd640], a
	ld a, $0
	ld [wd641], a
	ld a, [wBlueStageForceFieldDirection]
	cp $2  ; down direction
	ret nz
	ld a, $0
	ld [wBlueStageForceFieldDirection], a
	ld a, $1  ; right direction
	ld [wd64a], a
	xor a
	ld [wd649], a
	ld [wd648], a
	ret

Func_1c203: ; 0x1c203
	ld a, $ff
	ld [wd4d7], a
	ld [wd4db], a
	ld a, [wd4b4]
	ld [wd4c5], a
	ld a, [wd4b6]
	ld [wd4c6], a
	ld a, [wBallRotation]
	ld [wd4c7], a
	ret

Func_1c21e: ; 0x1c21e
	ld a, $ff
	ld [wd60e], a
	ld [wd60f], a
	ld a, [wd60c]
	call Func_1d5f2
	ld a, [wd60d]
	add $14
	call Func_1d5f2
	ret

Func_1c235: ; 0x1c235
	ld a, [wLeftMapMoveDiglettAnimationCounter]
	and a
	jr z, .asm_1c249
	ld a, $54
	ld [wc7e3], a
	ld a, $55
	ld [wc803], a
	ld a, $1
	jr .asm_1c24a

.asm_1c249
	xor a
.asm_1c24a
	call Func_1de4b
	ld a, [wLeftMapMoveCounter]
	call Func_1de6f
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_1c267
	ld a, [wLeftMapMoveCounter]
	cp $0
	jr z, .asm_1c264
	ld b, $7
	add b
	jr .asm_1c269

.asm_1c264
	xor a
	jr .asm_1c269

.asm_1c267
	ld a, $8
.asm_1c269
	call Func_1de6f
	ld a, [wRightMapMoveDiglettFrame]
	and a
	jr z, .asm_1c295
	ld a, $52
	ld [wc7f0], a
	ld a, $53
	ld [wc810], a
	ld a, [wd644]
	and a
	jr z, .asm_1c28a
	ld a, [wd55a]
	and a
	jr nz, .asm_1c2bd
	jr .asm_1c291

.asm_1c28a
	ld a, [wRightMapMoveCounter]
	add $3
	jr .asm_1c297

.asm_1c291
	ld a, $3
	jr .asm_1c297

.asm_1c295
	ld a, $2
.asm_1c297
	call Func_1de4b
	ld a, [wRightMapMoveCounter]
	add $4
	call Func_1de6f
	ld a, [hGameBoyColorFlag]
	and a
	jr z, .asm_1c2b7
	ld a, [wRightMapMoveCounter]
	cp $0
	jr z, .asm_1c2b3
	ld b, $a
	add b
	jr .asm_1c2b9

.asm_1c2b3
	ld a, $4
	jr .asm_1c2b9

.asm_1c2b7
	ld a, $9
.asm_1c2b9
	call Func_1de6f
	ret

.asm_1c2bd
	ld a, $6
	call Func_1de4b
	ld a, [wRightMapMoveCounter]
	add $4
	call Func_1de6f
	ret

Func_1c2cb: ; 0x1c2cb
	ld a, [wCurrentStage]
	bit 0, a
	ret z
	ld bc, $0000
.asm_1c2d4
	push bc
	ld hl, wIndicatorStates
	add hl, bc
	ld a, [hl]
	res 7, a
	call Func_1eb41
	pop bc
	inc c
	ld a, c
	cp $2
	jr nz, .asm_1c2d4
	ld bc, $0002
.asm_1c2e9
	push bc
	ld hl, wIndicatorStates
	add hl, bc
	ld a, [hl]
	push af
	ld hl, wd648
	add hl, bc
	dec hl
	dec hl
	ld a, [hl]
	ld d, a
	pop af
	add d
	call Func_1eb41
	pop bc
	inc c
	ld a, c
	cp $5
	jr nz, .asm_1c2e9
	ret

Func_1c305: ; 0x1c305
	ld a, [wInSpecialMode]
	and a
	ret z
	ld a, [wSpecialMode]
	cp $2
	ret z
	ld a, [wd5c6]
	and a
	jr nz, .asm_1c31f
	ld a, [wCapturingMon]
	and a
	jr nz, .asm_1c31f
	jp Func_1c3ca

.asm_1c31f
	callba Func_1c3ac
	callba Func_10362
	ld a, [hGameBoyColorFlag]
	and a
	callba nz, Func_10301
	ld a, [wCapturingMon]
	and a
	ret z
	ld a, BANK(PikachuSaverGfx)
	ld hl, PikachuSaverGfx + $c0
	ld de, vTilesOB tile $7e
	ld bc, $0020
	call FarCopyData
	ld a, BANK(StageSharedPikaBoltGfx)
	ld hl, BallCaptureSmokeGfx
	ld de, vTilesSH tile $10
	ld bc, $0180
	call FarCopyData
	ld a, [wBallType]
	cp GREAT_BALL
	jr nc, .notPokeball
	ld a, Bank(PinballPokeballShakeGfx)
	ld hl, PinballPokeballShakeGfx
	ld de, vTilesOB tile $38
	ld bc, $0040
	call FarCopyData
	ret

.notPokeball
	cp ULTRA_BALL
	jr nc, .notGreatball
	ld a, Bank(PinballGreatballShakeGfx)
	ld hl, PinballGreatballShakeGfx
	ld de, vTilesOB tile $38
	ld bc, $0040
	call FarCopyData
	ret

.notGreatball
	cp MASTER_BALL
	jr nc, .notUltraBall
	ld a, Bank(PinballUltraballShakeGfx)
	ld hl, PinballUltraballShakeGfx
	ld de, vTilesOB tile $38
	ld bc, $0040
	call FarCopyData
	ret

.notUltraBall
	ld a, Bank(PinballMasterballShakeGfx)
	ld hl, PinballMasterballShakeGfx
	ld de, vTilesOB tile $38
	ld bc, $0040
	call FarCopyData
	ret

Func_1c3ac: ; 0x1c3ac
	ld a, $80
	hlCoord 7, 4, vBGMap
	call Func_1c3c3
	hlCoord 7, 5, vBGMap
	call Func_1c3c3
	hlCoord 7, 6, vBGMap
	call Func_1c3c3
	hlCoord 7, 7, vBGMap
	; fall through

Func_1c3c3: ; 0x1c3c3
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret

Func_1c3ca: ; 0x1c3ca
	ld hl, wd586
	ld b, $18
.asm_1c3cf
	ld a, [hli]
	xor $1
	ld [hli], a
	dec b
	jr nz, .asm_1c3cf
	callba Func_10184
	ld a, [hGameBoyColorFlag]
	and a
	callba nz, Func_102bc
	ret

Func_1c3ee: ; 0x1c3ee
	ld a, [wInSpecialMode]
	and a
	ret z
	ld a, [wSpecialMode]
	cp $1
	ret nz
	ld a, [wd554]
	cp $3
	ret z
	ld a, [wCurrentStage]
	bit 0, a
	jr nz, .asm_1c416
	ld a, BANK(EvolutionTrinketsGfx)
	ld hl, EvolutionTrinketsGfx
	ld de, vTilesOB tile $60
	ld bc, $00e0
	call FarCopyData
	jr .asm_1c424

.asm_1c416
	ld a, BANK(EvolutionTrinketsGfx)
	ld hl, EvolutionTrinketsGfx
	ld de, vTilesOB tile $20
	ld bc, $00e0
	call FarCopyData
.asm_1c424
	ld a, [wd551]
	and a
	ret z
	ld a, [hGameBoyColorFlag]
	and a
	ret z
	ld a, BANK(PaletteData_dd188)
	ld hl, PaletteData_dd188
	ld de, $0070
	ld bc, $0010
	call Func_6fd
	ret

Func_1c43c: ; 0x1c43c
	ld a, [wInSpecialMode]
	and a
	jr z, .asm_1c458
	ld a, [wSpecialMode]
	and a
	jr nz, .asm_1c450
	ld a, [wNumMonHits]
	and a
	call nz, Func_1c46d
	ret

.asm_1c450
	cp $1
	jr nz, .asm_1c458
	call Func_1c47d
	ret

.asm_1c458
	ld a, [wd624]
	call Func_1f265
	ld a, BANK(CaughtPokeballGfx)
	ld hl, CaughtPokeballGfx
	ld de, vTilesSH tile $2e
	ld bc, $0020
	call FarCopyData
	ret

Func_1c46d: ; 0x1c46d
	push af
	callba Func_10611
	pop af
	dec a
	jr nz, Func_1c46d
	ret

Func_1c47d: ; 0x1c47d
	ld de, $0000
	ld a, [wd554]
	and a
	ret z
	ld b, a
.asm_1c486
	ld a, [wCurrentEvolutionType]
	call Func_1c491
	inc de
	dec b
	jr nz, .asm_1c486
	ret

Func_1c491: ; 0x1c491
	push bc
	push de
	dec a
	ld c, a
	ld b, $0
	swap c
	sla c
	ld hl, EvolutionProgressIconsGfx
	add hl, bc
	swap e
	sla e
	push hl
	ld hl, vTilesSH tile $2e
	add hl, de
	ld d, h
	ld e, l
	pop hl
	ld bc, $0020
	ld a, BANK(EvolutionProgressIconsGfx)
	call FarCopyData
	pop de
	pop bc
	ret

Func_1c4b6: ; 0x1c4b6
	ld a, [wInSpecialMode]
	and a
	jr nz, .asm_1c4f0
	ld a, [wd609]
	and a
	jr z, .asm_1c4d2
	ld a, [wd498]
	add $15
	callba Func_30256
	ret

.asm_1c4d2
	ld a, [wd608]
	and a
	jr z, .asm_1c4e5
	ld a, $1a
	callba Func_30256
	ret

.asm_1c4e5
	callba Func_30253
	ret

.asm_1c4f0
	ld a, [wSpecialMode]
	cp $2
	ret nz
	ld a, [wd54d]
	cp $3
	jr nz, .asm_1c508
	callba Func_30253
	ret

.asm_1c508
	ld a, [wd604]
	and a
	ld a, $14
	jr nz, .asm_1c515
	ld a, [wd55a]
	add $12
.asm_1c515
	callba Func_30256
	ret