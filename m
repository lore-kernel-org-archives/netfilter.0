From: Joel Newkirk <firewalldude@newkirk.us>
Subject: Re: problem with iptables with forward drop  policy.
Date: 25 Sep 2003 03:24:34 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064474674.1921.507.camel@alpha.newkirk.us>
References: <20030923182247.18490.qmail@servidor1.isabeldeespana.org>
Reply-To: firewalldude@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030923182247.18490.qmail@servidor1.isabeldeespana.org>
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
To: iptables@isabeldeespana.org
Cc: netfilter@lists.netfilter.org

On Tue, 2003-09-23 at 14:22, iptables@isabeldeespana.org wrote:
> I manage a network with three diferent range of IP=B4s 192.168.1.0 ,=20
> 192.168.2.0 and 192.168.3.0.=20
>=20
> I have a router-firewall which connect theese internals networks.=20
>=20
> iptables rules on the router-firewall machine are...=20

> $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -j ACCEPT
> $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
> $IPTABLES -A FORWARD -j LOG=20
> $IPTABLES -A FORWARD -s 192.168.1.19 -j ACCEPT=20

>  From host 192.168.1.19 which is a window machine I ping to machine=20
> 192.168.3.15 which is a linux machine. the result is Ok.=20
>=20
> If I ping from 192.168.1.19 to 192.168.3.35 which is a window machine I=20
> can=B4t get a response.=20

Is this ALL of the rules?  I presume that $INTIF has three IPs, one per
subnet?  In that case, you'd have forwarding from $INTIF back to $INTIF,
which you don't list a rule for.  Your listed rules will allow
192.168.1.19 to ping anything, but if the target it on $INTIF it will
not be allowed to reply.  The linux machine may have a different subnet
configured (like /16) - check "ip route show"  for "192.168.x.x/16", and
also see if there's a route that would allow 192.168.1.0/24 directly on
the interface, instead of listing a "via 192.168.3.1" or something
similar pointing to your router.  (should probably only be three routes
- "192.168.3.0/24 dev eth0", "127.0.0.0/8 dev lo", and "default via
192.168.3.1 dev eth0"...)

> I can ping from router to every IP on every network with forward policy s=
et=20
> as DROP by default.=20

Of course, as that traffic would all hit INPUT and OUTPUT chains for the
box itself...  not FORWARD.

> Could you help me with the problem?=20

Hopefully.

> Thanks in advance.=20

j



