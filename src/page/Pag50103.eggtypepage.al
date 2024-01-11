page 50103 "egg type page"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Egg type";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("chicken type code"; Rec."Code:")
                {
                    ApplicationArea = All;

                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = all;

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
                RunObject = page "Sales Order";

                trigger OnAction()
                begin


                end;
            }
        }
    }

    var
        myInt: Integer;
}