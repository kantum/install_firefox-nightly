#/bin/bash
sudo rm -rf /opt/firefox /usr/local/bin/firefox
cd /tmp
wget -O Firefox-nightly.tar.bz2 "https://download.mozilla.org/?product=firefox-nightly-latest-ssl&os=linux64&lang=en-US"
sudo tar -xf Firefox-nightly.tar.bz2 -C /opt
echo "
[Desktop Entry]
Name=Firefox Nightly
Name[fr]=Firefox Nightly
Comment=Browse the Fucking World Wide Web
Comment[fr]=Navigue sur le Putain d'Internet
GenericName=Web Browser
GenericName[fr]=Navigateur Web
X-GNOME-FullName=Firefox Nightly Web Browser
X-GNOME-FullName[fr]=Navigateur Web Firefox Nightly
Exec=/opt/firefox/firefox %u
Terminal=false
X-MultipleArgs=false
Type=Application
Icon=/opt/firefox/browser/chrome/icons/default/default128.png
Categories=Network;WebBrowser;
MimeType=text/html;text/xml;application/xhtml+xml;application/xml;application/vnd.mozilla.xul+xml;application/rss+xml;application/rdf+xml;image/gif;image/jpeg;image/png;x-scheme-handler/http;x-scheme-handler/https;
StartupWMClass=Firefox-nightly
StartupNotify=true
" | sudo tee /usr/share/applications/firefox-nightly.desktop

sudo ln -s /opt/firefox/firefox /usr/local/bin/

sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /opt/firefox/firefox 200
sudo update-alternatives --set x-www-browser /opt/firefox/firefox
