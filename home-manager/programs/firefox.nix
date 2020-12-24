{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    #extensions = with pkgs;
    #let
    #nur-no-pkgs = import (builtins.fetchTarball
    #"https://github.com/nix-community/NUR/archive/master.tar.gz") {
    #inherit pkgs;
    #};
    #in [
    #nur-no-pkgs.repos.rycee.firefox-addons.ublock-origin
    #nur-no-pkgs.repos.rycee.firefox-addons.lastpass-password-manager
    #];
    profiles = {
      default = {
        settings = {
          "browser.startup.homepage" = "https://news.ycombinator.com";
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        };
        userChrome = ''
             :root {

           /* Minimal Functional Fox variables*/
          --mff-bg: #292f36;
          --mff-icon-color: #e0fbfc;
          --mff-nav-toolbar-padding: 8px;
          --mff-sidebar-bg: var(--mff-bg);
          --mff-sidebar-color: #e0fbfc;
          --mff-tab-border-radius: 0px;
          --mff-tab-color: #fefefa;
          --mff-tab-font-family: "Cantarell", sans;
          --mff-tab-font-size: 11pt;
          --mff-tab-font-weight: 400;
          --mff-tab-height: 32px;
          --mff-tab-pinned-bg: #70c1b3;
          --mff-tab-selected-bg: #ee6c4d;
          --mff-tab-soundplaying-bg: #9c89b8;
          --mff-urlbar-color: #98c1d9;
          --mff-urlbar-focused-color: #e0fbfc;
          --mff-urlbar-font-family: "Cantarell", serif;
          --mff-urlbar-font-size: 12pt;
          --mff-urlbar-font-weight: 700;
          --mff-urlbar-results-color: #e0fbfc;
          --mff-urlbar-results-font-family: "mononoki Nerd Font", serif;
          --mff-urlbar-results-font-size: 12pt;
          --mff-urlbar-results-font-weight: 700;
          --mff-urlbar-results-url-color: #98c1d9;
          /*   --mff-tab-selected-bg: linear-gradient(90deg, rgba(232,74,95,1) 0%, rgba(255,132,124,1) 50%, rgba(254,206,168,1) 100%); */
          /*   --mff-urlbar-font-weight: 600; */

          /* Overriden Firefox variables*/
          --autocomplete-popup-background: var(--mff-bg) !important;
          --default-arrowpanel-background: var(--mff-bg) !important;
          --default-arrowpanel-color: #fefefa !important;
          --lwt-toolbarbutton-icon-fill: var(--mff-icon-color) !important;
          --panel-disabled-color: #f9f9fa80;
          --toolbar-bgcolor: var(--mff-bg) !important;
          --urlbar-separator-color: transparent !important;
          }

          /*
            _____ _   ___ ___
           |_   _/_\ | _ ) __|
             | |/ _ \| _ \__ \
             |_/_/ \_\___/___/

          */

          .tab-background[selected="true"] {
            background: var(--mff-tab-selected-bg) !important;
          }

          .tab-background:not[visuallyselected] {
            background: var(--mff-tab-selected-bg) !important;
            opacity: 0.5 !important;
          }

          /* This positions the tabs under the navaigator container */
          #titlebar {
            -moz-box-ordinal-group: 3 !important;
          }

          .tabbrowser-tab::after,
          .tabbrowser-tab::before {
            border-left: none !important;
          }

          .tab-background {
            border: none !important;
          }

          .tabbrowser-arrowscrollbox {
            margin-inline-start: 4px !important;
            margin-inline-end: 0px !important;
          }

          .tab-close-button {
           display: none !important;
          }

          .tab-text {
            font-family: var(--mff-tab-font-family);
            font-weight: var(--mff-tab-font-weight);
            font-size: var(--mff-tab-font-size) !important;
            color: var(--mff-tab-color);
          }

          /* Hide the favicon for tabs */
          hbox.tab-content .tab-icon-image {
            display: none !important;
          }

          /* Show the favicon for tabs that are pinned */
          hbox.tab-content[pinned=true] .tab-icon-image {
            display: initial !important;
          }

          hbox.tab-content[pinned=true] .tab-text {
            display: none !important;
          }

          #tabbrowser-tabs {
            --tab-loading-fill: #033433 !important;

          }

          .tab-label-container:not([textoverflow]) {
            display: flex;
            overflow: hidden;
            justify-content: center;
          width: 50% !important;
            max-width: 50% !important;
            min-width: 50% !important;
          }

          /* .tab-label-container::after {
            content: "?" !important;

          } */

          .tab-line {
            display: none !important;
          }

          .tabbrowser-tab {
            border-radius: var(--mff-tab-border-radius) !important;
            border-width: 0;
            height: var(--mff-tab-height) !important;
            margin-bottom: 4px !important;
            margin-inline-end: 4px !important;
            margin-top: 4px !important;
            max-height: var(--mff-tab-height) !important;
            min-height: var(--mff-tab-height) !important;
          }

          .tabbrowser-tab[soundplaying="true"] {
            background-color: var(--mff-tab-soundplaying-bg) !important;
          }

          #tabs-newtab-button {
            list-style-image: url("data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="isolation:isolate" viewBox="0 0 16 16" width="16pt" height="16pt"><defs><clipPath id="_clipPath_99lNy5iVNzBT4GJ61eRvLV4FbIJfEq2X"><rect width="16" height="16"/></clipPath></defs><g clip-path="url(#_clipPath_99lNy5iVNzBT4GJ61eRvLV4FbIJfEq2X)"><clipPath id="_clipPath_PSmJUw238rlrF3iVjoZbuIy7ApS18eFZ"><rect x="0" y="0" width="16" height="16" transform="matrix(1,0,0,1,0,0)" fill="rgb(255,255,255)"/></clipPath><g clip-path="url(#_clipPath_PSmJUw238rlrF3iVjoZbuIy7ApS18eFZ)"><g><defs><filter id="hr6gh2N39iEKGHUEUXPQ1VpI5CnFB6KP" x="-200%" y="-200%" width="400%" height="400%" filterUnits="objectBoundingBox" color-interpolation-filters="sRGB"><feGaussianBlur xmlns="http://www.w3.org/2000/svg" in="SourceGraphic" stdDeviation="1.42936090628390283"/><feOffset xmlns="http://www.w3.org/2000/svg" dx="0" dy="0" result="pf_100_offsetBlur"/><feFlood xmlns="http://www.w3.org/2000/svg" flood-color="#000000" flood-opacity="0.65"/><feComposite xmlns="http://www.w3.org/2000/svg" in2="pf_100_offsetBlur" operator="in" result="pf_100_dropShadow"/><feBlend xmlns="http://www.w3.org/2000/svg" in="SourceGraphic" in2="pf_100_dropShadow" mode="normal"/></filter></defs><g filter="url(#hr6gh2N39iEKGHUEUXPQ1VpI5CnFB6KP)"><mask id="_mask_kcpkNUVqAh3jvumwkzpWdE5WZ1TZaYfV" x="-200%" y="-200%" width="400%" height="400%"><rect x="-200%" y="-200%" width="400%" height="400%" style="fill:white;"/><path d=" M 12.487 8 L 3.513 8 M 8 3.513 L 8 12.487" fill-rule="evenodd" fill="black" stroke="none"/></mask><path d=" M 12.487 8 L 3.513 8 M 8 3.513 L 8 12.487" fill-rule="evenodd" fill="rgb(0,0,0)" mask="url(#_mask_kcpkNUVqAh3jvumwkzpWdE5WZ1TZaYfV)" vector-effect="non-scaling-stroke" stroke-width="3" stroke="rgb(255,255,255)" stroke-opacity="100" stroke-linejoin="miter" stroke-linecap="round" stroke-miterlimit="3"/><path d=" M 12.487 8 L 3.513 8 M 8 3.513 L 8 12.487" fill-rule="evenodd" fill="rgb(0,0,0)"/></g></g></g></g></svg>") !important;
            opacity: 0.7;
          }

          .tab-icon-sound {
            display: none !important;
          }

          /*
            _____ ___   ___  _    ___   _   ___
          |_   _/ _ \ / _ \| |  | _ ) /_\ | _ \
            | || (_) | (_) | |__| _ \/ _ \|   /
            |_| \___/ \___/|____|___/_/  \_\_|_\
          */

          .urlbar-icon > image {
            fill: var(--mff-icon-color) !important;
            color: var(--mff-icon-color) !important;
          }

          .toolbarbutton-text {
            color: var(--mff-icon-color)  !important;
          }
          .urlbar-icon {
            color: var(--mff-icon-color)  !important;

          }

          .toolbarbutton-icon {
          /* filter: drop-shadow(0 0 0.75rem crimson); */
          }

          #urlbar-results {
            font-family: var(--mff-urlbar-results-font-family);
            font-weight: var(--mff-urlbar-results-font-weight);
            font-size: var(--mff-urlbar-results-font-size) !important;
            color: var(--mff-urlbar-results-color) !important;
          }

          .urlbarView-row[type="bookmark"] > span{
            color: green !important;
          }

          .urlbarView-row[type="switchtab"] > span{
            color: orange !important;
          }

          .urlbarView-url, .search-panel-one-offs-container {
            color: var(--mff-urlbar-results-url-color) !important;
            font-family: var(--mff-urlbar-font-family);
            font-weight: var(--mff-urlbar-results-font-weight);
            font-size: var(--mff-urlbar-font-size) !important;
          }

          .urlbarView-favicon, .urlbarView-type-icon {
            display: none !important;
          }

          #urlbar-input {
            font-size: var(--mff-urlbar-font-size) !important;
            color: var(--mff-urlbar-color) !important;
            font-family: var(--mff-urlbar-font-family) !important;
            font-weight: var(--mff-urlbar-font-weight)!important;
            text-align: center !important;
          }

          #tracking-protection-icon-container, #identity-box {
            display: none;
          }

          #back-button > .toolbarbutton-icon{
            --backbutton-background: transparent !important;
            border: none !important;
          }

          #back-button {
            list-style-image: url("data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="isolation:isolate" viewBox="0 0 16 16" width="16pt" height="16pt"><defs><clipPath id="_clipPath_z1ZWMbJsyhiOU2QHbFJoUMhQtGZ43GMW"><rect width="16" height="16"/></clipPath></defs><g clip-path="url(#_clipPath_z1ZWMbJsyhiOU2QHbFJoUMhQtGZ43GMW)"><defs><filter id="VFDVuOTf5K98KT4GTZIfo6t2oUeOZ3OQ" x="-200%" y="-200%" width="400%" height="400%" filterUnits="objectBoundingBox" color-interpolation-filters="sRGB"><feGaussianBlur xmlns="http://www.w3.org/2000/svg" in="SourceGraphic" stdDeviation="1.42936090628390283"/><feOffset xmlns="http://www.w3.org/2000/svg" dx="0" dy="0" result="pf_100_offsetBlur"/><feFlood xmlns="http://www.w3.org/2000/svg" flood-color="#000000" flood-opacity="1"/><feComposite xmlns="http://www.w3.org/2000/svg" in2="pf_100_offsetBlur" operator="in" result="pf_100_dropShadow"/><feBlend xmlns="http://www.w3.org/2000/svg" in="SourceGraphic" in2="pf_100_dropShadow" mode="normal"/></filter></defs><g filter="url(#VFDVuOTf5K98KT4GTZIfo6t2oUeOZ3OQ)"><path d=" M 6.459 8.003 L 12.444 2.018 C 12.609 1.853 12.7 1.633 12.7 1.399 C 12.7 1.164 12.609 0.945 12.444 0.78 L 11.92 0.256 C 11.755 0.091 11.535 0 11.301 0 C 11.067 0 10.847 0.091 10.682 0.256 L 3.555 7.382 C 3.39 7.548 3.3 7.768 3.3 8.003 C 3.3 8.239 3.39 8.459 3.555 8.625 L 10.676 15.744 C 10.84 15.909 11.06 16 11.294 16 C 11.529 16 11.749 15.909 11.913 15.744 L 12.438 15.22 C 12.779 14.879 12.779 14.323 12.438 13.982 L 6.459 8.003 L 6.459 8.003 Z " fill="rgb(255,255,255)"/></g></g></svg>") !important;
          }

          #forward-button {
            list-style-image: url("data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" style="isolation:isolate" viewBox="0 0 16 16" width="16pt" height="16pt"><defs><clipPath id="_clipPath_eVFSl4zvN5oTHPzyWFXDKL3KvwnaLKzR"><rect width="16" height="16"/></clipPath></defs><g clip-path="url(#_clipPath_eVFSl4zvN5oTHPzyWFXDKL3KvwnaLKzR)"><clipPath id="_clipPath_whDLWxO2Es9F8hEuhZ0p3GS4myfSGk47"><rect x="0" y="0" width="16" height="16" transform="matrix(1,0,0,1,0,0)" fill="rgb(255,255,255)"/></clipPath><g clip-path="url(#_clipPath_whDLWxO2Es9F8hEuhZ0p3GS4myfSGk47)"><g><g filter="url(#ypa27OiaF8P4AvdUhn4W059B0fCNWPt7)"><path d=" M 9.541 8.003 L 3.556 2.018 C 3.391 1.853 3.3 1.633 3.3 1.399 C 3.3 1.164 3.391 0.945 3.556 0.78 L 4.08 0.256 C 4.245 0.091 4.465 0 4.699 0 C 4.933 0 5.153 0.091 5.318 0.256 L 12.445 7.382 C 12.61 7.548 12.7 7.768 12.7 8.003 C 12.7 8.239 12.61 8.459 12.445 8.625 L 5.324 15.744 C 5.16 15.909 4.94 16 4.706 16 C 4.471 16 4.251 15.909 4.087 15.744 L 3.562 15.22 C 3.221 14.879 3.221 14.323 3.562 13.982 L 9.541 8.003 L 9.541 8.003 Z " fill="rgb(255,255,255)"/></g><defs><filter id="ypa27OiaF8P4AvdUhn4W059B0fCNWPt7" x="-200%" y="-200%" width="400%" height="400%" filterUnits="objectBoundingBox" color-interpolation-filters="sRGB"><feGaussianBlur xmlns="http://www.w3.org/2000/svg" in="SourceGraphic" stdDeviation="1.42936090628390283"/><feOffset xmlns="http://www.w3.org/2000/svg" dx="0" dy="0" result="pf_100_offsetBlur"/><feFlood xmlns="http://www.w3.org/2000/svg" flood-color="#000000" flood-opacity="1"/><feComposite xmlns="http://www.w3.org/2000/svg" in2="pf_100_offsetBlur" operator="in" result="pf_100_dropShadow"/><feBlend xmlns="http://www.w3.org/2000/svg" in="SourceGraphic" in2="pf_100_dropShadow" mode="normal"/></filter></defs></g></g></g></svg>") !important;
          }

          toolbar {
            background-image: none !important;
          }

          #urlbar-background {
            opacity: .98 !important;
          }

          #navigator-toolbox, toolbaritem {
            border: none !important;
          }

          #urlbar-background {
            background-color: var(--mff-bg) !important;
            border: none !important;
          }

          .toolbar-items {
            background-color: var(--mff-bg) !important;
          }

          #sidebar-search-container {
            background-color: var(--mff-sidebar-bg) !important;
          }

          box.panel-arrowbox {
            display: none;
          }

          box.panel-arrowcontent {
            border-radius: 8px !important;
            border: none !important;
          }

          tab.tabbrowser-tab {
            overflow: hidden;
          }

          tab.tabbrowser-tab:hover {
            box-shadow: 0 1px 4px rgba(0,0,0,.05);
          }

          image#star-button {
            display: none;
          }

          toolbar#nav-bar {
            padding: var(--mff-nav-toolbar-padding) !important;
          }

          toolbar#nav-bar {
            padding: 4px !important;
          }

          #urlbar {
            max-width: 70% !important;
            margin: 0 15% !important;
            /*   position: unset!important; */;
          }

          #urlbar-input:focus {
            color: var(--mff-urlbar-focused-color) !important;
          }


          .megabar[breakout-extend="true"]:not([open="true"]) > #urlbar-background {
            box-shadow: none !important;
            background-color: transparent !important;
          }

          toolbarbutton {
            box-shadow: none !important;
          }


          /*
            ___ ___ ___  ___ ___   _   ___
           / __|_ _|   \| __| _ ) /_\ | _ \
           \__ \| || |) | _|| _ \/ _ \|   /
           |___/___|___/|___|___/_/ \_\_|_\
          */

          .close-icon, .urlbar-icon {
            fill: var(--mff-icon-color) !important;
          }

          .sidebar-placesTree {
            color: var(--mff-sidebar-color) !important;
          }

          #sidebar-switcher-target {
          /*   color: white !important; */
          }

          #sidebar-box {
            --sidebar-background-color: var(--mff-sidebar-bg) !important;
          }

          splitter#sidebar-splitter {
            opacity: 0 !important;
          }

          splitter#sidebar-splitter {
            border: none !important;
            background-color: transparent !important;
          }

          image#sidebar-icon {
            display: none;
          }


          /*
              _   ___ ___  _____      _____  _   _  _ ___ _
             /_\ | _ \ _ \/ _ \ \    / / _ \/_\ | \| | __| |
            / _ \|   /   / (_) \ \/\/ /|  _/ _ \| .` | _|| |__
           /_/ \_\_|_\_|_\\___/ \_/\_/ |_|/_/ \_\_|\_|___|____|
           */

          .panel-arrowcontent {
            padding: 0px !important;
            margin: 0px !important;
          }

          toolbarseparator {
            display: none;
          }
        '';
        userContent = ''
            @import url("userChrome.css");

          /* Removes white loading page */
          @-moz-document url(about:blank), url(about:newtab), url(about:home) {
              html:not(#ublock0-epicker), html:not(#ublock0-epicker) body, #newtab-customize-overlay {
                background: var(--mff-bg) !important;
              }
            }


            /* Hide scrollbar */

            :root{
              scrollbar-width: none !important;
            }


            @-moz-document url(about:privatebrowsing) {

            :root{
              scrollbar-width: none !important;
            }
            }
        '';
      };
    };

  };
}
