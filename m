From: "Herry Wild" <herry.wild@TENDI.COM>
Subject: pptp-conntrack-nat problem
Date: Tue, 5 Aug 2003 10:38:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <87D4F492F75B66408915EF4FE28149269ADE@mail-pfr.corp.tendi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

Hello everybody,

i have the following configuration:
-----------------------------------------------
W2k client -> SuSE Linux 8.2 router with iptables (NAT) -> W2k PPTP =
Server

on linux i use:
--------------------
2.4.20 kernel source
patch-o-matic Patch
   i ran ./run extra and applied:
      submitted/01_2.4.19 (already applied)
      submitted/01_2.4.20 (already applied)
      submitted/63_ip_conntrack_destroy (already applied)
      base/REJECT-ipv6 (already applied)
      base/psd (already applied)
      extra/pptp-conntrack-nat
      extra/string (already applied)
   i ran make menuconfig
      <*> Connection tracking
      <*>    FTP protocol support
      <*>    IRC protocol support
      <*>    GRE protocol support
      <*>       PPTP protocol support
iptables 1.2.8

i compiled the kernel (once Connection tracking and once as kernel =
embedded)
i compiled iptables

my iptables script lock like:
----------------------------------------
iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i ! eth1 -m state --state NEW,ESTABLISHED,RELATED =
-j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -t nat -A PREROUTING -i eth1 -p 47 -j DNAT --to-destination =
$VPN_SERVER
iptables -t nat -A POSTROUTING -o eth0 -p 47 -j SNAT --to-source $LAN_IP
iptables -A FORWARD -i eth1 -m state --state NEW -p 47 -d $VPN_SERVER -j =
ACCEPT
iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 1723 -j DNAT =
--to-destination $VPN_SERVER
iptables -t nat -A POSTROUTING -o eth0 -p tcp --dport 1723 -j SNAT =
--to-source $LAN_IP
iptables -A FORWARD -i eth1 -m state --state NEW -p tcp -d $VPN_SERVER =
--dport 1723 -j ACCEPT

eth1 is the external network interface.

and now the problem:
------------------------------
I made connections to the VPN Server which is working very well. Now =
sending data through this connection
like FTP, HTTP or Terminalsessions. During the data transfer the linux =
box is closing the connecting and the
LAN is no longer available. If i try this a couple of times the linux =
box is going down and i have to reboot!

have somebody an idea?

thank you for your help

Herry Wild

