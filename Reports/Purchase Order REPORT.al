report 50122 "Purchase Order Report"
{
    ApplicationArea = All;
    Caption = 'Purchase Order Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Purchase Order Report.rdl';


    dataset
    {
        dataitem("Purch. Inv. Header"; "Purch. Inv. Header")
        {

            RequestFilterFields = "No.";



            //company info. block
            column(pic; compInfo.Picture) { }
            column(name; compInfo.Name) { }
            column(address; compInfo.Address) { }
            column(address2; compInfo."Address 2") { }
            column(GstIn_UIN; compInfo."Registration No.") { }
            column(state_name; compInfo."State Code") { }
            column(Email; compInfo."E-Mail") { }


            //vendor Info. block  & Deliver by block
            column(Vendor_name; "Buy-from Vendor Name") { }
            column(add; "Buy-from Address") { }
            column(country; "Buy-from Country/Region Code") { }
            column(GSTIN; "VAT Registration No.") { }
            column(statecode; "Buy-from City") { }



            //Other details of Report
            column(date; "Document Date") { }
            column(purh_No; "Purchaser Code") { }
            column(Destination; "Bill to-Location(POS)") { }
            column("Reference"; "Reference Invoice No.") { }
            column(Order; "Order No.") { }



            dataitem("Purch. Inv. Line"; "Purch. Inv. Line")
            {
                DataItemLinkReference = "Purch. Inv. Header";
                DataItemLink = "Document No." = field("No.");
                RequestFilterFields = "Document No.";

                //TABLE DETAILS
                column(SR_No_; "No.") { }
                column(Description; Description) { }
                column(Quantity; Quantity) { }
                column(Unit_Cost; "Unit Cost") { }
                column(HSN_SAC_Code; "HSN/SAC Code") { }
                column(Unit_of_Measure; "Unit of Measure") { }
                column(rate; "Units per Parcel") { }
                column(NET; net) { }
                column(Amount; Amount) { }
                column(amountsInWords; amountsInWords) { }

                //Company Bank details block
                column(bank_name; compInfo."Bank Name") { }
                column(ac_no; compInfo."Bank Account No.") { }
                column(branch; compInfo."Bank Branch No.") { }
                column(swiftCode; compInfo."SWIFT Code") { }


                //GST CALCULATION
                column(CGSTAmt; CGSTAmt) { }
                column(CGSTRate; CGSTRate) { }
                column(SGSTAmt; SGSTAmt) { }
                column(SGSTRate; SGSTRate) { }
                column(IGSTAmt; IGSTAmt) { }
                column(IGSTRate; IGSTRate) { }
                column(TGST; TGST) { }





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
                    TGST := CGSTAmt + SGSTAmt + IGSTAmt;
                    amount := "Line Amount";
                    net += TGST + "Line Amount";
                    Repcheck.InitTextVariable();
                    Repcheck.FormatNoText(WordsInArry, net, ' ');
                    amountsInWords := WordsInArry[1] + WordsInArry[2];

                end;

            }

            trigger OnPreDataItem()
            var


            begin
                compInfo.get();

                compInfo.CalcFields(compInfo.Picture);


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


    // }




    var
        compInfo: Record "company Information";
        Amount: Decimal;
        net: Decimal;
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
        TGST: Decimal;
}