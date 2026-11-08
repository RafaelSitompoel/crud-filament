<?php

namespace App\Filament\Resources\LessonHourResource\Pages;

use App\Filament\Resources\LessonHourResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListLessonHours extends ListRecords
{
    protected static string $resource = LessonHourResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
