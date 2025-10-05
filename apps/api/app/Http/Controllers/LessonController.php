<?php
namespace App\Http\Controllers;
use App\Models\Course;
use App\Models\Lesson;
class LessonController extends Controller{
  public function index(Course $course){
    return $course->lessons()->select('id','course_id','title','order')
                    ->orderBy('order')->get();
  }
  public function show(Lesson $lesson){
    return $lesson;
  }
}
