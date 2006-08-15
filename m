From: Peter Nabbefeld <Peter.Nabbefeld@gmx.de>
Subject: Having troubles with ipfilter, networking etc.
Date: Tue, 15 Aug 2006 12:35:26 +0200
Message-ID: <ebs7th$p0o$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-9"
To: netfilter@lists.netfilter.org


Hello,

I've got many problems with routing and firewalling. As I've found
anywhere, that I could forward packets using iptables without the need
of a bridge (may also be a misunderstanding), I think this might be the
most helpful mainling list.

My situation:
- I can access the internet from my server (PC).
- I can access my server from my windows notebook (NB), ping works as
well as samba.
- I can ping the internet from my NB using IP, but not DNS.

- My internet connection is using a ASDL/USB modem, using br2684ctl to
establish a device "nas0", which "ppp0" is connected to.
- ppp0 gets an IP assigned from my ISP; nas0 doesn't get any IP.
- I've got a wired interface assigned to "eth0" on PC.
- My WLAN is configured using hostapd on PC, using "wifi0" and "ath0".
- My WLAN is using a bridge (brctl) "br0" bridges "ath0"/"eth0"
- My server is running samba and apache (needing http and webdav access)
- I need to be able to use ping

My routing table:
> Dest            Router          Genmask         Flags Metric Ref
Use Iface
> ar1.ffm.terrali *               255.255.255.255 UH    0      0
0 ppp0
> 192.168.1.0     *               255.255.255.252 U     0      0
0 br0
> 192.168.0.0     *               255.255.255.0   U     0      0
0 eth0
> loopback        *               255.0.0.0       U     0      0        0 lo
> default         ar1.ffm.terrali 0.0.0.0         UG    0      0
0 ppp0

ifconfig
> ath0      Protokoll:Ethernet  Hardware Adresse 00:11:22:33:44:55
>           UP BROADCAST RUNNING PROMISC MULTICAST  MTU:1500  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:28 errors:0 dropped:0 overruns:0 carrier:0
>           Kollisionen:0 Sendewarteschlangenl=E4nge:0
>           RX bytes:0 (0.0 b)  TX bytes:3579 (3.4 Kb)
>
> br0       Protokoll:Ethernet  Hardware Adresse 00:11:22:33:44:55
>           inet Adresse:192.168.1.1  Bcast:192.168.1.255
Maske:255.255.255.252
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:28 errors:0 dropped:0 overruns:0 carrier:0
>           Kollisionen:0 Sendewarteschlangenl=E4nge:0
>           RX bytes:0 (0.0 b)  TX bytes:3579 (3.4 Kb)
>
> eth0      Protokoll:Ethernet  Hardware Adresse 00:11:22:33:44:55
>           inet Adresse:192.168.0.1  Bcast:192.168.0.255
Maske:255.255.255.0
>           UP BROADCAST PROMISC MULTICAST  MTU:1500  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>           Kollisionen:0 Sendewarteschlangenl=E4nge:1000
>           RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)
>           Interrupt:9 Basisadresse:0x2000
>
> lo        Protokoll:Local loop
>           inet Adresse:127.0.0.1  Maske:255.0.0.0
>           UP LOOPBACK RUNNING  MTU:16436  Metric:1
>           RX packets:111 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:111 errors:0 dropped:0 overruns:0 carrier:0
>           Kollisionen:0 Sendewarteschlangenl=E4nge:0
>           RX bytes:11076 (10.8 Kb)  TX bytes:11076 (10.8 Kb)
>
> nas0      Protokoll:Ethernet  Hardware Adresse 00:11:22:33:44:55
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:10 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:10 errors:0 dropped:0 overruns:0 carrier:0
>           Kollisionen:0 Sendewarteschlangenl=E4nge:1000
>           RX bytes:472 (472.0 b)  TX bytes:504 (504.0 b)
>
> ppp0      Protokoll:Punkt-zu-Punkt Verbindung
>           inet Adresse:217.x.y.z  P-z-P:217.a.b.c  Maske:255.255.255.255
>           UP PUNKTZUPUNKT RUNNING NOARP MULTICAST  MTU:1492  Metric:1
>           RX packets:3 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:4 errors:0 dropped:0 overruns:0 carrier:0
>           Kollisionen:0 Sendewarteschlangenl=E4nge:3
>           RX bytes:54 (54.0 b)  TX bytes:61 (61.0 b)
>
> wifi0     Protokoll:UNSPEC  Hardware Adresse
00-11-22-33-44-55-66-77-00-00-00-00 -00-00-00-00
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:5 errors:0 dropped:0 overruns:0 frame:1
>           TX packets:41 errors:0 dropped:0 overruns:0 carrier:0
>           Kollisionen:0 Sendewarteschlangenl=E4nge:199
>           RX bytes:581 (581.0 b)  TX bytes:4793 (4.6 Kb)
>           Interrupt:11 Speicher:e2320000-e2330000

1. I guess, I don't need br0? Probably it is even an error to set an IP
for br0? Should I assign an IP to ath0 instead?
2. I've got a script from the internet (already tried to make some
changes, but isn't yet successful):

> #!/bin/sh
>
> # First we flush our current rules
> iptables -F
> iptables -t nat -F
>
> # Setup default policies to handle unmatched traffic
> iptables -P INPUT ACCEPT
> iptables -P OUTPUT ACCEPT
> iptables -P FORWARD DROP
>
> # Copy and paste these examples ...
> export WIRED_IF=3Deth0
> export WLAN_IF=3Dbr0
> export INET_IF=3Dppp0
> export WIRED_NET=3D192.168.0.0
> export WLAN_NET=3D192.168.1.0
> export WIRED_MASK=3D255.255.255.0
> export WLAN_MASK=3D255.255.255.252
>
> # Then we lock our services so they only work from the LAN
> iptables -I INPUT 1 -i ${WIRED_IF} -j ACCEPT
> iptables -I INPUT 1 -i ${WLAN_IF} -j ACCEPT
> iptables -I INPUT 1 -i lo -j ACCEPT
> iptables -A INPUT -p UDP --dport bootps -i ! ${WIRED_IF} -j REJECT
> iptables -A INPUT -p UDP --dport domain -i ! ${WIRED_IF} -j REJECT
> iptables -A INPUT -p UDP --dport bootps -i ! ${WLAN_IF} -j REJECT
> iptables -A INPUT -p UDP --dport domain -i ! ${WLAN_IF} -j REJECT
>
> # (Optional) Allow access to our ssh server from the WAN
> iptables -A INPUT -p TCP --dport ssh -i ${INET_IF} -j ACCEPT
>
> # Drop TCP / UDP packets to privileged ports
> iptables -A INPUT -p TCP -i ! ${WIRED_IF} -d 0/0 --dport 0:1023 -j DROP
> iptables -A INPUT -p UDP -i ! ${WIRED_IF} -d 0/0 --dport 0:1023 -j DROP
> iptables -A INPUT -p TCP -i ! ${WLAN_IF} -d 0/0 --dport 0:1023 -j DROP
> iptables -A INPUT -p UDP -i ! ${WLAN_IF} -d 0/0 --dport 0:1023 -j DROP
>
> # Finally we add the rules for NAT
> iptables -I FORWARD -i ${WIRED_IF} -d ${WIRED_NET}/${WIRED_MASK} -j DROP
> iptables -A FORWARD -i ${WIRED_IF} -s ${WIRED_NET}/${WIRED_MASK} -j ACCEPT
> iptables -I FORWARD -i ${WLAN_IF} -d ${WLAN_NET}/${WLAN_MASK} -j DROP
> iptables -A FORWARD -i ${WLAN_IF} -s ${WLAN_NET}/${WLAN_MASK} -j ACCEPT
> iptables -A FORWARD -i ${INET_IF} -d ${WIRED_NET}/${WIRED_MASK} -j ACCEPT
> iptables -A FORWARD -i ${INET_IF} -d ${WLAN_NET}/${WLAN_MASK} -j ACCEPT
> iptables -t nat -A POSTROUTING -o ${INET_IF} -j MASQUERADE
> # Tell the kernel that ip forwarding is OK
> echo 1 > /proc/sys/net/ipv4/ip_forward
> for f in /proc/sys/net/ipv4/conf/*/rp_filter ; do echo 1 > $f ; done
>
> # This is so when we boot we don't have to run the rules by hand
> /etc/init.d/iptables save
> # rc-update add iptables default
> # nano /etc/sysctl.conf
> # Add/Uncomment the following lines:
> # net.ipv4.ip_forward =3D 1
> # net.ipv4.conf.default.rp_filter =3D 1

Could anybody here probably please help me ???

Kind regards

Peter Nabbefeld


