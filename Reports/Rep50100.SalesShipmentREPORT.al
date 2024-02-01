report 50100 "Sales Shipment REPORT"
{

    ApplicationArea = All;
    Caption = 'Sales shipment report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = '.Sales shipment report.rdl';
    PreviewMode = PrintLayout;


    dataset
    {
        dataitem(SalesShipmentHeader; "Sales Shipment Header")
        {

            column(GSTNumber; customerGST."Registration Number") { }


            column(compinfo; compinfo.Name)
            {
            }

            column(adddress; compinfo.Address) { }
            column(PhoneNo; compinfo."Phone No.") { }
            column(Email; compinfo."E-Mail") { }
            column(VAT_Registration_No_; compinfo."VAT Registration No.") { }
            column(Company_Bank_Account_Code; compinfo."Bank Account No.") { }
            column(bank; compinfo."Bank Name") { }



            column(BilltoName; "Bill-to Name")
            {
            }
            column(SelltoCustomerName; "Sell-to Customer Name")
            {
            }
            column(ShiptoName; "Ship-to Name")
            {
            }
            column(ShiptoAddress; "Ship-to Address")
            {
            }
            column(ShiptoCity; "Ship-to City")
            {
            }
            column(ShiptoCounty; "Ship-to County")
            {
            }
            column(DocumentDate; "Document Date")
            {
            }

            column(ShipmentNumber; "No.")
            {
            }
            column(cmpname; '')
            {

            }





            dataitem("Sales Shipment Line"; "Sales Shipment Line")
            {

                DataItemLinkReference = SalesShipmentHeader;
                DataItemLink = "Document No." = field("No.");
                column(No_; "No.")
                {

                }

                column(Description; Description)
                {

                }

                column(Quantity__Base_; "Quantity (Base)")
                {

                }

                column(Unit_of_Measure; "Unit of Measure")
                {

                }



            }


            trigger OnPreDataItem()
            begin
                compinfo.get();

            end;

            trigger OnAfterGetRecord()
            var
                customerGST: Record customer;
                registrationNo: Code[50];
            begin
                // customerGST.SetRange("No."; );

                // if customerGST.FindFirst() then begin
                //     Record."No." := customerGST.
                // end;



                // if customerGST.get(SalesShipmentHeader."Bill-to Customer No.") then begin
                //     registrationNo := customerGST."Registration Number";
                // end;


            end;
        }


    }


    trigger OnInitReport()
    var
        myInt: Integer;
    begin
        // compinfo.get()

    end;

    var
        compinfo: Record "Company Information";

    var

        customerGST: Record "Customer";
}
