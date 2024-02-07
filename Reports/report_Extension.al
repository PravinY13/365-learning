reportextension 50100 MyExtension_Report extends "Standard Sales - Order Conf."
{
    dataset
    {

        add(Line)
        {
            column(Sr_No; "No.") { }
            column(location; "Location Code") { }
            // Add changes to dataitems and columns here
        }

    }


    rendering

    {


        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'mylayout.rdl';
        }
    }
}