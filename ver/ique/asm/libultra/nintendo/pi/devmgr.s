.include "macro.inc"

/* assembler directives */
.set noat      /* allow manual use of $at */
.set noreorder /* don't insert nops after branches */
.set gp=64     /* allow use of 64-bit general purpose registers */

.section .text, "ax"

/* Generated by spimdisasm 1.11.1 */

glabel __osDevMgrMain
/* 42A90 80067690 27BDFFC0 */  addiu     $sp, $sp, -0x40
/* 42A94 80067694 AFB20030 */  sw        $s2, 0x30($sp)
/* 42A98 80067698 00809021 */  addu      $s2, $a0, $zero
/* 42A9C 8006769C AFB40038 */  sw        $s4, 0x38($sp)
/* 42AA0 800676A0 0000A021 */  addu      $s4, $zero, $zero
/* 42AA4 800676A4 AFBF003C */  sw        $ra, 0x3C($sp)
/* 42AA8 800676A8 AFB30034 */  sw        $s3, 0x34($sp)
/* 42AAC 800676AC AFB1002C */  sw        $s1, 0x2C($sp)
/* 42AB0 800676B0 AFB00028 */  sw        $s0, 0x28($sp)
/* 42AB4 800676B4 AFA00018 */  sw        $zero, 0x18($sp)
/* 42AB8 800676B8 27A50018 */  addiu     $a1, $sp, 0x18
.LIQUE_800676BC:
/* 42ABC 800676BC 8E440008 */  lw        $a0, 0x8($s2)
/* 42AC0 800676C0 0C018DCC */  jal       osRecvMesg
/* 42AC4 800676C4 24060001 */   addiu    $a2, $zero, 0x1
/* 42AC8 800676C8 8FA50018 */  lw        $a1, 0x18($sp)
/* 42ACC 800676CC 8CA30014 */  lw        $v1, 0x14($a1)
/* 42AD0 800676D0 10600084 */  beqz      $v1, .LIQUE_800678E4
/* 42AD4 800676D4 24020002 */   addiu    $v0, $zero, 0x2
/* 42AD8 800676D8 90660004 */  lbu       $a2, 0x4($v1)
/* 42ADC 800676DC 54C20082 */  bnel      $a2, $v0, .LIQUE_800678E8
/* 42AE0 800676E0 94A20000 */   lhu      $v0, 0x0($a1)
/* 42AE4 800676E4 8C620014 */  lw        $v0, 0x14($v1)
/* 42AE8 800676E8 2C420002 */  sltiu     $v0, $v0, 0x2
/* 42AEC 800676EC 1040007D */  beqz      $v0, .LIQUE_800678E4
/* 42AF0 800676F0 24700014 */   addiu    $s0, $v1, 0x14
/* 42AF4 800676F4 2403FFFF */  addiu     $v1, $zero, -0x1
/* 42AF8 800676F8 AE030008 */  sw        $v1, 0x8($s0)
/* 42AFC 800676FC 24030003 */  addiu     $v1, $zero, 0x3
/* 42B00 80067700 96040006 */  lhu       $a0, 0x6($s0)
/* 42B04 80067704 96050004 */  lhu       $a1, 0x4($s0)
/* 42B08 80067708 000410C0 */  sll       $v0, $a0, 3
/* 42B0C 8006770C 00441021 */  addu      $v0, $v0, $a0
/* 42B10 80067710 00021080 */  sll       $v0, $v0, 2
/* 42B14 80067714 24420018 */  addiu     $v0, $v0, 0x18
/* 42B18 80067718 10A30006 */  beq       $a1, $v1, .LIQUE_80067734
/* 42B1C 8006771C 02028821 */   addu     $s1, $s0, $v0
/* 42B20 80067720 8E220004 */  lw        $v0, 0x4($s1)
/* 42B24 80067724 8E23000C */  lw        $v1, 0xC($s1)
/* 42B28 80067728 00431023 */  subu      $v0, $v0, $v1
/* 42B2C 8006772C AE220004 */  sw        $v0, 0x4($s1)
/* 42B30 80067730 96050004 */  lhu       $a1, 0x4($s0)
.LIQUE_80067734:
/* 42B34 80067734 14A60008 */  bne       $a1, $a2, .LIQUE_80067758
/* 42B38 80067738 00009821 */   addu     $s3, $zero, $zero
/* 42B3C 8006773C 8FA20018 */  lw        $v0, 0x18($sp)
/* 42B40 80067740 8C430014 */  lw        $v1, 0x14($v0)
/* 42B44 80067744 8C640014 */  lw        $a0, 0x14($v1)
/* 42B48 80067748 14800004 */  bnez      $a0, .LIQUE_8006775C
/* 42B4C 8006774C 27A5001C */   addiu    $a1, $sp, 0x1C
/* 42B50 80067750 08019DD7 */  j         .LIQUE_8006775C
/* 42B54 80067754 24130001 */   addiu    $s3, $zero, 0x1
.LIQUE_80067758:
/* 42B58 80067758 27A5001C */  addiu     $a1, $sp, 0x1C
.LIQUE_8006775C:
/* 42B5C 8006775C 8E440010 */  lw        $a0, 0x10($s2)
/* 42B60 80067760 0C018DCC */  jal       osRecvMesg
/* 42B64 80067764 24060001 */   addiu    $a2, $zero, 0x1
/* 42B68 80067768 3C040010 */  lui       $a0, (0x100401 >> 16)
/* 42B6C 8006776C 0C01AF40 */  jal       __osResetGlobalIntMask
/* 42B70 80067770 34840401 */   ori      $a0, $a0, (0x100401 & 0xFFFF)
/* 42B74 80067774 3C050500 */  lui       $a1, (0x5000510 >> 16)
/* 42B78 80067778 34A50510 */  ori       $a1, $a1, (0x5000510 & 0xFFFF)
/* 42B7C 8006777C 3C068000 */  lui       $a2, (0x80000000 >> 16)
/* 42B80 80067780 8FA20018 */  lw        $v0, 0x18($sp)
/* 42B84 80067784 8E030010 */  lw        $v1, 0x10($s0)
/* 42B88 80067788 8C440014 */  lw        $a0, 0x14($v0)
/* 42B8C 8006778C 0C01B000 */  jal       __osEPiRawWriteIo
/* 42B90 80067790 00663025 */   or       $a2, $v1, $a2
.LIQUE_80067794:
/* 42B94 80067794 27A50020 */  addiu     $a1, $sp, 0x20
/* 42B98 80067798 8E44000C */  lw        $a0, 0xC($s2)
/* 42B9C 8006779C 0C018DCC */  jal       osRecvMesg
/* 42BA0 800677A0 24060001 */   addiu    $a2, $zero, 0x1
/* 42BA4 800677A4 8FA50018 */  lw        $a1, 0x18($sp)
/* 42BA8 800677A8 8CA60014 */  lw        $a2, 0x14($a1)
/* 42BAC 800677AC 24D00014 */  addiu     $s0, $a2, 0x14
/* 42BB0 800677B0 96030006 */  lhu       $v1, 0x6($s0)
/* 42BB4 800677B4 000310C0 */  sll       $v0, $v1, 3
/* 42BB8 800677B8 00431021 */  addu      $v0, $v0, $v1
/* 42BBC 800677BC 00021080 */  sll       $v0, $v0, 2
/* 42BC0 800677C0 24420018 */  addiu     $v0, $v0, 0x18
/* 42BC4 800677C4 02028821 */  addu      $s1, $s0, $v0
/* 42BC8 800677C8 8E240000 */  lw        $a0, 0x0($s1)
/* 42BCC 800677CC 2403001D */  addiu     $v1, $zero, 0x1D
/* 42BD0 800677D0 5483002B */  bnel      $a0, $v1, .LIQUE_80067880
/* 42BD4 800677D4 8CA40004 */   lw       $a0, 0x4($a1)
/* 42BD8 800677D8 00C02021 */  addu      $a0, $a2, $zero
/* 42BDC 800677DC 3C050500 */  lui       $a1, (0x5000510 >> 16)
/* 42BE0 800677E0 34A50510 */  ori       $a1, $a1, (0x5000510 & 0xFFFF)
/* 42BE4 800677E4 8E030010 */  lw        $v1, 0x10($s0)
/* 42BE8 800677E8 3C061000 */  lui       $a2, (0x10000000 >> 16)
/* 42BEC 800677EC 0C01B000 */  jal       __osEPiRawWriteIo
/* 42BF0 800677F0 00663025 */   or       $a2, $v1, $a2
/* 42BF4 800677F4 3C050500 */  lui       $a1, (0x5000510 >> 16)
/* 42BF8 800677F8 8FA20018 */  lw        $v0, 0x18($sp)
/* 42BFC 800677FC 8E060010 */  lw        $a2, 0x10($s0)
/* 42C00 80067800 8C440014 */  lw        $a0, 0x14($v0)
/* 42C04 80067804 0C01B000 */  jal       __osEPiRawWriteIo
/* 42C08 80067808 34A50510 */   ori      $a1, $a1, (0x5000510 & 0xFFFF)
/* 42C0C 8006780C 3C050500 */  lui       $a1, (0x5000508 >> 16)
/* 42C10 80067810 8FA20018 */  lw        $v0, 0x18($sp)
/* 42C14 80067814 34A50508 */  ori       $a1, $a1, (0x5000508 & 0xFFFF)
/* 42C18 80067818 8C440014 */  lw        $a0, 0x14($v0)
/* 42C1C 8006781C 0C01AFA0 */  jal       __osEPiRawReadIo
/* 42C20 80067820 27A60024 */   addiu    $a2, $sp, 0x24
/* 42C24 80067824 8FA30024 */  lw        $v1, 0x24($sp)
/* 42C28 80067828 3C020200 */  lui       $v0, (0x2000000 >> 16)
/* 42C2C 8006782C 00621824 */  and       $v1, $v1, $v0
/* 42C30 80067830 10600008 */  beqz      $v1, .LIQUE_80067854
/* 42C34 80067834 3C050500 */   lui      $a1, (0x5000510 >> 16)
/* 42C38 80067838 34A50510 */  ori       $a1, $a1, (0x5000510 & 0xFFFF)
/* 42C3C 8006783C 3C060100 */  lui       $a2, (0x1000000 >> 16)
/* 42C40 80067840 8FA20018 */  lw        $v0, 0x18($sp)
/* 42C44 80067844 8E030010 */  lw        $v1, 0x10($s0)
/* 42C48 80067848 8C440014 */  lw        $a0, 0x14($v0)
/* 42C4C 8006784C 0C01B000 */  jal       __osEPiRawWriteIo
/* 42C50 80067850 00663025 */   or       $a2, $v1, $a2
.LIQUE_80067854:
/* 42C54 80067854 3C02A460 */  lui       $v0, (0xA4600010 >> 16)
/* 42C58 80067858 34420010 */  ori       $v0, $v0, (0xA4600010 & 0xFFFF)
/* 42C5C 8006785C 3C040010 */  lui       $a0, (0x100C01 >> 16)
/* 42C60 80067860 24030004 */  addiu     $v1, $zero, 0x4
/* 42C64 80067864 24050002 */  addiu     $a1, $zero, 0x2
/* 42C68 80067868 AE230000 */  sw        $v1, 0x0($s1)
/* 42C6C 8006786C AC450000 */  sw        $a1, 0x0($v0)
/* 42C70 80067870 0C01AF28 */  jal       __osSetGlobalIntMask
/* 42C74 80067874 34840C01 */   ori      $a0, $a0, (0x100C01 & 0xFFFF)
/* 42C78 80067878 8FA50018 */  lw        $a1, 0x18($sp)
/* 42C7C 8006787C 8CA40004 */  lw        $a0, 0x4($a1)
.LIQUE_80067880:
/* 42C80 80067880 0C018E28 */  jal       osSendMesg
/* 42C84 80067884 00003021 */   addu     $a2, $zero, $zero
/* 42C88 80067888 24030001 */  addiu     $v1, $zero, 0x1
/* 42C8C 8006788C 16630008 */  bne       $s3, $v1, .LIQUE_800678B0
/* 42C90 80067890 00002821 */   addu     $a1, $zero, $zero
/* 42C94 80067894 8FA20018 */  lw        $v0, 0x18($sp)
/* 42C98 80067898 8C430014 */  lw        $v1, 0x14($v0)
/* 42C9C 8006789C 8C64002C */  lw        $a0, 0x2C($v1)
/* 42CA0 800678A0 54800004 */  bnel      $a0, $zero, .LIQUE_800678B4
/* 42CA4 800678A4 8E440010 */   lw       $a0, 0x10($s2)
/* 42CA8 800678A8 08019DE5 */  j         .LIQUE_80067794
/* 42CAC 800678AC 00009821 */   addu     $s3, $zero, $zero
.LIQUE_800678B0:
/* 42CB0 800678B0 8E440010 */  lw        $a0, 0x10($s2)
.LIQUE_800678B4:
/* 42CB4 800678B4 0C018E28 */  jal       osSendMesg
/* 42CB8 800678B8 00003021 */   addu     $a2, $zero, $zero
/* 42CBC 800678BC 8FA30018 */  lw        $v1, 0x18($sp)
/* 42CC0 800678C0 8C620014 */  lw        $v0, 0x14($v1)
/* 42CC4 800678C4 9445001A */  lhu       $a1, 0x1A($v0)
/* 42CC8 800678C8 24040001 */  addiu     $a0, $zero, 0x1
/* 42CCC 800678CC 14A4FF7B */  bne       $a1, $a0, .LIQUE_800676BC
/* 42CD0 800678D0 27A50018 */   addiu    $a1, $sp, 0x18
/* 42CD4 800678D4 0C01AE98 */  jal       osYieldThread
/* 42CD8 800678D8 00000000 */   nop
/* 42CDC 800678DC 08019DAF */  j         .LIQUE_800676BC
/* 42CE0 800678E0 27A50018 */   addiu    $a1, $sp, 0x18
.LIQUE_800678E4:
/* 42CE4 800678E4 94A20000 */  lhu       $v0, 0x0($a1)
.LIQUE_800678E8:
/* 42CE8 800678E8 2442FFF6 */  addiu     $v0, $v0, -0xA
/* 42CEC 800678EC 2C430007 */  sltiu     $v1, $v0, 0x7
/* 42CF0 800678F0 10600065 */  beqz      $v1, .LIQUE_80067A88
/* 42CF4 800678F4 00021080 */   sll      $v0, $v0, 2
/* 42CF8 800678F8 3C03800A */  lui       $v1, %hi(jtbl_IQUE_80098980)
/* 42CFC 800678FC 00621821 */  addu      $v1, $v1, $v0
/* 42D00 80067900 8C638980 */  lw        $v1, %lo(jtbl_IQUE_80098980)($v1)
/* 42D04 80067904 00600008 */  jr        $v1
/* 42D08 80067908 00000000 */   nop
glabel .LIQUE_8006790C
/* 42D0C 8006790C 27A5001C */  addiu     $a1, $sp, 0x1C
/* 42D10 80067910 8E440010 */  lw        $a0, 0x10($s2)
/* 42D14 80067914 0C018DCC */  jal       osRecvMesg
/* 42D18 80067918 24060001 */   addiu    $a2, $zero, 0x1
/* 42D1C 8006791C 3C038000 */  lui       $v1, %hi(__osBbIsBb)
/* 42D20 80067920 8C630388 */  lw        $v1, %lo(__osBbIsBb)($v1)
/* 42D24 80067924 24020001 */  addiu     $v0, $zero, 0x1
/* 42D28 80067928 1462000E */  bne       $v1, $v0, .LIQUE_80067964
/* 42D2C 8006792C 8FA30018 */   lw       $v1, 0x18($sp)
/* 42D30 80067930 8C620008 */  lw        $v0, 0x8($v1)
/* 42D34 80067934 3042007F */  andi      $v0, $v0, 0x7F
/* 42D38 80067938 2C420060 */  sltiu     $v0, $v0, 0x60
/* 42D3C 8006793C 1440000A */  bnez      $v0, .LIQUE_80067968
/* 42D40 80067940 8E420014 */   lw       $v0, 0x14($s2)
/* 42D44 80067944 24140001 */  addiu     $s4, $zero, 0x1
/* 42D48 80067948 00002021 */  addu      $a0, $zero, $zero
/* 42D4C 8006794C 8C65000C */  lw        $a1, 0xC($v1)
/* 42D50 80067950 8C670010 */  lw        $a3, 0x10($v1)
/* 42D54 80067954 0040F809 */  jalr      $v0
/* 42D58 80067958 3C068060 */   lui      $a2, (0x80600000 >> 16)
/* 42D5C 8006795C 08019EA3 */  j         .LIQUE_80067A8C
/* 42D60 80067960 00000000 */   nop
.LIQUE_80067964:
/* 42D64 80067964 8E420014 */  lw        $v0, 0x14($s2)
.LIQUE_80067968:
/* 42D68 80067968 8C65000C */  lw        $a1, 0xC($v1)
/* 42D6C 8006796C 8C660008 */  lw        $a2, 0x8($v1)
/* 42D70 80067970 8C670010 */  lw        $a3, 0x10($v1)
/* 42D74 80067974 0040F809 */  jalr      $v0
/* 42D78 80067978 00002021 */   addu     $a0, $zero, $zero
/* 42D7C 8006797C 08019EA3 */  j         .LIQUE_80067A8C
/* 42D80 80067980 00000000 */   nop
glabel .LIQUE_80067984
/* 42D84 80067984 27A5001C */  addiu     $a1, $sp, 0x1C
/* 42D88 80067988 8E440010 */  lw        $a0, 0x10($s2)
/* 42D8C 8006798C 0C018DCC */  jal       osRecvMesg
/* 42D90 80067990 24060001 */   addiu    $a2, $zero, 0x1
/* 42D94 80067994 8FA30018 */  lw        $v1, 0x18($sp)
/* 42D98 80067998 8E420014 */  lw        $v0, 0x14($s2)
/* 42D9C 8006799C 8C65000C */  lw        $a1, 0xC($v1)
/* 42DA0 800679A0 8C660008 */  lw        $a2, 0x8($v1)
/* 42DA4 800679A4 8C670010 */  lw        $a3, 0x10($v1)
/* 42DA8 800679A8 0040F809 */  jalr      $v0
/* 42DAC 800679AC 24040001 */   addiu    $a0, $zero, 0x1
/* 42DB0 800679B0 08019EA3 */  j         .LIQUE_80067A8C
/* 42DB4 800679B4 00000000 */   nop
glabel .LIQUE_800679B8
/* 42DB8 800679B8 27A5001C */  addiu     $a1, $sp, 0x1C
/* 42DBC 800679BC 8E440010 */  lw        $a0, 0x10($s2)
/* 42DC0 800679C0 0C018DCC */  jal       osRecvMesg
/* 42DC4 800679C4 24060001 */   addiu    $a2, $zero, 0x1
/* 42DC8 800679C8 3C038000 */  lui       $v1, %hi(__osBbIsBb)
/* 42DCC 800679CC 8C630388 */  lw        $v1, %lo(__osBbIsBb)($v1)
/* 42DD0 800679D0 24020001 */  addiu     $v0, $zero, 0x1
/* 42DD4 800679D4 14620010 */  bne       $v1, $v0, .LIQUE_80067A18
/* 42DD8 800679D8 8FA30018 */   lw       $v1, 0x18($sp)
/* 42DDC 800679DC 8C620008 */  lw        $v0, 0x8($v1)
/* 42DE0 800679E0 3042007F */  andi      $v0, $v0, 0x7F
/* 42DE4 800679E4 2C420060 */  sltiu     $v0, $v0, 0x60
/* 42DE8 800679E8 1440000C */  bnez      $v0, .LIQUE_80067A1C
/* 42DEC 800679EC 8C620010 */   lw       $v0, 0x10($v1)
/* 42DF0 800679F0 24140001 */  addiu     $s4, $zero, 0x1
/* 42DF4 800679F4 00002821 */  addu      $a1, $zero, $zero
/* 42DF8 800679F8 AFA20010 */  sw        $v0, 0x10($sp)
/* 42DFC 800679FC 8C640014 */  lw        $a0, 0x14($v1)
/* 42E00 80067A00 8C66000C */  lw        $a2, 0xC($v1)
/* 42E04 80067A04 8E420018 */  lw        $v0, 0x18($s2)
/* 42E08 80067A08 0040F809 */  jalr      $v0
/* 42E0C 80067A0C 3C078060 */   lui      $a3, (0x80600000 >> 16)
/* 42E10 80067A10 08019EA3 */  j         .LIQUE_80067A8C
/* 42E14 80067A14 00000000 */   nop
.LIQUE_80067A18:
/* 42E18 80067A18 8C620010 */  lw        $v0, 0x10($v1)
.LIQUE_80067A1C:
/* 42E1C 80067A1C AFA20010 */  sw        $v0, 0x10($sp)
/* 42E20 80067A20 8C640014 */  lw        $a0, 0x14($v1)
/* 42E24 80067A24 8C66000C */  lw        $a2, 0xC($v1)
/* 42E28 80067A28 8C670008 */  lw        $a3, 0x8($v1)
/* 42E2C 80067A2C 8E420018 */  lw        $v0, 0x18($s2)
/* 42E30 80067A30 0040F809 */  jalr      $v0
/* 42E34 80067A34 00002821 */   addu     $a1, $zero, $zero
/* 42E38 80067A38 08019EA3 */  j         .LIQUE_80067A8C
/* 42E3C 80067A3C 00000000 */   nop
glabel .LIQUE_80067A40
/* 42E40 80067A40 27A5001C */  addiu     $a1, $sp, 0x1C
/* 42E44 80067A44 8E440010 */  lw        $a0, 0x10($s2)
/* 42E48 80067A48 0C018DCC */  jal       osRecvMesg
/* 42E4C 80067A4C 24060001 */   addiu    $a2, $zero, 0x1
/* 42E50 80067A50 8FA30018 */  lw        $v1, 0x18($sp)
/* 42E54 80067A54 8C620010 */  lw        $v0, 0x10($v1)
/* 42E58 80067A58 AFA20010 */  sw        $v0, 0x10($sp)
/* 42E5C 80067A5C 8C640014 */  lw        $a0, 0x14($v1)
/* 42E60 80067A60 8C66000C */  lw        $a2, 0xC($v1)
/* 42E64 80067A64 8C670008 */  lw        $a3, 0x8($v1)
/* 42E68 80067A68 8E420018 */  lw        $v0, 0x18($s2)
/* 42E6C 80067A6C 0040F809 */  jalr      $v0
/* 42E70 80067A70 24050001 */   addiu    $a1, $zero, 0x1
/* 42E74 80067A74 08019EA3 */  j         .LIQUE_80067A8C
/* 42E78 80067A78 00000000 */   nop
glabel .LIQUE_80067A7C
/* 42E7C 80067A7C 8CA40004 */  lw        $a0, 0x4($a1)
/* 42E80 80067A80 0C018E28 */  jal       osSendMesg
/* 42E84 80067A84 00003021 */   addu     $a2, $zero, $zero
glabel .LIQUE_80067A88
/* 42E88 80067A88 2402FFFF */  addiu     $v0, $zero, -0x1
.LIQUE_80067A8C:
/* 42E8C 80067A8C 1440FF0B */  bnez      $v0, .LIQUE_800676BC
/* 42E90 80067A90 27A50018 */   addiu    $a1, $sp, 0x18
/* 42E94 80067A94 27A50020 */  addiu     $a1, $sp, 0x20
/* 42E98 80067A98 8E44000C */  lw        $a0, 0xC($s2)
/* 42E9C 80067A9C 0C018DCC */  jal       osRecvMesg
/* 42EA0 80067AA0 24060001 */   addiu    $a2, $zero, 0x1
/* 42EA4 80067AA4 3C038000 */  lui       $v1, %hi(__osBbIsBb)
/* 42EA8 80067AA8 8C630388 */  lw        $v1, %lo(__osBbIsBb)($v1)
/* 42EAC 80067AAC 24020001 */  addiu     $v0, $zero, 0x1
/* 42EB0 80067AB0 14620014 */  bne       $v1, $v0, .LIQUE_80067B04
/* 42EB4 80067AB4 8FA50018 */   lw       $a1, 0x18($sp)
/* 42EB8 80067AB8 12800012 */  beqz      $s4, .LIQUE_80067B04
/* 42EBC 80067ABC 8FA20018 */   lw       $v0, 0x18($sp)
/* 42EC0 80067AC0 3C048060 */  lui       $a0, (0x80600000 >> 16)
/* 42EC4 80067AC4 8C430010 */  lw        $v1, 0x10($v0)
/* 42EC8 80067AC8 2405FFF0 */  addiu     $a1, $zero, -0x10
/* 42ECC 80067ACC 2463000F */  addiu     $v1, $v1, 0xF
/* 42ED0 80067AD0 0C018134 */  jal       osInvalDCache
/* 42ED4 80067AD4 00652824 */   and      $a1, $v1, $a1
/* 42ED8 80067AD8 8FA20018 */  lw        $v0, 0x18($sp)
/* 42EDC 80067ADC 8C450008 */  lw        $a1, 0x8($v0)
/* 42EE0 80067AE0 8C460010 */  lw        $a2, 0x10($v0)
/* 42EE4 80067AE4 0C018A04 */  jal       bcopy
/* 42EE8 80067AE8 3C048060 */   lui      $a0, (0x80600000 >> 16)
/* 42EEC 80067AEC 8FA20018 */  lw        $v0, 0x18($sp)
/* 42EF0 80067AF0 8C440008 */  lw        $a0, 0x8($v0)
/* 42EF4 80067AF4 8C450010 */  lw        $a1, 0x10($v0)
/* 42EF8 80067AF8 0C018180 */  jal       osWritebackDCache
/* 42EFC 80067AFC 0000A021 */   addu     $s4, $zero, $zero
/* 42F00 80067B00 8FA50018 */  lw        $a1, 0x18($sp)
.LIQUE_80067B04:
/* 42F04 80067B04 8CA40004 */  lw        $a0, 0x4($a1)
/* 42F08 80067B08 0C018E28 */  jal       osSendMesg
/* 42F0C 80067B0C 00003021 */   addu     $a2, $zero, $zero
/* 42F10 80067B10 00002821 */  addu      $a1, $zero, $zero
/* 42F14 80067B14 8E440010 */  lw        $a0, 0x10($s2)
/* 42F18 80067B18 0C018E28 */  jal       osSendMesg
/* 42F1C 80067B1C 00003021 */   addu     $a2, $zero, $zero
/* 42F20 80067B20 08019DAF */  j         .LIQUE_800676BC
/* 42F24 80067B24 27A50018 */   addiu    $a1, $sp, 0x18
/* 42F28 80067B28 00000000 */  nop
/* 42F2C 80067B2C 00000000 */  nop
