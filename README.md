[![Slack Status](http://slack.unoparty.io/badge.svg)](http://slack.unoparty.io)

**All-in-one Unoparty Federated Node Build System (`federatednode`)**

Allows one to easily build a unoparty-server, `unoblock` and/or Unowallet system, with all required components. Uses Docker and Docker compose.

See official counterparty federatednode documentation at <http://counterparty.io/docs/federated_node/>.

Please issue any/all pull requests against **develop**, not **master**.


# SETUP

Due to unoparty requiring custom version of python-altcoinlib and python-bitcoinlib, you may need to install these first:

```
sudo apt install cargo g++
sudo apt-get -y install libclang-dev python3-pip
```

Download and install **python-bitcoinlib** and **python-altcoinlib**:

_Unoparty-lib uses a custom version of python-bitcoinlib + python-altcoinlib that requires a manual install_

```
git clone https://github.com/terhnt/python-bitcoinlib.git
cd python-bitcoinlib
sudo python3 ./setup.py install

cd ..

git clone https://github.com/terhnt/python-altcoinlib.git
cd python-altcoinlib
sudo python3 ./setup.py install
```

You can now proceed with running 
```python3 ./fednode.py```
