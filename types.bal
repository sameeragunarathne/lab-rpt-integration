
type Author record {|
    string org?;
    string name?;
|};

type Validator record {|
    string org?;
    string name?;
    string date?;
|};

type Authenticator record {|
    string org?;
    string name?;
    string signature?;
|};

type Order record {|
    string reason?;
    string order_date?;
|};

type LabReportDAO record {|
    int id;
    string document_id;
    string report_status?;
    string report_date;
    string report_title?;
    string report_version?;
    string patient_id;
    string patient_name?;
    string patient_dob?;
    string patient_gender?;
    string insurance_name?;
    string policy_number?;
    string recipient_name?;
    string recipient_org?;
    json authors?;
    json validators?;
    json authenticators?;
    json orders?;
|};

type LabReport record {|
    int id;
    string document_id;
    string report_status?;
    string report_date;
    string report_title?;
    string report_version?;
    string patient_id;
    string patient_name?;
    string patient_dob?;
    string patient_gender?;
    string insurance_name?;
    string policy_number?;
    string recipient_name?;
    string recipient_org?;
    Author[] authors?;
    Validator[] validators?;
    Authenticator[] authenticators?;
    Order[] orders?;
|};