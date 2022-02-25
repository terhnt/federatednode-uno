## Versions ##
* v2.2.3 (2017-05-01)
  * COMPATIBLE WITH: `unoparty-lib` `9.55.2` and `unoblock` 1.4.0+
  * Update `unobtaniumd` to `0.13.2-addrindex`
  * Add `vacuum` command
  * A few other docker package tweaks
* v2.2.2 (2016-07-08)
  * COMPATIBLE WITH: `unoparty-lib` `develop` and `unoblock` 1.4.0
  * Short options available for things like --version, --debug, --no-restart, etc
  * unonode tail command - can specify number of lines
  * allow mongodb to bind to host interface (default to localhost)
  * delete respective .egg-info dirs when updating a service
  * limit logfile sizes via docker json-file log rotation
  * create data dir and symlinks to docker volume paths, for convenience
* v2.2.1 (2016-06-26)
  * COMPATIBLE WITH: `unoparty-lib` `develop` and `unoblock` 1.4.0
  * Fixes for more graceful shutdown of services
  * Service config tweaks
* v2.2.0 (2016-06-23)
  * COMPATIBLE WITH: `unoparty-lib` `develop` and `unoblock` 1.3.1
  * Initial (BETA) support for Windows and Mac OS
  * Use named docker volumes instead of host path mapped volumes (mainly for Windows compatibility); remove "data" dir
* v2.1.0 (2016-06-16)
  * COMPATIBLE WITH: `unoparty-lib` 9.54.0 and `unoblock` 1.3.1
  * Numerous bug fixes
  * Tweaks to most unonode subcommands to be able to work with multiple services specified
  * Config files for most components are now stored persistently (and editable) under the federatednode-uno/config directory
* v2.0.0 (2016-06-13)
  * COMPATIBLE WITH: `unoparty-lib` 9.54.0 and `unoblock` 1.3.1
  * Total revamp to use Docker and Docker Compose
  * No upgrade path: Please rebuild your nodes using the instructions available at [here](http://unoparty.io/docs/federated_node/)
* v1.1.3 (2016-01-18)
  * COMPATIBLE WITH: `unoparty-lib` 9.53.0 and `unoblock` 1.3.1
  * Updated `unobtanium` core to 0.11.2
  * Update `mongodb` to 3.0.x
* v1.1.2 (2015-11-01)
  * COMPATIBLE WITH: `unoparty-lib` 9.52.0 and `unoblock` 1.2.0
  * updated nginx version to newest
* v1.1.1 (2015-02-19)
  * numerous smaller bug fixes
* v1.1.0 (2015-02-12)

  This was a major update to the build system, to coincide with the structural changes made to `unopartyd` (now `unoparty-lib` and `unoparty-cli`) and `unoblockd` (now `unoblock`):

  * Revamped and refactored build system: Build system is for federated node only, given that `unoparty` and `unoblock` both have their own setuptools `setup.py` files now.
  * Renamed repo from `unoparty_build` to `federatednode-uno_build`
  * Removed Windows and Ubuntu 12.04/13.10 support.
  * Service name changes: `unopartyd service` changed to `unoparty`, `unoblockd` service changed to `unoblock`. `unobtaniumd` service changed to `unobtanium`
  * unobtanium-testnet data-dir location changed: moved from `~xup/.unobtanium-testnet` to `~xup/.unobtanium/testnet3`
  * All configuration file locations changed:

    * `unoparty`: From `~xup/.config/unopartyd/unoparty.conf` to `~xup/.config/unoparty/server.conf`
    * `unoparty-testnet`: From `~xup/.config/unopartyd-testnet/unopartyd.conf` to `~xup/.config/unoparty/server-testnet.conf`
    * `unoblock`: From `~xup/.config/unoblockd/unoblockd.conf` to `~xup/.config/unoblock/server.conf`
    * `unoblock-testnet`: From `~xup/.config/unoblockd-testnet/unoblockd.conf` to `~xup/.config/unoblock/server-testnet.conf`

  * Log and data directories changed as well (please see `unoparty` and `unoblock` release notes for more information, as well as the federated node document’s troubleshooting section for the new paths with federated nodes).
  * Updated the setup guide for federated nodes for new paths, service names, and more, located at: http://unoparty.io/docs/federated_node/

  * Updating:

    When updating to this new version, please BACKUP all data, and do a complete rebuild. Best way to kick this off is to do:
```
BRANCH=develop wget -q -O /tmp/unonode_run.py https://raw.github.com/terhnt/federatednode-uno_build/${BRANCH}/run.py sudo python3 /tmp/unonode_run.py
```

    When prompted, choose rebuild (‘r’), and then answer the other questions as appropriate. This rebuild should not delete your existing data, but does automatically build out everything for the new configuration files and paths.

    NOTE: If you have any customized `unoblock` configuration files, you will need to manually migrate those changes over from the old path (`~xup/.config/unoblockd/unoblockd.conf`) to the new path (`~xup/.config/unoblock/unoblock.conf`) (please don’t overwrite the new file, but just paste in the modified changes).
