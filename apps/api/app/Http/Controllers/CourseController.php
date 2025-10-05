<?php
namespace App\Http\Controllers;
use App\Models\Course;
class CourseController extends Controller{
  public function index(){
    return Course::select('id','title','description')
                 ->where('is_published',true)
                 ->orderBy('id','desc')->get();
  }
  public function show(Course $course){
    return $course->load(['lessons:id,course_id,title,order']);
  }
}
