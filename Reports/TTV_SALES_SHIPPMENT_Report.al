report 50104 SalesShippmentReport
{
    ApplicationArea = All;
    Caption = 'SalesShippmentReport';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'SalesShippmentReportNew.rdl';
    PreviewMode = PrintLayout;


    dataset
    {
        dataitem("Sales Shipment Header"; "Sales Shipment Header")
        {
            RequestFilterFields = "No.";

            //Customer details
            column(Sell_to_Customer_Name; "Sell-to Customer Name") { }
            column(Sell_to_Address; "Sell-to Address") { }
            column(Sell_to_City; "Sell-to City") { }
            column(Sell_to_Contact; "Sell-to phone No.") { }
            column(Sell_to_Country_Region_Code; "Sell-to Country/Region Code") { }


            //COMPANY INFO. BLOCK
            column(Picture123; compInfo.Picture) { }
            column(NAME; compInfo.Name) { }
            column(CompADD; compInfo.Address) { }
            column(EMAIL; compInfo."E-Mail") { }
            column(GST; compInfo."GST Registration No.") { }
            column(CompCONT; compInfo."Contact Person") { }
            column(CompStateCODE; compInfo."State Code") { }
            column(CompSTATE; compInfo."Ship-to City") { }
            column(TotalCGST; TotalCGST)
            {

            }
            column(TotalSGST; TotalSGST)
            {

            }
            column(TotalIGST; TotalIGST)
            {

            }


            // trigger OnAfterGetRecord()
            // var
            //     myInt: Integer;
            // begin

            // end;









            //sales line block
            dataitem("Sales Shipment Line"; "Sales Shipment Line")
            {
                DataItemLinkReference = "Sales Shipment Header";
                DataItemLink = "Document No." = field("No.");

                //TABLE DETAILS
                column(SR_No_; "No.") { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(Unit_Cost; "Unit Cost") { }
                column(HSN_SAC_Code; "HSN/SAC Code") { }
                column(Unit_of_Measure; "Unit Cost") { }
                column(amountsInWords; amountsInWords) { }
                column(TotAmt; TotAmt) { }
                column(LineAmount; LineAmount) { }
                column(totalTax; totalTax) { }

                // column(FinalAmt; FinalAmt) { }

                //GST CALCULATION
                column(CGSTAmt; CGSTAmt) { }
                column(CGSTRate; CGSTRate) { }
                column(SGSTAmt; SGSTAmt) { }
                column(SGSTRate; SGSTRate) { }
                column(IGSTAmt; IGSTAmt) { }
                column(IGSTRate; IGSTRate) { }
                //column(TotAmt; TotAmt) { }

                trigger OnAfterGetRecord()
                var
                    myInt: Integer;
                begin
                    // CLEAR(CGSTRate);

                    // CLEAR(CGSTAmt);

                    // CLEAR(GSTComponentCGST);

                    // CLEAR(SGSTRate);

                    // CLEAR(SGSTAmt);

                    // CLEAR(GSTComponentSGST);

                    // CLEAR(IGSTRate);

                    // CLEAR(IGSTAmt);

                    // CLEAR(GSTComponentIGST);

                    // GSTDetailLeger.RESET;


                    // GSTDetailLeger.SETRANGE(GSTDetailLeger."Document No.", "Sales Shipment Line"."Document No.");

                    // GSTDetailLeger.SETRANGE(GSTDetailLeger."No.", "Sales Shipment Line"."No.");

                    // GSTDetailLeger.SETRANGE(GSTDetailLeger."Document Line No.", "Sales Shipment Line"."Line No.");

                    // IF GSTDetailLeger.FINDSET THEN
                    //     REPEAT

                    //         IF GSTDetailLeger."GST Component Code" = 'CGST' THEN BEGIN

                    //             GSTComponentCGST := 'CGST';

                    //             CGSTRate := GSTDetailLeger."GST %";

                    //             CGSTAmt := ABS(GSTDetailLeger."GST Amount");

                    //         END ELSE

                    //             IF GSTDetailLeger."GST Component Code" = 'SGST' THEN BEGIN

                    //                 GSTComponentSGST := 'SGST';

                    //                 SGSTRate := GSTDetailLeger."GST %";

                    //                 SGSTAmt := ABS(GSTDetailLeger."GST Amount");

                    //             END ELSE

                    //                 IF GSTDetailLeger."GST Component Code" = 'IGST' THEN BEGIN

                    //                     GSTComponentIGST := 'IGST';

                    //                     IGSTRate := GSTDetailLeger."GST %";

                    //                     IGSTAmt := ABS(GSTDetailLeger."GST Amount");

                    //                 END;

                    //     UNTIL GSTDetailLeger.NEXT = 0;

                    // //TGST += SGSTAmt + CGSTAmt + IGSTAmt;
                    // // netPrice := "Line Amount";
                    // // netValue += netPrice + TGST;
                    // // tOTALBILLINGVALUE += "Sales Invoice Line".Quantity * "Sales Invoice Line"."Unit Price" + SGSTAmt + CGSTAmt + IGSTAmt;
                    // Repcheck.InitTextVariable();
                    // Repcheck.FormatNoText(WordsInArry, CGSTAmt, ' ');
                    // amountsInWords := WordsInArry[1] + WordsInArry[2];

                end;





            }
            dataitem("Sales Header"; "Sales Header")
            {
                DataItemLinkReference = "Sales Shipment Header";
                DataItemLink = "Last Shipping No." = field("No.");
                dataitem("Sales Line"; "Sales Line")
                {
                    DataItemLinkReference = "Sales Header";
                    DataItemLink = "Document No." = field("No.");
                    trigger OnAfterGetRecord()
                    var
                        myInt: Integer;

                    begin

                    end;

                }
            }

            trigger OnAfterGetRecord()
            var
                SalesHeader: Record "Sales Header";
                salesline: Record "Sales Line";
            begin
                //Message('OnAfterGetRecord');
                SalesHeader.Reset();
                SalesHeader.SetRange(SalesHeader."Last Shipping No.", "Sales Shipment Header"."No.");
                if SalesHeader.FindFirst() then begin
                    salesline.Reset();
                    salesline.SetRange(salesline."Document No.", SalesHeader."No.");
                    if salesline.FindFirst() then begin

                    end;

                end;


                "Sales Shipment Header Rec".Reset();
                "Sales Shipment Line Rec".SetRange("Document No.", "Sales Shipment Header"."No.");
                if "Sales Shipment Line Rec".FindSet() then begin
                    repeat
                        "Amount" += "Sales Shipment Line Rec".Quantity * "Sales Shipment Line Rec"."Unit Price";
                    until "Sales Shipment Line Rec".Next() = 0;

                    //AmountTotal += Amount;
                end;

                "Sales Header".Reset();
                "Sales Header".SetRange("No.", "Sales Shipment Header"."Order No.");
                "Sales Header".SetRange("Last Shipping No.", "Sales Shipment Header"."No.");
                if "Sales Header".FindFirst() then begin
                    "Sales Line".Reset();
                    "Sales Line".SetRange("Document No.", "Sales Shipment Header"."Order No.");
                    // if "Sales Line".FindFirst() then begin
                    "Sales Line".SetFilter("GST Group Code", '<>%1', '');
                    // ClearData();

                    repeat
                        TaxRecordID := "Sales Line".RecordId();//NP
                                                               //  PurchaseHeaderRecordID := saleLine.RecordId();
                                                               //Message('%1', PurchHeaderRecordID);
                        TaxTransactionValue.Reset();
                        TaxTransactionValue.SetRange("Tax Record ID", TaxRecordID);//Np
                        TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
                        TaxTransactionValue.SetFilter("Tax Type", '=%1', 'GST');
                        TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
                        TaxTransactionValue.SetRange("Visible on Interface", true);
                        TaxTransactionValue.SetFilter("Value ID", '%1|%2', 6, 2);
                        if TaxTransactionValue.FindSet() then begin
                            //repeat
                            CGSTRate := TaxTransactionValue.Percent;
                            SGSTRate := TaxTransactionValue.Percent;
                            CGST := abs(TaxTransactionValue.Amount);
                            SGST := abs(TaxTransactionValue.Amount);
                            SGSTtxt := 'SGST';
                            CGSTtxt := 'CGST';
                            TotalCGST += CGST;
                            TotalSGST += TotalCGST;//SGST;
                        end else begin
                            TaxTransactionValue.Reset();
                            TaxTransactionValue.SetRange("Tax Record ID", TaxRecordID);//NP
                            TaxTransactionValue.SetRange("Value Type", TaxTransactionValue."Value Type"::COMPONENT);
                            TaxTransactionValue.SetFilter("Tax Type", '=%1', 'GST');
                            TaxTransactionValue.SetFilter(Percent, '<>%1', 0);
                            TaxTransactionValue.SetRange("Visible on Interface", true);
                            TaxTransactionValue.SetFilter("Value ID", '%1', 3);
                            if TaxTransactionValue.FindSet() then
                                IGSTRate := TaxTransactionValue.Percent;
                            IGST := abs(TaxTransactionValue.Amount);
                            IGSTtxt := 'IGST';
                            TotalIGST += IGST;

                        END;


                    // Total += "Sales Line"."Line Amount";
                    until "Sales Line".Next() = 0;

                    totamt := "Sales Line".Quantity * "Sales Line"."Unit Cost" + TotalCGST + TotalSGST + TotalIGST;


                    //Using RepCheck and Posted Voucher : code is same only change the variable as required; repcheck(reportcheck will give numbers as well and posted voucher(var23) will wont)
                    var23.InitTextVariable();
                    var23.FormatNoText(WordsInArry, totamt, ' ');
                    amountsInWords := WordsInArry[1] + WordsInArry[2];

                    // Codeunit.InitTextVariable();
                    // Codeunit.FormatNoText(WordsInArry, totamt, ' ');
                    // amountsInWords := WordsInArry[1] + WordsInArry[2];





                    //=(Fields!Quantity.Value*Fields!Unit_Cost.Value+(Fields!TotalCGST.Value+Fields!TotalCGST.Value+Fields!TotalIGST.Value))


                    //Total += "Sales Line"."Line Amount";
                    "Sales Line".Reset();
                    "Sales Line".SetRange("Document No.", "Sales Shipment Header"."Order No.");
                    if "Sales Line".FindSet() then begin
                        LineAmount += "Sales Line"."Line Amount";
                    end;

                end;
            end;

            // end;





        }




    }



    trigger OnInitReport()
    var

    begin
        compInfo.get();
        compInfo.CalcFields(Picture);


    end;






    var
        CoUnit: Codeunit 50100;

        Repcheck: Report Check;
        WordsInArry: Array[2] of Text;
        totamt: Decimal;
        cgstAmt: Decimal;
        sgstAmt: Decimal;
        Igstamt: Decimal;
        myInt: Integer;
        amountsInWords: Text[250];
        Location: Record Location;
        Add: Text[100];
        City: Text[100];
        PostCode: Code[30];
        GSTNo: Code[39];
        StateName: Text[100];
        CompStateName: Text[50];
        CompStateNo: Code[20];
        StateCode: text[20];
        Customer: Record Customer;
        PAN: Code[20];
        "Sales Shipment Header Rec": Record "Sales Shipment Header";
        "Sales Shipment Line Rec": Record "Sales Shipment Line";

        "LineAmount": Decimal;


        compinfo: Record "Company Information";
        totaltax: Decimal;
        StateRec: Record State;
        term: Record "Payment Terms";
        getTerm: Text[100];
        "Amount": Decimal;
        TaxTransactionValue: Record "Tax Transaction Value";
        PurchaseHeaderRecordID: Record "Purchase Header";
        //   PostedVoucher: Report "Posted Voucher";
        TaxRecordID: RecordId;
        IGSTtxt: text[10];
        grandtotal: Decimal;
        CGSTtxt: text[10];
        SGSTtxt: text[10];
        AmountToVendor: Decimal;
        AmountTotal: Decimal;

        CGSTRate: Decimal;
        SGSTRate: Decimal;
        IGSTRate: Decimal;
        Total: Decimal;
        TotalCGST: Decimal;
        TotalSGST: Decimal;
        TotalIGST: Decimal;
        IGST: Decimal;
        SGST: Decimal;
        CGST: Decimal;
        var23: Report "Posted Voucher";


        wordinarray: array[2] of text;
        wordinarray2: array[2] of text;
        BankAccountName: Text[100];
        BankAccountNo: Text[30];
        BankBranchNo: Text[30];
        StateName2: Text[20];


        amountinwords: Text[259];
        Taxinwords: Text[259];
        CompADD: Text[100];
        CompADD1: Text[100];
        CompCity1: Text[50];
        CompPostCode: Code[50];
        CompState1: Text[50];
        CompStateNo2: Code[10];



    local procedure ClearData()
    Begin
        IGSTRate := 0;
        SGSTRate := 0;
        CGSTRate := 0;
        SGSTtxt := '';
        CGSTtxt := '';
        TotalCGST := 0;
        TotalSGST := 0;
        TotalIGST := 0;
        CGSTtxt := '';
        IGSTtxt := '';

        IGST := 0;
        CGST := 0;
        SGST := 0;
        // Clear(AmountinWords);
        AmountToVendor := 0;

    End;
}