From: Alexander Samad <alex@samad.com.au>
Subject: Re: 3 iptables accounting questions
Date: Wed, 7 Jul 2004 07:55:24 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040706215524.GB30118@samad.com.au>
References: <200407061017.43252.etienne@unix.za.org> <200407060945.51110.Antony@Soft-Solutions.co.uk> <200407061107.25731.etienne@unix.za.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200407061107.25731.etienne@unix.za.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org


--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 06, 2004 at 11:07:25AM +0200, Etienne Ledoux wrote:
> super answer! tx!
>=20
> 1)
> Should I change the 10.168.0.2/32 to 0.0.0.0/0 ? Would that catch everyth=
ing=20
> on eth0 ? My internal lan is 192.168.0.0/24. But mail is delivered direct=
ly=20
> to the fw which wont pass to the internal network but is also part of the=
=20
> internet traffic. So I guess I have to types of internet traffic.=20
> 192.168.0.0/24 which is the internal network doing the usual stuff on the=
=20
> internet like browsing etc. and mail which is going to/from 10.168.0.2 wh=
ich=20
> is the external ethernet of the firewall.
>=20
> 2) iptables-save -c ACCT
> Unknown arguments found on commandline
>=20
> I guess I'm doing something stupid here. What would the right syntax be ?
>=20
> e.
>=20
> On Tuesday 06 July 2004 10:45, Antony Stone wrote:
> > On Tuesday 06 July 2004 9:17 am, Etienne Ledoux wrote:
> > > Greetings,
> > >
> > > 1) I have a firewall and would like to count all the traffic
> > > entering/leaving the external interface (I want to count only internet
> > > traffic, which is the traffic entering/leaving the external if). Is t=
his
> > > rule right ?
> > >
> > > iptables -N ACCT
> > > iptables -I FORWARD -j ACCT
> > > iptables -I INPUT -j ACCT
> > > iptables -I OUTPUT -j ACCT
> > > iptables -A ACCT -s 10.168.0.2/32 -d 0.0.0.0/0 -o eth0
> > > iptables -A ACCT -s 0.0.0.0/0 -d 10.168.0.2/32 -i eth0

why not something like=20

iptables -t mangle -N ACCT
iptables -t mangle -I PREROUTING 1 -i eth0 -j ACCT
iptables -t mangle -I POSTROUTING 1 -o eth0 -j ACCT

iptables -A ACCT -i eth0
iptables -A ACCT -o eth0


This should capture every thing entering and leave via eth0



> > >
> > > 10.168.0.2 is my external interface ip and is also the ip which my
> > > internal network is natted behind.
> >
> > You want to count traffic addressed *to this machine* from the Internet,
> > and traffic addressed *from this machine* to the Internet, yes?   In th=
at
> > case these rules will work, but there is no point in jumping to the ACCT
> > chain from the FORWARD chain.
> >
> > Remember that FORWARD is *only* for traffic going through the machine, =
and
> > INPUT and OUTPUT are *only* for traffic to/from the machine (ie: *never*
> > for traffic going through it).
> >
> > If you want to count traffic addressed *to any machine on your internal
> > network* from the Internet, and traffic addressed *from any machine on =
your
> > network* to the Internet, then you should use your subnet address in th=
e -s
> > and -d options, not the address of your firewall.
> >
> > At a guess this subnet is going to be 10.168.0.0/24, but I don't know w=
hat
> > netmask you're using.
> >
> > > 2) I would like to save/restore only this accounting rule. I thought
> > > 'iptables-save -c -t ACCT' would work but it doesn't.
> >
> > No, ACCT is not a table (like filter, nat and mangle are) - it is a cha=
in
> > (like FORWARD, INPUT and OUTPUT are).   Don't use -t
> >
> > > 3) How do I flush the accounting stats.
> >
> > iptables -Z ACCT, or iptables -L -Z ACCT -nvx if you want to see the
> > counters immediately before zeroing them.
> >
> > Regards,
> >
> > Antony.
>=20
>=20

--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFA6x/MkZz88chpJ2MRAnhAAKC09CWzv+HXH4m9BKSjW37zSMM2oACeIudB
rqgQPrreEUhQVBZHbMfkRm8=
=DwhE
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--

