<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
return new class extends Migration{
  public function up(): void{
    Schema::create('progresses', function (Blueprint $table){
      $table->id();
      $table->string('client_id'); // ゲスト識別用
      $table->foreignId('lesson_id')->constrained()->cascadeOnDelete();
      $table->boolean('completed')->default(false);
      $table->timestamps();
      $table->unique(['client_id','lesson_id']);
    });
  }
  public function down(): void{ Schema::dropIfExists('progresses'); }
};