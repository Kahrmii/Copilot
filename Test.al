page 50101 "Prompt Dialog"
{
    PageType = PromptDialog;
    Extensible = false;
    ApplicationArea = All;
    Caption = 'Prompt Dialog';

    layout
    {
        area(Prompt)
        {
            group(Group)
            {
                field("Prompt Field"; UserPromptText)
                {
                    ApplicationArea = All;
                    Caption = 'Enter Value';
                }
            }
        }
    }

    actions
    {
        area(SystemActions)
        {
            systemaction(Generate)
            {
                Caption = 'Generate';
                trigger OnAction()
                begin
                    // RunGenerate();
                end;
            }
        }
    }

    // local procedure RunGeneration()
    // var
    //     InStr: InStream;
    //     Attempts: Integer;
    // begin
    //     CurrPage.Caption := ChatRequest;
    //     GenItemSubstProposal.SetUserPrompt(ChatRequest);

    //     TmpItemSubstAIProposal.Reset();
    //     TmpItemSubstAIProposal.DeleteAll();

    //     Attempts := 0;
    //     while TmpItemSubstAIProposal.IsEmpty and (Attempts < 5) do begin
    //         if GenItemSubstProposal.Run() then
    //             GenItemSubstProposal.GetResult(TmpItemSubstAIProposal);
    //         Attempts += 1;
    //     end;

    //     if (Attempts < 5) then begin
    //         Load(TmpItemSubstAIProposal);
    //     end else
    //         Error('Something went wrong. Please try again. ' + GetLastErrorText());
    // end;

    var
        UserPromptText: Text[100];
        SourceItem: Record Item;
        // TmpItemSubstAIProposal: Record "Copilot Item Sub Proposal" temporary;
        // GenItemSubstProposal: Codeunit "Generate Item Sub Proposal";
        ChatRequest: Text;
}