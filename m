From: Ranjeet Shetye <ranjeet.shetye2@zultys.com>
Subject: Re: Limit Bandwith
Date: Mon, 12 Apr 2004 12:25:24 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1081797923.6513.167.camel@ranjeet-pc2.zultys.com>
References: <00e801c420a0$b4ea32c0$a8db13ac@gesej.ciasc.gov.br>
	 <200404121643.20591.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404121643.20591.Antony@Soft-Solutions.co.uk>
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

On Mon, 2004-04-12 at 08:43, Antony Stone wrote:
> On Monday 12 April 2004 4:13 pm, cron@odi.com.br wrote:
>=20
> > Hello All,
> >
> > I=B4m new to iptables and also to the list.
> >
> > I have a linux box with 1 mb internet connection with is the host for s=
ome
> > sites and some email and is also the gateway to 5 pcs with fake ip adre=
ss
> > just to provide acess to the internet.
> >
> > Nat is woking  fine but would be very nice to limit the bandwith to the
> > lan. I have no clue where to start. Perhaps someone could anser some
> > questions?
> >
> > Does iptables limit bandwith?
>=20
> Not really, no - it's more of an "all or nothing" filtering mechanism - e=
ither=20
> you decide to allow something, or you decide not to (with certain specifi=
c=20
> exceptions such as SYN packet rate limiting for flood protection).
>=20
> > Any good howto about iptables/bandwith?
>=20
> Check out http://lartc.org - that will do what you need.
>=20
> Regards,
>=20
> Antony.

As Antony said, lartc.org is the home page for the "tc" toolkit (command
is also called "tc") and the "iproute" toolkit (command is called "ip").

specifically look at http://lartc.org/lartc.html#AEN2241 for a
ready-to-run HTB script and http://lartc.org/lartc.html#AEN2233 for a
ready-to-run CBQ script. But do take the time to learn the "tc" (for
"traffic control") architecture and its rich features, its worth the
time.

--=20

Ranjeet Shetye
Senior Software Engineer
Zultys Technologies
Ranjeet dot Shetye2 at Zultys dot com
http://www.zultys.com/
=20
The views, opinions, and judgements expressed in this message are solely
those of the author. The message contents have not been reviewed or
approved by Zultys.



