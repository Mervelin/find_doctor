# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

doctor = Doctor.create(first_name: 'Jan', last_name: 'Kowalski', title: 'dr',
                       email:'jankowalski@gmail.com', phone: '123456789',
                       specialization: 'kardiolog',
                       description: 'Opis lekarza jana kowalskiego')

office = Office.create(doctor_id: doctor.id, city: 'Krakow', street: 'ul. Adama Mickiewicza',
                       nr: '54b', info: 'na parterze')

Timetable.create(doctor_id: doctor.id, office_id: office.id, start_time: '2017-07-01 08:00:00',
                 end_time: '2017-07-01 16:00:00')

patient = Patient.create(first_name: 'Alojzy', last_name: 'Gompka', email: 'goma@gmail.com',
                         phone: '987654321')

Visit.create(doctor_id: doctor.id, patient_id: patient.id, office_id: office.id,
             start_time: '2017-07-01 08:00:00', end_time: '2017-07-01 08:30:00')

doctor = Doctor.create(first_name: 'Marcin', last_name: 'Nowak', title: 'dr hab',
                       email:'nowakmarcin@gmail.com', phone: '456123789',
                       specialization: 'pediatra',
                       description: 'Opis lekarza nowaka marcina')

office = Office.create(doctor_id: doctor.id, city: 'Krakow', street: 'ul. Krowoderska',
                       nr: '12/9', info: '4 pietro')


Timetable.create(doctor_id: doctor.id, office_id: office.id, start_time: '2017-07-02 08:00:00',
                 end_time: '2017-07-02 16:00:00')

patient = Patient.create(first_name: 'Smok', last_name: 'Wawelski', email: 'smok@gmail.com',
                         phone: '43986231234')

Visit.create(doctor_id: doctor.id, patient_id: patient.id, office_id: office.id,
             start_time: '2017-07-02 12:00:00', end_time: '2017-07-02 13:00:00')