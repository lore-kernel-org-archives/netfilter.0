From: Curt Brune <curt@acm.org>
Subject: ebtables and iptables and NAT questions
Date: Sun, 2 Mar 2008 18:23:57 -0800
Message-ID: <20080303022357.GA21681@curtisb.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi -

First off -- my sincere thanks to all the folks who work on these
tools.  I been using ipchains/iptables for nearly 10 years now.

Scenario: I have your basic dual NIC Linux box that is my home
firewall box.  One NIC connected to the DSL modem, one NIC for the
interal 10.0.0.0/24 private network.  Using iptables and NAT with no
problems for years.

I get the wild hair up my butt that I want to play with xen and
virtual machines -- with not too much space in my place I figure I
just do it on my firewall box (please no hissing from the audience).

BTW -- I have already read the xen networking guide
http://wiki.xensource.com/xenwiki/XenNetworking and the
"ebtables/iptables interaction on a Linux based bridge"
http://ebtables.sourceforge.net/br_fw_ia/br_fw_ia.html

Very interesting, but I'm still stuck.

As you may know xen uses bridging to connect the VMs to the physical
network.  I soon discovered that creating the bridge interface kills
my NAT.

Setup:

eth0 -- DSL modem
eth1 -- internal 10.0.0.0/24 network.  Also particpates in the xen
bridge, xenbr0.

My test is to try to ping my ISP's gateway from a second host, host2.
ASCII art:

+-----------+    +---------------------------+      +-------------+
| host2     |    |      Firewall Box         |      | ISP         |
| 10.0.0.22 |    |                           |      | 64.81.XX.XX |
|           +--->|eth1                   eth0+----->|             |
|           |    |                           |      |             |
+-----------+    +---------------------------+      +-------------+

The xen bridge script creates a bridge, xenbr0, and renames physical
eth1 to peth1 -- eth1 becomes a virtual interface that is connected to
dom0's vif0.0 interface.  The upshot is peth1, vif0.0 and any domU
virtual interfaces belong to the bridge, xenbr0.

I added some iptable/ebtable LOG statements to see how the traffic
goes when I ping the ISP gateway from host2.  What I saw was (slightly
editted for easy reading):

ebtable: broute BROUTING   :IN=peth1 SRC=10.0.0.22 IP DST=64.81.XX.XX
ebtable: nat  PREROUTING   :IN=peth1 SRC=10.0.0.22 IP DST=64.81.XX.XX
iptable: mangle PREROUTING :IN=xenbr0 PHYSIN=peth1 SRC=10.0.0.22 DST=64.81.XX.XX 
iptable: nat PREROUTING    :IN=xenbr0 PHYSIN=peth1 SRC=10.0.0.22 DST=64.81.XX.XX 
ebtable: filter FORWARD    :IN=peth1 OUT=vif0.0 SRC=10.0.0.22 IP DST=64.81.XX.XX
iptable: mangle FORWARD    :IN=xenbr0 OUT=xenbr0 PHYSIN=peth1 PHYSOUT=vif0.0 SRC=10.0.0.22 DST=64.81.XX.XX 
iptable: filter FORWARD    :IN=xenbr0 OUT=xenbr0 PHYSIN=peth1 PHYSOUT=vif0.0 SRC=10.0.0.22 DST=64.81.XX.XX 
ebtable: nat POSTROUTING   :OUT=vif0.0 SRC=10.0.0.22 IP DST=64.81.XX.XX
iptable: mangle POSTROUTING:OUT=xenbr0 PHYSIN=peth1 PHYSOUT=vif0.0 SRC=10.0.0.22 DST=64.81.XX.XX
iptable: nat POSTROUTING   :OUT=xenbr0 PHYSIN=peth1 PHYSOUT=vif0.0 SRC=10.0.0.22 DST=64.81.XX.XX
iptable: mangle PREROUTING :IN=eth1 SRC=10.0.0.22 DST=64.81.XX.XX
iptable: mangle FORWARD    :IN=eth1 OUT=eth0 SRC=10.0.0.22 DST=64.81.XX.XX
iptable: filter FORWARD    :IN=eth1 OUT=eth0 SRC=10.0.0.22 DST=64.81.XX.XX
iptable: mangle POSTROUTING:OUT=eth0 SRC=10.0.0.22 DST=64.81.XX.XX


I all looked OK to me until the last four lines.  The packet/frame
comes in on peth1, enters the bridge, goes out vif0.0, re-enters on
eth1 and gets forwarded to eth0.

What troubles me is that I expected to see "nat PREROUTING" and "nat
POSTROUTING" lines after the packet re-entered eth1.  The missing "nat
POSTROUTING" line is where the MASQUERADE should have happened.

It seems like the iptables "nat" table was only consulted once, but I
needed it to be hit twice.

Any ideas?

Cheers,
Curt

