From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Messages in log with SNAT target
Date: Mon, 24 Jul 2006 12:24:06 +0200
Message-ID: <44C49FC6.6030504@plouf.fr.eu.org>
References: <44C4903B.3080004@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44C4903B.3080004@gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Anssi Hannula a =E9crit :
>=20
> I've been using this kind of configuration on my Linux router for a few
> years:
>=20
> eth0	80.223.77.223, public internet ip
> eth0:0	10.0.0.1, private network ip

You know that having both internet and a private LAN on the same=20
interface is a *very* bad idea, don't you ? I suppose you have no other=20
choice.

> IP forwarding enabled.
>=20
> And a rule for iptables:
> -A POSTROUTING -s 10.0.0.0/255.255.255.0 -d ! 10.0.0.0/255.255.255.0 -j
> SNAT --to-source 80.223.77.223
>=20
> Kernel IP routing table
> Destination     Gateway         Genmask         Flags Metric Ref    Use=
 Iface
> 10.0.0.0        0.0.0.0         255.255.255.0   U     10     0        0=
 eth0
> 80.223.64.0     0.0.0.0         255.255.240.0   U     10     0        0=
 eth0
> 0.0.0.0         80.223.64.1     0.0.0.0         UG    10     0        0=
 eth0
>=20
> However, I get lots of this kind of messages in the dmesg while routing=
:
> host 10.0.0.4/if2 ignores redirects for 70.35.xxx.xxx to 80.223.64.1.
[and so on]

Here's what happens. On your router box, all routes use the same=20
interface eth0, so when it receives a packet for another destination=20
than the box itself, it sends an "ICMP Redirect" message to the source=20
IP address meaning "hey, there is a more direct route to destination=20
70.35.x.x using gateway 80.223.64.1 instead of me. Please update your=20
routing table".

Happily, the 1.0.0.4 host ignores the "ICMP Redirect" messages. One=20
reason is I think that's a default behaviour of Windows NT. Another=20
reason is that host has probably no direct route to the proposed gateway=20
address. Anyway, if it didn't ignore the "ICMP Redirect", it would=20
probably lose connectivity with internet hosts because of its private=20
address.

Note : destination NAT (DNAT) on the same network blocks the sending of=20
"ICMP Redirect" messages by the routing decision, because destination=20
NAT takes place before the routing decision. But source NAT (SNAT,=20
MASQUERADE) doesn't, because it takes place after the routing decision,=20
so it's too late (see Netfilter diagram in=20
http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO.txt).

You can enable or disable the sending of "ICMP Redirect" messages with=20
the kernel parameter send_redirect.

send_redirects - BOOLEAN
      Send redirects, if router.
      send_redirects for the interface will be enabled if at least one of
      conf/{all,interface}/send_redirects is set to TRUE,
      it will be disabled otherwise
      Default: TRUE

To disable sending "ICMP redirect" on eth0 :

echo 0 > /proc/sys/net/ipv4/conf/all/send_redirects
echo 0 > /proc/sys/net/ipv4/conf/eth0/send_redirects

or :

sysctl -w net/ipv4/conf/all/send_redirects=3D0
sysctl -w net/ipv4/conf/eth0/send_redirects=3D0

