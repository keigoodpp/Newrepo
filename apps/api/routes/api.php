<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CourseController;
use App\Http\Controllers\LessonController;
use App\Http\Controllers\ProgressController;
Route::get('/health', \App\Http\Controllers\HealthController::class);
Route::apiResource('courses', CourseController::class)->only(['index','show']);
Route::get('courses/{course}/lessons', [LessonController::class, 'index']);
Route::get('lessons/{lesson}', [LessonController::class, 'show']);
Route::post('progress/toggle', [ProgressController::class, 'toggle']);
