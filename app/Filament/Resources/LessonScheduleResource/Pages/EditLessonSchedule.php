<?php

namespace App\Filament\Resources\LessonScheduleResource\Pages;

use App\Filament\Resources\LessonScheduleResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditLessonSchedule extends EditRecord
{
    protected static string $resource = LessonScheduleResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\ViewAction::make(),
            Actions\DeleteAction::make(),
        ];
    }
}
