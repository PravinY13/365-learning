page 50102 "chicken type"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Chicken Type";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {

                field("chicken type description"; Rec."chicken type description")
                {
                    ToolTip = 'Specifies the value of the chicken type Description field.';
                }
                field("Code:"; Rec."Code:")
                {
                    ToolTip = 'Specifies the value of the Code: field.';
                    trigger OnValidate()
                    var
                        cicken: Record Chicken_Table;

                    begin
                        // cicken.Reset();
                        // cicken.SetRange("NO.", rec."Code:");

                        // if cicken.FindFirst() then begin
                        //     rec.Description := cicken.Description;
                        // end;
                        if cicken.get(rec."Code:") then begin
                            rec.Description := cicken.Description;
                        end;
                    end;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
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