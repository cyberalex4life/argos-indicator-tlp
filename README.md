# argos-indicator-tlp
Gnome Shell Indicator for TLP daemon, using Argos API


![Argos Based TLP Indicator](https://github.com/cyberalex4life/argos-indicator-tlp/blob/master/screenshots/tlp_ac.jpg) ![Argos Based TLP Indicator](https://github.com/cyberalex4life/argos-indicator-nvidia-prime/blob/master/screenshots/argos-nvidia-prime2.jpg)

#### Installation
Install [Argos](https://extensions.gnome.org/extension/1176/argos/) Gnome-Shell extension.

Then:
```
git clone https://github.com/cyberalex4life/argos-indicator-tlp.git
cd argos-indicator-tlp
cp -v tlp.r.3s.sh ~/.config/argos/
sudo cp org.freedesktop.policykit.pkexec.tlp.policy /usr/share/polkit-1/actions/
sudo cp pkroot /usr/local/bin/
```
**Note!**
Further info to be added soon...
