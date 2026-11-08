<?php

namespace App\Filament\Resources;

use App\Filament\Resources\MajorResource\Pages;
use App\Models\Major;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;

class MajorResource extends Resource
{
    protected static ?string $model = Major::class;

    protected static ?string $navigationIcon = 'heroicon-o-wrench-screwdriver';

    protected static ?string $navigationLabel = 'Jurusan';

    protected static ?string $modelLabel = 'Jurusan';

    protected static ?string $pluralModelLabel = 'Jurusan';

    protected static ?string $navigationGroup = 'Data Master';

    protected static ?int $navigationSort = 0;

    public static function form(Form $form): Form
    {
        $majors = [
            'RPL' => 'Rekayasa Perangkat Lunak',
            'TKJ' => 'Teknik Komputer dan Jaringan',
            'DKV' => 'Desain Komunikasi Visual',
            'AKL' => 'Akuntansi dan Keuangan Lembaga',
            'OTKP' => 'Otomatisasi dan Tata Kelola Perkantoran',
            'BDP' => 'Bisnis Daring dan Pemasaran',
            'MM' => 'Multimedia',
            'TKR' => 'Teknik Kendaraan Ringan Otomotif',
            'TSM' => 'Teknik dan Bisnis Sepeda Motor',
            'TITL' => 'Teknik Instalasi Tenaga Listrik',
            'APH' => 'Akomodasi Perhotelan',
            'TBG' => 'Tata Boga',
            'TB' => 'Tata Busana',
            'TKI' => 'Teknik Kimia Industri',
            'TPL' => 'Teknik Pengelasan',
        ];

        return $form
            ->schema([
                Forms\Components\Select::make('code')
                    ->label('Kode Jurusan')
                    ->options(array_combine(array_keys($majors), array_keys($majors)))
                    ->searchable()
                    ->preload()
                    ->native(false)
                    ->live()
                    ->afterStateUpdated(function (Forms\Set $set, ?string $state) use ($majors): void {
                        if ($state && isset($majors[$state])) {
                            $set('name', $majors[$state]);
                        }
                    })
                    ->dehydrateStateUsing(fn (?string $state): ?string => $state ?: null)
                    ->unique(ignoreRecord: true),
                Forms\Components\Select::make('name')
                    ->label('Nama Jurusan')
                    ->options(array_combine(array_values($majors), array_values($majors)))
                    ->searchable()
                    ->preload()
                    ->native(false)
                    ->required()
                    ->validationMessages([
                        'required' => 'Nama jurusan wajib dipilih.',
                    ])
                    ->live()
                    ->afterStateUpdated(function (Forms\Set $set, ?string $state) use ($majors): void {
                        $code = array_search($state, $majors, true);
                        if ($code !== false) {
                            $set('code', $code);
                        }
                    })
                    ->dehydrated(true),
                Forms\Components\Textarea::make('description')
                    ->label('Keterangan')
                    ->columnSpanFull(),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('code')
                    ->label('Kode')
                    ->searchable()
                    ->sortable()
                    ->placeholder('-'),
                Tables\Columns\TextColumn::make('name')
                    ->label('Nama Jurusan')
                    ->searchable()
                    ->sortable(),
                Tables\Columns\TextColumn::make('school_classes_count')
                    ->label('Jumlah Kelas')
                    ->counts('schoolClasses')
                    ->sortable()
                    ->formatStateUsing(fn ($state): string => (string) ($state ?? 0)),
                Tables\Columns\TextColumn::make('description')
                    ->label('Keterangan')
                    ->limit(40)
                    ->toggleable(isToggledHiddenByDefault: true),
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
                //
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
            'index' => Pages\ListMajors::route('/'),
            'create' => Pages\CreateMajor::route('/create'),
            'view' => Pages\ViewMajor::route('/{record}'),
            'edit' => Pages\EditMajor::route('/{record}/edit'),
        ];
    }
}
