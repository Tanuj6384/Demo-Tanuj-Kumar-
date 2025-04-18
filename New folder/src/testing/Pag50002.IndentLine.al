page 50098 "Indent Line"
{
    ApplicationArea = All;
    Caption = 'Indent Line';
    PageType = List;
    SourceTable = "Indent Line";
    UsageCategory = Lists;
    Editable = true;
    // CardPageId = 50003;
    layout
    {
        area(content)
        {
            repeater(General)
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
                field(Status;Rec.Status)
                {
                    ApplicationArea =All;
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Create Sales Order")
            {
                ApplicationArea = All;
                RunObject = report "SO Creation (Indent)";
                trigger OnAction()
                begin
                    
                end;
            }
        }
    }
}
