<?php

namespace App\Filament\Guru\Resources\AttendanceResource\Pages;

use App\Filament\Guru\Resources\AttendanceResource;
use Filament\Actions;
use Filament\Resources\Pages\ListRecords;

class ListAttendances extends ListRecords
{
    protected static string $resource = AttendanceResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make()->label('Catat Absensi'),
        ];
    }
}
