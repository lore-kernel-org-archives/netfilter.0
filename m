From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: RE: intermittent and unreliable behaviour with iptables scripts
Date: 13 Nov 2002 17:16:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037200566.4557.37.camel@rayw.knowledgefactory.co.za>
References: <91F7518FF779D41181A700010266356D015555DE@mail.springbound.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-63yppBsOBVW84NNl3UKm"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <91F7518FF779D41181A700010266356D015555DE@mail.springbound.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>


--=-63yppBsOBVW84NNl3UKm
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2002-11-13 at 16:34, Doug Watson wrote:
> Thank you for your prompt response.
>=20
> If there really is a bug in ip_conntrack
> that makes me unfortunately skiddish about=20
> continuing on with netfilter/iptables as a=20
> viable solution for my company. Yet it seems=20
> like many people have implemented this and have
> not seen these types of problems.
>=20
hmm... me neither

> I have run the script that you sent me several times.
> Attached is a sample output from it. I don't believe that
> I am seeing anything too strange, but I do have 1 question.
> in the following line which you will see in the attached file
> what does the (policy ACCEPT 4 packets, 284 bytes) mean?
> Chain OUTPUT (policy ACCEPT 4 packets, 284 bytes)
>=20
It means that the default policy for the OUTPUT chain is to accept
packets and that there have been 4 packets totalling 284 bytes tested
against this chain.

> Is that the total number of packets to traverse the OUTPUT=20
> chain or it he number of packets ACCEPTED by the policy for the=20
> OUTPUT chain? Or something else?
>=20
As above ...

> Thank you,
> Doug Watson
>=20
> -----Original Message-----
> From: alex [mailto:alex@bennee.com]
> Sent: Monday, November 11, 2002 6:19 PM
> To: Doug Watson
> Cc: 'netfilter@lists.netfilter.org'
> Subject: Re: intermittent and unreliable behaviour with iptables
> scripts
>=20
>=20
> On Mon, 2002-11-11 at 17:25, Doug Watson wrote:
> >  However, I along with my test group of 5 "lucky" users began to see
> > some
> > intermittent and unreliable behavior when accessing the internet
> > through
> > this new firewall most notably when browsing the web.=20
> >=20
> > When browsing the web, web pages that normally would load very
> quickly
> > seem=20
> > to hang for an inconsistent amount of time, anywhere between 1
> second
> > to 30 seconds or more
> > before they would even begin to load or would at times never load at
> > all as
> > if the connection to the web was lost.
>=20
> This sound familiar to my own woes with port forwarded connections. I
> suspect a bug in ip_conntrack that somehow causes FORWARDED packets to
> end up in the output chains. I've been trying to find out exactly when
> this occurs and why (and certainly why my older script worked without
> problems).
>=20
> You could try a using a variation of this script to monitor your
> connections "live" and see which rule starts dropping when you
> experience your problems. Try using it with something like watch:
>=20
>     iptables -Z -t nat
>     iptables -Z
>     watch -n 5 -d ./dumpview
>=20
> #!/bin/bash
> #
> # dumpview - try and see where the packets get dropped.
> #
> echo "DNAT Stuff"
> iptables -nvL -t nat
> echo "Dropped packets of normal chains"
> iptables -nvL | egrep "Chain|DROP"
> echo "Connections"
> cat /proc/net/ip_conntrack | wc -l
> echo "Web Connections"
> cat /proc/net/ip_conntrack | grep "port=3D80"=20
>=20
> --=20
> alex <alex@bennee.com>
> My own hacking haven
--=20

--=-63yppBsOBVW84NNl3UKm
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA90my1h1fuR/Bv+ygRApxvAJ0SHyn0077JAS9nL/fCGmNwItZSmQCgqk+x
NMSayBa1/s0xniNLrWsuLTA=
=drqi
-----END PGP SIGNATURE-----

--=-63yppBsOBVW84NNl3UKm--


