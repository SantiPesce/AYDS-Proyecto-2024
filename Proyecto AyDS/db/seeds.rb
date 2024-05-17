users = [
    { names: 'Jon Doe', username: 'jondoe', email: 'jon@doe.com', password: 'abc',progress: 20},
    { names: 'Jane Doe', username: 'janedoe', email: 'jane@doe.com', password: 'abc',progress: 20},
    { names: 'Baby Doe', username: 'babydoe', email: 'baby@doe.com', password: 'abc', progress: 20},
  ]
  
  users.each do |u|
    User.create(u)
  end

elements = [
  {symbol: "H",name:"Hydrogen",atomicMass:1.007,number:1,group:"1",period:"1",clasification:"Nonmetal"},
  {symbol:"He",name:"Helium",atomicMass:4.002,number:2,group:"18",period:"1",clasification:"NobleGas"},
  {symbol:"Li",name:"Lithium",atomicMass:6.941,number:3,group:"1",period:"2",clasification:"AlkaliMetal"},
]

elements.each do |k|
  Element.create(k)
end

