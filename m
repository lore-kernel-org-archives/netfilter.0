From: "Simon Garner" <sgarner@expio.co.nz>
Subject: NAT with two Internet links
Date: Thu, 16 Oct 2003 19:37:31 +1300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <01b801c393b0$3c837080$0301a8c0@SIMON>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I have a small network with several Windows client PCs, a Linux
firewall/server, and two links to the Internet. What I want to do is
have certain traffic (based on source and/or destination ports) routed
through one link while everything else goes through the other.

The first link is a 256k wireless/radio connection with a static IP. The
second is a 128k ADSL connection via an external ADSL modem/router with
a dynamic IP.

The Linux (2.4) firewall machine has two network interfaces, eth0
[192.168.1.2] connects it to the LAN, and eth1 [1.2.3.4] which plugs
straight into the wall (the wireless link).

The ADSL modem has a LAN IP [192.168.1.1] and itself acts as a NAT
device.

All the client PCs are set to use the Linux firewall as their gateway,
and I have it set up to do NAT. The Linux firewall has two default
gateway addresses, one for eth0 (the ADSL router, 192.168.1.1) and one
for eth1 (the wireless gateway, 1.2.3.3). Currently eth1 is set as the
lower metric so that all data is going out through the wireless link,
and the ADSL is not being used. If I swap this around, vice versa works
also.

How can I set it up to route some data out through eth1 and some through
the ADSL (based on sport/dport)? I've tried adding a rules like:

/sbin/iptables -t nat -A POSTROUTING -p tcp --dport 80 -o eth0 -j
MASQUERADE
/sbin/iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

But this doesn't seem to do anything, http is still routed through the
wireless.

Help!

-Simon


