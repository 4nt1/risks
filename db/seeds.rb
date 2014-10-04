t1 = Type.create(code: SecureRandom.hex, description: 'toxique')
t2 = Type.create(code: SecureRandom.hex, description: 'corrosif')
t3 = Type.create(code: SecureRandom.hex, description: 'addictif')

r1 = Risk.create(code: SecureRandom.hex, description: 'Risque de tomber')
r2 = Risk.create(code: SecureRandom.hex, description: 'Risque de se bruler')
r3 =  Risk.create(code: SecureRandom.hex, description: 'Risque de glisser')

[[t1, r1], [t2, r2], [t3, r3]].each do |i|
  type = i.first
  risk = i.last
  rank = Rank.new(code: SecureRandom.hex, description: 'Bla bla zou zou')
  rank.types << type
  rank.risks << risk
  rank.save
end

Rank.create(code:         SecureRandom.hex,
            type_ids:     [t1.id.to_s, t3.id.to_s],
            risk_ids:     [r1.id.to_s, r2.id.to_s],
            description:  "Ça doit faire mal")

Rank.create(code:         SecureRandom.hex,
            type_ids:     [t1.id.to_s],
            risk_ids:     [r3.id.to_s],
            description:  "Ça glisse")

Rank.create(code:         SecureRandom.hex,
            type_ids:     [t1.id.to_s, t2.id.to_s, t3.id.to_s],
            risk_ids:     [r3.id.to_s],
            description:  "Ça pique")