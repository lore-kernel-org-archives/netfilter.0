From: Nikolai Geogriev <voyager123bg@gmail.com>
Subject: Re: IP Tables slows network response times
Date: Sun, 14 Aug 2005 21:00:25 +0300
Message-ID: <a5561e950508141100178576cc@mail.gmail.com>
References: <57F9959B46E0FA4D8BA88AEDFBE5829074AD@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <57F9959B46E0FA4D8BA88AEDFBE5829074AD@pxtbenexd01.pxt.primeexalia.com>
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
To: "Gary W. Smith" <gary@primeexalia.com>
Cc: netfilter@lists.netfilter.org, Eric Leblond <eric@inl.fr>

I think correct should be:
itpables -I INPUT -i lo -j ACCEPT (guess you misspeled it in the hurry)
forward rule for loopback is not necesary, as long as i remember
iptables -I OUTPUT -o lo -j ACCEPT;


On 8/14/05, Gary W. Smith <gary@primeexalia.com> wrote:
> Something like the following (off the top of my head, so syntax may not
> be exact)
>=20
> iptables -I INPUT -o lo -j ACCEPT
> iptables -I FORWARD -o lo -j ACCEPT
> iptables -I OUTPUT -o lo -j ACCEPT
>=20
> Basically, tell the server to allow anything originating from loopback
>=20
> > -----Original Message-----
> > From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> > bounces@lists.netfilter.org] On Behalf Of Michael Hallager
> > Sent: Sunday, August 14, 2005 2:55 AM
> > To: Eric Leblond; netfilter@lists.netfilter.org
> > Subject: Re: IP Tables slows network response times
> >=20
> > Hi Eric.
> > > More over, add a rule to accept loopback traffic on INPUT, blocked
> > > loopback traffic could explain problem you have.
> >=20
> > Could you please provide a sample of this rule?
> > --
> > Michael Hallager
> > networkStuff ltd
> > www.networkstuff.co.nz | p.09.839.1000 | m.029.638.7883
>=20
>=20
>

