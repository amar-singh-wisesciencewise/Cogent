; ModuleID = 'matrix.c'
source_filename = "matrix.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [33 x i8] c"Enter the value of N (N <= 10): \00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.2 = private unnamed_addr constant [34 x i8] c"Enter the elements of Matrix-A: \0A\00", align 1
@.str.3 = private unnamed_addr constant [34 x i8] c"Enter the elements of Matrix-B: \0A\00", align 1
@.str.4 = private unnamed_addr constant [38 x i8] c"The product of the two matrices is: \0A\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%d\09\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

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
  %9 = call i32 (ptr, ...) @printf(ptr noundef @.str)
  %10 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %5)
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.2)
  store i32 0, ptr %6, align 4
  br label %12

12:                                               ; preds = %33, %0
  %13 = load i32, ptr %6, align 4
  %14 = load i32, ptr %5, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %36

16:                                               ; preds = %12
  store i32 0, ptr %7, align 4
  br label %17

17:                                               ; preds = %29, %16
  %18 = load i32, ptr %7, align 4
  %19 = load i32, ptr %5, align 4
  %20 = icmp slt i32 %18, %19
  br i1 %20, label %21, label %32

21:                                               ; preds = %17
  %22 = load i32, ptr %6, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [10 x [10 x i32]], ptr %2, i64 0, i64 %23
  %25 = load i32, ptr %7, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [10 x i32], ptr %24, i64 0, i64 %26
  %28 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %27)
  br label %29

29:                                               ; preds = %21
  %30 = load i32, ptr %7, align 4
  %31 = add nsw i32 %30, 1
  store i32 %31, ptr %7, align 4
  br label %17, !llvm.loop !6

32:                                               ; preds = %17
  br label %33

33:                                               ; preds = %32
  %34 = load i32, ptr %6, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, ptr %6, align 4
  br label %12, !llvm.loop !8

36:                                               ; preds = %12
  %37 = call i32 (ptr, ...) @printf(ptr noundef @.str.3)
  store i32 0, ptr %6, align 4
  br label %38

38:                                               ; preds = %59, %36
  %39 = load i32, ptr %6, align 4
  %40 = load i32, ptr %5, align 4
  %41 = icmp slt i32 %39, %40
  br i1 %41, label %42, label %62

42:                                               ; preds = %38
  store i32 0, ptr %7, align 4
  br label %43

43:                                               ; preds = %55, %42
  %44 = load i32, ptr %7, align 4
  %45 = load i32, ptr %5, align 4
  %46 = icmp slt i32 %44, %45
  br i1 %46, label %47, label %58

47:                                               ; preds = %43
  %48 = load i32, ptr %6, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [10 x [10 x i32]], ptr %3, i64 0, i64 %49
  %51 = load i32, ptr %7, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [10 x i32], ptr %50, i64 0, i64 %52
  %54 = call i32 (ptr, ...) @__isoc99_scanf(ptr noundef @.str.1, ptr noundef %53)
  br label %55

55:                                               ; preds = %47
  %56 = load i32, ptr %7, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, ptr %7, align 4
  br label %43, !llvm.loop !9

58:                                               ; preds = %43
  br label %59

59:                                               ; preds = %58
  %60 = load i32, ptr %6, align 4
  %61 = add nsw i32 %60, 1
  store i32 %61, ptr %6, align 4
  br label %38, !llvm.loop !10

62:                                               ; preds = %38
  store i32 0, ptr %6, align 4
  br label %63

63:                                               ; preds = %115, %62
  %64 = load i32, ptr %6, align 4
  %65 = load i32, ptr %5, align 4
  %66 = icmp slt i32 %64, %65
  br i1 %66, label %67, label %118

67:                                               ; preds = %63
  store i32 0, ptr %7, align 4
  br label %68

68:                                               ; preds = %111, %67
  %69 = load i32, ptr %7, align 4
  %70 = load i32, ptr %5, align 4
  %71 = icmp slt i32 %69, %70
  br i1 %71, label %72, label %114

72:                                               ; preds = %68
  %73 = load i32, ptr %6, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [10 x [10 x i32]], ptr %4, i64 0, i64 %74
  %76 = load i32, ptr %7, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [10 x i32], ptr %75, i64 0, i64 %77
  store i32 0, ptr %78, align 4
  store i32 0, ptr %8, align 4
  br label %79

79:                                               ; preds = %107, %72
  %80 = load i32, ptr %8, align 4
  %81 = load i32, ptr %5, align 4
  %82 = icmp slt i32 %80, %81
  br i1 %82, label %83, label %110

83:                                               ; preds = %79
  %84 = load i32, ptr %6, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [10 x [10 x i32]], ptr %2, i64 0, i64 %85
  %87 = load i32, ptr %8, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [10 x i32], ptr %86, i64 0, i64 %88
  %90 = load i32, ptr %89, align 4
  %91 = load i32, ptr %8, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [10 x [10 x i32]], ptr %3, i64 0, i64 %92
  %94 = load i32, ptr %7, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [10 x i32], ptr %93, i64 0, i64 %95
  %97 = load i32, ptr %96, align 4
  %98 = mul nsw i32 %90, %97
  %99 = load i32, ptr %6, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [10 x [10 x i32]], ptr %4, i64 0, i64 %100
  %102 = load i32, ptr %7, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [10 x i32], ptr %101, i64 0, i64 %103
  %105 = load i32, ptr %104, align 4
  %106 = add nsw i32 %105, %98
  store i32 %106, ptr %104, align 4
  br label %107

107:                                              ; preds = %83
  %108 = load i32, ptr %8, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, ptr %8, align 4
  br label %79, !llvm.loop !11

110:                                              ; preds = %79
  br label %111

111:                                              ; preds = %110
  %112 = load i32, ptr %7, align 4
  %113 = add nsw i32 %112, 1
  store i32 %113, ptr %7, align 4
  br label %68, !llvm.loop !12

114:                                              ; preds = %68
  br label %115

115:                                              ; preds = %114
  %116 = load i32, ptr %6, align 4
  %117 = add nsw i32 %116, 1
  store i32 %117, ptr %6, align 4
  br label %63, !llvm.loop !13

118:                                              ; preds = %63
  %119 = call i32 (ptr, ...) @printf(ptr noundef @.str.4)
  store i32 0, ptr %6, align 4
  br label %120

120:                                              ; preds = %143, %118
  %121 = load i32, ptr %6, align 4
  %122 = load i32, ptr %5, align 4
  %123 = icmp slt i32 %121, %122
  br i1 %123, label %124, label %146

124:                                              ; preds = %120
  store i32 0, ptr %7, align 4
  br label %125

125:                                              ; preds = %138, %124
  %126 = load i32, ptr %7, align 4
  %127 = load i32, ptr %5, align 4
  %128 = icmp slt i32 %126, %127
  br i1 %128, label %129, label %141

129:                                              ; preds = %125
  %130 = load i32, ptr %6, align 4
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [10 x [10 x i32]], ptr %4, i64 0, i64 %131
  %133 = load i32, ptr %7, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds [10 x i32], ptr %132, i64 0, i64 %134
  %136 = load i32, ptr %135, align 4
  %137 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %136)
  br label %138

138:                                              ; preds = %129
  %139 = load i32, ptr %7, align 4
  %140 = add nsw i32 %139, 1
  store i32 %140, ptr %7, align 4
  br label %125, !llvm.loop !14

141:                                              ; preds = %125
  %142 = call i32 (ptr, ...) @printf(ptr noundef @.str.6)
  br label %143

143:                                              ; preds = %141
  %144 = load i32, ptr %6, align 4
  %145 = add nsw i32 %144, 1
  store i32 %145, ptr %6, align 4
  br label %120, !llvm.loop !15

146:                                              ; preds = %120
  %147 = load i32, ptr %1, align 4
  ret i32 %147
}

declare i32 @printf(ptr noundef, ...) #1

declare i32 @__isoc99_scanf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
