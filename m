From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Possible dangerous flaw in the NAT howto
Date: Sun, 22 Jun 2003 16:12:43 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030622201243.GB25892@cannon.eng.us.uu.net>
References: <20030622024450.19E60105939@hot.ee>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Doesn't the whole story here imply IP-IP tunneling from two "well"-define=
d
interfaces? Even if my MASQing firewall had IP-to-IP capability, if I had
received such a packet from an arbitrary host, it would have been dropped.
Or maybe I didn't read this email correctly?

Ramin

On Sun, Jun 22, 2003 at 05:44:49AM +0300, Elver Loho wrote:

> I was on #netfilter (irc.freenode.net) earlier and asked about a possib=
le flaw in the NAT howto, but got no reply (people sleeping?) so I'm just=
 going to paste what I said here and go to sleep. (nearing 6am currently)
>=20
>=20
> <elver> I have a question about masquerading. The NAT howto gives an ex=
ample like this: "iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE", =
but since it masks the packets that are outgoing on ppp0 (by the destinat=
ion IP, interface IP and netmask) then could that rule also be exploited =
by outside hosts tunneling?
> <elver> For example, we have host A on subnet where the gateway to the =
internet is B (running that same rule) and then there are external hosts =
on the internet C and D. A's packets to C and D are masq'ed by B, but can=
't C and D also use B as a IP-level proxy to communicate to eachother?
> <elver> Over LAN the routing is done on the ethernet level usually, but=
 over the internet this could possibly done by IP encapsulation (RFC 2003=
 and RFC 1853)
> <elver> Coming back to the example, C tunneling through B to D would lo=
ok something like [ IP layer: from C to B [ IP layer: from C to D [ TCP l=
ayer [ Data ] ] ] ]
> <elver> RFC 2003 does however define that if the source IP is the same =
as any interface on itself, then it should drop it. So therefore, C can't=
 fake the address part to be B. However, with masquerading, it would NAT =
the connection and thus to D it would appear as if the data was coming fr=
om B.
> <elver> Since Netfilter does NAT in the POSTROUTING table, then it only=
 cares about the outgoing interface, which would be ppp0 or whatever your=
 internet link might be.
> <elver> The problem would be delivering the packet to B so that B would=
 think that it is outgoing on it's internet link.
> <elver> Since routing is done at a higher layer (Ethernet layer above t=
he IP layer for example) then IP encapsulation could possibly used to del=
iver it to host B.
> <elver> The quick and dirty masquerading part of the NAT howto at netfi=
lter.org (http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-4.html#=
ss4.1) does not build any safeguards against this.
> <elver> Sensible way would be denying all forwarding requests coming in=
 over the internet link.
> <elver> Potentially this could mean that there are hundreds of Linux ga=
teways out there that could be used as anonymous proxies.
> <elver> Funny. The Masquerading Simple Howto (http://www.linuxdocs.org/=
HOWTOs/Masquerading-Simple-HOWTO/summary.html) DOES address that specific=
 security hole by adding "iptables -A FORWARD -i eth0 -o eth0 -j REJECT".
> <elver> So I would say that anyone using just netfilter.org howto could=
 be vulnerable. (http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-=
4.html#ss4.1)
>=20
>=20
> This inconsistency between howtos was pointed out by Peter Johansson (x=
-g@gamleby.net) when he was looking for docs while setting up his Linux g=
ateway. I did the additional research into the subject.
>=20
>=20
> Elver Loho
> kernelpenguin@hot.ee
>=20
> -----------------------------------------
> Hot Mobiil - helinad, logod ja pilts=F5numid!
> http://portal.hot.ee
>=20

