<?php

namespace App\Filament\Resources;

use App\Filament\Resources\LessonHourResource\Pages;
use App\Models\LessonHour;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;

class LessonHourResource extends Resource
{
    protected static ?string $model = LessonHour::class;

    protected static ?string $navigationIcon = 'heroicon-o-clock';

    protected static ?string $navigationLabel = 'Jam Pelajaran';

    protected static ?string $modelLabel = 'Jam Pelajaran';

    protected static ?string $pluralModelLabel = 'Jam Pelajaran';

    protected static ?string $navigationGroup = 'Akademik';

    protected static ?int $navigationSort = 1;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('session_number')
                    ->label('Jam Ke-')
                    ->required()
                    ->numeric()
                    ->minValue(1)
                    ->unique(ignoreRecord: true),
                Forms\Components\TextInput::make('name')
                    ->label('Nama/Keterangan')
                    ->maxLength(255)
                    ->placeholder('Contoh: JP 1, Istirahat')
                    ->default(null),
                Forms\Components\TimePicker::make('start_time')
                    ->label('Mulai')
                    ->required()
                    ->seconds(false),
                Forms\Components\TimePicker::make('end_time')
                    ->label('Selesai')
                    ->required()
                    ->seconds(false),
                Forms\Components\Toggle::make('is_break')
                    ->label('Istirahat')
                    ->default(false)
                    ->helperText('Centang jika ini jam istirahat (bukan jam pelajaran).'),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->defaultSort('session_number')
            ->columns([
                Tables\Columns\TextColumn::make('session_number')
                    ->label('Jam Ke-')
                    ->sortable()
                    ->formatStateUsing(fn ($state): string => (string) ($state ?? '-')),
                Tables\Columns\TextColumn::make('name')
                    ->label('Nama/Keterangan')
                    ->searchable()
                    ->placeholder('-'),
                Tables\Columns\TextColumn::make('start_time')
                    ->label('Mulai')
                    ->time('H:i')
                    ->sortable(),
                Tables\Columns\TextColumn::make('end_time')
                    ->label('Selesai')
                    ->time('H:i')
                    ->sortable(),
                Tables\Columns\IconColumn::make('is_break')
                    ->label('Istirahat')
                    ->boolean(),
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
                Tables\Filters\TernaryFilter::make('is_break')
                    ->label('Jenis')
                    ->placeholder('Semua')
                    ->trueLabel('Istirahat')
                    ->falseLabel('Jam Pelajaran'),
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
            'index' => Pages\ListLessonHours::route('/'),
            'create' => Pages\CreateLessonHour::route('/create'),
            'view' => Pages\ViewLessonHour::route('/{record}'),
            'edit' => Pages\EditLessonHour::route('/{record}/edit'),
        ];
    }
}
