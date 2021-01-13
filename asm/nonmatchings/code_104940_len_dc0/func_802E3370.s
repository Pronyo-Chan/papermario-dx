.set noat      # allow manual use of $at
.set noreorder # don't insert nops after branches

glabel func_802E3370
/* 104BF0 802E3370 27BDFFE0 */  addiu     $sp, $sp, -0x20
/* 104BF4 802E3374 AFB00010 */  sw        $s0, 0x10($sp)
/* 104BF8 802E3378 0080802D */  daddu     $s0, $a0, $zero
/* 104BFC 802E337C 3C058011 */  lui       $a1, %hi(gPlayerStatus)
/* 104C00 802E3380 24A5EFC8 */  addiu     $a1, $a1, %lo(gPlayerStatus)
/* 104C04 802E3384 AFB20018 */  sw        $s2, 0x18($sp)
/* 104C08 802E3388 AFBF001C */  sw        $ra, 0x1c($sp)
/* 104C0C 802E338C AFB10014 */  sw        $s1, 0x14($sp)
/* 104C10 802E3390 9202000B */  lbu       $v0, 0xb($s0)
/* 104C14 802E3394 8E110040 */  lw        $s1, 0x40($s0)
/* 104C18 802E3398 2C4200FF */  sltiu     $v0, $v0, 0xff
/* 104C1C 802E339C 10400003 */  beqz      $v0, .L802E33AC
/* 104C20 802E33A0 00A0902D */   daddu    $s2, $a1, $zero
/* 104C24 802E33A4 080B8D29 */  j         .L802E34A4
/* 104C28 802E33A8 3C03FFDF */   lui      $v1, 0xffdf
.L802E33AC:
/* 104C2C 802E33AC 8624000E */  lh        $a0, 0xe($s1)
/* 104C30 802E33B0 9623000E */  lhu       $v1, 0xe($s1)
/* 104C34 802E33B4 30828000 */  andi      $v0, $a0, 0x8000
/* 104C38 802E33B8 1440003F */  bnez      $v0, .L802E34B8
/* 104C3C 802E33BC 28820096 */   slti     $v0, $a0, 0x96
/* 104C40 802E33C0 1440009C */  bnez      $v0, .L802E3634
/* 104C44 802E33C4 24620001 */   addiu    $v0, $v1, 1
/* 104C48 802E33C8 C6220014 */  lwc1      $f2, 0x14($s1)
/* 104C4C 802E33CC 3C0141C8 */  lui       $at, 0x41c8
/* 104C50 802E33D0 44810000 */  mtc1      $at, $f0
/* 104C54 802E33D4 00000000 */  nop
/* 104C58 802E33D8 46001001 */  sub.s     $f0, $f2, $f0
/* 104C5C 802E33DC C604004C */  lwc1      $f4, 0x4c($s0)
/* 104C60 802E33E0 4600203C */  c.lt.s    $f4, $f0
/* 104C64 802E33E4 00000000 */  nop
/* 104C68 802E33E8 4502000A */  bc1fl     .L802E3414
/* 104C6C 802E33EC 46041081 */   sub.s    $f2, $f2, $f4
/* 104C70 802E33F0 46022001 */  sub.s     $f0, $f4, $f2
/* 104C74 802E33F4 3C014248 */  lui       $at, 0x4248
/* 104C78 802E33F8 44811000 */  mtc1      $at, $f2
/* 104C7C 802E33FC 00000000 */  nop
/* 104C80 802E3400 46020000 */  add.s     $f0, $f0, $f2
/* 104C84 802E3404 3C013E00 */  lui       $at, 0x3e00
/* 104C88 802E3408 44811000 */  mtc1      $at, $f2
/* 104C8C 802E340C 080B8D08 */  j         .L802E3420
/* 104C90 802E3410 00000000 */   nop
.L802E3414:
/* 104C94 802E3414 3C013E00 */  lui       $at, 0x3e00
/* 104C98 802E3418 44810000 */  mtc1      $at, $f0
/* 104C9C 802E341C 00000000 */  nop
.L802E3420:
/* 104CA0 802E3420 46001102 */  mul.s     $f4, $f2, $f0
/* 104CA4 802E3424 00000000 */  nop
/* 104CA8 802E3428 3C01802F */  lui       $at, %hi(D_802EB1F0)
/* 104CAC 802E342C D422B1F0 */  ldc1      $f2, %lo(D_802EB1F0)($at)
/* 104CB0 802E3430 46002021 */  cvt.d.s   $f0, $f4
/* 104CB4 802E3434 4620103C */  c.lt.d    $f2, $f0
/* 104CB8 802E3438 00000000 */  nop
/* 104CBC 802E343C 45000004 */  bc1f      .L802E3450
/* 104CC0 802E3440 00000000 */   nop
/* 104CC4 802E3444 3C013F99 */  lui       $at, 0x3f99
/* 104CC8 802E3448 3421999A */  ori       $at, $at, 0x999a
/* 104CCC 802E344C 44812000 */  mtc1      $at, $f4
.L802E3450:
/* 104CD0 802E3450 3C01802F */  lui       $at, %hi(D_802EB1F8)
/* 104CD4 802E3454 D422B1F8 */  ldc1      $f2, %lo(D_802EB1F8)($at)
/* 104CD8 802E3458 46002021 */  cvt.d.s   $f0, $f4
/* 104CDC 802E345C 4622003C */  c.lt.d    $f0, $f2
/* 104CE0 802E3460 00000000 */  nop
/* 104CE4 802E3464 45000004 */  bc1f      .L802E3478
/* 104CE8 802E3468 00000000 */   nop
/* 104CEC 802E346C 3C013E99 */  lui       $at, 0x3e99
/* 104CF0 802E3470 3421999A */  ori       $at, $at, 0x999a
/* 104CF4 802E3474 44812000 */  mtc1      $at, $f4
.L802E3478:
/* 104CF8 802E3478 C600004C */  lwc1      $f0, 0x4c($s0)
/* 104CFC 802E347C 46040000 */  add.s     $f0, $f0, $f4
/* 104D00 802E3480 E600004C */  swc1      $f0, 0x4c($s0)
/* 104D04 802E3484 C6220014 */  lwc1      $f2, 0x14($s1)
/* 104D08 802E3488 4600103C */  c.lt.s    $f2, $f0
/* 104D0C 802E348C 00000000 */  nop
/* 104D10 802E3490 45000069 */  bc1f      .L802E3638
/* 104D14 802E3494 3C03FFDF */   lui      $v1, 0xffdf
/* 104D18 802E3498 2402FFFF */  addiu     $v0, $zero, -1
/* 104D1C 802E349C E602004C */  swc1      $f2, 0x4c($s0)
/* 104D20 802E34A0 A622000E */  sh        $v0, 0xe($s1)
.L802E34A4:
/* 104D24 802E34A4 8E020000 */  lw        $v0, ($s0)
/* 104D28 802E34A8 3463FFFF */  ori       $v1, $v1, 0xffff
/* 104D2C 802E34AC 00431024 */  and       $v0, $v0, $v1
/* 104D30 802E34B0 080B8D8E */  j         .L802E3638
/* 104D34 802E34B4 AE020000 */   sw       $v0, ($s0)
.L802E34B8:
/* 104D38 802E34B8 92020006 */  lbu       $v0, 6($s0)
/* 104D3C 802E34BC 30420004 */  andi      $v0, $v0, 4
/* 104D40 802E34C0 10400014 */  beqz      $v0, .L802E3514
/* 104D44 802E34C4 00000000 */   nop
/* 104D48 802E34C8 8CA20000 */  lw        $v0, ($a1)
/* 104D4C 802E34CC 30420002 */  andi      $v0, $v0, 2
/* 104D50 802E34D0 14400058 */  bnez      $v0, .L802E3634
/* 104D54 802E34D4 24020001 */   addiu    $v0, $zero, 1
/* 104D58 802E34D8 86040016 */  lh        $a0, 0x16($s0)
/* 104D5C 802E34DC 0C044181 */  jal       get_shadow_by_index
/* 104D60 802E34E0 00000000 */   nop
/* 104D64 802E34E4 10400017 */  beqz      $v0, .L802E3544
/* 104D68 802E34E8 00000000 */   nop
/* 104D6C 802E34EC C600004C */  lwc1      $f0, 0x4c($s0)
/* 104D70 802E34F0 C4420014 */  lwc1      $f2, 0x14($v0)
/* 104D74 802E34F4 46020081 */  sub.s     $f2, $f0, $f2
/* 104D78 802E34F8 864200B0 */  lh        $v0, 0xb0($s2)
/* 104D7C 802E34FC 46020001 */  sub.s     $f0, $f0, $f2
/* 104D80 802E3500 24420001 */  addiu     $v0, $v0, 1
/* 104D84 802E3504 44821000 */  mtc1      $v0, $f2
/* 104D88 802E3508 00000000 */  nop
/* 104D8C 802E350C 080B8D4B */  j         .L802E352C
/* 104D90 802E3510 468010A0 */   cvt.s.w  $f2, $f2
.L802E3514:
/* 104D94 802E3514 0C044181 */  jal       get_shadow_by_index
/* 104D98 802E3518 86040016 */   lh       $a0, 0x16($s0)
/* 104D9C 802E351C 10400009 */  beqz      $v0, .L802E3544
/* 104DA0 802E3520 00000000 */   nop
/* 104DA4 802E3524 C600004C */  lwc1      $f0, 0x4c($s0)
/* 104DA8 802E3528 C4420014 */  lwc1      $f2, 0x14($v0)
.L802E352C:
/* 104DAC 802E352C 4602003E */  c.le.s    $f0, $f2
/* 104DB0 802E3530 00000000 */  nop
/* 104DB4 802E3534 45000003 */  bc1f      .L802E3544
/* 104DB8 802E3538 24020001 */   addiu    $v0, $zero, 1
/* 104DBC 802E353C E602004C */  swc1      $f2, 0x4c($s0)
/* 104DC0 802E3540 A622000E */  sh        $v0, 0xe($s1)
.L802E3544:
/* 104DC4 802E3544 92020006 */  lbu       $v0, 6($s0)
/* 104DC8 802E3548 30420004 */  andi      $v0, $v0, 4
/* 104DCC 802E354C 14400039 */  bnez      $v0, .L802E3634
/* 104DD0 802E3550 24020001 */   addiu    $v0, $zero, 1
/* 104DD4 802E3554 C6220014 */  lwc1      $f2, 0x14($s1)
/* 104DD8 802E3558 3C0141C8 */  lui       $at, 0x41c8
/* 104DDC 802E355C 44810000 */  mtc1      $at, $f0
/* 104DE0 802E3560 00000000 */  nop
/* 104DE4 802E3564 46001001 */  sub.s     $f0, $f2, $f0
/* 104DE8 802E3568 C604004C */  lwc1      $f4, 0x4c($s0)
/* 104DEC 802E356C 4600203C */  c.lt.s    $f4, $f0
/* 104DF0 802E3570 00000000 */  nop
/* 104DF4 802E3574 4502000A */  bc1fl     .L802E35A0
/* 104DF8 802E3578 46041081 */   sub.s    $f2, $f2, $f4
/* 104DFC 802E357C 46022001 */  sub.s     $f0, $f4, $f2
/* 104E00 802E3580 3C014248 */  lui       $at, 0x4248
/* 104E04 802E3584 44811000 */  mtc1      $at, $f2
/* 104E08 802E3588 00000000 */  nop
/* 104E0C 802E358C 46020000 */  add.s     $f0, $f0, $f2
/* 104E10 802E3590 3C013E00 */  lui       $at, 0x3e00
/* 104E14 802E3594 44811000 */  mtc1      $at, $f2
/* 104E18 802E3598 080B8D6B */  j         .L802E35AC
/* 104E1C 802E359C 00000000 */   nop
.L802E35A0:
/* 104E20 802E35A0 3C013E00 */  lui       $at, 0x3e00
/* 104E24 802E35A4 44810000 */  mtc1      $at, $f0
/* 104E28 802E35A8 00000000 */  nop
.L802E35AC:
/* 104E2C 802E35AC 46001102 */  mul.s     $f4, $f2, $f0
/* 104E30 802E35B0 00000000 */  nop
/* 104E34 802E35B4 3C01802F */  lui       $at, %hi(D_802EB200)
/* 104E38 802E35B8 D422B200 */  ldc1      $f2, %lo(D_802EB200)($at)
/* 104E3C 802E35BC 46002021 */  cvt.d.s   $f0, $f4
/* 104E40 802E35C0 4620103C */  c.lt.d    $f2, $f0
/* 104E44 802E35C4 00000000 */  nop
/* 104E48 802E35C8 45000004 */  bc1f      .L802E35DC
/* 104E4C 802E35CC 00000000 */   nop
/* 104E50 802E35D0 3C013F99 */  lui       $at, 0x3f99
/* 104E54 802E35D4 3421999A */  ori       $at, $at, 0x999a
/* 104E58 802E35D8 44812000 */  mtc1      $at, $f4
.L802E35DC:
/* 104E5C 802E35DC 3C01802F */  lui       $at, %hi(D_802EB208)
/* 104E60 802E35E0 D422B208 */  ldc1      $f2, %lo(D_802EB208)($at)
/* 104E64 802E35E4 46002021 */  cvt.d.s   $f0, $f4
/* 104E68 802E35E8 4622003C */  c.lt.d    $f0, $f2
/* 104E6C 802E35EC 00000000 */  nop
/* 104E70 802E35F0 45000004 */  bc1f      .L802E3604
/* 104E74 802E35F4 00000000 */   nop
/* 104E78 802E35F8 3C013E99 */  lui       $at, 0x3e99
/* 104E7C 802E35FC 3421999A */  ori       $at, $at, 0x999a
/* 104E80 802E3600 44812000 */  mtc1      $at, $f4
.L802E3604:
/* 104E84 802E3604 C600004C */  lwc1      $f0, 0x4c($s0)
/* 104E88 802E3608 46040001 */  sub.s     $f0, $f0, $f4
/* 104E8C 802E360C 3C014248 */  lui       $at, 0x4248
/* 104E90 802E3610 44811000 */  mtc1      $at, $f2
/* 104E94 802E3614 E600004C */  swc1      $f0, 0x4c($s0)
/* 104E98 802E3618 C6240014 */  lwc1      $f4, 0x14($s1)
/* 104E9C 802E361C 46022101 */  sub.s     $f4, $f4, $f2
/* 104EA0 802E3620 4604003C */  c.lt.s    $f0, $f4
/* 104EA4 802E3624 00000000 */  nop
/* 104EA8 802E3628 45000003 */  bc1f      .L802E3638
/* 104EAC 802E362C 24020001 */   addiu    $v0, $zero, 1
/* 104EB0 802E3630 E604004C */  swc1      $f4, 0x4c($s0)
.L802E3634:
/* 104EB4 802E3634 A622000E */  sh        $v0, 0xe($s1)
.L802E3638:
/* 104EB8 802E3638 8FBF001C */  lw        $ra, 0x1c($sp)
/* 104EBC 802E363C 8FB20018 */  lw        $s2, 0x18($sp)
/* 104EC0 802E3640 8FB10014 */  lw        $s1, 0x14($sp)
/* 104EC4 802E3644 8FB00010 */  lw        $s0, 0x10($sp)
/* 104EC8 802E3648 03E00008 */  jr        $ra
/* 104ECC 802E364C 27BD0020 */   addiu    $sp, $sp, 0x20
