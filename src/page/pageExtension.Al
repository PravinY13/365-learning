pageextension 50100 MyPageExtension extends "Posted Sales Invoice"
{



    actions
    {


        // Add changes to page actions here
        addafter("&Invoice")
        {


            action("My Actions")
            {

                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = all;
                Image = action;

                RunObject = report 50103;
                trigger OnAction()
                var
                    saleinvoiceheader: Record "Sales Invoice Header";
                begin
                    saleinvoiceheader.SetRange("No.", rec."No.");
                    saleinvoiceheader.SetRange("Bill-to Customer No.", rec."Bill-to Customer No.");
                    saleinvoiceheader.SetRange("Sell-to Customer No.", rec."Sell-to Customer No.");
                    saleinvoiceheader.SetRange("No. Printed", rec."No. Printed");
                    if saleinvoiceheader.FindFirst() then
                        Report.RunModal(Report::"Sales__Invoice Report", true, true, saleinvoiceheader);

                end;
            }
        }
    }

    var
        myInt: Integer;
}