codeunit 50101 "CopilotJob"
{
    /// <summary>
    /// Generates a response based on the provided prompt using Azure OpenAI services.
    /// </summary>
    /// <param name="Prompt">The user input text to generate a response for.</param>
    /// <returns>The generated response text.</returns>
    procedure Generate(Prompt: Text): Text
    var
        AzureOpenAI: Codeunit "Azure OpenAI";
        AOAIOperationResponse: Codeunit "AOAI Operation Response";
        AOAIChatCompletionParams: Codeunit "AOAI Chat Completion Params";
        AOAIChatMessages: Codeunit "AOAI Chat Messages";
        AOAIToken: Codeunit "AOAI Token";
        Metaprompt: Text;
        Result: Text;
        defaultMetaprompt: Text;
    begin
        SetAzureOpenAIAuthorization(AzureOpenAI);
        SetParameters(AOAIChatCompletionParams);
        AzureOpenAI.SetCopilotCapability(Enum::"Copilot Capability"::"Copilot Playground");

        defaultMetaprompt := ''; //TODO need default metaprompt

        if not IsolatedStorage.Get('DescribeJobMetaprompt', Metaprompt) then
            Metaprompt := defaultMetaprompt;

        if AOAIToken.GetGPT35TokenCount(Metaprompt) + AOAIToken.GetGPT35TokenCount(Prompt) <= 1596 then begin
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
        Apikey: SecretText; //TODO need Azure OpenAI API key
    begin
        AzureOpenAI.SetAuthorization(Enum::"AOAI Model Type"::"Chat Completions", Endpoint, Deployment, Apikey);
    end;
}