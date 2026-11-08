<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class LessonSchedule extends Model
{
    public const DAYS = [
        1 => 'Senin',
        2 => 'Selasa',
        3 => 'Rabu',
        4 => 'Kamis',
        5 => 'Jumat',
        6 => 'Sabtu',
        7 => 'Minggu',
    ];

    protected $fillable = [
        'school_class_id',
        'day_of_week',
        'lesson_hour_id',
        'subject_name',
        'teacher_name',
        'room',
        'note',
    ];

    public function schoolClass(): BelongsTo
    {
        return $this->belongsTo(SchoolClass::class);
    }

    public function lessonHour(): BelongsTo
    {
        return $this->belongsTo(LessonHour::class);
    }
}
