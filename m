From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Some advice for QoS setup ...
Date: 09 Jan 2003 08:41:46 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042094506.26551.111.camel@rayw.knowledgefactory.co.za>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-eTaH03at3X8oeL4MXX7u"
Return-path: <netfilter-admin@lists.netfilter.org>
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


--=-eTaH03at3X8oeL4MXX7u
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi all

Am I going about this in the right way?

This is what I plan to do :

1. Outgoing www traffic originating from our web servers has priority 1
with min 30% bandwidth and max 60% bandwidth.
2. Outgoing mail traffic (smtp and pop3) originating from our mail
servers has priority 2 with min 5% bandwidth and max 20% bandwidth.
3. Outgoing ftp traffic originating from our ftp servers has priority 3
with min 5% bandwidth and max 10% bandwidth.
4. All other traffic has priority 4 with min 0% bandwidth and max 10%
bandwidth.

I was thinking of using htb and sfq. What should my 'tree that is not a
tree' look like?

I was also planning to use netfilter iptables to mark the traffic and
use tc to filter the packets based on the mark (let's say 1,2,3,4
corresponding to the priorities above).

Any suggestions?

I thought my tree would look something like this:

                              10: (htb)
                                 |
                              10:1 (htb)
                       (rate 512kbps, ceil 512kbps)
                                 |
    ________________________________________________________
   |                  |                  |                  |
10:10 (htb)        10:20 (htb)        10:30 (htb)        10:40 (htb)
(rate 153kbps,     (rate 25kbps,      (rate 25kbps,      (rate 0kbps,
 ceil 306kbps)      ceil 102kbps)      ceil 50kbps)       ceil 50kbps)
   |                  |                  |                  |
  SFQ                SFQ                SFQ                SFQ

Does my tree look correct? Will this tree honour the priorities I want
to set? Is netfilter FWMARK the right way to go here?

Regards

Ray
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

--=-eTaH03at3X8oeL4MXX7u
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA+HRmqh1fuR/Bv+ygRAlRKAJ4o1kIW73RKhvVnTLKYJlwng+ShTgCfUay/
3WmU1N9kmHHRUZ1MfGPbOmI=
=DopE
-----END PGP SIGNATURE-----

--=-eTaH03at3X8oeL4MXX7u--


