tableextension 50101 saleslineExtension extends "Sales Line"
{
    fields
    {
        field(50101; Name; Text[20])
        {
            Caption = 'Name';
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