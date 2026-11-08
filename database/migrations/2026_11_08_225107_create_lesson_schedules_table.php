<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('lesson_schedules', function (Blueprint $table) {
            $table->id();
            $table->foreignId('school_class_id')->constrained('school_classes')->cascadeOnDelete();
            $table->unsignedTinyInteger('day_of_week');
            $table->foreignId('lesson_hour_id')->constrained('lesson_hours')->cascadeOnDelete();
            $table->string('subject_name');
            $table->string('teacher_name')->nullable();
            $table->string('room')->nullable();
            $table->text('note')->nullable();
            $table->timestamps();

            $table->unique(['school_class_id', 'day_of_week', 'lesson_hour_id'], 'lesson_schedule_unique');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('lesson_schedules');
    }
};
