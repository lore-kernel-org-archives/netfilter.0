From: Sven Anders <anders@anduras.de>
Subject: Reset conntrack?
Date: Wed, 01 Dec 2004 15:12:52 +0100
Message-ID: <41ADD164.6000803@anduras.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="------------050406010102080408020106"
Return-path: <netfilter-bounces@lists.netfilter.org>
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

This is a multi-part message in MIME format.
--------------050406010102080408020106
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Is it possible to reset the conntrack list or set any entry to the state NE=
W to force
a recheck against new filter rules?

The problem is:
~  If I set the (new) filtering rules with the target DROP, I want old
~  (existing) connections to be dropped immediatly.
~  The global rule '--state RELATED,ESTABLISHED' I set would still allow th=
em...

(Please answer directly too, because I'm not subscribed to this list!)

Regards
~ Sven

- --
~ Sven Anders <anders@anduras.de>

~ ANDURAS service solutions AG
~ Innstra=DFe 71 - 94036 Passau - Germany
~ Web: www.anduras.de - Tel: +49 (0)851-4 90 50-0 - Fax: +49 (0)851-4 90 50=
-55

Rechtsform: Aktiengesellschaft - Sitz: Passau - Amtsgericht Passau HRB 6032
Mitglieder des Vorstands: Sven Anders, Marcus Junker, Michael Sch=F6n
Vorsitzender des Aufsichtsrats: Dipl. Kfm. Karlheinz Antesberger
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFBrdFj5lKZ7Feg4EcRAs18AJsHAAhGH+grtjJMraakWqtzFb99AgCeONtw
1N28gx4MrLGwd3kkpIIzUUw=3D
=3DoJ2Q
-----END PGP SIGNATURE-----

--------------050406010102080408020106--

