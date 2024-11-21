table 50100 AOAISetupTab
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; Endpoint; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3; Deployment; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4; APIKey; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}