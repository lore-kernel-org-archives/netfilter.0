From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: nat, dns, public, private, port forwarding, iptables: cant see
 sites on LAN with public DNS
Date: Tue, 25 Jul 2006 13:47:01 +0200
Message-ID: <44C604B5.4090108@plouf.fr.eu.org>
References: <B74511B06DDF514399346C759139F03B8DF163@roma.sjobeck.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <B74511B06DDF514399346C759139F03B8DF163@roma.sjobeck.com>
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

support@sjobeck.com a =E9crit :
>=20
> Now my traffic hits the WAN interface of iptables, is mapped to the
> private IP, hits the box on the LAN. But for traffic originating from
> the box destained to the WAN, it appears to the WAN as just any other
> box coming out of the NAT pool, and appears to come from the gateway's
> WAN interface. It does not appear to come from its public IP.

If I understand you well, this public IP address is distinct from the=20
router's WAN IP address which is used for masquerading the LAN, and you=20
would like to do some 1:1 static NAT in both directions for that box.

> So, here is the part that is "interesting trafic" to my discussion.=20
>=20
> Question 1: Do I care? Do I want those boxes that are mapped to public
> IP's to appear to the WAN to be actually coming from those public IP's?

Don't ask us. You're the only one who can answer this question. If you=20
answer "yes", here is some information.
In iptables, NAT comes in two *independent* forms :
- Destination NAT (DNAT) often used for port forwarding.
- Source NAT (SNAT) often used for masquerading.

As these two forms are independent, bidirectionnal static 1:1 NAT must=20
combine SNAT for outbound communications and DNAT for inbound=20
communications :

iptables -t nat -A POSTROUTING -s private_ip -j SNAT --to public_ip
iptables -t nat -A PREROUTING -d public_ip -j DNAT --to private_ip

Of course the specific 1:1 SNAT rule must appear before the general LAN=20
masquerading rule in the POSTROUTING chain to have precedence over it.

> But, most importantly, is question 2:
>=20
> I can not see the websites that are hosted on this webserver on my LAN,
> since those websites are for domains that have public DNS (and no split
> horizon DNS)(we don't want split horizon DNS). Something is breaking
> when my host tries to see these sites

This is a common issue. See=20
<http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-10.html>.

First, I assume that traffic in the FORWARD chain from the router's LAN=20
interface to the same interface is allowed.

The thing that is breaking is asymmetric routing. The route from a=20
client to the NATed LAN server is through the router, but the return=20
route from the server to a LAN client is direct because they're on the=20
same IP subnet. Return packets from the server must go through the=20
router for proper de-DNAT operation, so you must restore symmetric=20
routing. The usual way of doing this is to perform SNAT on connections=20
routed from the LAN back to the LAN :

iptables -t nat -A POSTROUTING -o lan_iface -s lan_subnet -j SNAT \
   --to router_ip

You can use either the public or private IP address of the router. The=20
drawback of this method is that the server does not see the real client=20
source address. There are possible workaround for this though, such as=20
using the NETMAP target to perform 1:1 SNAT to an unused subnet.

