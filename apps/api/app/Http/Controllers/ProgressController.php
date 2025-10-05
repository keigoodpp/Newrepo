<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\Progress;
class ProgressController extends Controller{
  public function toggle(Request $request){
    $data = $request->validate([
      'client_id' => 'required|string',
      'lesson_id' => 'required|integer|exists:lessons,id',
      'completed' => 'required|boolean'
    ]);
    $progress = Progress::updateOrCreate(
      ['client_id' => $data['client_id'], 'lesson_id' => $data['lesson_id']],
      ['completed' => $data['completed']]
    );
    return $progress;
  }
}
