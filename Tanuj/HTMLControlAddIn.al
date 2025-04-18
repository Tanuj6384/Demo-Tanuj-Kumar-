controladdin HTMLControlAddIn
{
    RequestedHeight = 1300;
    MinimumHeight = 1300;
    MaximumHeight = 1300;
    RequestedWidth = 700;
    MinimumWidth = 700;
    MaximumWidth = 700;
    VerticalStretch = true;
    VerticalShrink = true;
    HorizontalStretch = true;
    HorizontalShrink = true;

    StyleSheets = 'Tanuj/buttonStyle.css';  // Path to the CSS file
    StartupScript = 'Tanuj/start.js';
    Scripts = 'Tanuj/buttonScript.js';  // Path to the JavaScript file 

    event Ready();

    procedure embedHomePage()
}
