page 50104 "chicken list"
{
    ApplicationArea = All;
    Caption = 'chicken list';
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "chicken type";
    // CardPageId = 
    Editable = false;


    layout
    {
        area(content)
        {
            repeater(General)
            {




                // field("chicken type code"; Rec."chicken type code")
                // {
                //     ToolTip = 'Specifies the value of the chicken type code field.';
                // }
                // field(Description; Rec.Description)
                // {
                //     ToolTip = 'Specifies the value of the Description field.';
                // }
                // field("Last Modified Date"; Rec."Last Modified Date")
                // {
                //     ToolTip = 'Specifies the value of the Last Modified Date field.';
                // }
                // field("NO."; Rec."NO.")
                // {
                //     ToolTip = 'Specifies the value of the NO. field.';
                // }
                // field(picture; Rec.picture)
                // {
                //     ToolTip = 'Specifies the value of the picture field.';
                // }

                // field("number of EGG Produced"; rec."number of EGG Produced")
                // {
                //     ApplicationArea = All;

                // }

                field("chicken type description"; Rec."chicken type description")
                {
                    ToolTip = 'Specifies the value of the chicken type Description field.';
                }
                field("Code:"; Rec."Code:")
                {
                    ToolTip = 'Specifies the value of the Code: field.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }
}
