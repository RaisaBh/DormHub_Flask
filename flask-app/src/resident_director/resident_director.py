from flask import Blueprint, request, jsonify, make_response
import json
from src import db


resident_director = Blueprint('resident_director', __name__)

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

#deletes the ra for a given weekly schedule
@resident_director.route('/WeeklySchedule/<ra_id>', methods=['DELETE'])
def update_ra(ra_id):
    cursor = db.get_db().cursor()
    query = '''
        DELETE FROM WeeklySchedule
        WHERE ra_id = {0}
    '''.format(ra_id)
    cursor.execute(query)

#deletes the a student from the residents (they might move out for ex.)
@resident_director.route('/Residents/<student_id>', methods=['DELETE'])
def update_ra(student_id):
    cursor = db.get_db().cursor()
    query = '''
        DELETE FROM Residents
        WHERE student_id = {0}
    '''.format(student_id)
    cursor.execute(query)

# Get all the start times for a resident director 
@resident_director.route('/getStartTimes', methods=['GET'])
def get_products():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('SELECT start_time FROM WeeklySchedule')

# Get all the years for Residents
@resident_director.route('/getResidentYears', methods=['GET'])
def get_products():
    # get a cursor object from the database
    cursor = db.get_db().cursor()

    # use cursor to query the database for a list of products
    cursor.execute('SELECT year FROM Residents')