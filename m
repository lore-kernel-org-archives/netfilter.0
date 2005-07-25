From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: iptable for single nic
Date: Sun, 24 Jul 2005 23:31:20 -0500
Message-ID: <42E46B18.4090108@gmx.co.uk>
References: <20050725022838.89776.qmail@web42403.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050725022838.89776.qmail@web42403.mail.yahoo.com>
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
To: netfilter <netfilter@lists.netfilter.org>

john decot wrote:
>  i am facing a problem in iptables as follows:
>   i have  single nic which ip is eth0=3D x.x.x.x(public_ip)
>     alias is  eth0:1=3Dy.y.y.y( private_ip)
> the proxy works when ip of server and port 3128 at lan connection=20
> is configured at client side(windows os).
> But doesn't work without that whenever i flow traffic to proxy=20
> server, again i have used ip tables as:
> =20
> iptables -A PREROUTING -t nat -p tcp --dport 80 -i eth0 -j REDIRECT 3128

I suppose not.

    REDIRECT
        This  target  is  only valid in the nat table, in the PRE=AD-
        ROUTING and OUTPUT chains, and user-defined  chains  which
        are only called from those chains.  It alters the destina=AD-
        tion IP address to send the packet to the  machine  itself
        (locally-generated  packets  are  mapped  to the 127.0.0.1
        address).  It takes one option:

        --to-ports port[-port]
               This specifies a destination port or range of ports
               to use: without this, the destination port is never
               altered.  This is only valid if the rule also spec=AD-
               ifies -p tcp or -p udp.

Did you try it with "--to-ports 3128"? I have a couple of transparent=20
proxy sites, and that's what works for me.

Also note that your -i eth0 doesn't do much. It eliminates localhost,=20
but that's all. You might also want "-s y.y.y.0/24" (assuming the LAN on=20
a /24 RFC 1918 network) to restrict to local clients only. Wasn't this=20
in the HOWTO you read?

Another comment is that you'd be a lot better off with a separate NIC=20
for each interface. It's a lot stronger to be able to filter by=20
interface, rather than by source or destination IP. Think: spoofed=20
packets coming in from the outside.

> with above it doesn't work then i tried following
>=20
> iptables -A PREROUTING -t nat -p tcp --dport 80 -i eth0 -j DNAT  $public_=
ip or $private_ip:3128

REDIRECT is a special type of DNAT. You can't DNAT to the iptables=20
machine's own IP.
--=20
     mail to this address is discarded unless "/dev/rob0"
     or "not-spam" is in Subject: header

