tableextension 50102 GLExtension extends "G/L Entry"
{
    fields
    {
        field(50100; Name1; Text[20])
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