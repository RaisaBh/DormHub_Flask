from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db

# Resident Director Blueprints
    # Route 1(check): /WeeklySchedule → Post
    # Route 2(check): /Residents → Post
    # Route 3(check): /WeeklySchedule/{ra_id}/{start_time} → Put
    # Route 4(check): /Residents/{student_id}/{ra_id} → Put
    # Route 5: /WeeklySchedule/{ra_id} → Delete
    # Route 6: /Residents/{student_id} → Delete
    # Route 7(check): /WeeklySchedule//getStartTimes → Get
    # Route 8(check): /getResidentYears → Get

resident_director = Blueprint('resident_director', __name__)
# Adds a new shift to the weekly schedule 
@resident_director.route('/weekly_schedule', methods=['POST'])
def add_new_shift():
    #access json data from request object
    current_app.logger.info('Processing form data')
    req_data = request.get_json()
    current_app.logger.info(req_data)

    ra_days = req_data['days_on_shift']
    ra_start = req_data['start_time']
    ra_end = req_data['end_time']
    ra_id = req_data['ra_id']

    #construct the insert statement 
    query = 'INSERT INTO WeeklySchedule(days_on_shift, start_time, end_time, ra_id) VALUES ("'
    query += ra_days + '", "'
    query += ra_start + '", "'
    query += ra_end + '", '
    query += str(ra_id) + ')'

    current_app.logger.info(query)

    #execute the query 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    return "Success"

# Adds a new resident to the system 
@resident_director.route('/resident', methods=['POST'])
def add_new_resident():
    #access json data from request object
    current_app.logger.info('Processing form data')
    req_data = request.get_json()
    current_app.logger.info(req_data)

    res_id = req_data['student_id']
    res_rd = req_data['rd_id']
    res_ra = req_data['ra_id']
    res_email = req_data['email']
    res_year = req_data['year']
    res_semester = req_data['semester']
    res_last = req_data['last_name']
    res_middle = req_data['middle_name']
    res_first = req_data['first_name']
    res_floor = req_data['floor']
    res_building = req_data['building_number']
    res_room = req_data['room_number']
    res_phone = req_data['phone_number']
    res_add = req_data['perm_address']

    #construct the insert statement 
    query = 'INSERT INTO Residents(student_id, rd_id, ra_id, email, year, semester, last_name, middle_name, first_name, floor, building_number, room_number, phone_number, perm_address) VALUES ('
    query += str(res_id) + ', '
    query += str(res_rd) + ', '
    query += str(res_ra) + ', "'
    query += res_email + '", '
    query += str(res_year) + ', "'
    query += res_semester + '", "'
    query += res_last + '", "'
    query += res_middle + '", "'
    query += res_first + '", '
    query += str(res_floor) + ', '
    query += str(res_building) + ', '
    query += str(res_room) + ', "'
    query += res_phone + '", "'
    query += res_add + '")'

    current_app.logger.info(query)

    #execute the query 
    cursor = db.get_db().cursor()
    cursor.execute(query)
    db.get_db().commit()
    return "Success"

# Update the start time for an RD
@resident_director.route('/WeeklySchedule/', methods=['PUT'])
def update_start_time():
    cursor = db.get_db().cursor()

    ra_id = request.args.get('ra_id')
    start_time = request.args.get('start_time')


    query = '''
        UPDATE WeeklySchedule
        SET start_time = ''' +  start_time + ''' WHERE ra_id = ''' + ra_id
    cursor.execute(query)

    db.get_db().commit()

    return 'Success'

#updates the ra for a given student
@resident_director.route('/Residents/', methods=['PUT'])
def update_ra():
    cursor = db.get_db().cursor()

    student_id = request.args.get('student_id')
    ra_id = request.args.get('ra_id')


    query = '''
        UPDATE Residents
        SET ra_id = ''' +  ra_id + ''' WHERE student_id = ''' + student_id
    cursor.execute(query)

    db.get_db().commit()

    return 'Success'

# #deletes the ra for a given weekly schedule
# @resident_director.route('/WeeklySchedule/deleteRA', methods=['DELETE'])
# def delete_ra():
#     cursor = db.get_db().cursor()
#     ra_id = request.args.get('ra_id')

#     cursor.execute('DELETE FROM WeeklySchedule WHERE ra_id = ' + ra_id)

#     db.get_db().commit()

#     return 'Success'

# #deletes the a shift from the weekly schedule (ex. they cant show up at that time any more)
# @resident_director.route('/WeeklySchedule/deleteShift', methods=['DELETE'])
# def delete_student():
#     cursor = db.get_db().cursor()

#     ra_id = request.args.get('ra_id')

#     cursor.execute('DELETE FROM Residents where ra_id = ' + ra_id)

#     db.get_db().commit()

#     return 'Success'

#deletes the an event 
@resident_director.route('/Attend/delete', methods=['DELETE'])
def delete_event():
    cursor = db.get_db().cursor()

    event_id = request.args.get('event_id')
    student_id = request.args.get('student_id')

    cursor.execute('DELETE FROM Attend where event_id = ' + str(event_id) + ' AND student_id = ' + str(student_id))

    db.get_db().commit()

    return 'Success'

#Get all the start times for a resident director 
@resident_director.route('/getStartTimes', methods=['GET'])
def get_start_times():
    
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('SELECT ra_id, start_time FROM WeeklySchedule')

    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get all the years for Residents
@resident_director.route('/getResidentYears', methods=['GET'])
def get_resident_years():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('SELECT student_id, ra_id, year FROM Residents')

    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response