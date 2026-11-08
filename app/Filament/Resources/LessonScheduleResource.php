<?php

namespace App\Filament\Resources;

use App\Filament\Resources\LessonScheduleResource\Pages;
use App\Models\LessonSchedule;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;

class LessonScheduleResource extends Resource
{
    protected static ?string $model = LessonSchedule::class;

    protected static ?string $navigationIcon = 'heroicon-o-calendar-days';

    protected static ?string $navigationLabel = 'Jadwal Pelajaran';

    protected static ?string $modelLabel = 'Jadwal Pelajaran';

    protected static ?string $pluralModelLabel = 'Jadwal Pelajaran';

    protected static ?string $navigationGroup = 'Akademik';

    protected static ?int $navigationSort = 2;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Select::make('school_class_id')
                    ->label('Kelas')
                    ->relationship('schoolClass', 'name')
                    ->searchable()
                    ->preload()
                    ->required(),
                Forms\Components\Select::make('day_of_week')
                    ->label('Hari')
                    ->options(LessonSchedule::DAYS)
                    ->required()
                    ->native(false),
                Forms\Components\Select::make('lesson_hour_id')
                    ->label('Jam Pelajaran')
                    ->relationship('lessonHour', 'session_number')
                    ->getOptionLabelFromRecordUsing(fn ($record): string => 'Jam '.$record->session_number
                        .($record->name ? ' - '.$record->name : '')
                        .($record->start_time && $record->end_time ? ' ('.substr($record->start_time, 0, 5).'–'.substr($record->end_time, 0, 5).')' : ''))
                    ->searchable()
                    ->preload()
                    ->required(),
                Forms\Components\TextInput::make('subject_name')
                    ->label('Mata Pelajaran')
                    ->required()
                    ->maxLength(255),
                Forms\Components\TextInput::make('teacher_name')
                    ->label('Guru')
                    ->maxLength(255)
                    ->default(null),
                Forms\Components\TextInput::make('room')
                    ->label('Ruang')
                    ->maxLength(255)
                    ->default(null),
                Forms\Components\Textarea::make('note')
                    ->label('Catatan')
                    ->columnSpanFull(),
            ]);
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
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
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
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListLessonSchedules::route('/'),
            'create' => Pages\CreateLessonSchedule::route('/create'),
            'view' => Pages\ViewLessonSchedule::route('/{record}'),
            'edit' => Pages\EditLessonSchedule::route('/{record}/edit'),
        ];
    }
}
