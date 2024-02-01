report 50101 "Sales Invoice Report"
{
    ApplicationArea = All;
    Caption = 'Sales Invoice Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Sales Invoice Report.rdl';
    PreviewMode = PrintLayout;



    dataset
    {
        dataitem("Sales Invoice Header"; "Sales Invoice Header")
        {
            column(Invoice_Disc__Code; "Invoice Disc. Code") { }

            column(No_; "No.") { }

            column(Document_Date; "Document Date") { }

            // column(pageNo; " page No.") { }

            column(BilltoName; "Bill-to Name") { }

            column(Sell_to_Customer_Name; "Sell-to Customer Name") { }

            column(Bill_to_Address; "Bill-to Address") { }

            column(Bill_to_County; "Bill-to County") { }

            column(Bill_to_Country_Region_Code; "Bill-to Country/Region Code") { }

            column(compInfo; CompanyName) { }

            column(Your_Reference; "Your Reference") { }

            column(Due_Date; "Due Date") { }

            column(Picture; compInfo.Picture) { }

            column(Payment_Terms_Code; "Payment Terms Code") { }

            column(Order_No_; "Order No.") { }

            column(Shipment_Method_Code; "Shipment Method Code") { }

            column(Payment_Method_Code; "Payment Method Code") { }

            column(Salesperson_Code; "Salesperson Code") { }

            column(Shipping_Agent_Code; "Shipping Agent Code") { }

            column(Package_Tracking_No_; "Package Tracking No.") { }

            column(Comp_Name; compInfo.Name) { }

            column(compADD; compInfo.Address) { }

            column(compADD2; compInfo."Address 2") { }

            column(VAT_Registration_No_; compInfo."VAT Registration No.") { }

            column(Phone_No; compInfo."Phone No.") { }

            column(Email; compInfo."E-Mail") { }

            column(Company_Bank_Account_Code; "Company Bank Account Code") { }

            column(Giro_No; compInfo."Giro No.") { }

            column(GSTComponentCGST; GSTComponentCGST) { }

            column(GSTComponentIGST; GSTComponentIGST) { }

            column(GSTComponentSGST; GSTComponentSGST) { }

            column(CGST; CGSTAmt) { }

            column(SGST; SGSTAmt) { }

            column(IGST; IGSTAmt) { }




            dataitem("Sales Invoice Line"; "Sales Invoice Line")

            {
                DataItemLinkReference = "Sales Invoice Header";
                DataItemLink = "Document No." = field("No.");


                column(Line_Amount; "Line Amount")
                {

                }

                column(Description; Description)
                {

                }
                column(NUMBER; "No.")
                {

                }

                column(Quantity__Base_; "Quantity (Base)")
                {

                }

                column(Shipment_Date; "Shipment Date")
                {

                }

                column(Unit_Price; "Unit Price")
                {

                }
                column(amountsInWords; amountsInWords)
                {

                }




                trigger OnAfterGetRecord()
                var

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
                    // FinalAmt += "Line Amount";
                    TotAmt += "Line Amount" + CGSTAmt + SGSTAmt + IGSTAmt;
                    Repcheck.InitTextVariable();
                    Repcheck.FormatNoText(WordsInArry, TotAmt, ' ');
                    amountsInWords := WordsInArry[1] + WordsInArry[2];


















                end;















            }













        }


        // requestpage
        // {
        //     layout
        //     {
        //         area(Content)
        //         {
        //             group(GroupName)
        //             {
        //                 field(Name; SourceExpression)
        //                 {
        //                     ApplicationArea = All;

        //                 }
        //             }
        //         }
        //     }

    }


    trigger OnInitReport()
    var

    begin
        compInfo.get();
    end;


    trigger OnPreReport()
    begin
        compInfo.CalcFields(Picture);
    end;






    var

        compInfo: Record "Company Information";


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
        FinalAmt: Decimal;

        RECSalesGST_INVOICE: Record "Sales Invoice Line";

        TotAmt: Decimal;
        Repcheck: Report Check;
        WordsInArry: Array[2] of Text;
        amountsInWords: text[250];




}