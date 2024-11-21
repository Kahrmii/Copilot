codeunit 50101 "CopilotJob"
{
    procedure Generate(Prompt: Text): Text
    var
        AzureOpenAI: Codeunit "Azure OpenAI";
        AOAIOperationResponse: Codeunit "AOAI Operation Response";
        AOAIChatCompletionParams: Codeunit "AOAI Chat Completion Params";
        AOAIChatMessages: Codeunit "AOAI Chat Messages";
        AOAIToken: Codeunit "AOAI Token";
        Metaprompt: Text;
        Result: Text;
    begin
        SetAzureOpenAIAuthorization(AzureOpenAI);
        SetParameters(AOAIChatCompletionParams);
        AzureOpenAI.SetCopilotCapability(Enum::"Copilot Capability"::"Copilot Playground");
        IsolatedStorage.Get('DescribeJobMetaprompt', Metaprompt);
        if AOAIToken.GetGPT35TokenCount(Metaprompt) + AOAIToken.GetGPT35TokenCount(Prompt) <= 1596 then begin // assuming GPT3.5 model
            AOAIChatMessages.SetPrimarySystemMessage(Metaprompt);
            AOAIChatMessages.AddUserMessage(Prompt);
            AzureOpenAI.GenerateChatCompletion(AOAIChatMessages, AOAIChatCompletionParams, AOAIOperationResponse);
            if AOAIOperationResponse.IsSuccess() then
                Result := AOAIChatMessages.GetLastMessage();
            exit(Result);
        end;
    end;

    local procedure SetParameters(var AOAIChatCompletionParams: Codeunit "AOAI Chat Completion Params")
    begin
        AOAIChatCompletionParams.SetMaxTokens(2500);
        AOAIChatCompletionParams.SetTemperature(0);
    end;

    local procedure SetAzureOpenAIAuthorization(var AzureOpenAI: Codeunit "Azure OpenAI")
    var
        Endpoint: Text;
        Deployment: Text;
        Apikey: SecretText;
    begin
        IsolatedStorage.Get('Endpoint', Endpoint);
        IsolatedStorage.Get('Deployment', Deployment);
        IsolatedStorage.Get('Apikey', Apikey);

        AzureOpenAI.SetAuthorization(Enum::"AOAI Model Type"::"Chat Completions", Endpoint, Deployment, Apikey);
    end;
}