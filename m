From: Eric Leblond <eric@regit.org>
Subject: Re: iptables, uids, ssh and port forwarding.
Date: Fri, 19 Dec 2003 23:24:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071872650.2120.12.camel@porky>
References: <23FE389FE273D211BBB000A0C9ADF7E3B28CF7@MAIL1>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-IUo0FMZVDDl0iopD2Ivq"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <23FE389FE273D211BBB000A0C9ADF7E3B28CF7@MAIL1>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Keith Ealanta <kealanta@golfpartners.com.au>
Cc: netfilter@lists.netfilter.org


--=-IUo0FMZVDDl0iopD2Ivq
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le jeu 18/12/2003 =C3=A0 05:19, Keith Ealanta a =C3=A9crit :
> I've gathered that packets forwarded from elsewhere can't be restricted b=
y
> uid.

You can't with standard mean but you can use nufw:
	http://www.nufw.org
to do so.

> Is it different if the user is using ssh port-forwarding?
> What I find myself needing to do is to allow a couple of external
> contractors to have access to different points in our network.
> While adequately trusted (i.e. I'm willing to let them ssh in) I'd like t=
o
> restrict where else they can connect to.
> My thought was that, because the connection is coming through SSH, there =
is
> a local user associated with the connection.
> Can anyone confirm this?

sshd switch to if of user connected. So it has to be a user associated
to if.

> If not, and allowing that the contractors are not on fixed ip addresses, =
how
> would you recommend I allow (an unknown number of) people each to have
> access to a different specific list of address/port pairs in my local
> network?

If it is not the case, you can :
	- or use ipsec with provided keys
	- or use nufw
	- or use both : do tunnel and authenticate people in the tunnel

NR,
--=20
Eric Leblond
Nufw, Now User Filtering Works (http://www.nufw.org)

--=-IUo0FMZVDDl0iopD2Ivq
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Ceci est une partie de message
	=?ISO-8859-1?Q?num=E9riquement?= =?ISO-8859-1?Q?_sign=E9e=2E?=

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/43qKnxA7CdMWjzIRAnttAJ9VM3f7XgEJk0tWWzJPuwmgt41GXgCffuZd
fyk+Qs6P93HkDxBlBG3EDeQ=
=v8XL
-----END PGP SIGNATURE-----

--=-IUo0FMZVDDl0iopD2Ivq--

