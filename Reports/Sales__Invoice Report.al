report 50103 "Sales__Invoice Report"
{
    Caption = 'Sales Invoice Report';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = 'SalesReportNew.rdl';


    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            RequestFilterFields = "No.", "Bill-to Customer No.", "Sell-to Customer No.", "No. Printed";


            // Company Information Columns
            column(Picture; compInfo.Picture) { }
            column(name; compInfo.Name) { }
            column(Address; compInfo.Address) { }
            column(Address2; compInfo."Address 2") { }
            column(city; compInfo.City) { }
            column(PAN_NO; compInfo."P.A.N. No.") { }
            column(GST_No; compInfo."GST Registration No.") { }
            column(State; compInfo."State Code") { }

            column(Invoice_Disc__Code; "Invoice Disc. Code") { }
            column(Date; "Order Date") { }
            column(PURCHASE_ORDER_REF_NO; '') { }
            column(Email; compInfo."E-Mail") { }
            column(Salesperson_Code; "Salesperson Code") { }


            //Bank details
            column(BENEFICIARY_NAME; '') { }
            column(bank_name; BanKName) { }
            column(accountNo; BankAccNo) { }
            column(IFSC_CODE; ifcbank) { }
            column(BRANCH_NAME; compInfo."Bank Branch No.") { }


            //Customer Information Columns
            column(comp_Name; CompanyName) { }
            column(Doc_Name; '') { }
            column(Bill_to_Address; "Bill-to Address") { }
            column(Ship_to_Address; "Ship-to Address") { }
            column(State_; State) { }
            column(GstNo; "Ship-to GST Reg. No.") { }
            column(PanNo_; '') { }
            column(Email_; "Sell-to E-Mail") { }
            column(Sell_to_Contact; "Sell-to Phone No.") { }
            column(Person_name; '') { }
            column(Credit_Period; "Payment Terms Code") { }
            column(Due_Date; "Due Date") { }



            //Line Table Columns
            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {

                DataItemLinkReference = "Sales Invoice Header";
                DataItemLink = "Document No." = field("No.");
                RequestFilterFields = "Document No.";


                column(Sr_No; "No.") { }
                column(description; Description) { }
                column(Quantity; Quantity) { }
                column(batch_no; '') { }
                column(Exp_Date; '') { }
                column(MRP; "Unit Price") { }
                column(Disc_percentage; "Line Discount %") { }
                column(Line_Discount_Amount; "Line Discount Amount") { }
                column(netPrice; netPrice) { }
                column(netValue; netValue) { }
                column(Net; Net) { }
                column(Total_IGST; Total_IGST) { }
                column(TTaxVal; TTaxVal) { }
                column(tOTALBILLINGVALUE; tOTALBILLINGVALUE) { }






                //GST CALCULATION
                column(CGSTAmt; CGSTAmt) { }
                column(CGSTRate; CGSTRate) { }
                column(SGSTAmt; SGSTAmt) { }
                column(SGSTRate; SGSTRate) { }
                column(IGSTAmt; IGSTAmt) { }
                column(IGSTRate; IGSTRate) { }
                column(amountsInWords; amountsInWords) { }

                // column(TGST; TGST) { }

                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    CLEAR(CGSTRate);

                    CLEAR(CGSTAmt);

                    CLEAR(GSTComponentCGST);

                    CLEAR(SGSTRate);

                    CLEAR(SGSTAmt);

                    CLEAR(GSTComponentSGST);

                    CLEAR(IGSTRate);

                    CLEAR(IGSTAmt);

                    CLEAR(GSTComponentIGST);

                    GSTDetailLeger.RESET;


                    GSTDetailLeger.SETRANGE(GSTDetailLeger."Document No.", "Sales Invoice Line"."Document No.");

                    GSTDetailLeger.SETRANGE(GSTDetailLeger."No.", "Sales Invoice Line"."No.");

                    GSTDetailLeger.SETRANGE(GSTDetailLeger."Document Line No.", "Sales Invoice Line"."Line No.");

                    IF GSTDetailLeger.FINDSET THEN
                        REPEAT

                            IF GSTDetailLeger."GST Component Code" = 'CGST' THEN BEGIN

                                GSTComponentCGST := 'CGST';

                                CGSTRate := GSTDetailLeger."GST %";

                                CGSTAmt := ABS(GSTDetailLeger."GST Amount");

                            END ELSE

                                IF GSTDetailLeger."GST Component Code" = 'SGST' THEN BEGIN

                                    GSTComponentSGST := 'SGST';

                                    SGSTRate := GSTDetailLeger."GST %";

                                    SGSTAmt := ABS(GSTDetailLeger."GST Amount");

                                END ELSE

                                    IF GSTDetailLeger."GST Component Code" = 'IGST' THEN BEGIN

                                        GSTComponentIGST := 'IGST';

                                        IGSTRate := GSTDetailLeger."GST %";

                                        IGSTAmt := ABS(GSTDetailLeger."GST Amount");

                                    END;

                        UNTIL GSTDetailLeger.NEXT = 0;

                    TGST += SGSTAmt + CGSTAmt + IGSTAmt;
                    // netPrice := "Line Amount";
                    // netValue += netPrice + TGST;
                    tOTALBILLINGVALUE += "Sales Invoice Line".Quantity * "Sales Invoice Line"."Unit Price" + SGSTAmt + CGSTAmt + IGSTAmt;
                    Repcheck.InitTextVariable();
                    Repcheck.FormatNoText(WordsInArry, tOTALBILLINGVALUE, ' ');
                    amountsInWords := WordsInArry[1] + WordsInArry[2];

                end;

                //=Sum(Fields!Quantity.Value*Fields!MRP.Value+Fields!CGSTAmt.Value+Fields!SGSTAmt.Value+Fields!IGSTAmt.Value)



            }
            trigger OnAfterGetRecord()
            begin
                bankaccaount.Reset();
                bankaccaount.SetRange("No.", "Sales Invoice Header"."Company Bank Account Code");
                if bankaccaount.FindFirst() then begin
                    BankName := bankaccaount.Name;
                    BankAccNo := bankaccaount."No.";
                    ifcbank := bankaccaount."IFSC Code";
                end;
            end;





            trigger OnPreDataItem()
            var

            begin
                compInfo.get();
                compInfo.CalcFields(Picture);

            end;
        }




    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)


                {
                    field(Banko; BankAccNo)

                    {
                        TableRelation = "Bank Account"."No.";
                        ApplicationArea = All;

                    }




                    // field(BRANCH_NAME; BankName)
                    // {
                    //     TableRelation = "Bank Account";
                    //     ApplicationArea = All;

                    //     trigger OnValidate()
                    //     var
                    //         bankaccaount: Record "Bank Account";
                    //     begin
                    //         bankaccaount.Reset();
                    //         bankaccaount.SetRange("No.", "Sales Invoice Header"."Bal. Account No.");
                    //         if bankaccaount.FindFirst() then begin
                    //             BankName := bankaccaount.Name;
                    //         end;
                    //     end;
                    // }





                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }



    var


        bankDetail: Record "Bank Account";


        myInt: Integer;
        compInfo: Record "Company Information";
        Amount: Decimal;
        netPrice: decimal;
        Net: Decimal;
        netValue: Decimal;
        Repcheck: Report Check;
        WordsInArry: Array[2] of Text;
        amountsInWords: text[250];

        GSTDetailLeger: Record "Detailed GST Ledger Entry";
        CGSTRate: Decimal;
        CGSTAmt: Decimal;
        GSTComponentCGST: Code[20];
        SGSTRate: Decimal;
        SGSTAmt: Decimal;
        GSTComponentSGST: Code[20];
        IGSTRate: Decimal;
        IGSTAmt: Decimal;
        GSTComponentIGST: Code[20];
        Total_IGST: Decimal;
        TTaxVal: Decimal;
        TGST: Decimal;
        tOTALBILLINGVALUE: Decimal;
        BankAccNo: Code[50];
        BankName: Text[100];
        bankaccaount: Record "Bank Account";
        ifcbank: Code[20];

}