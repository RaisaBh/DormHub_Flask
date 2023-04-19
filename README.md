# DormHub
Dormhub is a space for roommates to organize their data. Roommates can have trouble with organizing chores so we are providing a space for them to complete chores, make calendar events, pay any money owed if one of them went grocery shopping, or access fun enhancement like a joined spotify playlist. We would also have resident assistants or resident directors be able to navigate this hub in order to help the roommates with any conflicts they may have, or just to oversee the students if needed in addition to advertising events and such. Residents can use this app not only to get to know their roommate, but also a useful app for RA and RD to organize their schedule.

## User Personas
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
  



