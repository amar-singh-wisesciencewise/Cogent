; ModuleID = 'matrix.c'
source_filename = "matrix.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca [10 x [10 x i32]], align 16
  %3 = alloca [10 x [10 x i32]], align 16
  %4 = alloca [10 x [10 x i32]], align 16
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 3, ptr %5, align 4
  store i32 0, ptr %6, align 4
  br label %9

9:                                                ; preds = %23, %0
  %10 = load i32, ptr %6, align 4
  %11 = load i32, ptr %5, align 4
  %12 = icmp slt i32 %10, %11
  br i1 %12, label %13, label %26

13:                                               ; preds = %9
  store i32 0, ptr %7, align 4
  br label %14

14:                                               ; preds = %19, %13
  %15 = load i32, ptr %7, align 4
  %16 = load i32, ptr %5, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %22

18:                                               ; preds = %14
  br label %19

19:                                               ; preds = %18
  %20 = load i32, ptr %7, align 4
  %21 = add nsw i32 %20, 1
  store i32 %21, ptr %7, align 4
  br label %14, !llvm.loop !6

22:                                               ; preds = %14
  br label %23

23:                                               ; preds = %22
  %24 = load i32, ptr %6, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, ptr %6, align 4
  br label %9, !llvm.loop !8

26:                                               ; preds = %9
  store i32 0, ptr %6, align 4
  br label %27

27:                                               ; preds = %41, %26
  %28 = load i32, ptr %6, align 4
  %29 = load i32, ptr %5, align 4
  %30 = icmp slt i32 %28, %29
  br i1 %30, label %31, label %44

31:                                               ; preds = %27
  store i32 0, ptr %7, align 4
  br label %32

32:                                               ; preds = %37, %31
  %33 = load i32, ptr %7, align 4
  %34 = load i32, ptr %5, align 4
  %35 = icmp slt i32 %33, %34
  br i1 %35, label %36, label %40

36:                                               ; preds = %32
  br label %37

37:                                               ; preds = %36
  %38 = load i32, ptr %7, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, ptr %7, align 4
  br label %32, !llvm.loop !9

40:                                               ; preds = %32
  br label %41

41:                                               ; preds = %40
  %42 = load i32, ptr %6, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, ptr %6, align 4
  br label %27, !llvm.loop !10

44:                                               ; preds = %27
  store i32 0, ptr %6, align 4
  br label %45

45:                                               ; preds = %97, %44
  %46 = load i32, ptr %6, align 4
  %47 = load i32, ptr %5, align 4
  %48 = icmp slt i32 %46, %47
  br i1 %48, label %49, label %100

49:                                               ; preds = %45
  store i32 0, ptr %7, align 4
  br label %50

50:                                               ; preds = %93, %49
  %51 = load i32, ptr %7, align 4
  %52 = load i32, ptr %5, align 4
  %53 = icmp slt i32 %51, %52
  br i1 %53, label %54, label %96

54:                                               ; preds = %50
  %55 = load i32, ptr %6, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [10 x [10 x i32]], ptr %4, i64 0, i64 %56
  %58 = load i32, ptr %7, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [10 x i32], ptr %57, i64 0, i64 %59
  store i32 0, ptr %60, align 4
  store i32 0, ptr %8, align 4
  br label %61

61:                                               ; preds = %89, %54
  %62 = load i32, ptr %8, align 4
  %63 = load i32, ptr %5, align 4
  %64 = icmp slt i32 %62, %63
  br i1 %64, label %65, label %92

65:                                               ; preds = %61
  %66 = load i32, ptr %6, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [10 x [10 x i32]], ptr %2, i64 0, i64 %67
  %69 = load i32, ptr %8, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [10 x i32], ptr %68, i64 0, i64 %70
  %72 = load i32, ptr %71, align 4
  %73 = load i32, ptr %8, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [10 x [10 x i32]], ptr %3, i64 0, i64 %74
  %76 = load i32, ptr %7, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [10 x i32], ptr %75, i64 0, i64 %77
  %79 = load i32, ptr %78, align 4
  %80 = mul nsw i32 %72, %79
  %81 = load i32, ptr %6, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [10 x [10 x i32]], ptr %4, i64 0, i64 %82
  %84 = load i32, ptr %7, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [10 x i32], ptr %83, i64 0, i64 %85
  %87 = load i32, ptr %86, align 4
  %88 = add nsw i32 %87, %80
  store i32 %88, ptr %86, align 4
  br label %89

89:                                               ; preds = %65
  %90 = load i32, ptr %8, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, ptr %8, align 4
  br label %61, !llvm.loop !11

92:                                               ; preds = %61
  br label %93

93:                                               ; preds = %92
  %94 = load i32, ptr %7, align 4
  %95 = add nsw i32 %94, 1
  store i32 %95, ptr %7, align 4
  br label %50, !llvm.loop !12

96:                                               ; preds = %50
  br label %97

97:                                               ; preds = %96
  %98 = load i32, ptr %6, align 4
  %99 = add nsw i32 %98, 1
  store i32 %99, ptr %6, align 4
  br label %45, !llvm.loop !13

100:                                              ; preds = %45
  store i32 0, ptr %6, align 4
  br label %101

101:                                              ; preds = %115, %100
  %102 = load i32, ptr %6, align 4
  %103 = load i32, ptr %5, align 4
  %104 = icmp slt i32 %102, %103
  br i1 %104, label %105, label %118

105:                                              ; preds = %101
  store i32 0, ptr %7, align 4
  br label %106

106:                                              ; preds = %111, %105
  %107 = load i32, ptr %7, align 4
  %108 = load i32, ptr %5, align 4
  %109 = icmp slt i32 %107, %108
  br i1 %109, label %110, label %114

110:                                              ; preds = %106
  br label %111

111:                                              ; preds = %110
  %112 = load i32, ptr %7, align 4
  %113 = add nsw i32 %112, 1
  store i32 %113, ptr %7, align 4
  br label %106, !llvm.loop !14

114:                                              ; preds = %106
  br label %115

115:                                              ; preds = %114
  %116 = load i32, ptr %6, align 4
  %117 = add nsw i32 %116, 1
  store i32 %117, ptr %6, align 4
  br label %101, !llvm.loop !15

118:                                              ; preds = %101
  %119 = load i32, ptr %1, align 4
  ret i32 %119
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 16.0.0 (https://github.com/llvm/llvm-project.git bcb1397bda667e75200ae0be9a65fd17dd0763d4)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
