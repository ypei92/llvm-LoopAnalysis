; ModuleID = 'mmm.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.timezone = type { i32, i32 }
%struct.timeval = type { i64, i64 }

@A = common global [4096 x [4096 x double]] zeroinitializer, align 16
@B = common global [4096 x [4096 x double]] zeroinitializer, align 16
@C = common global [4096 x [4096 x double]] zeroinitializer, align 16
@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [5 x i8] c"%lf \00", align 1
@stdout = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [35 x i8] c"Error return from gettimeofday: %d\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c".test\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@t_start = common global double 0.000000e+00, align 8
@t_end = common global double 0.000000e+00, align 8

; Function Attrs: nounwind uwtable
define void @init_array() #0 {
entry:
  call void @llvm.memset.p0i8.i64(i8* bitcast ([4096 x [4096 x double]]* @C to i8*), i8 0, i64 134217728, i32 16, i1 false)
  br label %for.cond.1.preheader

for.cond.1.preheader:                             ; preds = %for.inc.15, %entry
  %indvars.iv36 = phi i64 [ 0, %entry ], [ %indvars.iv.next37, %for.inc.15 ]
  br label %for.body.3

for.body.3:                                       ; preds = %for.body.3, %for.cond.1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond.1.preheader ], [ %indvars.iv.next.1, %for.body.3 ]
  %0 = add nuw nsw i64 %indvars.iv, %indvars.iv36
  %1 = trunc i64 %0 to i32
  %conv = sitofp i32 %1 to double
  %arrayidx5 = getelementptr inbounds [4096 x [4096 x double]], [4096 x [4096 x double]]* @A, i64 0, i64 %indvars.iv36, i64 %indvars.iv
  store double %conv, double* %arrayidx5, align 16, !tbaa !1
  %2 = mul nuw nsw i64 %indvars.iv, %indvars.iv36
  %3 = trunc i64 %2 to i32
  %conv6 = sitofp i32 %3 to double
  %arrayidx10 = getelementptr inbounds [4096 x [4096 x double]], [4096 x [4096 x double]]* @B, i64 0, i64 %indvars.iv36, i64 %indvars.iv
  store double %conv6, double* %arrayidx10, align 16, !tbaa !1
  %indvars.iv.next = or i64 %indvars.iv, 1
  %4 = add nuw nsw i64 %indvars.iv.next, %indvars.iv36
  %5 = trunc i64 %4 to i32
  %conv.1 = sitofp i32 %5 to double
  %arrayidx5.1 = getelementptr inbounds [4096 x [4096 x double]], [4096 x [4096 x double]]* @A, i64 0, i64 %indvars.iv36, i64 %indvars.iv.next
  store double %conv.1, double* %arrayidx5.1, align 8, !tbaa !1
  %6 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv36
  %7 = trunc i64 %6 to i32
  %conv6.1 = sitofp i32 %7 to double
  %arrayidx10.1 = getelementptr inbounds [4096 x [4096 x double]], [4096 x [4096 x double]]* @B, i64 0, i64 %indvars.iv36, i64 %indvars.iv.next
  store double %conv6.1, double* %arrayidx10.1, align 8, !tbaa !1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 4096
  br i1 %exitcond.1, label %for.inc.15, label %for.body.3

for.inc.15:                                       ; preds = %for.body.3
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next37, 4096
  br i1 %exitcond38, label %for.end.17, label %for.cond.1.preheader

for.end.17:                                       ; preds = %for.inc.15
  ret void
}

; Function Attrs: nounwind
declare void @llvm.lifetime.start(i64, i8* nocapture) #1

; Function Attrs: nounwind
declare void @llvm.lifetime.end(i64, i8* nocapture) #1

; Function Attrs: nounwind uwtable
define void @print_array() #0 {
entry:
  br label %for.cond.1.preheader

for.cond.1.preheader:                             ; preds = %for.end, %entry
  %indvars.iv24 = phi i64 [ 0, %entry ], [ %indvars.iv.next25, %for.end ]
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  br label %for.body.3

for.body.3:                                       ; preds = %for.inc, %for.cond.1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond.1.preheader ], [ %indvars.iv.next, %for.inc ]
  %1 = phi %struct._IO_FILE* [ %0, %for.cond.1.preheader ], [ %5, %for.inc ]
  %arrayidx5 = getelementptr inbounds [4096 x [4096 x double]], [4096 x [4096 x double]]* @C, i64 0, i64 %indvars.iv24, i64 %indvars.iv
  %2 = load double, double* %arrayidx5, align 8, !tbaa !1
  %call = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), double %2) #3
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 80
  %cmp6 = icmp eq i32 %rem, 79
  br i1 %cmp6, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body.3
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !tbaa !5
  %fputc21 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4)
  br label %for.inc

for.inc:                                          ; preds = %for.body.3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %exitcond = icmp eq i64 %indvars.iv.next, 4096
  br i1 %exitcond, label %for.end, label %for.body.3

for.end:                                          ; preds = %for.inc
  %.lcssa = phi %struct._IO_FILE* [ %5, %for.inc ]
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa) #4
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next25, 4096
  br i1 %exitcond26, label %for.end.11, label %for.cond.1.preheader

for.end.11:                                       ; preds = %for.end
  ret void
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define double @rtclock() #0 {
entry:
  %Tzp = alloca %struct.timezone, align 4
  %Tp = alloca %struct.timeval, align 8
  %0 = bitcast %struct.timezone* %Tzp to i8*
  call void @llvm.lifetime.start(i64 8, i8* %0) #1
  %1 = bitcast %struct.timeval* %Tp to i8*
  call void @llvm.lifetime.start(i64 16, i8* %1) #1
  %call = call i32 @gettimeofday(%struct.timeval* nonnull %Tp, %struct.timezone* nonnull %Tzp) #1
  %cmp = icmp eq i32 %call, 0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call1 = tail call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.2, i64 0, i64 0), i32 %call) #1
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %tv_sec = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp, i64 0, i32 0
  %2 = load i64, i64* %tv_sec, align 8, !tbaa !7
  %conv = sitofp i64 %2 to double
  %tv_usec = getelementptr inbounds %struct.timeval, %struct.timeval* %Tp, i64 0, i32 1
  %3 = load i64, i64* %tv_usec, align 8, !tbaa !10
  %conv2 = sitofp i64 %3 to double
  %mul = fmul double %conv2, 1.000000e-06
  %add = fadd double %conv, %mul
  call void @llvm.lifetime.end(i64 16, i8* %1) #1
  call void @llvm.lifetime.end(i64 8, i8* %0) #1
  ret double %add
}

; Function Attrs: nounwind
declare i32 @gettimeofday(%struct.timeval* nocapture, %struct.timezone* nocapture) #2

; Function Attrs: nounwind
declare i32 @printf(i8* nocapture readonly, ...) #2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  tail call void @llvm.memset.p0i8.i64(i8* bitcast ([4096 x [4096 x double]]* @C to i8*), i8 0, i64 134217728, i32 16, i1 false) #1
  br label %for.cond.1.preheader.i

for.cond.1.preheader.i:                           ; preds = %for.inc.15.i, %entry
  %indvars.iv36.i = phi i64 [ 0, %entry ], [ %indvars.iv.next37.i, %for.inc.15.i ]
  br label %for.body.3.i

for.body.3.i:                                     ; preds = %for.body.3.i, %for.cond.1.preheader.i
  %indvars.iv.i = phi i64 [ 0, %for.cond.1.preheader.i ], [ %indvars.iv.next.i.1, %for.body.3.i ]
  %0 = add nuw nsw i64 %indvars.iv.i, %indvars.iv36.i
  %1 = trunc i64 %0 to i32
  %conv.i = sitofp i32 %1 to double
  %arrayidx5.i = getelementptr inbounds [4096 x [4096 x double]], [4096 x [4096 x double]]* @A, i64 0, i64 %indvars.iv36.i, i64 %indvars.iv.i
  store double %conv.i, double* %arrayidx5.i, align 16, !tbaa !1
  %2 = mul nuw nsw i64 %indvars.iv.i, %indvars.iv36.i
  %3 = trunc i64 %2 to i32
  %conv6.i = sitofp i32 %3 to double
  %arrayidx10.i = getelementptr inbounds [4096 x [4096 x double]], [4096 x [4096 x double]]* @B, i64 0, i64 %indvars.iv36.i, i64 %indvars.iv.i
  store double %conv6.i, double* %arrayidx10.i, align 16, !tbaa !1
  %indvars.iv.next.i = or i64 %indvars.iv.i, 1
  %4 = add nuw nsw i64 %indvars.iv.next.i, %indvars.iv36.i
  %5 = trunc i64 %4 to i32
  %conv.i.1 = sitofp i32 %5 to double
  %arrayidx5.i.1 = getelementptr inbounds [4096 x [4096 x double]], [4096 x [4096 x double]]* @A, i64 0, i64 %indvars.iv36.i, i64 %indvars.iv.next.i
  store double %conv.i.1, double* %arrayidx5.i.1, align 8, !tbaa !1
  %6 = mul nuw nsw i64 %indvars.iv.next.i, %indvars.iv36.i
  %7 = trunc i64 %6 to i32
  %conv6.i.1 = sitofp i32 %7 to double
  %arrayidx10.i.1 = getelementptr inbounds [4096 x [4096 x double]], [4096 x [4096 x double]]* @B, i64 0, i64 %indvars.iv36.i, i64 %indvars.iv.next.i
  store double %conv6.i.1, double* %arrayidx10.i.1, align 8, !tbaa !1
  %indvars.iv.next.i.1 = add nsw i64 %indvars.iv.i, 2
  %exitcond.i.1 = icmp eq i64 %indvars.iv.next.i.1, 4096
  br i1 %exitcond.i.1, label %for.inc.15.i, label %for.body.3.i

for.inc.15.i:                                     ; preds = %for.body.3.i
  %indvars.iv.next37.i = add nuw nsw i64 %indvars.iv36.i, 1
  %exitcond38.i = icmp eq i64 %indvars.iv.next37.i, 4096
  br i1 %exitcond38.i, label %for.cond.1.preheader.preheader, label %for.cond.1.preheader.i

for.cond.1.preheader.preheader:                   ; preds = %for.inc.15.i
  br label %for.cond.1.preheader

for.cond.1.preheader:                             ; preds = %for.cond.1.preheader.preheader, %for.inc.26
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %for.inc.26 ], [ 0, %for.cond.1.preheader.preheader ]
  br label %for.cond.4.preheader

for.cond.4.preheader:                             ; preds = %for.inc.23, %for.cond.1.preheader
  %indvars.iv52 = phi i64 [ 0, %for.cond.1.preheader ], [ %indvars.iv.next53, %for.inc.23 ]
  %arrayidx8 = getelementptr inbounds [4096 x [4096 x double]], [4096 x [4096 x double]]* @C, i64 0, i64 %indvars.iv55, i64 %indvars.iv52
  %arrayidx8.promoted = load double, double* %arrayidx8, align 8, !tbaa !1
  br label %for.body.6

for.body.6:                                       ; preds = %for.body.6, %for.cond.4.preheader
  %indvars.iv = phi i64 [ 0, %for.cond.4.preheader ], [ %indvars.iv.next.1, %for.body.6 ]
  %8 = phi double [ %arrayidx8.promoted, %for.cond.4.preheader ], [ %add.1, %for.body.6 ]
  %arrayidx12 = getelementptr inbounds [4096 x [4096 x double]], [4096 x [4096 x double]]* @A, i64 0, i64 %indvars.iv55, i64 %indvars.iv
  %9 = load double, double* %arrayidx12, align 16, !tbaa !1
  %arrayidx17 = getelementptr inbounds [4096 x [4096 x double]], [4096 x [4096 x double]]* @B, i64 0, i64 %indvars.iv, i64 %indvars.iv52
  %10 = load double, double* %arrayidx17, align 8, !tbaa !1
  %mul18 = fmul double %9, %10
  %add = fadd double %8, %mul18
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx12.1 = getelementptr inbounds [4096 x [4096 x double]], [4096 x [4096 x double]]* @A, i64 0, i64 %indvars.iv55, i64 %indvars.iv.next
  %11 = load double, double* %arrayidx12.1, align 8, !tbaa !1
  %arrayidx17.1 = getelementptr inbounds [4096 x [4096 x double]], [4096 x [4096 x double]]* @B, i64 0, i64 %indvars.iv.next, i64 %indvars.iv52
  %12 = load double, double* %arrayidx17.1, align 8, !tbaa !1
  %mul18.1 = fmul double %11, %12
  %add.1 = fadd double %add, %mul18.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 4096
  br i1 %exitcond.1, label %for.inc.23, label %for.body.6

for.inc.23:                                       ; preds = %for.body.6
  %add.1.lcssa = phi double [ %add.1, %for.body.6 ]
  store double %add.1.lcssa, double* %arrayidx8, align 8, !tbaa !1
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next53, 4096
  br i1 %exitcond54, label %for.inc.26, label %for.cond.4.preheader

for.inc.26:                                       ; preds = %for.inc.23
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next56, 4096
  br i1 %exitcond57, label %for.end.28, label %for.cond.1.preheader

for.end.28:                                       ; preds = %for.inc.26
  %call = tail call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i64 0, i64 0)) #1
  %tobool = icmp eq %struct._IO_FILE* %call, null
  br i1 %tobool, label %if.end, label %for.cond.1.preheader.i.43.preheader

for.cond.1.preheader.i.43.preheader:              ; preds = %for.end.28
  br label %for.cond.1.preheader.i.43

for.cond.1.preheader.i.43:                        ; preds = %for.cond.1.preheader.i.43.preheader, %for.end.i
  %indvars.iv24.i = phi i64 [ %indvars.iv.next25.i, %for.end.i ], [ 0, %for.cond.1.preheader.i.43.preheader ]
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  br label %for.body.3.i.46

for.body.3.i.46:                                  ; preds = %for.inc.i, %for.cond.1.preheader.i.43
  %indvars.iv.i.44 = phi i64 [ 0, %for.cond.1.preheader.i.43 ], [ %indvars.iv.next.i.47, %for.inc.i ]
  %14 = phi %struct._IO_FILE* [ %13, %for.cond.1.preheader.i.43 ], [ %18, %for.inc.i ]
  %arrayidx5.i.45 = getelementptr inbounds [4096 x [4096 x double]], [4096 x [4096 x double]]* @C, i64 0, i64 %indvars.iv24.i, i64 %indvars.iv.i.44
  %15 = load double, double* %arrayidx5.i.45, align 8, !tbaa !1
  %call.i = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str, i64 0, i64 0), double %15) #3
  %16 = trunc i64 %indvars.iv.i.44 to i32
  %rem.i = srem i32 %16, 80
  %cmp6.i = icmp eq i32 %rem.i, 79
  br i1 %cmp6.i, label %if.then.i, label %for.inc.i

if.then.i:                                        ; preds = %for.body.3.i.46
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stdout, align 8, !tbaa !5
  %fputc21.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #1
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body.3.i.46
  %indvars.iv.next.i.47 = add nuw nsw i64 %indvars.iv.i.44, 1
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8, !tbaa !5
  %exitcond.i.48 = icmp eq i64 %indvars.iv.next.i.47, 4096
  br i1 %exitcond.i.48, label %for.end.i, label %for.body.3.i.46

for.end.i:                                        ; preds = %for.inc.i
  %.lcssa = phi %struct._IO_FILE* [ %18, %for.inc.i ]
  %fputc.i = tail call i32 @fputc(i32 10, %struct._IO_FILE* %.lcssa) #3
  %indvars.iv.next25.i = add nuw nsw i64 %indvars.iv24.i, 1
  %exitcond26.i = icmp eq i64 %indvars.iv.next25.i, 4096
  br i1 %exitcond26.i, label %if.end.loopexit, label %for.cond.1.preheader.i.43

if.end.loopexit:                                  ; preds = %for.end.i
  br label %if.end

if.end:                                           ; preds = %if.end.loopexit, %for.end.28
  ret i32 0
}

; Function Attrs: nounwind
declare noalias %struct._IO_FILE* @fopen(i8* nocapture readonly, i8* nocapture readonly) #2

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #1

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { cold nounwind }
attributes #4 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.7.1 (tags/RELEASE_371/final)"}
!1 = !{!2, !2, i64 0}
!2 = !{!"double", !3, i64 0}
!3 = !{!"omnipotent char", !4, i64 0}
!4 = !{!"Simple C/C++ TBAA"}
!5 = !{!6, !6, i64 0}
!6 = !{!"any pointer", !3, i64 0}
!7 = !{!8, !9, i64 0}
!8 = !{!"timeval", !9, i64 0, !9, i64 8}
!9 = !{!"long", !3, i64 0}
!10 = !{!8, !9, i64 8}
