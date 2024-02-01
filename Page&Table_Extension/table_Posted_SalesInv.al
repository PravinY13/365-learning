tableextension 50111 PostedSalesInvExtension extends "Sales Invoice Line"
{
    fields
    {
        field(50101; Name; Text[20])
        {
            Caption = 'Name1';
            DataClassification = ToBeClassified;
        }
        // Add changes to table fields here
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;
}