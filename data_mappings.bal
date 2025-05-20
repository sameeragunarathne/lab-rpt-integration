import wso2healthcare/health.fhir.r4.labreport_eu;

isolated function mapLabReportToDiagnosticReport(LabReport labReport) returns labreport_eu:DiagnosticReportLabEu => {
    extension: [],
    code: {
        coding: [
            {
                system: "http://loinc.org",
                code: "11502-2",
                display: "Laboratory report"
            }
        ]
    },
    subject: {
        reference: string `Patient/${labReport.patient_id}`,
        display: labReport.patient_name
    },
    status: labReport.report_status != () ? <string>labReport.report_status : "unknown",
    basedOn: [
        {
            display: labReport.insurance_name
        }
    ],
    performer: from var authorsItem in labReport.authors ?: []
        select {
            display: authorsItem.name,
            reference: authorsItem.org

        },
    effectivePeriod: {
        'start: labReport.report_date
    },
    identifier: [
        {
            id: labReport.document_id
        }
    ],
    id: labReport.id.toString()
};

isolated function mapSubjectToPatient(Subject subject) returns labreport_eu:PatientEuLab => {

    name: [
        {
            text: subject.name
        }
    ],
    birthDate: subject.birth_date != () ? <string>subject.birth_date : "",
    id: subject.patient_id.toString(),
    identifier: [
        {
            value: subject.patient_id

        }
    ],
    gender: subject.gender,
    address: [
        {
            text: subject.address
        }
    ],
    telecom: [
        {
            value: subject.phone,
            use: "mobile"
        }
    ]
};
