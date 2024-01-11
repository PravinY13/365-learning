table 50100 "Chicken_Table"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "NO."; Code[20])
        {
            DataClassification = ToBeClassified;
        }

        field(2; Description; text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(3; "chicken type code"; code[20])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "chicken type";
            Caption = 'chicken type code';

            // trigger OnValidate()


            // begin
            //     CalcFields("chicken type description");
            // end;
        }


        field(4; "Last Modified Date"; Date)
        {
            DataClassification = ToBeClassified;
        }

        field(5; picture; MediaSet)
        {
            DataClassification = ToBeClassified;
        }

        field(6; "Chicken Type Description"; text[100])
        {
            // fieldClass = flowfield;
            // editable = false;
        }

        field(7; "number of EGG Produced"; Decimal)
        {

            caption = 'Number of Egg produced';
            fieldClass = FLowfield;
            Editable = false;
            calcformula = sum("Egg production line table".quantity
                            where(
                                 "Chicken No" = field("NO."),
                                 "Egg production date" = field("date filter"),
                                 "egg type code" = field("Egg type filter")
                            )
                            );


        }

        field(8; "date filter"; Date)
        {
            Caption = 'Date Filter';
            FieldClass = FlowField;
        }


        field(9; "Egg type filter"; code[20])
        {
            Caption = 'Egg type Filter';
            // FieldClass = FlowField;
            TableRelation = "Egg type";


        }










    }

    keys
    {
        key(pk; "NO.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "chicken type code", Description)
        {
        }

        fieldgroup(Brick; Description, picture)
        {
        }




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