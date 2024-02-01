report 50121 "Posted Purchase Order"
{
    ApplicationArea = All;
    Caption = 'Posted Purchase Order';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Posted Purchase Order.rdl';
    PreviewMode = PrintLayout;
    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {
            RequestFilterFields = "No.";


            //COMPANY INFO. BLOCK
            column(Picture123; compInfo.Picture) { }
            column(NAME; compInfo.Name) { }
            column(CompADD; compInfo.Address) { }
            column(EMAIL; compInfo."E-Mail") { }
            column(GST; compInfo."GST Registration No.") { }
            column(CompCONT; compInfo."Contact Person") { }
            column(CompStateCODE; compInfo."State Code") { }
            column(CompSTATE; compInfo."Ship-to City") { }



            //Vendor Info. Block
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name") { }
            column(ADDRESS; "Buy-from Address") { }
            column(STATE; "Buy-from City") { }
            column(COUNTRY; "Buy-from County") { }
            column(CONTACT; "Buy-from Contact") { }


            //SHIP TO BLOCK
            column(Ship_to_Name; "Ship-to Name") { }
            column(Ship_to_Address; "Ship-to Address") { }
            column(Ship_to_Address_2; "Ship-to Address 2") { }
            column(Ship_to_Country_Region_Code; "Ship-to Country/Region Code") { }
            column(Location_State_Code; "Location State Code") { }


            //INVOICE BLOCK
            column(Invoice_Disc__Code; "Invoice Disc. Code") { }
            column(Order_No_; "Order No.") { }
            column(Order_Date; "Order Date") { }
            column(Shipment_Method_Code; "Shipment Method Code") { }
            column(termsofpayment; DescriptionTerms) { }


            //Bank Details
            //column(account; bankInfo."Bank Account No.") { }
            column(Bank_name; bankInfo.Name) { }
            column(bank_branch_No; bankInfo."Bank Branch No.") { }








            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {
                DataItemLinkReference = "Purch. Inv. Header";
                DataItemLink = "Document No." = field("No.");

                //TABLE DETAILS
                column(SR_No_; "No.") { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(Unit_Cost; "Unit Cost") { }
                column(HSN_SAC_Code; "HSN/SAC Code") { }
                column(Unit_of_Measure; "Unit of Measure") { }
                column(FinalAmt; FinalAmt) { }
                column(amountsInWords; amountsInWords) { }

                //GST CALCULATION
                column(CGSTAmt; CGSTAmt) { }
                column(CGSTRate; CGSTRate) { }
                column(SGSTAmt; SGSTAmt) { }
                column(SGSTRate; SGSTRate) { }
                column(IGSTAmt; IGSTAmt) { }
                column(IGSTRate; IGSTRate) { }
                column(TotAmt; TotAmt) { }



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


                    GSTDetailLeger.SETRANGE(GSTDetailLeger."Document No.", "Purch. Inv. Line"."Document No.");

                    GSTDetailLeger.SETRANGE(GSTDetailLeger."No.", "Purch. Inv. Line"."No.");

                    GSTDetailLeger.SETRANGE(GSTDetailLeger."Document Line No.", "Purch. Inv. Line"."Line No.");

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
                    TotAmt += "Line Amount" + CGSTAmt + SGSTAmt + IGSTAmt;
                    FinalAmt += TotAmt;//"Line Amount" + SGSTAmt + CGSTAmt + IGSTAmt;
                    Repcheck.InitTextVariable();
                    Repcheck.FormatNoText(WordsInArry, FinalAmt, ' ');
                    amountsInWords := WordsInArry[1] + WordsInArry[2];

                end;






            }
            trigger OnAfterGetRecord()
            var

            begin
                Message('OnAfterGetRecord');
                PaymentTerms.Reset();
                PaymentTerms.SetRange(Code, "Purch. Inv. Header"."Payment Terms Code");
                if PaymentTerms.FindFirst() then
                    DescriptionTerms := PaymentTerms.Description;
            end;

            trigger OnPostDataItem()
            var
                myInt: Integer;
            begin
                Message('OnPostDataItem');

            end;

            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin
                Message('OnPreDataItem');
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

    trigger OnInitReport()
    var

    begin
        compInfo.get();
        compInfo.CalcFields(Picture);
        // VendorInfo.get();

    end;

    trigger OnPreReport()
    begin

    end;









    //     actions
    //     {
    //         area(processing)
    //         {
    //             action(ActionName)
    //             {
    //                 ApplicationArea = All;

    //             }
    //         }
    //     }
    // }



    var
        compInfo: Record "Company Information";
        bankInfo: Record "Bank Account";
        PaymentTerms: Record "Payment Terms";
        DescriptionTerms: Text;

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

        RECSalesGST_INVOICE: Record "Purch. Inv. Line";

        TotAmt: Decimal;
        Repcheck: Report Check;
        WordsInArry: Array[2] of Text;
        amountsInWords: text[250];


}