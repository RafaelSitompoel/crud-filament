<?php

namespace App\Filament\Resources\LessonScheduleResource\Pages;

use App\Filament\Resources\LessonScheduleResource;
use Filament\Actions;
use Filament\Resources\Pages\ViewRecord;

class ViewLessonSchedule extends ViewRecord
{
    protected static string $resource = LessonScheduleResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\EditAction::make(),
        ];
    }
}
