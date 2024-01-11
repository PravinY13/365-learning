table 50101 "Chicken Type"
{

    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Code:"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Chicken_Table."NO.";

        }

        field(2; Description; Text[100])
        {
            DataClassification = ToBeClassified;

        }

        field(3; "chicken type description"; Text[100])
        {
            Caption = 'chicken type Description';
            FieldClass = FlowField;
            CalcFormula = lookup("chicken_table".Description where("NO." = field("code:")));
            Editable = false;

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