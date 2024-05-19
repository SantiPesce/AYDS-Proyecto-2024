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
    "Name": "Hydrogen",
    "AtomicMass": "1007",
    "Number": "1",
    "Group": "1",
    "Period": "1",
    "Classification": "Nonmetal"
  },
  {
    "Symbol": "He",
    "Name": "Helium",
    "AtomicMass": "4002",
    "Number": "2",
    "Group": "18",
    "Period": "1",
    "Classification": "Noble Gas"
  },
  {
    "Symbol": "Li",
    "Name": "Lithium",
    "AtomicMass": "6941",
    "Number": "3",
    "Group": "1",
    "Period": "2",
    "Classification": "Alkali Metal"
  },
  {
    "Symbol": "Be",
    "Name": "Beryllium",
    "AtomicMass": "9012",
    "Number": "4",
    "Group": "2",
    "Period": "2",
    "Classification": "Alkaline Earth Metal"
  },
  {
    "Symbol": "B",
    "Name": "Boron",
    "AtomicMass": "10811",
    "Number": "5",
    "Group": "13",
    "Period": "2",
    "Classification": "Metalloid"
  },
  {
    "Symbol": "C",
    "Name": "Carbon",
    "AtomicMass": "12011",
    "Number": "6",
    "Group": "14",
    "Period": "2",
    "Classification": "Nonmetal"
  },
  {
    "Symbol": "N",
    "Name": "Nitrogen",
    "AtomicMass": "14007",
    "Number": "7",
    "Group": "15",
    "Period": "2",
    "Classification": "Nonmetal"
  },
  {
    "Symbol": "O",
    "Name": "Oxygen",
    "AtomicMass": "15999",
    "Number": "8",
    "Group": "16",
    "Period": "2",
    "Classification": "Nonmetal"
  },
  {
    "Symbol": "F",
    "Name": "Fluorine",
    "AtomicMass": "18998",
    "Number": "9",
    "Group": "17",
    "Period": "2",
    "Classification": "Halogen"
  },
  {
    "Symbol": "Ne",
    "Name": "Neon",
    "AtomicMass": "20.18",
    "Number": "10",
    "Group": "18",
    "Period": "2",
    "Classification": "Noble Gas"
  },
  {
    "Symbol": "Na",
    "Name": "Sodium",
    "AtomicMass": "22.99",
    "Number": "11",
    "Group": "1",
    "Period": "3",
    "Classification": "Alkali Metal"
  },
  {
    "Symbol": "Mg",
    "Name": "Magnesium",
    "AtomicMass": "24305",
    "Number": "12",
    "Group": "2",
    "Period": "3",
    "Classification": "Alkaline Earth Metal"
  },
  {
    "Symbol": "Al",
    "Name": "Aluminum",
    "AtomicMass": "26982",
    "Number": "13",
    "Group": "13",
    "Period": "3",
    "Classification": "Metal"
  },
  {
    "Symbol": "Si",
    "Name": "Silicon",
    "AtomicMass": "28086",
    "Number": "14",
    "Group": "14",
    "Period": "3",
    "Classification": "Metalloid"
  },
  {
    "Symbol": "P",
    "Name": "Phosphorus",
    "AtomicMass": "30974",
    "Number": "15",
    "Group": "15",
    "Period": "3",
    "Classification": "Nonmetal"
  },
  {
    "Symbol": "S",
    "Name": "Sulfur",
    "AtomicMass": "32065",
    "Number": "16",
    "Group": "16",
    "Period": "3",
    "Classification": "Nonmetal"
  },
  {
    "Symbol": "Cl",
    "Name": "Chlorine",
    "AtomicMass": "35453",
    "Number": "17",
    "Group": "17",
    "Period": "3",
    "Classification": "Halogen"
  },
  {
    "Symbol": "Ar",
    "Name": "Argon",
    "AtomicMass": "39948",
    "Number": "18",
    "Group": "18",
    "Period": "3",
    "Classification": "Noble Gas"
  },
  {
    "Symbol": "K",
    "Name": "Potassium",
    "AtomicMass": "39098",
    "Number": "19",
    "Group": "1",
    "Period": "4",
    "Classification": "Alkali Metal"
  },
  {
    "Symbol": "Ca",
    "Name": "Calcium",
    "AtomicMass": "40078",
    "Number": "20",
    "Group": "2",
    "Period": "4",
    "Classification": "Alkaline Earth Metal"
  },
  {
    "Symbol": "Sc",
    "Name": "Scandium",
    "AtomicMass": "44956",
    "Number": "21",
    "Group": "3",
    "Period": "4",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "Ti",
    "Name": "Titanium",
    "AtomicMass": "47867",
    "Number": "22",
    "Group": "4",
    "Period": "4",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "V",
    "Name": "Vanadium",
    "AtomicMass": "50942",
    "Number": "23",
    "Group": "5",
    "Period": "4",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "Cr",
    "Name": "Chromium",
    "AtomicMass": "51996",
    "Number": "24",
    "Group": "6",
    "Period": "4",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "Mn",
    "Name": "Manganese",
    "AtomicMass": "54938",
    "Number": "25",
    "Group": "7",
    "Period": "4",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "Fe",
    "Name": "Iron",
    "AtomicMass": "55845",
    "Number": "26",
    "Group": "8",
    "Period": "4",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "Co",
    "Name": "Cobalt",
    "AtomicMass": "58933",
    "Number": "27",
    "Group": "9",
    "Period": "4",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "Ni",
    "Name": "Nickel",
    "AtomicMass": "58693",
    "Number": "28",
    "Group": "10",
    "Period": "4",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "Cu",
    "Name": "Copper",
    "AtomicMass": "63546",
    "Number": "29",
    "Group": "11",
    "Period": "4",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "Zn",
    "Name": "Zinc",
    "AtomicMass": "65.38",
    "Number": "30",
    "Group": "12",
    "Period": "4",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "Ga",
    "Name": "Gallium",
    "AtomicMass": "69723",
    "Number": "31",
    "Group": "13",
    "Period": "4",
    "Classification": "Metal"
  },
  {
    "Symbol": "Ge",
    "Name": "Germanium",
    "AtomicMass": "72.64",
    "Number": "32",
    "Group": "14",
    "Period": "4",
    "Classification": "Metalloid"
  },
  {
    "Symbol": "As",
    "Name": "Arsenic",
    "AtomicMass": "74922",
    "Number": "33",
    "Group": "15",
    "Period": "4",
    "Classification": "Metalloid"
  },
  {
    "Symbol": "Se",
    "Name": "Selenium",
    "AtomicMass": "78.96",
    "Number": "34",
    "Group": "16",
    "Period": "4",
    "Classification": "Nonmetal"
  },
  {
    "Symbol": "Br",
    "Name": "Bromine",
    "AtomicMass": "79904",
    "Number": "35",
    "Group": "17",
    "Period": "4",
    "Classification": "Halogen"
  },
  {
    "Symbol": "Kr",
    "Name": "Krypton",
    "AtomicMass": "83798",
    "Number": "36",
    "Group": "18",
    "Period": "4",
    "Classification": "Noble Gas"
  },
  {
    "Symbol": "Rb",
    "Name": "Rubidium",
    "AtomicMass": "85468",
    "Number": "37",
    "Group": "1",
    "Period": "5",
    "Classification": "Alkali Metal"
  },
  {
    "Symbol": "Sr",
    "Name": "Strontium",
    "AtomicMass": "87.62",
    "Number": "38",
    "Group": "2",
    "Period": "5",
    "Classification": "Alkaline Earth Metal"
  },
  {
    "Symbol": "Y",
    "Name": "Yttrium",
    "AtomicMass": "88906",
    "Number": "39",
    "Group": "3",
    "Period": "5",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "Zr",
    "Name": "Zirconium",
    "AtomicMass": "91224",
    "Number": "40",
    "Group": "4",
    "Period": "5",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "Nb",
    "Name": "Niobium",
    "AtomicMass": "92906",
    "Number": "41",
    "Group": "5",
    "Period": "5",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "Mo",
    "Name": "Molybdenum",
    "AtomicMass": "95.96",
    "Number": "42",
    "Group": "6",
    "Period": "5",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "Tc",
    "Name": "Technetium",
    "AtomicMass": "98",
    "Number": "43",
    "Group": "7",
    "Period": "5",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "Ru",
    "Name": "Ruthenium",
    "AtomicMass": "101.07",
    "Number": "44",
    "Group": "8",
    "Period": "5",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "Rh",
    "Name": "Rhodium",
    "AtomicMass": "102906",
    "Number": "45",
    "Group": "9",
    "Period": "5",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "Pd",
    "Name": "Palladium",
    "AtomicMass": "106.42",
    "Number": "46",
    "Group": "10",
    "Period": "5",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "Ag",
    "Name": "Silver",
    "AtomicMass": "107868",
    "Number": "47",
    "Group": "11",
    "Period": "5",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "Cd",
    "Name": "Cadmium",
    "AtomicMass": "112411",
    "Number": "48",
    "Group": "12",
    "Period": "5",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "In",
    "Name": "Indium",
    "AtomicMass": "114818",
    "Number": "49",
    "Group": "13",
    "Period": "5",
    "Classification": "Metal"
  },
  {
    "Symbol": "Sn",
    "Name": "Tin",
    "AtomicMass": "118.71",
    "Number": "50",
    "Group": "14",
    "Period": "5",
    "Classification": "Metal"
  },
  {
    "Symbol": "Sb",
    "Name": "Antimony",
    "AtomicMass": "121.76",
    "Number": "51",
    "Group": "15",
    "Period": "5",
    "Classification": "Metalloid"
  },
  {
    "Symbol": "Te",
    "Name": "Tellurium",
    "AtomicMass": "127.6",
    "Number": "52",
    "Group": "16",
    "Period": "5",
    "Classification": "Metalloid"
  },
  {
    "Symbol": "I",
    "Name": "Iodine",
    "AtomicMass": "126904",
    "Number": "53",
    "Group": "17",
    "Period": "5",
    "Classification": "Halogen"
  },
  {
    "Symbol": "Xe",
    "Name": "Xenon",
    "AtomicMass": "131293",
    "Number": "54",
    "Group": "18",
    "Period": "5",
    "Classification": "Noble Gas"
  },
  {
    "Symbol": "Cs",
    "Name": "Cesium",
    "AtomicMass": "132905",
    "Number": "55",
    "Group": "1",
    "Period": "6",
    "Classification": "Alkali Metal"
  },
  {
    "Symbol": "Ba",
    "Name": "Barium",
    "AtomicMass": "137327",
    "Number": "56",
    "Group": "2",
    "Period": "6",
    "Classification": "Alkaline Earth Metal"
  },
  {
    "Symbol": "La",
    "Name": "Lanthanum",
    "AtomicMass": "138905",
    "Number": "57",
    "Group": "3",
    "Period": "6",
    "Classification": "Lanthanide"
  },
  {
    "Symbol": "Ce",
    "Name": "Cerium",
    "AtomicMass": "140116",
    "Number": "58",
    "Group": 50,
    "Period": "6",
    "Classification": "Lanthanide"
  },
  {
    "Symbol": "Pr",
    "Name": "Praseodymium",
    "AtomicMass": "140908",
    "Number": "59",
    "Group": 50,
    "Period": "6",
    "Classification": "Lanthanide"
  },
  {
    "Symbol": "Nd",
    "Name": "Neodymium",
    "AtomicMass": "144242",
    "Number": "60",
    "Group": 50,
    "Period": "6",
    "Classification": "Lanthanide"
  },
  {
    "Symbol": "Pm",
    "Name": "Promethium",
    "AtomicMass": "145",
    "Number": "61",
    "Group": 50,
    "Period": "6",
    "Classification": "Lanthanide"
  },
  {
    "Symbol": "Sm",
    "Name": "Samarium",
    "AtomicMass": "150.36",
    "Number": "62",
    "Group": 50,
    "Period": "6",
    "Classification": "Lanthanide"
  },
  {
    "Symbol": "Eu",
    "Name": "Europium",
    "AtomicMass": "151964",
    "Number": "63",
    "Group": 50,
    "Period": "6",
    "Classification": "Lanthanide"
  },
  {
    "Symbol": "Gd",
    "Name": "Gadolinium",
    "AtomicMass": "157.25",
    "Number": "64",
    "Group": 50,
    "Period": "6",
    "Classification": "Lanthanide"
  },
  {
    "Symbol": "Tb",
    "Name": "Terbium",
    "AtomicMass": "158925",
    "Number": "65",
    "Group": 50,
    "Period": "6",
    "Classification": "Lanthanide"
  },
  {
    "Symbol": "Dy",
    "Name": "Dysprosium",
    "AtomicMass": "162.5",
    "Number": "66",
    "Group": 50,
    "Period": "6",
    "Classification": "Lanthanide"
  },
  {
    "Symbol": "Ho",
    "Name": "Holmium",
    "AtomicMass": "164.93",
    "Number": "67",
    "Group": 50,
    "Period": "6",
    "Classification": "Lanthanide"
  },
  {
    "Symbol": "Er",
    "Name": "Erbium",
    "AtomicMass": "167259",
    "Number": "68",
    "Group": 50,
    "Period": "6",
    "Classification": "Lanthanide"
  },
  {
    "Symbol": "Tm",
    "Name": "Thulium",
    "AtomicMass": "168934",
    "Number": "69",
    "Group": 50,
    "Period": "6",
    "Classification": "Lanthanide"
  },
  {
    "Symbol": "Yb",
    "Name": "Ytterbium",
    "AtomicMass": "173054",
    "Number": "70",
    "Group": 50,
    "Period": "6",
    "Classification": "Lanthanide"
  },
  {
    "Symbol": "Lu",
    "Name": "Lutetium",
    "AtomicMass": "174967",
    "Number": "71",
    "Group": 50,
    "Period": "6",
    "Classification": "Lanthanide"
  },
  {
    "Symbol": "Hf",
    "Name": "Hafnium",
    "AtomicMass": "178.49",
    "Number": "72",
    "Group": "4",
    "Period": "6",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "Ta",
    "Name": "Tantalum",
    "AtomicMass": "180948",
    "Number": "73",
    "Group": "5",
    "Period": "6",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "W",
    "Name": "Wolfram",
    "AtomicMass": "183.84",
    "Number": "74",
    "Group": "6",
    "Period": "6",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "Re",
    "Name": "Rhenium",
    "AtomicMass": "186207",
    "Number": "75",
    "Group": "7",
    "Period": "6",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "Os",
    "Name": "Osmium",
    "AtomicMass": "190.23",
    "Number": "76",
    "Group": "8",
    "Period": "6",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "Ir",
    "Name": "Iridium",
    "AtomicMass": "192217",
    "Number": "77",
    "Group": "9",
    "Period": "6",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "Pt",
    "Name": "Platinum",
    "AtomicMass": "195084",
    "Number": "78",
    "Group": "10",
    "Period": "6",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "Au",
    "Name": "Gold",
    "AtomicMass": "196967",
    "Number": "79",
    "Group": "11",
    "Period": "6",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "Hg",
    "Name": "Mercury",
    "AtomicMass": "200.59",
    "Number": "80",
    "Group": "12",
    "Period": "6",
    "Classification": "Transition Metal"
  },
  {
    "Symbol": "Tl",
    "Name": "Thallium",
    "AtomicMass": "204383",
    "Number": "81",
    "Group": "13",
    "Period": "6",
    "Classification": "Metal"
  },
  {
    "Symbol": "Pb",
    "Name": "Lead",
    "AtomicMass": "207.2",
    "Number": "82",
    "Group": "14",
    "Period": "6",
    "Classification": "Metal"
  },
  {
    "Symbol": "Bi",
    "Name": "Bismuth",
    "AtomicMass": "208.98",
    "Number": "83",
    "Group": "15",
    "Period": "6",
    "Classification": "Metal"
  },
  {
    "Symbol": "Po",
    "Name": "Polonium",
    "AtomicMass": "210",
    "Number": "84",
    "Group": "16",
    "Period": "6",
    "Classification": "Metalloid"
  },
  {
    "Symbol": "At",
    "Name": "Astatine",
    "AtomicMass": "210",
    "Number": "85",
    "Group": "17",
    "Period": "6",
    "Classification": "Noble Gas"
  },
  {
    "Symbol": "Rn",
    "Name": "Radon",
    "AtomicMass": "222",
    "Number": "86",
    "Group": "18",
    "Period": "6",
    "Classification": "Alkali Metal"
  },
  {
    "Symbol": "Fr",
    "Name": "Francium",
    "AtomicMass": "223",
    "Number": "87",
    "Group": "1",
    "Period": "7",
    "Classification": "Alkaline Earth Metal"
  },
  {
    "Symbol": "Ra",
    "Name": "Radium",
    "AtomicMass": "226",
    "Number": "88",
    "Group": "2",
    "Period": "7",
    "Classification": "Actinide"
  },
  {
    "Symbol": "Ac",
    "Name": "Actinium",
    "AtomicMass": "227",
    "Number": "89",
    "Group": "3",
    "Period": "7",
    "Classification": "Actinide"
  },
  {
    "Symbol": "Th",
    "Name": "Thorium",
    "AtomicMass": "232038",
    "Number": "90",
    "Group": 50,
    "Period": "7",
    "Classification": "Actinide"
  },
  {
    "Symbol": "Pa",
    "Name": "Protactinium",
    "AtomicMass": "231036",
    "Number": "91",
    "Group": 50,
    "Period": "7",
    "Classification": "Actinide"
  },
  {
    "Symbol": "U",
    "Name": "Uranium",
    "AtomicMass": "238029",
    "Number": "92",
    "Group": 50,
    "Period": "7",
    "Classification": "Actinide"
  },
  {
    "Symbol": "Np",
    "Name": "Neptunium",
    "AtomicMass": "237",
    "Number": "93",
    "Group": 50,
    "Period": "7",
    "Classification": "Actinide"
  },
  {
    "Symbol": "Pu",
    "Name": "Plutonium",
    "AtomicMass": "244",
    "Number": "94",
    "Group": 50,
    "Period": "7",
    "Classification": "Actinide"
  },
  {
    "Symbol": "Am",
    "Name": "Americium",
    "AtomicMass": "243",
    "Number": "95",
    "Group": 50,
    "Period": "7",
    "Classification": "Actinide"
  },
  {
    "Symbol": "Cm",
    "Name": "Curium",
    "AtomicMass": "247",
    "Number": "96",
    "Group": 50,
    "Period": "7",
    "Classification": "Actinide"
  },
  {
    "Symbol": "Bk",
    "Name": "Berkelium",
    "AtomicMass": "247",
    "Number": "97",
    "Group": 50,
    "Period": "7",
    "Classification": "Actinide"
  },
  {
    "Symbol": "Cf",
    "Name": "Californium",
    "AtomicMass": "251",
    "Number": "98",
    "Group": 50,
    "Period": "7",
    "Classification": "Actinide"
  },
  {
    "Symbol": "Es",
    "Name": "Einsteinium",
    "AtomicMass": "252",
    "Number": "99",
    "Group": 50,
    "Period": "7",
    "Classification": "Actinide"
  },
  {
    "Symbol": "Fm",
    "Name": "Fermium",
    "AtomicMass": "257",
    "Number": "100",
    "Group": 50,
    "Period": "7",
    "Classification": "Actinide"
  },
  {
    "Symbol": "Md",
    "Name": "Mendelevium",
    "AtomicMass": "258",
    "Number": "101",
    "Group": 50,
    "Period": "7",
    "Classification": "Actinide"
  },
  {
    "Symbol": "No",
    "Name": "Nobelium",
    "AtomicMass": "259",
    "Number": "102",
    "Group": 50,
    "Period": "7",
    "Classification": "Actinide"
  },
  {
    "Symbol": "Lr",
    "Name": "Lawrencium",
    "AtomicMass": "262",
    "Number": "103",
    "Group": 50,
    "Period": "7",
    "Classification": "Actinide"
  },
  {
    "Symbol": "Rf",
    "Name": "Rutherfordium",
    "AtomicMass": "261",
    "Number": "104",
    "Group": "4",
    "Period": "7",
    "Classification": "Transactinide"
  },
  {
    "Symbol": "Db",
    "Name": "Dubnium",
    "AtomicMass": "262",
    "Number": "105",
    "Group": "5",
    "Period": "7",
    "Classification": "Transactinide"
  },
  {
    "Symbol": "Sg",
    "Name": "Seaborgium",
    "AtomicMass": "266",
    "Number": "106",
    "Group": "6",
    "Period": "7",
    "Classification": "Transactinide"
  },
  {
    "Symbol": "Bh",
    "Name": "Bohrium",
    "AtomicMass": "264",
    "Number": "107",
    "Group": "7",
    "Period": "7",
    "Classification": "Transactinide"
  },
  {
    "Symbol": "Hs",
    "Name": "Hassium",
    "AtomicMass": "267",
    "Number": "108",
    "Group": "8",
    "Period": "7",
    "Classification": "Transactinide"
  },
  {
    "Symbol": "Mt",
    "Name": "Meitnerium",
    "AtomicMass": "268",
    "Number": "109",
    "Group": "9",
    "Period": "7",
    "Classification": "Transactinide"
  },
  {
    "Symbol": "Ds ",
    "Name": "Darmstadtium ",
    "AtomicMass": "271",
    "Number": "110",
    "Group": "10",
    "Period": "7",
    "Classification": "Transactinide"
  },
  {
    "Symbol": "Rg ",
    "Name": "Roentgenium ",
    "AtomicMass": "272",
    "Number": "111",
    "Group": "11",
    "Period": "7",
    "Classification": "Transactinide"
  },
  {
    "Symbol": "Cn ",
    "Name": "Copernicium ",
    "AtomicMass": "285",
    "Number": "112",
    "Group": "12",
    "Period": "7",
    "Classification": "Transactinide"
  },
  {
    "Symbol": "Nh",
    "Name": "Nihonium",
    "AtomicMass": "284",
    "Number": "113",
    "Group": "13",
    "Period": "7",
    "Classification": 50
  },
  {
    "Symbol": "Fl",
    "Name": "Flerovium",
    "AtomicMass": "289",
    "Number": "114",
    "Group": "14",
    "Period": "7",
    "Classification": "Transactinide"
  },
  {
    "Symbol": "Mc",
    "Name": "Moscovium",
    "AtomicMass": "288",
    "Number": "115",
    "Group": "15",
    "Period": "7",
    "Classification": 50
  },
  {
    "Symbol": "Lv",
    "Name": "Livermorium",
    "AtomicMass": "292",
    "Number": "116",
    "Group": "16",
    "Period": "7",
    "Classification": "Transactinide"
  },
  {
    "Symbol": "Ts",
    "Name": "Tennessine",
    "AtomicMass": "295",
    "Number": "117",
    "Group": "17",
    "Period": "7",
    "Classification": 50
  },
  {
    "Symbol": "Og",
    "Name": "Oganesson",
    "AtomicMass": "294",
    "Number": "118",
    "Group": "18",
    "Period": "7",
    "Classification": "Noble Gas"
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