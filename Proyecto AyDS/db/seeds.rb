require './models/learning'
users = [
    { names: 'Jon Doe', username: 'jondoe', email: 'jon@doe.com', password: 'abc',progress: 20,actualLearning: 1},
    { names: 'Jane Doe', username: 'janedoe', email: 'jane@doe.com', password: 'abc',progress: 20,actualLearning: 1},
    { names: 'Baby Doe', username: 'babydoe', email: 'baby@doe.com', password: 'abc', progress: 20,actualLearning: 1},
  ]
  
  users.each do |u|
    User.create(u)
  end

elements = [
  {
    "Symbol": "H",
    "Name": "Hidrogeno",
    "AtomicMass": 1.0080,
    "Number": 1,
    "Group_": 1,
    "Period": 1,
    "Classification": "No Metales"
  },
  {
    "Symbol": "He",
    "Name": "Helio",
    "AtomicMass": 4.0026,
    "Number": 2,
    "Group_": 18,
    "Period": 1,
    "Classification": "Gases Nobles"
  },
  {
    "Symbol": "Li",
    "Name": "Litio",
    "AtomicMass": 6.94,
    "Number": 3,
    "Group_": 1,
    "Period": 2,
    "Classification": "Metales Alcalinos"
  },
  {
    "Symbol": "Be",
    "Name": "Berilio",
    "AtomicMass": 9.0122,
    "Number": 4,
    "Group_": 2,
    "Period": 2,
    "Classification": "Alcalinotérreos"
  },
  {
    "Symbol": "B",
    "Name": "Boro",
    "AtomicMass": 10.81,
    "Number": 5,
    "Group_": 13,
    "Period": 2,
    "Classification": "Metaloides"
  },
  {
    "Symbol": "C",
    "Name": "Carbono",
    "AtomicMass": 12.011,
    "Number": 6,
    "Group_": 14,
    "Period": 2,
    "Classification": "No Metales"
  },
  {
    "Symbol": "N",
    "Name": "Nitrógeno",
    "AtomicMass": 14.007,
    "Number": 7,
    "Group_": 15,
    "Period": 2,
    "Classification": "No Metales"
  },
  {
    "Symbol": "O",
    "Name": "Oxígeno",
    "AtomicMass": 15.999,
    "Number": 8,
    "Group_": 16,
    "Period": 2,
    "Classification": "No Metales"
  },
  {
    "Symbol": "F",
    "Name": "Flúor",
    "AtomicMass": 18.998,
    "Number": 9,
    "Group_": 17,
    "Period": 2,
    "Classification": "Halógenos"
  },
  {
    "Symbol": "Ne",
    "Name": "Neón",
    "AtomicMass": 20.180,
    "Number": 10,
    "Group_": 18,
    "Period": 2,
    "Classification": "Gases Nobles"
  },
  {
    "Symbol": "Na",
    "Name": "Sodio",
    "AtomicMass": 22.990,
    "Number": 11,
    "Group_": 1,
    "Period": 3,
    "Classification": "Metales Alcalinos"
  },
  {
    "Symbol": "Mg",
    "Name": "Magnesio",
    "AtomicMass": 24.305,
    "Number": 12,
    "Group_": 2,
    "Period": 3,
    "Classification": "Alcalinotérreos"
  },
  {
    "Symbol": "Al",
    "Name": "Aluminio",
    "AtomicMass": 26.982,
    "Number": 13,
    "Group_": 13,
    "Period": 3,
    "Classification": "Otros Metales"
  },
  {
    "Symbol": "Si",
    "Name": "Silicio",
    "AtomicMass": 28.085,
    "Number": 14,
    "Group_": 14,
    "Period": 3,
    "Classification": "Metaloides"
  },
  {
    "Symbol": "P",
    "Name": "Fósforo",
    "AtomicMass": 30.974,
    "Number": 15,
    "Group_": 15,
    "Period": 3,
    "Classification": "No Metales"
  },
  {
    "Symbol": "S",
    "Name": "Asufre",
    "AtomicMass": 32.06,
    "Number": 16,
    "Group_": 16,
    "Period": 3,
    "Classification": "No Metales"
  },
  {
    "Symbol": "Cl",
    "Name": "Cloro",
    "AtomicMass": 35.45,
    "Number": 17,
    "Group_": 17,
    "Period": 3,
    "Classification": "Halógenos"
  },
  {
    "Symbol": "Ar",
    "Name": "Argón",
    "AtomicMass": 39.95,
    "Number": 18,
    "Group_": 18,
    "Period": 3,
    "Classification": "Gases Nobles"
  },
  {
    "Symbol": "K",
    "Name": "Potasio",
    "AtomicMass": 39.098,
    "Number": 19,
    "Group_": 1,
    "Period": 4,
    "Classification": "Metales Alcalinos"
  },
  {
    "Symbol": "Ca",
    "Name": "Calcio",
    "AtomicMass": 40.078,
    "Number": 20,
    "Group_": 2,
    "Period": 4,
    "Classification": "Alcalinotérreos"
  },
  {
    "Symbol": "Sc",
    "Name": "Escandio",
    "AtomicMass": 44.956,
    "Number": 21,
    "Group_": 3,
    "Period": 4,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Ti",
    "Name": "Titanio",
    "AtomicMass": 47.867,
    "Number": 22,
    "Group_": 4,
    "Period": 4,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "V",
    "Name": "Vanadio",
    "AtomicMass": 50.942,
    "Number": 23,
    "Group_": 5,
    "Period": 4,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Cr",
    "Name": "Cromo",
    "AtomicMass": 51.996,
    "Number": 24,
    "Group_": 6,
    "Period": 4,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Mn",
    "Name": "Manganeso",
    "AtomicMass": 54.938,
    "Number": 25,
    "Group_": 7,
    "Period": 4,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Fe",
    "Name": "Hierro",
    "AtomicMass": 55.845,
    "Number": 26,
    "Group_": 8,
    "Period": 4,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Co",
    "Name": "Cobalto",
    "AtomicMass": 58.933,
    "Number": 27,
    "Group_": 9,
    "Period": 4,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Ni",
    "Name": "Níquel",
    "AtomicMass": 58.693,
    "Number": 28,
    "Group_": 10,
    "Period": 4,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Cu",
    "Name": "Cobre",
    "AtomicMass": 63.546,
    "Number": 29,
    "Group_": 11,
    "Period": 4,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Zn",
    "Name": "Zinc",
    "AtomicMass": 65.38,
    "Number": 30,
    "Group_": 12,
    "Period": 4,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Ga",
    "Name": "Galio",
    "AtomicMass": 69.723,
    "Number": 31,
    "Group_": 13,
    "Period": 4,
    "Classification": "Otros Metales"
  },
  {
    "Symbol": "Ge",
    "Name": "Germanio",
    "AtomicMass": 72.630,
    "Number": 32,
    "Group_": 14,
    "Period": 4,
    "Classification": "Metaloides"
  },
  {
    "Symbol": "As",
    "Name": "Arsénico",
    "AtomicMass": 74.922,
    "Number": 33,
    "Group_": 15,
    "Period": 4,
    "Classification": "Metaloides"
  },
  {
    "Symbol": "Se",
    "Name": "Selenio",
    "AtomicMass": 78.971,
    "Number": 34,
    "Group_": 16,
    "Period": 4,
    "Classification": "No Metales"
  },
  {
    "Symbol": "Br",
    "Name": "Bromo",
    "AtomicMass": 79.904,
    "Number": 35,
    "Group_": 17,
    "Period": 4,
    "Classification": "Halógenos"
  },
  {
    "Symbol": "Kr",
    "Name": "Kriptón",
    "AtomicMass": 83.798,
    "Number": 36,
    "Group_": 18,
    "Period": 4,
    "Classification": "Gases Nobles"
  },
  {
    "Symbol": "Rb",
    "Name": "Rubidio",
    "AtomicMass": 85.468,
    "Number": 37,
    "Group_": 1,
    "Period": 5,
    "Classification": "Metales Alcalinos"
  },
  {
    "Symbol": "Sr",
    "Name": "Estroncio",
    "AtomicMass": 87.62,
    "Number": 38,
    "Group_": 2,
    "Period": 5,
    "Classification": "Alcalinotérreos"
  },
  {
    "Symbol": "Y",
    "Name": "Itio",
    "AtomicMass": 88.906,
    "Number": 39,
    "Group_": 3,
    "Period": 5,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Zr",
    "Name": "Circonio",
    "AtomicMass": 91.224,
    "Number": 40,
    "Group_": 4,
    "Period": 5,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Nb",
    "Name": "Niobio",
    "AtomicMass": 92.906,
    "Number": 41,
    "Group_": 5,
    "Period": 5,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Mo",
    "Name": "Molibdeno",
    "AtomicMass": 95.95,
    "Number": 42,
    "Group_": 6,
    "Period": 5,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Tc",
    "Name": "Tecnecio",
    "AtomicMass": 97,
    "Number": 43,
    "Group_": 7,
    "Period": 5,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Ru",
    "Name": "Rutenio",
    "AtomicMass": 101.07,
    "Number": 44,
    "Group_": 8,
    "Period": 5,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Rh",
    "Name": "Rodio",
    "AtomicMass": 102.91,
    "Number": 45,
    "Group_": 9,
    "Period": 5,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Pd",
    "Name": "Paladio",
    "AtomicMass": 106.42,
    "Number": 46,
    "Group_": 10,
    "Period": 5,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Ag",
    "Name": "Plata",
    "AtomicMass": 107.87,
    "Number": 47,
    "Group_": 11,
    "Period": 5,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Cd",
    "Name": "Cadmio",
    "AtomicMass": 112.41,
    "Number": 48,
    "Group_": 12,
    "Period": 5,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "In",
    "Name": "Indio",
    "AtomicMass": 114.82,
    "Number": 49,
    "Group_": 13,
    "Period": 5,
    "Classification": "Otros Metales"
  },
  {
    "Symbol": "Sn",
    "Name": "Estaño",
    "AtomicMass": 118.71,
    "Number": 50,
    "Group_": 14,
    "Period": 5,
    "Classification": "Otros Metales"
  },
  {
    "Symbol": "Sb",
    "Name": "Antimonio",
    "AtomicMass": 121.76,
    "Number": 51,
    "Group_": 15,
    "Period": 5,
    "Classification": "Metaloides"
  },
  {
    "Symbol": "Te",
    "Name": "Telurio",
    "AtomicMass": 127.60,
    "Number": 52,
    "Group_": 16,
    "Period": 5,
    "Classification": "Metaloides"
  },
  {
    "Symbol": "I",
    "Name": "Yodo",
    "AtomicMass": 126.90,
    "Number": 53,
    "Group_": 17,
    "Period": 5,
    "Classification": "Halógenos"
  },
  {
    "Symbol": "Xe",
    "Name": "Xenón",
    "AtomicMass": 131.29,
    "Number": 54,
    "Group_": 18,
    "Period": 5,
    "Classification": "Gases Nobles"
  },
  {
    "Symbol": "Cs",
    "Name": "Cesio",
    "AtomicMass": 132.91,
    "Number": 55,
    "Group_": 1,
    "Period": 6,
    "Classification": "Metales Alcalinos"
  },
  {
    "Symbol": "Ba",
    "Name": "Bario",
    "AtomicMass": 137.33,
    "Number": 56,
    "Group_": 2,
    "Period": 6,
    "Classification": "Alcalinotérreoss"
  },
  {
    "Symbol": "La",
    "Name": "Lantano",
    "AtomicMass": 138.91,
    "Number": 57,
    "Group_": nil,
    "Period": 6,
    "Classification": "Lantánidos"
  },
  {
    "Symbol": "Ce",
    "Name": "Cerio",
    "AtomicMass": 140.12,
    "Number": 58,
    "Group_": nil,
    "Period": 6,
    "Classification": "Lantánidos"
  },
  {
    "Symbol": "Pr",
    "Name": "Praseodimio",
    "AtomicMass": 140.91,
    "Number": 59,
    "Group_": nil,
    "Period": 6,
    "Classification": "Lantánidos"
  },
  {
    "Symbol": "Nd",
    "Name": "Neodimio",
    "AtomicMass": 144.24,
    "Number": 60,
    "Group_": nil,
    "Period": 6,
    "Classification": "Lantánidos"
  },
  {
    "Symbol": "Pm",
    "Name": "Prometio",
    "AtomicMass": 145,
    "Number": 61,
    "Group_": nil,
    "Period": 6,
    "Classification": "Lantánidos"
  },
  {
    "Symbol": "Sm",
    "Name": "Samario",
    "AtomicMass": 150.36,
    "Number": 62,
    "Group_": nil,
    "Period": 6,
    "Classification": "Lantánidos"
  },
  {
    "Symbol": "Eu",
    "Name": "Europio",
    "AtomicMass": 151.96,
    "Number": 63,
    "Group_": nil,
    "Period": 6,
    "Classification": "Lantánidos"
  },
  {
    "Symbol": "Gd",
    "Name": "Gadolinio",
    "AtomicMass": 157.25,
    "Number": 64,
    "Group_": nil,
    "Period": 6,
    "Classification": "Lantánidos"
  },
  {
    "Symbol": "Tb",
    "Name": "Terbio",
    "AtomicMass": 158.93,
    "Number": 65,
    "Group_": nil,
    "Period": 6,
    "Classification": "Lantánidos"
  },
  {
    "Symbol": "Dy",
    "Name": "Disprosio",
    "AtomicMass": 162.50,
    "Number": 66,
    "Group_": nil,
    "Period": 6,
    "Classification": "Lantánidos"
  },
  {
    "Symbol": "Ho",
    "Name": "Holmio",
    "AtomicMass": 164.93,
    "Number": 67,
    "Group_": nil,
    "Period": 6,
    "Classification": "Lantánidos"
  },
  {
    "Symbol": "Er",
    "Name": "Erbio",
    "AtomicMass": 167.26,
    "Number": 68,
    "Group_": nil,
    "Period": 6,
    "Classification": "Lantánidos"
  },
  {
    "Symbol": "Tm",
    "Name": "Tulio",
    "AtomicMass": 168.93,
    "Number": 69,
    "Group_": nil,
    "Period": 6,
    "Classification": "Lantánidos"
  },
  {
    "Symbol": "Yb",
    "Name": "Iterbio",
    "AtomicMass": 173.05,
    "Number": 70,
    "Group_": nil,
    "Period": 6,
    "Classification": "Lantánidos"
  },
  {
    "Symbol": "Lu",
    "Name": "Lutecio",
    "AtomicMass": 174.97,
    "Number": 71,
    "Group_": nil,
    "Period": 6,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Hf",
    "Name": "Hafnio",
    "AtomicMass": 178.49,
    "Number": 72,
    "Group_": 4,
    "Period": 6,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Ta",
    "Name": "Tántalo",
    "AtomicMass": 180.95,
    "Number": 73,
    "Group_": 5,
    "Period": 6,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "W",
    "Name": "Wolframio",
    "AtomicMass": 183.84,
    "Number": 74,
    "Group_": 6,
    "Period": 6,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Re",
    "Name": "Renio",
    "AtomicMass": 186.21,
    "Number": 75,
    "Group_": 7,
    "Period": 6,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Os",
    "Name": "Osmio",
    "AtomicMass": 190.23,
    "Number": 76,
    "Group_": 8,
    "Period": 6,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Ir",
    "Name": "Iridio",
    "AtomicMass": 192.22,
    "Number": 77,
    "Group_": 9,
    "Period": 6,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Pt",
    "Name": "Platino",
    "AtomicMass": 195.08,
    "Number": 78,
    "Group_": 10,
    "Period": 6,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Au",
    "Name": "Oro",
    "AtomicMass": 196.97,
    "Number": 79,
    "Group_": 11,
    "Period": 6,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Hg",
    "Name": "Mercurio",
    "AtomicMass": 200.59,
    "Number": 80,
    "Group_": 12,
    "Period": 6,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Tl",
    "Name": "Talio",
    "AtomicMass": 204.38,
    "Number": 81,
    "Group_": 13,
    "Period": 6,
    "Classification": "Otros Metales"
  },
  {
    "Symbol": "Pb",
    "Name": "Plomo",
    "AtomicMass": 207.2,
    "Number": 82,
    "Group_": 14,
    "Period": 6,
    "Classification": "Otros Metales"
  },
  {
    "Symbol": "Bi",
    "Name": "Bismuto",
    "AtomicMass": 208.98,
    "Number": 83,
    "Group_": 15,
    "Period": 6,
    "Classification": "Otros Metales"
  },
  {
    "Symbol": "Po",
    "Name": "Polonio",
    "AtomicMass": 209,
    "Number": 84,
    "Group_": 16,
    "Period": 6,
    "Classification": "Metaloides"
  },
  {
    "Symbol": "At",
    "Name": "Astato",
    "AtomicMass": 210,
    "Number": 85,
    "Group_": 17,
    "Period": 6,
    "Classification": "Halógenos"
  },
  {
    "Symbol": "Rn",
    "Name": "Radón",
    "AtomicMass": 222,
    "Number": 86,
    "Group_": 18,
    "Period": 6,
    "Classification": "Gases Nobles"
  },
  {
    "Symbol": "Fr",
    "Name": "Francio",
    "AtomicMass": 223,
    "Number": 87,
    "Group_": 1,
    "Period": 7,
    "Classification": "Alcalinotérreoss"
  },
  {
    "Symbol": "Ra",
    "Name": "Radio",
    "AtomicMass": 226,
    "Number": 88,
    "Group_": 2,
    "Period": 7,
    "Classification": "Alcalinotérreos"
  },
  {
    "Symbol": "Ac",
    "Name": "Actinio",
    "AtomicMass": 227,
    "Number": 89,
    "Group_": nil,
    "Period": 7,
    "Classification": "Actínidos"
  },
  {
    "Symbol": "Th",
    "Name": "Torio",
    "AtomicMass": 232.04,
    "Number": 90,
    "Group_": nil,
    "Period": 7,
    "Classification": "Actínidos"
  },
  {
    "Symbol": "Pa",
    "Name": "Protactinio",
    "AtomicMass": 231.04,
    "Number": 91,
    "Group_": nil,
    "Period": 7,
    "Classification": "Actínidos"
  },
  {
    "Symbol": "U",
    "Name": "Uranio",
    "AtomicMass": 238.03,
    "Number": 92,
    "Group_": nil,
    "Period": 7,
    "Classification": "Actínidos"
  },
  {
    "Symbol": "Np",
    "Name": "Neptunio",
    "AtomicMass": 237,
    "Number": 93,
    "Group_": nil,
    "Period": 7,
    "Classification": "Actínidos"
  },
  {
    "Symbol": "Pu",
    "Name": "Plutonio",
    "AtomicMass": 244,
    "Number": 94,
    "Group_": nil,
    "Period": 7,
    "Classification": "Actínidos"
  },
  {
    "Symbol": "Am",
    "Name": "Americio",
    "AtomicMass": 243,
    "Number": 95,
    "Group_": nil,
    "Period": 7,
    "Classification": "Actínidos"
  },
  {
    "Symbol": "Cm",
    "Name": "Curio",
    "AtomicMass": 247,
    "Number": 96,
    "Group_": nil,
    "Period": 7,
    "Classification": "Actínidos"
  },
  {
    "Symbol": "Bk",
    "Name": "Berkelio",
    "AtomicMass": 247,
    "Number": 97,
    "Group_": nil,
    "Period": 7,
    "Classification": "Actínidos"
  },
  {
    "Symbol": "Cf",
    "Name": "Californio",
    "AtomicMass": 251,
    "Number": 98,
    "Group_": nil,
    "Period": 7,
    "Classification": "Actínidos"
  },
  {
    "Symbol": "Es",
    "Name": "Einsteinio",
    "AtomicMass": 252,
    "Number": 99,
    "Group_": nil,
    "Period": 7,
    "Classification": "Actínidos"
  },
  {
    "Symbol": "Fm",
    "Name": "Fermio",
    "AtomicMass": 257,
    "Number": 100,
    "Group_": nil,
    "Period": 7,
    "Classification": "Actínidos"
  },
  {
    "Symbol": "Md",
    "Name": "Mendelevio",
    "AtomicMass": 258,
    "Number": 101,
    "Group_": nil,
    "Period": 7,
    "Classification": "Actínidos"
  },
  {
    "Symbol": "No",
    "Name": "Nobelio",
    "AtomicMass": 259,
    "Number": 102,
    "Group_": nil,
    "Period": 7,
    "Classification": "Actínidos"
  },
  {
    "Symbol": "Lr",
    "Name": "Lawrencio",
    "AtomicMass": 262,
    "Number": 103,
    "Group_": nil,
    "Period": 7,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Rf",
    "Name": "Rutherfordio",
    "AtomicMass": 267,
    "Number": 104,
    "Group_": 4,
    "Period": 7,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Db",
    "Name": "Dubnio",
    "AtomicMass": 268,
    "Number": 105,
    "Group_": 5,
    "Period": 7,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Sg",
    "Name": "Seaborgio",
    "AtomicMass": 269,
    "Number": 106,
    "Group_": 6,
    "Period": 7,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Bh",
    "Name": "Bohrio",
    "AtomicMass": 270,
    "Number": 107,
    "Group_": 7,
    "Period": 7,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Hs",
    "Name": "Hasio",
    "AtomicMass": 269,
    "Number": 108,
    "Group_": 8,
    "Period": 7,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Mt",
    "Name": "Meitnerio",
    "AtomicMass": 277,
    "Number": 109,
    "Group_": 9,
    "Period": 7,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Ds",
    "Name": "Darmstatio",
    "AtomicMass": 281,
    "Number": 110,
    "Group_": 10,
    "Period": 7,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Rg",
    "Name": "Roentgenio",
    "AtomicMass": 282,
    "Number": 111,
    "Group_": 11,
    "Period": 7,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Cn",
    "Name": "Copernicio",
    "AtomicMass": 285,
    "Number": 112,
    "Group_": 12,
    "Period": 7,
    "Classification": "Metales de Transición"
  },
  {
    "Symbol": "Nh",
    "Name": "Nihonio",
    "AtomicMass": 286,
    "Number": 113,
    "Group_": 13,
    "Period": 7,
    "Classification": "Otros Metales"
  },
  {
    "Symbol": "Fl",
    "Name": "Flerovio",
    "AtomicMass": 290,
    "Number": 114,
    "Group_": 14,
    "Period": 7,
    "Classification": "Otros Metales"
  },
  {
    "Symbol": "Mc",
    "Name": "Moscovio",
    "AtomicMass": 290,
    "Number": 115,
    "Group_": 15,
    "Period": 7,
    "Classification": "Otros Metales"
  },
  {
    "Symbol": "Lv",
    "Name": "Livermorio",
    "AtomicMass": 293,
    "Number": 116,
    "Group_": 16,
    "Period": 7,
    "Classification": "Otros Metales"
  },
  {
    "Symbol": "Ts",
    "Name": "Teneso",
    "AtomicMass": 294,
    "Number": 117,
    "Group_": 17,
    "Period": 7,
    "Classification": "Halógenos"
  },
  {
    "Symbol": "Og",
    "Name": "Oganesón",
    "AtomicMass": 294,
    "Number": 118,
    "Group_": 18,
    "Period": 7,
    "Classification": "Gases Nobles"
  }
]

elements.each do |k|
  Element.create(k)
end


learnings = [
  { number: 1, lesson:"La tabla periódica de los elementos es una disposición de los elementos químicos en forma de tabla, ordenados por su número atómico (número de protones),por su configuración de electrones y sus propiedades químicas. Este ordenamiento muestra tendencias periódicas como elementos con comportamiento similar en la misma columna.", level: 1},
  { number: 2, lesson:"Las filas de la tabla se denominan períodos y las columnas grupos. La tabla también se divide en cuatro bloques con algunas propiedades químicas similares. Debido a que las posiciones están ordenadas, se puede utilizar la tabla para obtener relaciones entre las propiedades de los elementos, o pronosticar propiedades de elementos nuevos todavía no descubiertos o sintetizados.", level: 1},
  { number: 3, lesson:"La tabla periódica actual es un sistema donde se clasifican los elementos conocidos hasta la fecha. Se colocan De izquierda a derecha y de arriba abajo en orden creciente de sus números atómicos. Los elementos están ordenados en siete hileras horizontales llamadas periodos, y en 18 columnas verticales llamadas grupos o familias. Hacia abajo y a la izquierda aumenta el radio atómico y el radio iónico. Hacia arriba y a la derecha aumenta la energía de ionización, la afinidad electrónica y la electronegatividad.", level: 1},
  { number: 4, lesson:"Grupos. columnas verticales de la tabla se las conoce como grupos o familias. Hay 18 grupos en la tabla periódica estándar. En virtud de un convenio internacional de denominación, los grupos están numerados de 1 a 18 desde la columna más a la izquierda,los metales alcalinos, hasta la columna más a la derecha los ,gases nobles.", level: 1},
  { number: 5, lesson:"Los elementos de un mismo grupo tienden a mostrar patrones en el radio atómico, energía de ionización y electronegatividad. De arriba abajo en un grupo, aumentan los radios atómicos de los elementos. Puesto que hay niveles de energía más llenos, los electrones de valencia se encuentran más alejados del núcleo. Desde la parte superior, cada elemento sucesivo tiene una energía de ionización más baja, ya que es más fácil quitar un electrón en los átomos que están menos fuertemente unidos.", level: 1},
  { number: 6, lesson:"Hay excepciones a estas tendencias, como por ejemplo lo que ocurre en el grupo 11, donde la electronegatividad aumenta más abajo en el grupo.64​ Además, en algunas partes de la tabla periódica como los bloques d y f, las similitudes horizontales pueden ser tan o más pronunciadas que las verticales.", level: 1},
  { number: 7, lesson: "Las filas horizontales de la tabla periódica son llamadas períodos.​ El número de niveles energéticos de un átomo determina el periodo al que pertenece. Cada nivel está dividido en distintos subniveles, que conforme aumenta su número atómico se van llenando en este orden:", level: 1},
  { number: 8, lesson: "Los elementos en el mismo período muestran tendencias similares en radio atómico, energía de ionización, afinidad electrónica y electronegatividad. En un período el radio atómico normalmente decrece si nos desplazamos hacia la derecha debido a que cada elemento sucesivo añadió protones y electrones, lo que provoca que este último sea arrastrado más cerca del núcleo.69​ Esta disminución del radio atómico también causa que la energía de ionización y la electronegatividad aumenten de izquierda a derecha en un período, debido a la atracción que ejerce el núcleo sobre los electrones.", level: 1},
  { number: 9, lesson: "Bloques. La tabla periódica se puede también dividir en bloques de acuerdo a la secuencia en la que se llenan las capas de electrones de los elementos. Cada bloque se denomina según el orbital en el que en teoría reside el último electrón: s, p, d y f.", level: 1},
  { number: 10, lesson: "El bloque s comprende los dos primeros grupos (metales alcalinos y alcalinotérreos), así como el hidrógeno y el helio. El bloque p comprende los últimos seis grupos —que son grupos del 13 al 18 y contiene, entre otros elementos, todos los metaloides. El bloque d comprende los grupos 3 a 12 —o 3B a 2B en la numeración americana de grupo— y contiene todos los metales de transición .El bloque f, a menudo colocado por debajo del resto de la tabla periódica, no tiene números de grupo y se compone de lantánidos y actínidos.", level: 1},
  { number: 11, lesson: "Metales, metaloides y no metales. De acuerdo con las propiedades físicas y químicas que comparten, los elementos se pueden clasificar en tres grandes categorías: metales, metaloides y no metales. Los metales son sólidos generalmente brillantes, altamente conductores que forman aleaciones de unos con otros y compuestos iónicos similares a sales con compuestos no metálicos —siempre que no sean los gases nobles—. La mayoría de los no metales son gases incoloros o de colores", level: 1},
  { number: 12, lesson:"Metales y no metales pueden clasificarse en sub_categorías que muestran una gradación desde lo metálico a las propiedades no metálicas, de izquierda a derecha, en las filas: metales alcalinos —altamente reactivos—, metales alcalinotérreos —menos reactivos—, lantánidos y actínidos, metales de transición y metales post-transición.", level: 1},
  { number: 13, lesson:"Los no metales se subdividen simplemente en no metales poliatómicos —que, por estar más cercanos a los metaloides, muestran cierto carácter metálico incipiente—, no metales diatómicos —que son esencialmente no metálicos— y los gases nobles, que son monoatómicos no metálicos y casi completamente inertes.", level: 1},
]

learnings.each do |h|
  Learning.create(h)
end