From: Felipe <fflores@millicom.com.pe>
Subject: Re: SNAT question
Date: Mon, 01 Mar 2004 20:28:05 -0500 (PET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078190885.4043e325cc3b0@milliweb.millicom.com.pe>
References: <1078185401.4043cdb979aab@milliweb.millicom.com.pe> <200403020022.47603.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403020022.47603.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

Is there any special configuration to do this, perhaps any kernel values?
That's because without set up the ip on the interface that rule doesn't work

Thanks

Felipe

Antony Stone <Antony@Soft-Solutions.co.uk> escribi=F3:

> On Monday 01 March 2004 11:56 pm, Felipe wrote:
>=20
> > It's necessary to set up phisically the public address used in SNAT
> rule ?
> > For this rule:
> >
> > iptables -t nat -A POSTROUTING -s 172.21.0.0/16 -j SNAT --to
> 200.110.2.181
> >
> > For that rule, its necessay set up phisically the IP 200.110.2.181
> over the
> > interface ?
>=20
> No, it is not necessary to set up that address on that interface in
> order to=20
> use that rule and send out packets with that source address.
>=20
> However, if you send out packets with that source address, and you want
> to=20
> receive the replies, the address must exist on whatever machine the
> address=20
> will get routed to.
>=20
> If you are only doing UDP transmits, and never expect a reply, it might
> work.
>=20
> Regards,
>=20
> Antony.
>=20
> --=20
> "The joy of X!!??  I've always hated compiling graphical shite.  You
> have a 10=20
> line program, and it ends up depending on the entire known universe."
>=20
>  - Philip Hands
>=20
>                                                      Please reply to the
> list;
>                                                            please don't
> CC me.
>=20
>=20
>=20

