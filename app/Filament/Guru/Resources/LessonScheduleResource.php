<?php

namespace App\Filament\Guru\Resources;

use App\Filament\Guru\Resources\LessonScheduleResource\Pages;
use App\Models\LessonSchedule;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;

class LessonScheduleResource extends Resource
{
    protected static ?string $model = LessonSchedule::class;

    protected static ?string $navigationIcon = 'heroicon-o-calendar-days';

    protected static ?string $navigationLabel = 'Jadwal Pelajaran';

    protected static ?string $modelLabel = 'Jadwal Pelajaran';

    protected static ?string $pluralModelLabel = 'Jadwal Pelajaran';

    protected static ?int $navigationSort = 3;

    public static function form(Form $form): Form
    {
        return $form->schema([]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->defaultSort('day_of_week')
            ->columns([
                Tables\Columns\TextColumn::make('schoolClass.name')
                    ->label('Kelas')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('day_of_week')
                    ->label('Hari')
                    ->formatStateUsing(fn ($state): string => LessonSchedule::DAYS[(int) $state] ?? (string) $state)
                    ->sortable(),
                Tables\Columns\TextColumn::make('lessonHour.session_number')
                    ->label('Jam Ke-')
                    ->sortable()
                    ->formatStateUsing(fn ($state): string => (string) ($state ?? '-')),
                Tables\Columns\TextColumn::make('lessonHour.start_time')
                    ->label('Waktu')
                    ->formatStateUsing(function ($state, $record): string {
                        $start = $record->lessonHour?->start_time;
                        $end = $record->lessonHour?->end_time;
                        if (! $start || ! $end) {
                            return '-';
                        }

                        return substr($start, 0, 5).'–'.substr($end, 0, 5);
                    })
                    ->toggleable(),
                Tables\Columns\TextColumn::make('subject_name')
                    ->label('Mata Pelajaran')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('teacher_name')
                    ->label('Guru')
                    ->searchable()
                    ->placeholder('-'),
                Tables\Columns\TextColumn::make('room')
                    ->label('Ruang')
                    ->searchable()
                    ->placeholder('-')
                    ->toggleable(),
            ])
            ->filters([
                Tables\Filters\SelectFilter::make('school_class_id')
                    ->label('Kelas')
                    ->relationship('schoolClass', 'name')
                    ->searchable()
                    ->preload(),
                Tables\Filters\SelectFilter::make('day_of_week')
                    ->label('Hari')
                    ->options(LessonSchedule::DAYS),
            ])
            ->actions([])
            ->bulkActions([]);
    }

    public static function canCreate(): bool
    {
        return false;
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListLessonSchedules::route('/'),
        ];
    }
}
