codeunit 50100 "Secrets And Capabilities Setup"
{
    Subtype = Install;
    InherentEntitlements = X;
    InherentPermissions = X;
    Access = Internal;

    trigger OnInstallAppPerDatabase()
    var
    // SetupStorage: Codeunit "Setup Isolated Storage"; //TODO isolated storage
    begin
        RegisterCapability();
        // SetupStorage.StoreData();
    end;

    local procedure RegisterCapability()
    var
        CopilotCapability: Codeunit "Copilot Capability";
        LearnMoreUrlTxt: Label 'https://tinyurl.com/yk58eyb5', Locked = true;
        EnvironmentInfo: Codeunit "Environment Information";
    begin
        if EnvironmentInfo.IsSaaSInfrastructure() then
            if not CopilotCapability.IsCapabilityRegistered(Enum::"Copilot Capability"::"Copilot Playground") then
                CopilotCapability.RegisterCapability(
                      Enum::"Copilot Capability"::"Copilot Playground",
                      Enum::"Copilot Availability"::"Generally Available", LearnMoreUrlTxt);
    end;
}