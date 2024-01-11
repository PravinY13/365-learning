#pragma warning disable DOC0101
page 50100 "Chicken card"
#pragma warning restore DOC0101
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Chicken_Table";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("chicken type code"; Rec."chicken type code")
                {
                    ToolTip = 'Specifies the value of the chicken type code field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Last Modified Date"; Rec."Last Modified Date")
                {
                    ToolTip = 'Specifies the value of the Last Modified Date field.';
                }
                field("NO."; Rec."NO.")
                {
                    ToolTip = 'Specifies the value of the NO. field.';
                }
                field(picture; Rec.picture)
                {
                    ToolTip = 'Specifies the value of the picture field.';
                }

                field("Chicken Type Description"; rec."Chicken Type Description")
                {
                    ToolTip = 'Specifies the value of the picture field.';
                }

                field("number of EGG Produced"; rec."number of EGG Produced")
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