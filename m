From: Ray Leach <raymondl@knowledgefactory.co.za>
Subject: RE: TARPIT target
Date: Tue, 30 Sep 2003 17:40:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064936426.20391.23.camel@raylinux.internal>
References: <7A3B4AA360FDEF448F3390421FC8D731F4143D@coxhpexg.coxhp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-43lm0zFIGNHcOsfq9BUd"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7A3B4AA360FDEF448F3390421FC8D731F4143D@coxhpexg.coxhp.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-43lm0zFIGNHcOsfq9BUd
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-09-30 at 15:58, bmcdowell@coxhealthplans.com wrote:
> Well, I've gotten mixed results.  I did get the TARPIT target to work, bu=
t cannot for the life of me get 'nth' to work also.  It shows up as an opti=
on in the kernel config, but the libipt_nth.so is never created.  I can see=
 a libipt_nth.h in the source, but that's as close as it gets.
>=20
For the libraries to be created, you have to recompile the iptables
userspace proggies.

> One thing that gives me pause is that I am using 1.2.8, and not 1.2.7a.  =
There are two reasons why I think this may be important.  First, the pom is=
 older than the iptables version I am using.  Second, libipt_TARPIT.c and l=
ibipt_TARPIT.d are both found in the source for iptables 1.2.8.  Does this =
not mean that TARPIT is included at least as an option in 1.2.8?  Of course=
, if it is, I can't seem to get it to show up in the kernel menu...
>=20
As above, you need to recompile the iptables source and spcify your
kernel dir as per the INSTALL doc.

> Please forgive any ignorance on my part...
>=20
> Thanks,
>=20
> Bob
>=20
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Cedric Blancher
> Sent: Friday, September 26, 2003 4:32 PM
> To: Bob McDowell
> Cc: netfilter@lists.netfilter.org
> Subject: Re: TARPIT target
>=20
>=20
> Le ven 26/09/2003 =E0 22:45, bmcdowell@coxhealthplans.com a =E9crit :
> > How do I use the TARPIT target?
> > I have iptables 1.2.8 installed and working otherwise.  I'm running Red=
Hat 9.
> > When I try and use
> > 	'iptables -A FORWARD -j TARPIT'
> > I get
> > 	'iptables: No chain/target/match by that name'
>=20
> Your kernel does not support TARPIT.
>=20
> > I have rebuilt the kernel, but I do not see an option for 'TARPIT'
> > anywhere in the netfilter stuff.  Yes, I do have 'experimental' turned
> > on.  I have also deleted iptables completely and used only the source
> > to install it.
>=20
> TARPIT target is in patch-o-matic (extra section). So you have to
> download and install it.
>=20
> 	1. install patch-o-matic (see README)
> 	2. rebuild your kernel from sources that got patched
> 	3. build iptables
>=20
> And it should work.
>=20
> Not that TARPIT only applies to TCP connections. So your previously
> given command won't work :
>=20
> 	cbr@elendil:~$ sudo iptables -A FORWARD -j TARPIT
> 	iptables: Invalid argument
>=20
> You have to specify TCP matching :
>=20
> 	cbr@elendil:~$ sudo iptables -A FORWARD -p tcp -j TARPIT
> 	cbr@elendil:~$ sudo iptables -L FORWARD
> 	Chain FORWARD (policy ACCEPT)
> 	target     prot opt source               destination
> 	TARPIT     tcp  --  anywhere             anywhere
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

--=-43lm0zFIGNHcOsfq9BUd
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/eaPph1fuR/Bv+ygRArvgAJ9yEIWJcwEkXmZQF+opeOMvl856XwCfSVyD
Bv/P3Lr9D7I9KJeOCdloSnA=
=Xu6/
-----END PGP SIGNATURE-----

--=-43lm0zFIGNHcOsfq9BUd--


