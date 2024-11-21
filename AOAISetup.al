page 50102 AOAISetup
{
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'AOAISetup';
    PageType = Card;
    SourceTable = AOAISetupTab;
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                    Visible = false;
                }
                field(Endpoint; Rec.Endpoint)
                {
                    ToolTip = 'Specifies the value of the Endpoint field.', Comment = '%';
                }
                field(Deployment; Rec.Deployment)
                {
                    ToolTip = 'Specifies the value of the Deployment field.', Comment = '%';
                }
                field(APIKey; Rec.APIKey)
                {
                    ToolTip = 'Specifies the value of the APIKey field.', Comment = '%';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.Reset();
        if Rec.FindLast() then begin
            AOAISetupTab := Rec;
        end else begin
            Rec.Init();
            Rec.Insert();
            AOAISetupTab := Rec;
        end;
    end;

    var
        AOAISetupTab: Record "AOAISetupTab";
}
