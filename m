From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Possible dangerous flaw in the NAT howto
Date: 22 Jun 2003 12:49:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1056278950.667.22.camel@elendil.intranet.cartel-securite.net>
References: <20030622024450.19E60105939@hot.ee>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030622024450.19E60105939@hot.ee>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Elver Loho <kernelpenguin@hot.ee>
Cc: netfilter@lists.netfilter.org

Le dim 22/06/2003 =E0 04:44, Elver Loho a =E9crit :=20
> <elver> I have a question about masquerading. The NAT howto gives an
> example like this: "iptables -t nat -A POSTROUTING -o ppp0 -j
> MASQUERADE", but since it masks the packets that are outgoing on ppp0
> (by the destination IP, interface IP and netmask) then could that rule
> also be exploited by outside hosts tunneling?

Yes, this kind of rule is not imho strict enough, but I quite disagree
with you on the flaw you describe.

> <elver> For example, we have host A on subnet where the gateway to the
> internet is B (running that same rule) and then there are external
> hosts on the internet C and D. A's packets to C and D are masq'ed by
> B, but can't C and D also use B as a IP-level proxy to communicate to
> eachother?

As long as C and D are on a locally attached network (i.e. to external
interface) they surely can. Otherwise, I don't think so.

> <elver> Over LAN the routing is done on the ethernet level usually,
> but over the internet this could possibly done by IP encapsulation
> (RFC 2003 and RFC 1853)

Problem is gateway must support IP-IP tunnels, and an appropriate tunnel
as to be configured. If not, packets will probably get dropped. The only
way to realize this I can think of is source routing use, but is barely
not applicable as most routers drop source routed IP.

[...]
> <elver> Since routing is done at a higher layer (Ethernet layer above
> the IP layer for example) then IP encapsulation could possibly used to
> deliver it to host B.

Providing gateway supports IP-IP tunnel, and is properly configured so B
can use it (see http://lartc.org/howto/lartc.tunnel.ip-ip.html for IP-IP
tunnels configuration), yes, packets can be delivered. Otherwise, you
can't.

1. Gateway does not support IP-IP tunneling

	Gateway receive a packet with protocol filed set to 4 (payload
	is IP). As the gateway has no layer 4 extension to support this
	protocol number, packet gets dropped

	Note that most (not to say all) distribution kernels are build
	with IP-IP tunnel support as module. So, if the box is not
	intentionnaly configured to support them, it won't be likely to.
	Moreover, stock kernel defautl configuration does not include
	IP tunneling support, and so does not include IP-IP.

2. Gateway does support IP-IP tunneling

	2.1 No tunnel is configured with B

		It is likely that packet will be droped as packet cannot
		get associated to an existing interface

	2.2 A tunnel is configured with B

		Then B is likely to be allowed to behave like this ;)


I have not verified this by experience, I do not have the proper setup
right now, but I will.

Therefore, your remark still apply to locally attached external
stations, such as this kind of case :

	A -------- B -------- Internet
			|
			|---- C
			`---- D

C and D are able to get masqueraded though B to the Internet with rule
you describe. To a wider point of vue, allowing routing of packets
through their incoming interface can often lead to flaws. As an example,
it is a basic technic to overcome private VLAN or MAC level ACLs
restrictions. In this cas, it can lead to gateway impersonation.

So, if I agree the fact this rule is weak, I don't think it can be used
by arbitrary hosts on the Internet for impersonation (but can be wrong).


--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

