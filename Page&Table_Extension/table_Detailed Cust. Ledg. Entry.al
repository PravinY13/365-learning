tableextension 50106 DEtailCustExtension extends "Detailed Cust. Ledg. Entry"
{
    fields
    {

        field(50100; Name1; text[30])
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