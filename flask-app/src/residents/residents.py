from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

residents = Blueprint('residents', __name__)

# residents Blueprint
    # Route 1(check): /ResidentInterests → Post
    # Route 2(check): /SpotifyPlaylist → Post
    # Route 3(check): /Calendar/{event}/{student_id}/{location} → Put
    # Route 4(check): /SpotifyPlaylist/{student_id} → Get
    # Route 5(check): /Calendar/{event}/{student_id}/{date} → Delete 
    # Route 6(check): /ResidentMajor/{student_id} → Delete
    # Route 7(check): /ResidentInterests/{student_id} → Get
    # Route 8(check): /SpotifyPlaylist/{artist} → Get
    # Route 9(check): /resident_all_interests → Get
    # Route 10(check): all_spotifyPlaylist → Get

# Route1-Post: Add a new interest for the given student
@residents.route('/addNewInterest', methods=['POST'])
def add_new_interests():

    # access json data from requested object
    current_app.logger.info('Processing form data')
    req_data = request.get_json()
    current_app.logger.info(req_data)

    stu_id = req_data['student_id']
    interests = req_data['interests']
    cursor = db.get_db().cursor()
    
    # construct the insert statement
    query = 'INSERT INTO ResidentInterests(student_id, interests) VALUES ('
    query += str(stu_id) + ', "'
    query += interests + '")'
    current_app.logger.info(query)

    # execute the query
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return 'Success'

# Route2-Post: Add a new song to the Spotify playlist
@residents.route('/addNewSong', methods=['POST'])
def add_new_songs():

    # access json data from requested object
    current_app.logger.info('Processing form data')
    req_data = request.get_json()
    current_app.logger.info(req_data)

    stu_id = req_data['student_id']
    artist = req_data['artist']
    album = req_data['album']
    genre = req_data['genre']
    song = req_data['song']
    cursor = db.get_db().cursor()
    
    # construct the insert statement
    query = 'INSERT INTO SpotifyPlaylist(student_id, artist, album, genre, song) VALUES ('
    query += str(stu_id) + ', "'
    query += artist + '", "'
    query += album + '", "'
    query += genre + '", "'
    query += song + '")'

    current_app.logger.info(query)

    # execute the query
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()

    return 'Success'

# Route3-Put: for the given student and event combo, update the location
@residents.route('/Calendar/update', methods=['PUT'])
def update_event_location():
    cursor = db.get_db().cursor()

    # access json data from requested object
    current_app.logger.info('Update the info')

    location = request.args.get('location')
    student_id = request.args.get('student_id')
    date = request.args.get('date')
    event = request.args.get('event')

    current_app.logger.info(location)
    current_app.logger.info(student_id)
    current_app.logger.info(date)
    current_app.logger.info(event)

    query = 'UPDATE Calendar SET location = ' + location + ' WHERE student_id = ' + str(student_id) + ' AND date = ' + date + ' AND event = ' + event

    # execute the query
    cursor.execute(query)

    db.get_db().commit()

    return 'Success'

# Route4-Get: Get all of the songs by the given student as to see what their taste is like
@residents.route('/SpotifyPlaylist/<student_id>', methods=['GET'])
def get_songs(student_id):
    cursor = db.get_db().cursor()
    cursor.execute('select * from SpotifyPlaylist where student_id = {0}'.format(student_id))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Route5-Delete: delete the given event that takes place on the given date for the given student
@residents.route('/Calendar/delete', methods=['DELETE'])
def delete_event():
    current_app.logger.info('delete data')
    student_id = request.args.get('student_id')
    date = request.args.get('date')
    event = request.args.get('event')
    current_app.logger.info(student_id)
    current_app.logger.info(date)
    current_app.logger.info(event)
    cursor = db.get_db().cursor()

    query = 'DELETE FROM Calendar WHERE student_id = ' + str(student_id) + ' AND date = ' + date + ' AND event = ' + event
    cursor.execute(query)
    
    current_app.logger.info(query)
    db.get_db().commit()

    return 'Success'

# Route6-Delete: Deletes a given song by the given artist 
@residents.route('/SpotifyPlaylist/delete', methods=['DELETE'])
def delete_song():
    current_app.logger.info('Processing form data')
    song = request.args.get('song')
    artist = request.args.get('artist')
    current_app.logger.info(song)
    current_app.logger.info(artist)

    cursor = db.get_db().cursor()
    cursor.execute('DELETE FROM SpotifyPlaylist where artist = ' + artist + ' AND song = ' + song)
    db.get_db().commit()

    return 'Success'

# Route7-Get: Gets all the interests for a given student
@residents.route('/resident_interests/<student_id>', methods=['GET'])
def get_interests(student_id):
    cursor = db.get_db().cursor()
    cursor.execute('select * from ResidentInterests where student_id = {0}'.format(student_id))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Route8-Get: Gets all the songs by a given artist 
@residents.route('/SpotifyPlaylist/artist', methods=['GET'])
def get_songs_by_artist():
    current_app.logger.info('Processing form data')
    artist = request.args.get('artist')
    current_app.logger.info(artist)

    cursor = db.get_db().cursor()
    cursor.execute('select * from SpotifyPlaylist where artist = ' + artist)
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Route9-Get: Gets all the interests
@residents.route('/resident_all_interests', methods=['GET'])
def get_all_interests():
    cursor = db.get_db().cursor()
    cursor.execute('select * from ResidentInterests')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Route10-Get: Get all of the songs
@residents.route('/all_spotifyPlaylist', methods=['GET'])
def get_all_songs():
    cursor = db.get_db().cursor()
    cursor.execute('select * from SpotifyPlaylist')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response