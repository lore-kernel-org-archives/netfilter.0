From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Time based rules ...
Date: 14 Nov 2002 06:42:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037248941.4556.54.camel@rayw.knowledgefactory.co.za>
References: <1037199668.4556.30.camel@rayw.knowledgefactory.co.za>
	 <200211141038.36884.dharmu@nsecure.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-PQdZAvE8xFupjzLpjWpn"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200211141038.36884.dharmu@nsecure.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: dharmu@nsecure.net
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-PQdZAvE8xFupjzLpjWpn
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi

Yes, all my chains default policies are set to DROP.

I believe in taking the paranoid approach to security: assume everything
is bad and then only allow what you know to go where you want it to. I'm
sure you know the cliche by now :- 'where do you want to go today?'

On Linux we know where we want to go ...

Ray

On Thu, 2002-11-14 at 07:08, Dharmendra.T wrote:
> What is the default polic you have set for? I guess it is by dropping all=
 the=20
> packets froom the forward chain and then you are allowing accordingly.
> Regards,
> Dharmendra.T
> Linux Security Expert
> www.nsecure.net
> dharmu@nsecure.net
> On Wednesday 13 November 2002 20:31, Raymond Leach wrote:
> > Hi
> >
> > Is there a way to put time restrictions on rules?
> > For eaxmple, something like:
> >
> > iptables -A FORWARD -i eth0 -p tcp -sport 1024: -dport 1024: -time
> > 0700:1700 -j DROP
> >
> > It would be nice ...
> >
> > Ray
--=20

--=-PQdZAvE8xFupjzLpjWpn
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA90ymsh1fuR/Bv+ygRAmZvAJ9ctaUpgF4clIp8yIgQrlUIfl7FBQCcD8YO
KOy/ZJD+KlrmM1fEYLt2nDM=
=xqpR
-----END PGP SIGNATURE-----

--=-PQdZAvE8xFupjzLpjWpn--


