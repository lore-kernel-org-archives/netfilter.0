From: "Michael" <michael@klintan.cjb.net>
Subject: RE: discard TCP SYN
Date: Wed, 6 Aug 2003 18:43:38 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000101c35c39$e29babd0$c800a8c0@klintan.local>
References: <1060172871.712.13.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1060172871.712.13.camel@elendil.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-9"
To: netfilter@lists.netfilter.org


> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org=20
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of=20
> Cedric Blancher
> Sent: Wednesday, August 06, 2003 2:28 PM
> To: Michael K
> Cc: netfilter@lists.netfilter.org
> Subject: Re: discard TCP SYN
>=20
>=20
> Le mer 06/08/2003 =E0 13:32, Michael K a =E9crit :
> > Then I use stateful inspection, accepting=20
> estabished,related. However,=20
> > the nessus scanner is reporting this:
> > -----
> > The remote host does not discard TCP SYN packets which
> > have the FIN flag set.
>=20
> SYN/FIN packets are valid according to RFC793. RFC specify=20
> that if RST and ACK are not set, and SYN is set, packet must=20
> get treated as opening a connection without examining other flags.
>=20
> > Depending on the kind of firewall you are using, an
> > attacker may use this flaw to bypass its rules.
>=20
> Some people say that some firewalls may accept this kind of=20
> packets through closed ports. That is not Netfilter's behaviour.
>=20
> > Should I be worried?
>=20
> Not with Netfilter.
>=20

Again, hurray for iptables :-)

And thank you!

/Klintan



