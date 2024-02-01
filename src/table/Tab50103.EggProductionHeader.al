table 50103 "Egg Production Header"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(2; "NDocument Date"; Date)
        {
            DataClassification = ToBeClassified;
        }


    }

    keys
    {
        key(pk; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        // Add changes to field groups here
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}