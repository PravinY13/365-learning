tableextension 50103 CustLegExtension extends "Cust. Ledger Entry"
{
    fields
    {
        field(50100; Name1; text[100])
        {
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