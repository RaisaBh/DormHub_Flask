# CS3200 DormHub Project

## This repo contains a boilerplate setup for spinning up 3 Docker containers: 
1. A MySQL 8 container for obvious reasons
1. A Python Flask container to implement a REST API
1. A Local AppSmith Server

## Setup and start the containers
1. Clone this repository.  
2. Create a file named `db_root_password.txt` in the `secrets/` folder and put inside of it the root password for MySQL. 
3. Create a file named `db_password.txt` in the `secrets/` folder and put inside of it the password you want to use for the a non-root user named webapp. 
4. In a terminal or command prompt, navigate to the folder with the `docker-compose.yml` file.  
5. Build the images with `docker compose build`
6. Start the containers with `docker compose up`.  To run in detached mode, run `docker compose up -d`. 

### Resident Blueprint
1. /ResidentInterests → Post
2. /SpotifyPlaylist → Post
3. /Calendar/{event}/{student_id}/{location} → Put
4. /SpotifyPlaylist/{student_id} → Get
5. /Calendar/{event}/{student_id}/{date} → Delete 
6. /ResidentMajor/{student_id} → Delete
7. /ResidentInterests/{student_id} → Get
8. /SpotifyPlaylist/{artist} → Get
9. /resident_all_interests → Get
10. all_spotifyPlaylist → Get
  
### Resident Director Blueprint
1. /WeeklySchedule → Post
2. /Residents → Post
3. /WeeklySchedule/{ra_id}/{start_time} → Put
4. /Residents/{student_id}/{ra_id} → Put
5. /Attend/delete → Delete
6. /getStudents/<event_id> → Get
7. /WeeklySchedule//getStartTimes → Get
8. /getResidentYears → Get
  



