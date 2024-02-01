page 50113 ActionPage
{
    PageType = Card;

    actions
    {
        // Adds the action called "My Actions" to the Action menu 
        area(Processing)
        {
            action("My Actions")
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    Message('Hello World');
                end;
            }
        }

        area(Creation)
        {
            // Adds the action "My New document" to the New Document group in the Actions menu. 
            action("My New document")
            {
                ApplicationArea = All;
                RunObject = page "Customer Card";
                Image = "1099Form";
            }
        }

        area(Navigation)
        {
            // Adds the action called "My Navigate" to the Navigate menu. 
            action("My Navigate")
            {
                ApplicationArea = All;
                RunObject = page "Customer Card";
            }
        }

        area(Reporting)
        {
            // Adds a submenu called "My Label" to the Report menu. 
            group(NewSubGroup)
            {
                Caption = 'My label';
                group(MyGroup)
                {
                    // Adds the action "My Report" to the My Label submenu. 
                    // action("My Report")
                    // {
                    //     ApplicationArea = All;
                    //     RunObject = report ;
                    // }
                }
            }
        }
    }
}