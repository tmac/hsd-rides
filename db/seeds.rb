# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Appears to be some issues running the queue when invoked from seeds.rb
# https://github.com/rails/rails/issues/35812
ActiveJob::Base.queue_adapter = :inline

rides = 
  [['2014 Clemens Road, Oakland CA 94602', '1643 Oxford Street, Berkeley CA 94709'],
  ['28250 Dickens Avenue, Hayward CA 94544', '6244 Sun River Drive, Sacramento CA 95824'],
  ['4329 Howe Street, Oakland CA 94611', '1532 Milvia Street, Berkeley CA 94709'],
  ['35805 Alcazar Court, Fremont CA 94536','514 Flower Lane, Alameda CA 94502'],
  ['441 Merritt Avenue, Oakland CA 94610','2134 West Mills Drive, Orange CA 92868'],
  ['1300 Lemos Lane, Fremont CA 94539','31 Yosemite Avenue, Oakland CA 94611'],
  ['928 Wright Avenue, Mountain View CA 94043','19 Heritage, Oakland CA 94605'],
  ['1209 Parker Street, Berkeley CA 94702','6452 El Camino Real, Atascadero CA 93422'],
  ['649 Praderia Circle, Fremont CA 94539','4770 Balboa Way, Fremont CA 94536'],
  ['42223 Edgewood Street, Fremont CA 94538','4920 Quonset Drive, Sacramento CA 95820'],
  ['612 E Street, Marysville CA 95901','12156 Oslo Drive, Truckee CA 96161'],
  ['6716 South Mariposa Lane, Dublin CA 94568','9036 Calico Court, Hesperia CA 92344'],
  ['654 Laurette Place, Hayward CA 94544','152 Teddy Drive, Union City CA 94587'],
  ['46710 Crawford Street, Fremont CA 94539','840 Inglewood Drive, West Sacramento CA 95605'],
  ['619 Colusa Avenue, Berkeley CA 94707','3388 Thomasson Lane, Fairfield CA 94534'],
  ['4971 Janet Court, Livermore CA 94550','11150 Sun Valley Drive, Oakland CA 94605'],
  ['330 Michell Court, Livermore CA 94551','1780 142nd Avenue, San Leandro CA 94578'],
  ['1358 Scenic Avenue, Berkeley CA 94708','1736 81st Avenue, Oakland CA 94621'],
  ['2522 Fountain Avenue, South Lake Tahoe CA 96150','210 Beachcomber Drive, Pismo Beach CA 93449'],
  ['2064 West Columbia Way, Hanford CA 93230','2313 Vegas Avenue, Castro Valley CA 94546']]

drivers = 
  ['40902 Ingersoll Terrace, Fremont CA 94538',
  '40700 Penn Lane, Fremont CA 94538',
  '3189 Main Street, Mammoth Lakes CA 93546',
  '512 Tennyson Road, Hayward CA 94544']


rides.each do |ride|
  Ride.create(start_address: ride[0], destination_address: ride[1])
end

drivers.each do |driver|
  Driver.create(home_address: driver)
end

# Some extra addresses 
# '55620 Jolon Road, King City CA 93930',
# '61 Callahan Way, Mammoth Lakes CA 93546',
# '3600 Pennsylvania Avenue, Fremont CA 94536',
# '14524 Lodestar Drive, Grass Valley CA 95949',
# '1076 Foster Street, Alameda CA 94502',
# '21950 Arnold Center Road, Carson CA 90810'
# '43626 Bryant Street, Fremont CA 94539'
# '918 Cheryl Ann Circle, Hayward CA 94544'
# '36360 Beech Place, Newark CA 94560'
# '1870 A Street, Oroville CA 95966'
# '19416 Barclay Road, Castro Valley CA 94546'
# '849 East Victoria Street, Carson CA 90746'
# '6214 Herzog Street, Oakland CA 94608'
# '20375 Wisteria Street, Castro Valley CA 94546'
# '11 Eclipse Court, Alameda CA 94501'
# '101 Mustang Drive, San Luis Obispo CA 93405'
# '2086 Hillside Drive, San Leandro CA 94577'
# '4255 Tanager Common, Fremont CA 94555'
# '2500 Medallion Drive, Union City CA 94587'
# '5938 Laguna Honda Street, Redding CA 96001'
# '90 Via Verde, San Lorenzo CA 94580'
# '1011 San Jose Street, San Leandro CA 94577'
# '5792 Owl Hill Avenue, Santa Rosa CA 95409'
# '4016 Doane Street, Fremont CA 94538'
# '3318 East Woodbine Road, Orange CA 92867'
# '22618 South Figueroa Street, Carson CA 90745'
# '2755 Country Drive, Fremont CA 94536'
# '2732 Humboldt Avenue, Oakland CA 94602'
# '47634 Kato Road, Fremont CA 94538'
# '800 California 116, Sebastopol CA 95472'
# '6100 Bullard Drive, Oakland CA 94611'
# '18789 Crane Avenue, Castro Valley CA 94546'
# '16502 South Main Street, Gardena CA 90248'
# '835 Shiloh Court, Redding CA 96003'
# '4231 Miramonte Way, Union City CA 94587'
# '1222 Arcade Boulevard, Sacramento CA 95815'
# '680 Quintana Road, Morro Bay CA 93442'
# '703 Elizabeth Barcus Way, Fortuna CA 95540'
# '1219 Carleton Street, Berkeley CA 94702'
# '24647 Patricia Court, Hayward CA 94541'
# '39247 Sundale Drive, Fremont CA 94538'
# '5130 Morris Way, Fremont CA 94536'
# '1352 Purdue Street, San Leandro CA 94579'
# '2 Sotelo Avenue, Piedmont CA 94611'
# '7725 Ney Avenue, Oakland CA 94605'
# '4876 Norris Road, Fremont CA 94536'
# '1349 Burkhart Avenue, San Leandro CA 94579'
# '6057 Griffith Avenue, Linda CA 95901'
# '1732 27th Avenue, Oakland CA 94601'
# '732 Kevin Court, Oakland CA 94621'
# '4540 Phyllis Court, Livermore CA 94550'
# '5715 Saint Matthew Drive, Newark CA 94560'
# '16303 Mateo Street, San Leandro CA 94578'
# '3228 Chettenham Drive, Rancho Cordova CA 95670'
# '3819 Vineyard Avenue, Pleasanton CA 94566'
# '465 Humboldt Way, Livermore CA 94551'