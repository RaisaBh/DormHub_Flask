from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

residents = Blueprint('residents', __name__)

# residents Blueprint
    # Route 1: /ResidentInterests → Post
    # Route 2: /SpotifyPlaylist → Post
    # Route 3: /Calendar/{event}/{student_id}/{location} → Put
    # Route 4: /SpotifyPlaylist/{student_id} → Get
    # Route 5: /Calendar/{event}/{student_id}/{date} → Delete 
    # Route 6: /ResidentMajor/{student_id} → Delete
    # Route 7: /ResidentInterests/{student_id} → Get
    # Route 8: /SpotifyPlaylist/{artist} → Get

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
@residents.route('/Calendar/<student_id>/<location>', methods=['PUT'])
def update_event_location(student_id, location):

    cursor = db.get_db().cursor()

    query = '''
        UPDATE Calendar
        SET location = ''
        WHERE ra_id = {0}
    '''.format(student_id, location)

    cursor.execute(query)

# Route4-Get: Get all of the songs added by the given student as to see what their taste is like
@residents.route('/SpotifyPlaylist/<student_id>', methods=['GET'])
def get_songs(student_id):
    cursor = db.get_db().cursor()
    cursor.execute('select * from SpotifyPlaylist where id = {0}'.format(student_id))
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
@residents.route('/Calendar/<student_id>/<date>', methods=['DELETE'])
def delete_event(student_id):
    cursor = db.get_db().cursor()
    query = '''
        DELETE FROM Calendar
        WHERE student_id = {0}
    '''.format(student_id)
    cursor.execute(query)