.include "macro.inc"

/* assembler directives */
.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.set gp=64     /* allow use of 64-bit general purpose registers */

.section .text, "ax"

/* Generated by spimdisasm 1.11.1 */

# Handwritten function
glabel __osSetCompare
/* 46A80 8006B680 27BDFFC8 */  addiu     $sp, $sp, -0x38
/* 46A84 8006B684 FFBF0030 */  sd        $ra, 0x30($sp)
/* 46A88 8006B688 FFBE0028 */  sd        $fp, 0x28($sp)
/* 46A8C 8006B68C 03A0F02D */  daddu     $fp, $sp, $zero
/* 46A90 8006B690 AFC4003C */  sw        $a0, 0x3C($fp)
/* 46A94 8006B694 8FC2003C */  lw        $v0, 0x3C($fp)
/* 46A98 8006B698 1040001C */  beqz      $v0, .LIQUE_8006B70C
/* 46A9C 8006B69C 00000000 */   nop
/* 46AA0 8006B6A0 0C019B40 */  jal       __osDisableInt
/* 46AA4 8006B6A4 00000000 */   nop
/* 46AA8 8006B6A8 AFC20020 */  sw        $v0, 0x20($fp)
/* 46AAC 8006B6AC 8FC2003C */  lw        $v0, 0x3C($fp)
/* 46AB0 8006B6B0 3C03800A */  lui       $v1, %hi(__osBbLastVCount)
/* 46AB4 8006B6B4 8C6391E8 */  lw        $v1, %lo(__osBbLastVCount)($v1)
/* 46AB8 8006B6B8 0043102B */  sltu      $v0, $v0, $v1
/* 46ABC 8006B6BC 3C03800A */  lui       $v1, %hi(__osBbVCountWraps)
/* 46AC0 8006B6C0 8C639210 */  lw        $v1, %lo(__osBbVCountWraps)($v1)
/* 46AC4 8006B6C4 00431021 */  addu      $v0, $v0, $v1
/* 46AC8 8006B6C8 AFC20024 */  sw        $v0, 0x24($fp)
/* 46ACC 8006B6CC 9FC20024 */  lwu       $v0, 0x24($fp)
/* 46AD0 8006B6D0 0002183C */  dsll32    $v1, $v0, 0
/* 46AD4 8006B6D4 9FC4003C */  lwu       $a0, 0x3C($fp)
/* 46AD8 8006B6D8 00641025 */  or        $v0, $v1, $a0
/* 46ADC 8006B6DC 0040202D */  daddu     $a0, $v0, $zero
/* 46AE0 8006B6E0 00041878 */  dsll      $v1, $a0, 1
/* 46AE4 8006B6E4 0062182D */  daddu     $v1, $v1, $v0
/* 46AE8 8006B6E8 000321B8 */  dsll      $a0, $v1, 6
/* 46AEC 8006B6EC 2401007D */  addiu     $at, $zero, 0x7D
/* 46AF0 8006B6F0 0081001F */  ddivu     $zero, $a0, $at
/* 46AF4 8006B6F4 00001012 */  mflo      $v0
/* 46AF8 8006B6F8 0002103C */  dsll32    $v0, $v0, 0
/* 46AFC 8006B6FC 0002103F */  dsra32    $v0, $v0, 0
/* 46B00 8006B700 AFC2003C */  sw        $v0, 0x3C($fp)
/* 46B04 8006B704 0C019B5C */  jal       __osRestoreInt
/* 46B08 8006B708 8FC40020 */   lw       $a0, 0x20($fp)
.LIQUE_8006B70C:
/* 46B0C 8006B70C 8FC5003C */  lw        $a1, 0x3C($fp)
/* 46B10 8006B710 40855800 */  mtc0      $a1, $11 # handwritten instruction
/* 46B14 8006B714 03C0E82D */  daddu     $sp, $fp, $zero
/* 46B18 8006B718 DFBF0030 */  ld        $ra, 0x30($sp)
/* 46B1C 8006B71C DFBE0028 */  ld        $fp, 0x28($sp)
/* 46B20 8006B720 03E00008 */  jr        $ra
/* 46B24 8006B724 27BD0038 */   addiu    $sp, $sp, 0x38
/* 46B28 8006B728 00000000 */  nop
/* 46B2C 8006B72C 00000000 */  nop
