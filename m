From: Alexander Samad <alex@samad.com.au>
Subject: Re: SSH Brute force attacks
Date: Mon, 9 May 2005 08:57:47 +1000
Message-ID: <20050508225747.GQ12091@samad.com.au>
References: <427B93EE.3030905@eccotours.dyndns.org>
	<427C52EC.6020004@riverviewtech.net>
	<200505081120.50939.Alistair@nerdnet.ca>
	<1115578284.c89d25d0e91ec@webmail.harrisonburg.k12.va.us>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Vsi50HYs5tPfr+1I"
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1115578284.c89d25d0e91ec@webmail.harrisonburg.k12.va.us>
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
To: netfilter@lists.netfilter.org


--Vsi50HYs5tPfr+1I
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

How efficient is recent, I currently scan my log files for 'evil'
activity and build up a list of around 2000s ip addresses which I place
into a BLOCKED chain, there is about 2 lines per entry cause I TARPIT
tcp sessions.  But I could more easily manage it with recent as I can
just use the test of are they in the list !

I am presuming it is more efficient to use recent cause it hashes the
address ! can any one confirm this ?

A

On Sun, May 08, 2005 at 02:51:24PM -0400, Dwayne Hottinger wrote:
> Cool.  Ive been having the same issue for quite some time.  Im going to l=
ook
> hard at this.
>=20
> ddh
>=20
>=20
> Quoting Alistair Tonner <Alistair@nerdnet.ca>:
>=20
> > On May 7, 2005 01:32 am, Taylor, Grant wrote:
> > > > One one of my hosted boxes, my logwatch scripts continuously pipe o=
ut my
> > > > ssh and auth log of unsuccessful dictionary attacks
> > > >
> > > > I came across this link : http://blog.andrew.net.au/2005/02/17/
> > >
> > > Not a bad idea, but I think there is a little bit of room for growth.
> >
> >
> > 	Grant:
> > 		I think you've put together the basis for a FAQ on recent/TARPIT here=
 --
> > and
> > I like yer attitude *grin*
> >
> > 	Oskar A:
> >
> > 		If you'd like I can buff the following up some, but I think this dese=
rves a
> > mention in the iptables tutorial:
> >
> > >
> > > # Let's jump to the SSH_Brute_Force chain if this is a new connection=
 that
> > > is not from my IP address. # This will prevent processing these rules=
 for
> > > non SSH traffic.
> > > iptables -A INPUT -p tcp --dport 22 -m state --state NEW -j SSH_Brute=
_Force
> > > # Let's white list some IP addresses.
> > > iptables -A SSH_Brute_Force -s $My_IP_Address -j RETURN
> > > iptables -A SSH_Brute_Force -s $My_Friends_IP_Address -j RETURN
> > > iptables -A SSH_Brute_Force -s $Any_other_IP_that_I_want_to_white lis=
t -j
> > > RETURN # If there have not been 4 NEW connection attempts from this s=
ource
> > > IP address in the last 60 seconds let's return to the INPUT chain. ip=
tables
> > > -A SSH_Brute_Force -m recent --name SSH ! --rcheck --seconds 60 -m re=
cent
> > > --hitcount 4 --set --name SSH -j RETURN # Well, the NEW connection ha=
s been
> > > seen so let's update the SSH recent list. iptables -A SSH_Brute_Force=
 -m
> > > recent --name SSH --update
> > > # I like to log on a line by it's self so I don't have to remember to=
 do it
> > > on my last line prior to the end of my script. iptables -A SSH_Brute_=
Force
> > > -j LOG --log-prefix "SSH Brute Force Attempt:  " # Let's send the per=
son
> > > that is trying to SSH in to us to the TARPIT target and make them thi=
nk
> > > twice before they try again. # TARPIT will force the site that is SSH=
ing in
> > > to us to timeout the connection.  Sure stick you hand in my port, I'l=
l grab
> > > hold of it and not let go, # you will have to chew your arm off and g=
row a
> > > new one and try again.  I'll hold your new arm again and again and ag=
ain
> > > and...  This should slow you down. iptables -A SSH_Brute_Force -j TAR=
PIT
> > > # I can be a mean vindictive SoB (Sweet Old Buzzard.  NOT!)
> >
> > 	I like that in an admin. *grin*
> >
> > 	Alistair Tonner
> > >
> > > I tried putting in comments to explain the logic of what is going on,=
 if
> > > you have any questions please let me know.
> > >
> > >
> > >
> > > Grant. . . .
> >
>=20
>=20
> --
> Dwayne Hottinger
> Network Administrator
> Harrisonburg City Public Schools
>=20
>=20

--Vsi50HYs5tPfr+1I
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFCfplrkZz88chpJ2MRAr4uAJ9HXf1jfyxPeFGjj3xQxsFmj5m0rwCfT5Jn
d5y4qwZocZK3kKVY5jZu33M=
=jU6D
-----END PGP SIGNATURE-----

--Vsi50HYs5tPfr+1I--

