From: =?ISO-8859-1?Q?G=E1bor_Igl=F3i?= <mdjake@gmail.com>
Subject: A Linux router/bridge/access point filtering question
Date: Tue, 13 Dec 2005 15:51:35 +0100
Message-ID: <b8fd3ed90512130651o218f4c6cpf37e7fb696524f93@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello!

At home I have a network topology like this:

Internet
 |
[D-Link router] 192.168.0.254
 |             | | |
eth0      [Machine 1,2,3] 192.168.0.1-3
 |
[Linux-box] 192.168.0.4
 |             |
eth1       ra0
 |             |
LAN       WLAN - (my notebook) 192.168.1.x
(friends
machines)
192.168.0.5-x

So I have a wired router having four computers on it (it's a 4
ethernet port type DLink model). One of these machines is a simple
Linux server which has 3 interfaces: eth0 through it connects to the
wired router, eth1 on which it provides connectivity for my friends
computers and ra0 an rt2500 based wireless card.

eth0 and eth1 are bridged actually with brctl (br0). This way
computers connected to eth1 get DHCP, firewalling and NAT services
directly from the DLink router.

Unfortunately current rt2500 code doesn't support AP mode so I run my
ra0 card in Ad-Hoc mode. I set up a DHCP server on the Linux box to
the wireless connection which also provides masquerading for the wlan
network.
(Note: I've tried to include ra0 in the br0 bridge but that way
wireless performance was unacceptable - maybe my rt2500 card didn't
have proper promisc mode support)

I managed to configure this entire setup successfully but I'd like to
achieve one more thing. I'd like to forbid anything except my notebook
to be able to connect to my wlan network. I'd like to do this by
restricting access through mac address filtering. Here's is what I
have now:

As I previously said I run a dhcp3 server on the linux box which
provides 192.168.1.x/24 addresses on the wlan interface. I also set up
SNAT masquerading and ip forwarding (the chain is iptables -t nat -A
POSTROUTING -o br0 -j MASQUERADE).

After experimenting and reading manuals for a few days I managed to
restrict internet access on the wifi net by using the following rules:
iptables -t nat -P PREROUTING DROP #default policy DROP
iptables -t nat -A PREROUTING -s br0 -j ACCEPT #allow connections from
the wired LAN
iptables -t nat -A PREROUTING -s ra0 -m mac --mac-source
00:11:33:e7:52:1a -j ACCEPT # allow only my notebook's NIC to connect
to my wifi network

However I realized that other notebooks with other NICs can still get
DHCP parameters from the dhcp3 server running on the Linux box. I
could configure the server to only serve addresses for my notebook
only but I would prefer if other laptops wouldn't be able to connect
at any level at all - I'd like some rule that drops every packets
coming from other wireless clients with unknown mac addresses. Also I
wouldn't like to restrict my wired LANs in any way.

I have also tried
iptables -A INPUT -i ra0 -m mac --mac-source ! xx:xx:xx:xx:xx:xx -j DROP
iptables -A FORWARD -i ra0 -m mac --mac-source ! xx:xx:xx:xx:xx:xx -j DROP
which didn't do what I liked. Maybe because masquerading, maybe
because of the bridged eth0/1 interfaces.

