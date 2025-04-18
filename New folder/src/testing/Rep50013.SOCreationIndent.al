report 50013 "SO Creation (Indent)"
{
    ApplicationArea = All;
    Caption = 'SO Creation (Indent)';
    UsageCategory = ReportsAndAnalysis;
    ProcessingOnly = True;
    UseRequestPage = false;
    dataset
    {
        dataitem(IndentLine; "Indent Line")
        {
            DataItemTableView = sorting(Indent_ID)
            where(Status = const(Open));
            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                if IndentLine.Indent_ID <> IndentID then begin
                    CreateSalesHeader(IndentLine);
                end;
                IndentID := IndentLine."MSD Code (Customer)";
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
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    trigger OnPreReport()
    var
        myInt: Integer;
    begin
        Clear(IndentID);
    end;

    var
        IndentID: Code[20];

    local procedure CreateSalesHeader(Var IndentLine: Record "Indent Line")
    var
        RecSalesHead: Record "Sales Header";
        RecSalesSetup: Record "Sales & Receivables Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DocNo: Code[20];
        CheckCustomer: Record Customer;
    begin
        RecSalesSetup.Get();
        Clear(DocNo);
        DocNo := NoSeriesMgt.GetNextNo(RecSalesSetup."Order Nos.", Today, True);
        RecSalesHead.Init();
        RecSalesHead.Validate("Document Type", RecSalesHead."Document Type"::Order);
        RecSalesHead.Validate("No.", DocNo);
        RecSalesHead.Insert();
        RecSalesHead.Validate("Location Code", IndentLine.Location_Code);
        if CheckCustomer.Get(IndentLine."MSD Code (Customer)") then begin
            RecSalesHead.Validate("Sell-to Customer No.", IndentLine."MSD Code (Customer)");
        end;
        // RecSalesHead.Validate("Indent Id", IndentLine.Indent_ID);
        RecSalesHead.Validate("Ship-to Code", IndentLine.Ship_to_Code);
        RecSalesHead.Validate("Order Date", IndentLine.Indent_Date);
        RecSalesHead.Modify();

        if not CreateSalesLine(IndentLine, RecSalesHead) then begin
            IndentLine.Validate(Status, IndentLine.Status::Error);
        end;
    end;



    [TryFunction]
    local procedure CreateSalesLine(Var IndentLine: Record "Indent Line"; RecSH: Record "Sales Header")
    var
        RecSalesLine: Record "Sales Line";
    begin
        RecSalesLine.Init();
        RecSalesLine.Validate("Document Type", RecSalesLine."Document Type"::Order);
        RecSalesLine.Validate("Document No.", RecSH."No.");
        RecSalesLine.Validate("Line No.", IndentLine.Line_No);
        IndentLine.Validate(Status, IndentLine.Status::Created);
        IndentLine.Validate("SO ID", RecSalesLine."Document No.");
        IndentLine.Modify();
        RecSalesLine.Insert();
        RecSalesLine.Validate("Location Code", IndentLine.Location_Code);
        RecSalesLine.Validate("No.", IndentLine.Item_No);
        RecSalesLine.Validate(Quantity, IndentLine.Quantity);
        RecSalesLine.Modify();
    end;
}
