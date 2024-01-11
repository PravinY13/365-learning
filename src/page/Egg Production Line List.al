page 50110 "Egg production Line List"
{
    PageType = List;
    Editable = false;
    // ApplicationArea = All;
    UsageCategory = None;
    SourceTable = "Egg production line table";

    layout
    {
        area(Content)
        {
            repeater(general)
            {


                field("chicken descrption"; Rec."chicken descrption")
                {
                    ToolTip = 'Specifies the value of the chicken descrption field.';
                }
                field("Chicken No"; Rec."Chicken No")
                {
                    ToolTip = 'Specifies the value of the Chicken No field.';
                }
                field("Document no."; Rec."Document no.")
                {
                    ToolTip = 'Specifies the value of the Document no. field.';
                }
                field("Egg production date"; Rec."Egg production date")
                {
                    ToolTip = 'Specifies the value of the Egg production date field.';
                }
                field("egg type code"; Rec."egg type code")
                {
                    ToolTip = 'Specifies the value of the egg type code field.';
                }
                field(quantity; Rec.quantity)
                {
                    ToolTip = 'Specifies the value of the quantity field.';
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