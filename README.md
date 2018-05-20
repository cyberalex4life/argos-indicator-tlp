# argos-indicator-tlp
Gnome Shell Indicator for switching **tlp** daemon modes (AC/battery) using Argos API.

![Argos Based TLP Indicator](https://github.com/cyberalex4life/argos-indicator-tlp/blob/master/screenshots/tlp_ac.jpg) ![Argos Based TLP Indicator](https://github.com/cyberalex4life/argos-indicator-tlp/blob/master/screenshots/tlp_bat.jpg)

#### Requirements
- [Argos](https://extensions.gnome.org/extension/1176/argos/) Gnome Shell extension.
- tlp: `sudo apt install tlp`
- one of the following:
    - [pkroot](https://github.com/cyberalex4life/pkroot) - minimum already provided in github repository
    - gksu: `sudo apt install gksu`
    - gnomesu - OpenSuSE only

#### Installation
Install [Argos](https://extensions.gnome.org/extension/1176/argos/) Gnome-Shell extension.

Then:

```
git clone https://github.com/cyberalex4life/argos-indicator-tlp.git
cd argos-indicator-tlp

# cp 'tlp.r.3s.sh' to argos folder
cp -v tlp.r.3s.sh ~/.config/argos/

# cp 'org.freedesktop.policykit.pkexec.tlp.policy' to location
sudo cp org.freedesktop.policykit.pkexec.tlp.policy /usr/share/polkit-1/actions/

# make a copy of pkroot in '/usr/local/bin'
sudo cp pkroot /usr/local/bin/
```

#### Uninstall

```
# rm 'tlp.r.3s.sh'
rm ~/.config/argos/tlp.r.3s.sh

# rm polkit policy and pkroot
/usr/share/polkit-1/actions/org.freedesktop.policykit.pkexec.tlp.policy
sudo rm /usr/local/bin/pkroot
```

Then uninstall Argos if you don't need it anymore.

**Note!**
- To make the indicator ask for password when switching governors, you can either fully install
['pkroot'](https://github.com/cyberalex4life/pkroot) or edit '**org.freedesktop.policykit.pkexec.tlp.policy**' such that these lines:

    ```
    <defaults>
    <allow_any>yes</allow_any>
    <allow_inactive>yes</allow_inactive>
    <allow_active>yes</allow_active>
    </defaults>
    ```
    look like this:
    ```
    <defaults>
    <allow_any>auth_admin</allow_any>
    <allow_inactive>auth_admin</allow_inactive>
    <allow_active>auth_admin</allow_active>
    </defaults>
    ```

- You can also modify second line from '**cpupower.r.3s.sh**':
    ```
    run_as_root="pkroot -d" # gksu; pkroot; gnomesu -c;
    ```
    into:
    ```
    run_as_root="gksu" # gksu; pkroot; gnomesu -c;
    ```
    to use '**gksu**' in Ubuntu or Debian based distro's.

    'gnomesu -c' is meant for OpenSuSE.

    In general "*run_as_root*" has to support the following syntax:
    ```
    run_as_root "<command_or_list_of_commands>"
    ```
    where **""** is the way commands are coded (and **\\\\\\"** is nothing but an escape sequence).

- To further modify position and execution timings read:

    #### [Filename format](https://github.com/p-e-w/argos#filename-format) (for Argos plugins)


    A plugin file may be named anything (it only needs to be executable), but if its name has the special form

    ```
    NAME.POSITION.INTERVAL[+].EXTENSION
    ```

    where

    * `POSITION` consists of an integer (optional) + one of `l` (left), `c` (center) or `r` (right), and
    * `INTERVAL` consists of an integer + one of `s` (seconds), `m` (minutes), `h` (hours) or `d` (days)

    then

    * the dropdown menu button is placed in the panel at `POSITION`, and
    * the plugin is re-run and its output re-rendered every `INTERVAL`, and
    * if `INTERVAL` is followed by `+`, the plugin is additionally re-run each time the dropdown menu is opened.

    `POSITION` may be omitted entirely (in which case the button is placed before all other buttons on the right-hand side of the panel) while `INTERVAL` can be left empty. For example, a script named `plugin.10s.sh` is updated every 10 seconds, the button belonging to `plugin.1c..sh` is positioned just right of the GNOME Shell clock, and `plugin.l.1m.sh` is displayed left of the "Activities" button and updated every minute.
