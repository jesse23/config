// ************************* Surfingkeys Config ***********************************
//
// The file contains the default mappings, and it is released un-minified
// for your referrence on creating your own mappings.
//
// But please don't just copy statement from this file to your own settings.
// As the bound functions in this file may rely on some unstable functions/
// variables, which may be changed some day. If you insist on that, please
// compare your settings with this file to find what stops your keystrokes
// from working.
//
// Therefore, the best practice to remap is using map instead of mapkey, for
// example:
//
//      map('F', 'af');
//
// is better than
//
//      mapkey('F', '#1Open a link in new tab', 'Hints.create("", Hints.dispatchMouseClick, {tabbed: true})');
//
// most of the implementation is from:
//   https://github.com/brookhong/Surfingkeys/blob/57fccbbeeb60ee2be0d2d60cfc50bd3aca3b0436/pages/default.js
//   https://github.com/brookhong/Surfingkeys/blob/57fccbbeeb60ee2be0d2d60cfc50bd3aca3b0436/background.js
//
// ************************* Surfingkeys Config ***********************************


// --------------------------------------------------------------------------------
// Backward Forward
// --------------------------------------------------------------------------------
unmap('S');
unmap('D');
mapkey('u', '#4Go back in history', function() {
    history.go(-1);
}, {repeatIgnore: true});

mapkey('<Ctrl-r>', '#4Go forward in history', function() {
    history.go(1);
}, {repeatIgnore: true});

// --------------------------------------------------------------------------------
// Page navigation
// --------------------------------------------------------------------------------
mapkey('k', '#2Scroll a page up', function() {
    Normal.scroll('pageUp');
}, {repeatIgnore: true});

mapkey('j', '#2Scroll a page down', function() {
    Normal.scroll('pageDown');
}, {repeatIgnore: true});
map('<Space>', 'j');

// --------------------------------------------------------------------------------
// Tab Control
// --------------------------------------------------------------------------------
unmap('d');
map('D', 'x');

mapkey('o', '#8Open a URL in current tab', function() {
    Front.openOmnibar({type: "URLs", extra: "getAllSites", tabbed: false});
});

mapkey('>', 'Choose a tab with omnibar', function() {
    Front.openOmnibar({type: "Tabs"});
});

mapkey('.', 'Choose a tab', function() {
    Front.chooseTab();
});

mapkey(',', '#4Go to last used tab', function() {
    RUNTIME("goToLastTab");
});

mapkey('H', '#4Go to last previous tab', function() {
    RUNTIME("previousTab");
});

mapkey('L', '#4Go to last next tab', function() {
    RUNTIME("nextTab");
});

// --------------------------------------------------------------------------------
// Copy/Paste
// --------------------------------------------------------------------------------
mapkey('yy', '#8Yank Selected Text', function() {
    var text = "";
    if (window.getSelection) {
        text = window.getSelection().toString();
    } else if (document.selection && document.selection.type != "Control") {
        text = document.selection.createRange().text;
    }
    Clipboard.write(text);
}, {repeatIgnore: true});

mapkey('Y', "#7Copy current page's URL", function() {
    Clipboard.write(window.location.href);
});

// --------------------------------------------------------------------------------
// General
// --------------------------------------------------------------------------------
Hints.characters = 'barstdqwfpgzxcv';
settings.smoothScroll=false;
settings.tabsThreshold = 18;

// --------------------------------------------------------------------------------
// Dracula Theme
// https://gist.github.com/emraher/2c071182ce0f04f3c69f6680de335029
// --------------------------------------------------------------------------------
Hints.style('border: solid 1px #ff79c6; color:#44475a; background: #f1fa8c; background-color: #f1fa8c; font-size: 10pt; font-family: "Fira Code"');
Hints.style('border: solid 8px #ff79c6;padding: 1px;background: #f1fa8c; font-family: "Fira Code"', "text");

// Change search marks and cursor
Visual.style('marks', 'background-color: #f1fa8c;');
Visual.style('cursor', 'background-color: #6272a4; color: #f8f8f2');

// Change theme, fonts and colors
settings.theme = `
.sk_theme input {
    font-family: "Fira Code";
}
.sk_theme .url {
    font-size: 10px;
}
#sk_omnibarSearchResult li div.url {
    font-weight: normal;
}
.sk_theme .omnibar_timestamp {
    font-size: 11px;
    font-weight: bold;
}
.sk_theme .omnibar_visitcount {
    font-size: 11px;
    font-weight: bold;
}
body {
    font-family: "Fira Code", Consolas, "Liberation Mono", Menlo, Courier, monospace;
    font-size: 14px;
}
kbd {
    font: 11px "Fira Code", Consolas, "Liberation Mono", Menlo, Courier, monospace;
}
#sk_omnibarSearchArea .prompt, #sk_omnibarSearchArea .resultPage {
    font-size: 12px;
}
.sk_theme {
    background: #282a36;
    color: #f8f8f2;
}
.sk_theme tbody {
    color: #ff5555;
}
.sk_theme input {
    color: #ffb86c;
}
.sk_theme .url {
    color: #6272a4;
}
#sk_omnibarSearchResult>ul>li {
    background: #282a36;
}
#sk_omnibarSearchResult>ul>li:nth-child(odd) {
    background: #282a36;
}
.sk_theme .annotation {
    color: #6272a4;
}
.sk_theme .focused {
    background: #44475a !important;
}
.sk_theme kbd {
    background: #f8f8f2;
    color: #44475a;
}
.sk_theme .frame {
    background: #8178DE9E;
}
.sk_theme .omnibar_highlight {
    color: #8be9fd;
}
.sk_theme .omnibar_folder {
    color: #ff79c6;
}
.sk_theme .omnibar_timestamp {
    color: #bd93f9;
}
.sk_theme .omnibar_visitcount {
    color: #f1fa8c;
}
.sk_theme #sk_omnibarSearchResult>ul>li:nth-child(odd) {
    background: #282a36;
}
.sk_theme .prompt, .sk_theme .resultPage {
    color: #50fa7b;
}
.sk_theme .feature_name {
    color: #ff5555;
}
.sk_omnibar_middle #sk_omnibarSearchArea {
    border-bottom: 1px solid #282a36;
}
#sk_status {
    border: 1px solid #282a36;
}
#sk_richKeystroke {
    background: #282a36;
    box-shadow: 0px 2px 10px rgba(40, 42, 54, 0.8);
}
#sk_richKeystroke kbd>.candidates {
    color: #ff5555;
}
#sk_keystroke {
    background-color: #282a36;
    color: #f8f8f2;
}
kbd {
    border: solid 1px #f8f8f2;
    border-bottom-color: #f8f8f2;
    box-shadow: inset 0 -1px 0 #f8f8f2;
}
#sk_frame {
    border: 4px solid #ff5555;
    background: #8178DE9E;
    box-shadow: 0px 0px 10px #DA3C0DCC;
}
#sk_banner {
    border: 1px solid #282a36;
    background: rgb(68, 71, 90);
}
div.sk_tabs_bg {
    background: #f8f8f2;
}
div.sk_tab {
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#6272a4), color-stop(100%,#44475a));
}
div.sk_tab_title {
    color: #f8f8f2;
}
div.sk_tab_url {
    color: #8be9fd;
}
div.sk_tab_hint {
    background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#f1fa8c), color-stop(100%,#ffb86c));
    color: #282a36;
    border: solid 1px #282a36;
}
#sk_bubble {
    border: 1px solid #f8f8f2;
    color: #282a36;
    background-color: #f8f8f2;
}
#sk_bubble * {
    color: #282a36 !important;
}
div.sk_arrow[dir=down]>div:nth-of-type(1) {
    border-top: 12px solid #f8f8f2;
}
div.sk_arrow[dir=up]>div:nth-of-type(1) {
    border-bottom: 12px solid #f8f8f2;
}
div.sk_arrow[dir=down]>div:nth-of-type(2) {
    border-top: 10px solid #f8f8f2;
}
div.sk_arrow[dir=up]>div:nth-of-type(2) {
    border-bottom: 10px solid #f8f8f2;
}
}`
