From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: Problem with IPtables/Netfilter hooks
Date: 20 Feb 2003 14:01:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045742461.2848.132.camel@rayw.knowledgefactory.co.za>
References: <20030218114034.47859.qmail@web10802.mail.yahoo.com>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-ZTwyXBKk79PVs1QnYW6q"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030218114034.47859.qmail@web10802.mail.yahoo.com>
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


--=-ZTwyXBKk79PVs1QnYW6q
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Tue, 2003-02-18 at 13:40, paridhi bansal wrote:
> Hi!!
>=20
> I am a newbie to iptables...I was trying to understand
> the hooks defined in netfilter.With natting enabled,
> every pkt shld ideally come to Prerouting hook and
> then only move to input hook if it is for local m/c
> itself or forward hook if it is to be forwardedand
> finally to postrouting..
> This is what i have understood..and i hope this is
> correct..If not,,pls correct me and give ur comments..
>=20
PREROUTING and POSTROUTING are only used when the packet is not destined
for the local host... correct.

> But my analysis of pkts says that sometimes, the pkts
> meant for the local machine come directly to the input
> hook rather than the prerouting hook..Is it
> right?????Is yes, why/when does this happen??If no,
> can what can be the case when this happens??
>=20
That is correct. Since the packets are destined for the local host,
there is no routing (or forwarding).

> Paridhi
>=20
>=20
> __________________________________________________
> Do you Yahoo!?
> Yahoo! Shopping - Send Flowers for Valentine's Day
> http://shopping.yahoo.com
--=20
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(  Raymond Leach                       )
 ) Knowledge Factory                  (
(                                      )
 ) Tel: +27 11 445 8100               (
(  Fax: +27 11 445 8101                )
 )                                    (
(  http://www.knowledgefactory.co.za/  )
 ) http://www.saptg.co.za/            (
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   o                                o
    o                              o
        .--.                  .--.
       | o_o|                |o_o |
       | \_:|                |:_/ |
      / /   \\              //   \ \
     ( |     |)            (|     | )
     /`\_   _/'\          /'\_   _/`\
     \___)=3D(___/          \___)=3D(___/

--=-ZTwyXBKk79PVs1QnYW6q
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+VMN9h1fuR/Bv+ygRAqyCAJ42+rqaOxL4uFI71KmUBZRsoQB1gwCeLn7u
mYWNI2nIbNbZqOPuzPKnHBI=
=o/oj
-----END PGP SIGNATURE-----

--=-ZTwyXBKk79PVs1QnYW6q--


