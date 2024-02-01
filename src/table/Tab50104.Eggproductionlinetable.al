table 50104 "Egg production line table"
{
    DataClassification = ToBeClassified;
    DrillDownPageId = "Egg production Line List";

    fields
    {
        field(1; "Document no."; code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(2; "line no."; integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = chicken_table;
        }


        field(3; "Chicken No"; code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(4; "chicken descrption"; text[100])
        {

            CalcFormula = lookup(Chicken_table.Description where("NO." = Field("Chicken No")));
            editable = false;
            fieldclass = flowField;

        }

        field(5; "Egg production date"; date)
        {
            DataClassification = ToBeClassified;
        }

        field(6; "egg type code"; code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(7; "chicken type descrption"; text[20])
        {
            DataClassification = ToBeClassified;
        }

        field(8; quantity; decimal)
        {
            DataClassification = ToBeClassified;
        }






    }

    keys
    {
        key(pk; "Chicken No", "Document no.", "line no.")
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