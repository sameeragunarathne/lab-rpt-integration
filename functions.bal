# Retrieves a subject by patient ID
#
# + patientId - The patient ID to search for
# + return - Subject record if found, error if not found or on database error
public isolated function getSubjectByPatientId(string patientId) returns Subject|error {
    Subject|error result = dbClient->queryRow(
        sqlQuery = `SELECT * FROM Subject WHERE patient_id=${patientId}`
    );
    if result is error {
        return error("Failed to retrieve subject");
    }
    return result;
}

# Retrieves all subjects from the database
#
# + return - Array of Subject records or error
public isolated function getAllSubjects() returns Subject[]|error {
    Subject[] subjects = [];
    stream<Subject, error?> resultStream = dbClient->query(
        sqlQuery = `SELECT * FROM Subject`
    );
    check from Subject subject in resultStream
        do {
            subjects.push(subject);
        };
    check resultStream.close();
    return subjects;
}