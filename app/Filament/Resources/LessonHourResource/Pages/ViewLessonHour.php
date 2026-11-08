<?php

namespace App\Filament\Resources\LessonHourResource\Pages;

use App\Filament\Resources\LessonHourResource;
use Filament\Actions;
use Filament\Resources\Pages\ViewRecord;

class ViewLessonHour extends ViewRecord
{
    protected static string $resource = LessonHourResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\EditAction::make(),
        ];
    }
}
