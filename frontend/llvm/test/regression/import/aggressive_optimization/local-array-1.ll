; ModuleID = 'local-array-1.c.pp.bc'
source_filename = "local-array-1.c"
target datalayout = "e-m:o-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-apple-macosx10.12.0"

; CHECK-LABEL: Bundle
; CHECK: target-endianness = little-endian
; CHECK: target-pointer-size = 64 bits
; CHECK: target-triple = x86_64-apple-macosx10.12.0

; Function Attrs: noinline nounwind ssp uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 !dbg !7 {
  %3 = alloca [10 x i32], align 16
  call void @llvm.dbg.value(metadata i32 %0, i64 0, metadata !14, metadata !15), !dbg !16
  call void @llvm.dbg.value(metadata i8** %1, i64 0, metadata !17, metadata !15), !dbg !18
  call void @llvm.dbg.declare(metadata [10 x i32]* %3, metadata !19, metadata !15), !dbg !23
  call void @llvm.dbg.value(metadata i32 0, i64 0, metadata !24, metadata !15), !dbg !25
  br label %4, !dbg !26

; <label>:4:                                      ; preds = %6, %2
  %.0 = phi i32 [ 0, %2 ], [ %9, %6 ]
  call void @llvm.dbg.value(metadata i32 %.0, i64 0, metadata !24, metadata !15), !dbg !25
  %5 = icmp slt i32 %.0, 10, !dbg !28
  br i1 %5, label %6, label %10, !dbg !31

; <label>:6:                                      ; preds = %4
  %7 = sext i32 %.0 to i64, !dbg !33
  %8 = getelementptr inbounds [10 x i32], [10 x i32]* %3, i64 0, i64 %7, !dbg !33
  store i32 %.0, i32* %8, align 4, !dbg !35
  %9 = add nsw i32 %.0, 1, !dbg !36
  call void @llvm.dbg.value(metadata i32 %9, i64 0, metadata !24, metadata !15), !dbg !25
  br label %4, !dbg !38, !llvm.loop !39

; <label>:10:                                     ; preds = %4
  ret i32 0, !dbg !42
}
; CHECK: define si32 @main(si32 %1, si8** %2) {
; CHECK: #1 !entry successors={#2} {
; CHECK:   [10 x si32]* $3 = allocate [10 x si32], 1, align 16
; CHECK:   si32 %.0 = 0
; CHECK: }
; CHECK: #2 predecessors={#1, #3} successors={#3, #4} {
; CHECK: }
; CHECK: #3 predecessors={#2} successors={#2} {
; CHECK:   %.0 silt 10
; CHECK:   si64 %4 = sext %.0
; CHECK:   si32* %5 = ptrshift $3, 40 * 0, 4 * %4
; CHECK:   store %5, %.0, align 4
; CHECK:   si32 %6 = %.0 sadd.nw 1
; CHECK:   si32 %.0 = %6
; CHECK: }
; CHECK: #4 !exit predecessors={#2} {
; CHECK:   %.0 sige 10
; CHECK:   return 0
; CHECK: }
; CHECK: }

; Function Attrs: nounwind readnone
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nounwind readnone
declare void @llvm.dbg.value(metadata, i64, metadata, metadata) #1

attributes #0 = { noinline nounwind ssp uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="penryn" "target-features"="+cx16,+fxsr,+mmx,+sse,+sse2,+sse3,+sse4.1,+ssse3,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 4.0.1 (tags/RELEASE_401/final)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2)
!1 = !DIFile(filename: "local-array-1.c", directory: "/Users/marthaud/ikos/ikos-git/frontend/llvm/test/regression/import/aggressive_optimization")
!2 = !{}
!3 = !{i32 2, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"PIC Level", i32 2}
!6 = !{!"clang version 4.0.1 (tags/RELEASE_401/final)"}
!7 = distinct !DISubprogram(name: "main", scope: !1, file: !1, line: 6, type: !8, isLocal: false, isDefinition: true, scopeLine: 6, flags: DIFlagPrototyped, isOptimized: false, unit: !0, variables: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !11}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!14 = !DILocalVariable(name: "argc", arg: 1, scope: !7, file: !1, line: 6, type: !10)
!15 = !DIExpression()
!16 = !DILocation(line: 6, column: 14, scope: !7)
!17 = !DILocalVariable(name: "argv", arg: 2, scope: !7, file: !1, line: 6, type: !11)
!18 = !DILocation(line: 6, column: 27, scope: !7)
!19 = !DILocalVariable(name: "a", scope: !7, file: !1, line: 8, type: !20)
!20 = !DICompositeType(tag: DW_TAG_array_type, baseType: !10, size: 320, elements: !21)
!21 = !{!22}
!22 = !DISubrange(count: 10)
!23 = !DILocation(line: 8, column: 7, scope: !7)
!24 = !DILocalVariable(name: "i", scope: !7, file: !1, line: 7, type: !10)
!25 = !DILocation(line: 7, column: 7, scope: !7)
!26 = !DILocation(line: 9, column: 8, scope: !27)
!27 = distinct !DILexicalBlock(scope: !7, file: !1, line: 9, column: 3)
!28 = !DILocation(line: 9, column: 17, scope: !29)
!29 = !DILexicalBlockFile(scope: !30, file: !1, discriminator: 1)
!30 = distinct !DILexicalBlock(scope: !27, file: !1, line: 9, column: 3)
!31 = !DILocation(line: 9, column: 3, scope: !32)
!32 = !DILexicalBlockFile(scope: !27, file: !1, discriminator: 1)
!33 = !DILocation(line: 10, column: 5, scope: !34)
!34 = distinct !DILexicalBlock(scope: !30, file: !1, line: 9, column: 28)
!35 = !DILocation(line: 10, column: 10, scope: !34)
!36 = !DILocation(line: 9, column: 24, scope: !37)
!37 = !DILexicalBlockFile(scope: !30, file: !1, discriminator: 2)
!38 = !DILocation(line: 9, column: 3, scope: !37)
!39 = distinct !{!39, !40, !41}
!40 = !DILocation(line: 9, column: 3, scope: !27)
!41 = !DILocation(line: 11, column: 3, scope: !27)
!42 = !DILocation(line: 13, column: 3, scope: !7)
