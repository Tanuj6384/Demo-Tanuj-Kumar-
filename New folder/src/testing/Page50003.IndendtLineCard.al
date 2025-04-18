page 50099 "Indent Line Card"
{
    ApplicationArea = All;
    Caption = 'Indent Line Card';
    PageType = Card;
    SourceTable = "Indent Line";
    UsageCategory = Administration;
    Editable = true;
    
    layout
    {
        area(content)
        {
            group(General)
            {
                field(Indent_Date; Rec.Indent_Date)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Indent_Date field.';
                }
                field(Indent_ID; Rec.Indent_ID)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Indent ID field.';
                }
                field(Item_No; Rec.Item_No)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Item_No field.';
                }
                field(Line_No; Rec.Line_No)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line_No field.';
                }
                field(Location_Code; Rec.Location_Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Location_Code field.';
                }
                field("MSD Code (Customer)"; Rec."MSD Code (Customer)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the MSD Code (Customer) field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field(Ship_to_Code; Rec.Ship_to_Code)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ship_to_Code field.';
                }
            }
        }
    }
}
