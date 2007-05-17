From: =?iso-8859-1?Q?Paul_Blond=E9?= <jpb@entel.ca>
Subject: RE: is it possible to block ip packets that contains
	experimentaltcp options ?
Date: Thu, 17 May 2007 10:25:06 -0700
Message-ID: <000001c798a8$50246a80$5a05a8c0@nisgaa.net>
References: <F163413C9250D211A55C0060979D5280016AB361@hertz.rad.nd.edu>
Reply-To: jpb@entel.ca
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <F163413C9250D211A55C0060979D5280016AB361@hertz.rad.nd.edu>
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

I would guess this refers to the following:

http://www.psc.edu/networking/projects/sack/

or, more generally, the options discussed here:

http://www.snort.org/archive-3-186.html



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Paul Blond=E9
Web Programmer
enTel Communications Inc
jpb@entel.ca
250.633.5151
866.633.2644
=20


> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Marc Cozzi
> Sent: Thursday, May 17, 2007 10:18 AM
> To: netfilter@lists.netfilter.org
> Subject: RE: is it possible to block ip packets that contains=20
> experimentaltcp options ?
>=20
>=20
>  Paul,
>=20
> I believe that's correct. Although I'm still not
> Sure what was originally meant by "experimental tcp options".
>=20
>   -marc
>=20
> > -----Original Message-----
> > From: Paul Blond=E9 [mailto:jpb@entel.ca]=20
> > Sent: Thursday, May 17, 2007 11:09 AM
> > To: netfilter@lists.netfilter.org
> > Subject: RE: is it possible to block ip packets that contains=20
> > experimentaltcp options ?
> >=20
> > I assume that LOG-AND-DROP is your own chain, crafted so that=20
> > you can perform both functions with a single entry?
> >=20
> >=20
> >=20
> > ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > Paul Blond=E9
> > =20
> >=20
> >=20
> > > -----Original Message-----
> > > From: netfilter-bounces@lists.netfilter.org
> > > [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> > Marc Cozzi
> > > Sent: Wednesday, May 16, 2007 5:19 AM
> > > To: netfilter@lists.netfilter.org
> > > Subject: RE: is it possible to block ip packets that contains=20
> > > experimentaltcp options ?
> > >=20
> > >=20
> > >=20
> > > Glenn,
> > >=20
> > > Not sure what you mean by "experimental" however, there are some=20
> > > conditions of flags that should never occur on the network.=20
> > These can=20
> > > be trapped with rules similar to the following.
> > >=20
> > > iptables -A BLOCKED -m state --state INVALID -j=20
> > LOG-AND-DROP iptables=20
> > > -A BLOCKED -p tcp --tcp-flags ALL ALL -j LOG-AND-DROP iptables -A=20
> > > BLOCKED -p tcp --tcp-flags ALL NONE -j LOG-AND-DROP
> > >=20
> > >   --marc
> > >=20
> > >=20
> > > > -----Original Message-----
> > > > From: Glenn Terjesen [mailto:glenn@webcat.no]
> > > > Sent: Wednesday, May 16, 2007 5:24 AM
> > > > To: netfilter@lists.netfilter.org
> > > > Subject: is it possible to block ip packets that contains=20
> > > > experimental tcp options ?
> > > >=20
> > > > Hello,
> > > > got a iptables firewall filtering our servers.
> > > >=20
> > > > Is it possible to block tcp packets that contains=20
> > experimental tcp=20
> > > > options ?
> > > >=20
> > > > AND is it smart to do so ?
> > > >=20
> > > >=20
> > > > --
> > > > Mvh Glenn Terjesen @ Webcat AS
> > > > Tlf: +47 37 02 20 20
> > > > E-post: support@webcat.no
> > > >=20
> > >=20
> >=20
> >=20
>=20
>=20


