table 50102 "Egg type"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code:"; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Pk; "Code:")
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