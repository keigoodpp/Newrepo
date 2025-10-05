<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
class Progress extends Model{
  protected $fillable = ['client_id','lesson_id','completed'];
  public function lesson(){ return $this->belongsTo(Lesson::class); }
}
