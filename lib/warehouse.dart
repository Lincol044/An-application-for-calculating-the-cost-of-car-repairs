//warehouse.dart
List<List<String>> carData = [];
const List<String> carBrands = [
  'Acura',
  'Alfa Romeo',
  'Aston Martin',
  'Audi',
  'BMW',
  'Buick',
  'Cadillac',
  'Chevrolet',
  'Chrysler',
  'Citroën',
  'Dodge',
  'Ferrari',
  'Fiat',
  'Ford',
  'Genesis',
  'GMC',
  'Honda',
  'Hyundai',
  'Infiniti',
  'Jaguar',
  'Jeep',
  'Kia',
  'Lamborghini',
  'Land Rover',
  'Lexus',
  'Lincoln',
  'Maserati',
  'Mazda',
  'McLaren',
  'Mercedes-Benz',
  'Mini',
  'Mitsubishi',
  'Nissan',
  'Pagani',
  'Peugeot',
  'Porsche',
  'RAM',
  'Rolls-Royce',
  'Saab',
  'Subaru',
  'Suzuki',
  'Tesla',
  'Toyota',
  'Volkswagen',
  'Volvo',
];

const Map<String, List<String>> modelsByBrand = {
  'Acura': ['MDX', 'RDX', 'TLX', 'ILX', 'ZDX'],
  'Alfa Romeo': ['Giulia', 'Stelvio', '4C', 'Giulietta', 'Spider'],
  'Aston Martin': ['DB11', 'Vantage', 'Rapide', 'DBS Superleggera', 'DBX'],
  'Audi': [
    'A1',
    'A3',
    'A4',
    'A5',
    'A6',
    'A7',
    'A8',
    'Q2',
    'Q3',
    'Q5',
    'Q7',
    'Q8',
    'e-tron'
  ],
  'BMW': [
    '1 Series',
    '2 Series',
    '3 Series',
    '4 Series',
    '5 Series',
    '6 Series',
    '7 Series',
    '8 Series',
    'X1',
    'X2',
    'X3',
    'X4',
    'X5',
    'X6',
    'X7',
    'Z4'
  ],
  'Buick': ['Enclave', 'Envision', 'Encore', 'Regal', 'LaCrosse'],
  'Cadillac': ['Escalade', 'XT4', 'XT5', 'XT6', 'CT4', 'CT5', 'CT6'],
  'Chevrolet': [
    'Spark',
    'Sonic',
    'Malibu',
    'Impala',
    'Camaro',
    'Corvette',
    'Equinox',
    'Traverse',
    'Tahoe',
    'Suburban',
    'Silverado',
    'Colorado'
  ],
  'Chrysler': ['300', 'Pacifica', 'Voyager', 'Aspen', 'Crossfire'],
  'Citroën': ['C1', 'C3', 'C4', 'C5', 'C6', 'C3 Aircross', 'C5 Aircross'],
  'Dodge': [
    'Dart',
    'Charger',
    'Challenger',
    'Durango',
    'Ram 1500',
    'Ram 2500',
    'Ram 3500'
  ],
  'Ferrari': [
    'F8 Tributo',
    '488 GTB',
    'Portofino',
    'Roma',
    'LaFerrari',
    'SF90 Stradale'
  ],
  'Fiat': ['500', '124 Spider', 'Tipo', 'Panda', 'Doblo'],
  'Ford': [
    'Fiesta',
    'Focus',
    'Fusion',
    'Mustang',
    'Explorer',
    'Edge',
    'Escape',
    'F-150',
    'F-250',
    'F-350',
    'Bronco'
  ],
  'Genesis': ['G70', 'G80', 'G90', 'GV70', 'GV80'],
  'GMC': ['Sierra 1500', 'Sierra HD', 'Canyon', 'Acadia', 'Terrain', 'Yukon'],
  'Honda': [
    'Fit',
    'Civic',
    'Accord',
    'HR-V',
    'CR-V',
    'Pilot',
    'Ridgeline',
    'Insight'
  ],
  'Hyundai': [
    'Accent',
    'Elantra',
    'Sonata',
    'Ioniq',
    'Tucson',
    'Santa Fe',
    'Santa Cruz',
    'Palisade'
  ],
  'Infiniti': ['Q50', 'Q60', 'QX50', 'QX55', 'QX80'],
  'Jaguar': ['XE', 'XF', 'XJ', 'F-PACE', 'E-PACE', 'I-PACE'],
  'Jeep': [
    'Wrangler',
    'Grand Cherokee',
    'Cherokee',
    'Compass',
    'Renegade',
    'Gladiator'
  ],
  'Kia': ['Rio', 'Forte', 'Soul', 'Seltos', 'Sportage', 'Sorento', 'Telluride'],
  'Lamborghini': ['Huracán', 'Aventador', 'Urus', 'Gallardo'],
  'Land Rover': [
    'Defender',
    'Discovery',
    'Range Rover',
    'Range Rover Sport',
    'Range Rover Velar'
  ],
  'Lexus': ['IS', 'ES', 'GS', 'RX', 'NX', 'LX', 'GX', 'LC', 'LS'],
  'Lincoln': ['MKZ', 'Nautilus', 'Aviator', 'Navigator', 'Corsair'],
  'Maserati': ['Ghibli', 'Levante', 'Quattroporte', 'Alfieri'],
  'Mazda': [
    'Mazda2',
    'Mazda3',
    'Mazda6',
    'MX-5 Miata',
    'CX-3',
    'CX-30',
    'CX-5',
    'CX-9'
  ],
  'McLaren': ['570S', '720S', 'GT', 'Elva', 'Artura'],
  'Mercedes-Benz': [
    'A-Class',
    'B-Class',
    'C-Class',
    'E-Class',
    'S-Class',
    'CLA',
    'CLS',
    'GLA',
    'GLB',
    'GLC',
    'GLE',
    'GLS',
    'G-Class',
    'EQC',
    'EQS'
  ],
  'Mini': [
    'Hardtop 2 Door',
    'Hardtop 4 Door',
    'Countryman',
    'Clubman',
    'Convertible'
  ],
  'Mitsubishi': [
    'Outlander',
    'Outlander Sport',
    'Eclipse Cross',
    'Mirage',
    'Lancer'
  ],
  'Nissan': [
    'Altima',
    'Maxima',
    'Sentra',
    'Rogue',
    'Murano',
    'Pathfinder',
    'Armada',
    'Titan',
    'Frontier'
  ],
  'Pagani': ['Huayra', 'Zonda'],
  'Peugeot': ['208', '308', '508', '3008', '5008', 'Rifter'],
  'Porsche': [
    '911',
    '718 Cayman',
    '718 Boxster',
    'Macan',
    'Cayenne',
    'Panamera',
    'Taycan'
  ],
  'RAM': ['1500', '2500', '3500', 'ProMaster'],
  'Rolls-Royce': ['Phantom', 'Ghost', 'Wraith', 'Cullinan', 'Dawn'],
  'Saab': ['9-3', '9-5', '9-4X'],
  'Subaru': [
    'Impreza',
    'Legacy',
    'Outback',
    'Forester',
    'Crosstrek',
    'Ascent',
    'WRX'
  ],
  'Suzuki': ['Jimny', 'Vitara', 'SX4', 'Baleno', 'Swift'],
  'Tesla': ['Model S', 'Model 3', 'Model X', 'Model Y'],
  'Toyota': [
    'Aygo',
    'Yaris',
    'Corolla',
    'Camry',
    'Avalon',
    'RAV4',
    'Highlander',
    '4Runner',
    'Tacoma',
    'Tundra',
    'Land Cruiser',
    'Prius',
    'C-HR'
  ],
  'Volkswagen': [
    'Golf',
    'Jetta',
    'Passat',
    'Tiguan',
    'Atlas',
    'Arteon',
    'ID.4'
  ],
  'Volvo': ['S60', 'S90', 'V60', 'V90', 'XC40', 'XC60', 'XC90'],
};
const Map<String, double> partPrices = {
  'Бензиновый': 10000.0,
  'Дизельный': 12000.0,
  'Электрический': 15000.0,
  'Автоматическая': 5000.0,
  'Механическая': 3000.0,
  'Передний': 2000.0,
  'Задний': 1800.0,
  'Полный': 3500.0,
  'Инжектор': 1500.0,
  'Карбюратор': 1000.0,
  'Седан': 3000.0,
  'Хэтчбек': 2500.0,
  'Универсал': 3500.0,
  'Тканевые': 500.0,
  'Кожаные': 1500.0,
  '2 двери': 1000.0,
  '4 двери': 1500.0,
  'Цифровая': 2000.0,
  'Аналоговая': 1000.0,
};
