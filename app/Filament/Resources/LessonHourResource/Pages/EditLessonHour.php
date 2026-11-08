<?php

namespace App\Filament\Resources\LessonHourResource\Pages;

use App\Filament\Resources\LessonHourResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditLessonHour extends EditRecord
{
    protected static string $resource = LessonHourResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\ViewAction::make(),
            Actions\DeleteAction::make(),
        ];
    }
}
