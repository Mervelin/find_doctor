# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

patient1 = Patient.create(first_name: 'demo', last_name: 'demo', email: 'demo@demo.com',
                          phone: '987654321', password: 'demo')
patient2 = Patient.create(first_name: 'Smok', last_name: 'Wawelski', email: 'smok@gmail.com',
                          phone: '43986231234', password: 'smok')

doctor = Doctor.create(first_name: 'Jan', last_name: 'Kowalski', title: 'dr',
                       email: 'kowalski@gmail.com', phone: '123456789',
                       specialization: 'kardiolog',
                       description: 'Jestem dobrym kardiologiem',
                       password: 'kowalski')

office = Office.create(doctor_id: doctor.id, city: 'Krakow', street: 'ul. Adama Mickiewicza',
                       nr: '54b', info: 'na parterze')

Visit.create(doctor_id: doctor.id, patient_id: patient1.id, office_id: office.id,
             start_time: '2017-07-01 08:00:00', end_time: '2017-07-01 08:30:00')

office = Office.create(doctor_id: doctor.id, city: 'Katowice', street: 'ul. Warszawska',
                       nr: '123a', info: '3 pietro')

Visit.create(doctor_id: doctor.id, patient_id: patient1.id, office_id: office.id,
             start_time: '2017-07-02 08:00:00', end_time: '2017-07-02 08:30:00')

doctor = Doctor.create(first_name: 'Jakub', last_name: 'Lewandowski', title: 'dr',
                       email: 'lewandowski@gmail.com', phone: '123456789',
                       specialization: 'ortopeda',
                       description: 'Najlepszy ortopeda w Polsce',
                       password: 'lewandowski')

Office.create(doctor_id: doctor.id, city: 'Warszawa', street: 'ul. Adama Mickiewicza',
              nr: '3', info: '')

Visit.create(doctor_id: doctor.id, patient_id: patient1.id, office_id: office.id,
             start_time: '2017-07-03 08:00:00', end_time: '2017-07-03 08:30:00')

Office.create(doctor_id: doctor.id, city: 'Gdańsk', street: 'ul. Sopocka',
              nr: '2', info: '')

Visit.create(doctor_id: doctor.id, patient_id: patient2.id, office_id: office.id,
             start_time: '2017-07-04 08:00:00', end_time: '2017-07-04 08:30:00')