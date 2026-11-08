<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class LessonHour extends Model
{
    protected $fillable = [
        'session_number',
        'name',
        'start_time',
        'end_time',
        'is_break',
    ];

    protected function casts(): array
    {
        return [
            'is_break' => 'boolean',
        ];
    }

    public function schedules(): HasMany
    {
        return $this->hasMany(LessonSchedule::class);
    }
}
