From: =?iso-8859-1?Q?Paul_Blond=E9?= <jpb@entel.ca>
Subject: RE: is it possible to block ip packets that contains
	experimentaltcp options ?
Date: Thu, 17 May 2007 08:08:34 -0700
Message-ID: <001901c79895$3d5d1d10$5a05a8c0@nisgaa.net>
References: <F163413C9250D211A55C0060979D5280016AB33A@hertz.rad.nd.edu>
Reply-To: jpb@entel.ca
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <F163413C9250D211A55C0060979D5280016AB33A@hertz.rad.nd.edu>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

I assume that LOG-AND-DROP is your own chain, crafted so that you can
perform both functions with a single entry?



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Paul Blond=E9
=20


> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Marc Cozzi
> Sent: Wednesday, May 16, 2007 5:19 AM
> To: netfilter@lists.netfilter.org
> Subject: RE: is it possible to block ip packets that contains=20
> experimentaltcp options ?
>=20
>=20
>=20
> Glenn,
>=20
> Not sure what you mean by "experimental" however, there are
> some conditions of flags that should never occur on the
> network. These can be trapped with rules similar to the following.
>=20
> iptables -A BLOCKED -m state --state INVALID -j LOG-AND-DROP
> iptables -A BLOCKED -p tcp --tcp-flags ALL ALL -j LOG-AND-DROP
> iptables -A BLOCKED -p tcp --tcp-flags ALL NONE -j LOG-AND-DROP
>=20
>   --marc
>=20
>=20
> > -----Original Message-----
> > From: Glenn Terjesen [mailto:glenn@webcat.no]=20
> > Sent: Wednesday, May 16, 2007 5:24 AM
> > To: netfilter@lists.netfilter.org
> > Subject: is it possible to block ip packets that contains=20
> > experimental tcp options ?
> >=20
> > Hello,
> > got a iptables firewall filtering our servers.
> >=20
> > Is it possible to block tcp packets that contains=20
> > experimental tcp options ?
> >=20
> > AND is it smart to do so ?
> >=20
> >=20
> > --
> > Mvh Glenn Terjesen @ Webcat AS
> > Tlf: +47 37 02 20 20
> > E-post: support@webcat.no
> >=20
>=20


