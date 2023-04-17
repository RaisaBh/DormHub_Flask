from flask import Blueprint, request, jsonify, make_response, current_app
import json
from src import db


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

# Get all the products from the database
@resident_director.route('/resident_director', methods=['GET'])
def get_products():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('SELECT id, product_code, product_name, list_price FROM products')

    # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)

# get the top 5 products from the database
@resident_director.route('/mostExpensive')
def get_most_pop_products():
    cursor = db.get_db().cursor()
    query = '''
        SELECT product_code, product_name, list_price, reorder_level
        FROM products
        ORDER BY list_price DESC
        LIMIT 5
    '''
    cursor.execute(query)
       # grab the column headers from the returned data
    column_headers = [x[0] for x in cursor.description]

    # create an empty dictionary object to use in 
    # putting column headers together with data
    json_data = []

    # fetch all the data from the cursor
    theData = cursor.fetchall()

    # for each of the rows, zip the data elements together with
    # the column headers. 
    for row in theData:
        json_data.append(dict(zip(column_headers, row)))

    return jsonify(json_data)


# Update the start time for an RD
@resident_director.route('/WeeklySchedule/<ra_id>/<start_time>', methods=['PUT'])
def update_start_time(ra_id, start_time):
    cursor = db.get_db().cursor()
    # {0}'.format(userID)
    query = '''
        UPDATE WeeklySchedule
        SET start_time = {0}
        WHERE ra_id = {0}
    '''.format(ra_id, start_time)
    cursor.execute(query)

    db.get_db().commit()

    return 'Success'

#updates the ra for a given student
@resident_director.route('/Residents/<student_id>/<ra_id>', methods=['PUT'])
def update_ra(student_id, ra_id):
    cursor = db.get_db().cursor()
    query = '''
        UPDATE Residents
        SET ra_id = {0}
        WHERE student_id = {0}
    '''.format(ra_id, student_id)
    cursor.execute(query)

    db.get_db().commit()

    return 'Success'

#deletes the ra for a given weekly schedule
@resident_director.route('/WeeklySchedule/<ra_id>', methods=['DELETE'])
def update_ra(ra_id):
    cursor = db.get_db().cursor()
    query = '''
        DELETE FROM WeeklySchedule
        WHERE ra_id = {0}
    '''.format(ra_id)
    cursor.execute(query)

    db.get_db().commit()

    return 'Success'

#deletes the a student from the residents (they might move out for ex.)
@resident_director.route('/Residents/<student_id>', methods=['DELETE'])
def update_ra(student_id):
    cursor = db.get_db().cursor()
    query = '''
        DELETE FROM Residents
        WHERE student_id = {0}
    '''.format(student_id)
    cursor.execute(query)

    db.get_db().commit()

    return 'Success'

#Get all the start times for a resident director 
@resident_director.route('/getStartTimes', methods=['GET'])
def get_products():
    
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('SELECT start_time FROM WeeklySchedule')

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
def get_products():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('SELECT year FROM Residents')

    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response