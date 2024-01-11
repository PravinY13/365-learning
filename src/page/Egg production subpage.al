page 50107 "egg production subpage"
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Egg production line table";
    AutoSplitKey = false;

    layout
    {
        area(Content)
        {
            repeater(general)
            {
                field("Chicken No."; rec."Chicken No")
                {
                    ApplicationArea = All;

                }

                field("Chicken Description"; rec."chicken descrption")
                {
                    ApplicationArea = All;
                }

                field("Egg production Date"; rec."Egg production date")
                {
                    ApplicationArea = All;
                }

                field("Egg type code"; rec."egg type code")
                {
                    ApplicationArea = All;
                }

                field("Quantity"; rec.quantity)
                {
                    ApplicationArea = All;
                }








            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }

    var
        myInt: Integer;
}