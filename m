From: Adam Ellis <aellis@saberlogic.com>
Subject: SMTP Routing Based On Recipient
Date: Mon, 22 Dec 2003 14:28:02 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072121282.10935.12.camel@localhost.localdomain>
Reply-To: aellis@saberlogic.com
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-AR2zcYBhHZCwhks3le4P"
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
To: netfilter@lists.netfilter.org


--=-AR2zcYBhHZCwhks3le4P
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

I am running a MS Exchange 5.5 server and am getting hit with the NDR
(non-delivery report) Reverse Spam Attack as described here:
=20
http://www.tek-tips.com/gviewthread.cfm/lev2/3/lev3/15/pid/10/qid/725829

As the thread describes, there is no way to just turn off NDRs in
Exchange 5.5 - Microsoft is recommending third party utilities.  What I
am wondering is this - would it be possible to redirect SMTP to my Linux
server, use iptables to check that the recipient matches a valid user
from a list I'd supply, and, if so, route the message to the Exchange
server?  And, if no valid recipient is found, the message is simply
dropped.  Is this even a logical way to handle this situation?  Should I
be looking at something like snort instead?  I'm all ears!

Thanks,
--=20
Adam Ellis <aellis@saberlogic.com>
SaberLogic

--=-AR2zcYBhHZCwhks3le4P
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/50XCTVqlkAkp0+wRAgQwAJ9jdN0Jc38jfvYKySQhSXTJCQhyhwCdFgRp
/4HoW4lggbuCb/MIJDPYhDw=
=Csnn
-----END PGP SIGNATURE-----

--=-AR2zcYBhHZCwhks3le4P--

