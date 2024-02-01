tableextension 50113 GJLExtension extends "Gen. Journal Line"
{
    fields
    {
        field(50100; name; text[100])
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