From: Netfilter Subscription <netfilter@quintux.com>
Subject: Need help simplifying network setup
Date: Sun, 30 Apr 2017 18:14:27 +0200
Message-ID: <db596221c405d6e14f5ce4e5791ef493@piserver.lan.quintux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi all,

I'm trying to simplify the following setup that I currently have:

  +-----+   +------+     +----------------+     +------+
-|modem|---|switch|-----|+-----+   +----+|-----|switch|---- LAN
  +-----+   +------+     ||eth0 |   |eth1||     +------+
                |        |+-----+   +----+|         |
                |        ||veth0|         |         |
                |        |+-----+   router|         |
                |        +----------------+         |
                |                                   |
                |             +------+              |
                +-------------|bridge|--------------+
                              +------+

The "bridge" is an RPi only bridging packets from/to specific MAC 
address on the LAN.  This is needed for the TV-boxes of my supplier, 
which demand having direct connection with the modem (but apperently 
only need IP and a DHCP address assigned by the router, no multicast or 
other more complex stuff).  The EBTables rules used:

   INPUT -P DROP
   INPUT -A -i eth1 -j ACCEPT    # allow us to access the bridge from our 
LAN and give it a DHCP address from there
   OUTPUT -P DROP
   OUTPUT -A -o eth1 -j ACCEPT   # same reason as above
   FORWARD -P DROP
   FORWARD -A -d 68:63:59:33:49:d7 -i eth0 -j ACCEPT
   FORWARD -A -s 68:63:59:33:49:d7 -o eth0 -j ACCEPT
   FORWARD -p ARP -d Broadcast -i eth0 --arp-op Request --arp-mac-dst 
0:0:0:0:0:0 -j ACCEPT
     # allow the modem's ARP request onto the LAN
     # but ARP responses will only be allowed back from the host with 
above MAC address

The router is also an RPi, but because it wants 2 Internet addresses (to 
mimic 2 separate hosts), it has a macvlan veth0 attached to eth0.  The 
IPTables rules are a bit too complex to list here, but include some DNAT 
via nat/PREROUTING to forward requests for specific ports on veth0 to a 
host on the LAN and obviously masquerading for anything going out to the 
Internet over eth0.  It also has a DHCP server which is configured to 
ignore requests from the MAC addresses that bridge allows to pass (since 
those hosts will get their DHCP address from the modem).

All this works fine for the moment.  It took me sufficient headaches to 
get to this point, but I'm happy with the result, except for one thing: 
it takes a lot of hardware.  If I could combine the bridge and router 
together to a single BROUTER, it would remove 2 switches and 1 RPi, 
which all waste electricity ...

In an attempt to address that, I tried adding eth0 of the router to a 
bridge, but that failed because of the existence of veth0 (the macvlan 
type bridge interface attached to eth0).  That seems logical, but then I 
started wondering how I can get the same functionality with a bridge.  
Adding eth0 to the bridge (when there is no macvlan attached) is a 
breeze, but how do I then get an additional interface with a second MAC 
address that can get its own DHCP address from the modem?  I tried 
adding a n interface-pair with "ip link add dev veth0 address 
xx:xx:xx:xx:xx:xx type veth peer name veth0b" and then adding veth0b to 
the bridge.  Unfortunately without additional changes this veth0 was 
unable to get a DHCP address.  Possibly the (empty) ebtables and 
(unchanged) iptables rules might play a role here, but I'm unsure 
whether this approach would really be the correct one ...

So, first question: How to implement the equivalent of a macvlan (type 
bridge) with an actual Linux bridge?  Of course additional info on how I 
could collapse the above setup to a single Linux BROUTER would always 
help.

Thanks in advance,
K
