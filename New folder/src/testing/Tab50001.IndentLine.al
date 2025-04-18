table 50001 "Indent Line"
{
    Caption = 'Indent Line';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Indent_ID"; code[20])
        {
            Caption = 'Indent ID';
        }
        field(2; Line_No; Integer)
        {
        }
        field(3; "MSD Code (Customer)"; code[20])
        {
        }
        field(4; "Ship_to_Code"; code[20])
        {
        }
        field(5; "Location_Code"; code[20])
        {
        }
        field(6; Item_No; code[20])
        {
        }
        field(7; Quantity; Decimal)
        {
        }
        field(8; Indent_Date; Date)
        {
        }

        //Added Field for after SO API
        field(9; Status; Option)
        {
            DataClassification = ToBeClassified;
            InitValue = Open;
            OptionMembers = Open,Created,Error;
        }
        field(10; "SO ID"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "SO Qty"; Decimal)
        {
        }
        field(12; "SO Date"; Date)
        { 
            
        }
        field(13;EntryNo ; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
    }
    keys
    {
        key(PK;EntryNo){
            Clustered = true;
        }
        key(Key1; "Indent_ID", Line_No)
        {
        }
        key(SK;"MSD Code (Customer)")
        {}
    }
}
