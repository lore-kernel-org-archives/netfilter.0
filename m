From: Glaucius Djalma Pereira Junior <glaucius@gmail.com>
Subject: Re: How to masquerade when using ROUTE
Date: Mon, 9 May 2005 09:19:07 -0300
Message-ID: <f48e768e05050905196a3ffaee@mail.gmail.com>
References: <427D52FA.8020805@fabian-wolter.de>
	<427EFFC3.3040300@riverviewtech.net>
Reply-To: Glaucius Djalma Pereira Junior <glaucius@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <427EFFC3.3040300@riverviewtech.net>
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
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: netfilter@lists.netfilter.org

irc channel is better than an IM program

see you there

On 5/9/05, Taylor, Grant <gtaylor@riverviewtech.net> wrote:
> > I want to route all outgoing port-25-traffic produced by the clients
> > over ppp1. The rest schould take the default route over ppp0.
> >
> > I used the following command:
> >
> > iptables -A PREROUTING -p tcp --dport 25 -t mangle -i eth0 -j ROUTE
> > --oif ppp1
>=20
> This seems reasonable enough.
>=20
> > But the source addresses of the packets are wrong as "tcpdump -ni ppp1"
> > shows:
> >
> > 01:20:24.422756 IP 192.168.0.4.32825 > 160.45.10.13.25: S
> > 2020082843:2020082843(0) win 5840 <mss 1460,sackOK,timestamp 266850[|tc=
p]>
> >
> > 192.168.0.4 is the IP adress of the client which tried to connect to th=
e
> > mailserver 160.45.10.13.25.
> >
> > Masquarding is done to 192.168.0.0/24:
> >
> > # iptables -t nat -L POSTROUTING
> > Chain POSTROUTING (policy ACCEPT)
> > target     prot opt source               destination
> > MASQUERADE  all  --  192.168.0.0/24       anywhere
> >
> > My default route is set to ppp0.
> >
> > So, how can I replace/masquerade the 192.168.0.4 by the official IP
> > address of ppp1?
>=20
> It looks like there might be a chance that traffic that goes out ppp0 and=
 ppp1 are matching your one POSTROUTING rule.  Is there a reason that you a=
re not specifying an interface the traffic is going out to match against?  =
I.e.
>=20
> iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> iptables -t nat -A POSTROUTING -o ppp1 -j MASQUERADE
>=20
> I'm wondering if there is not some confusion in the kernel / routing code=
 as to which source IP to use when going out ppp1.
>=20
>=20
> Grant. . . .
>=20
>=20


--=20
Glaucius Djalma Pereira Junior
glaucius@gmail.com

