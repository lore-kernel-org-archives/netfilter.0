From: franck <joncourt_franck@yahoo.co.uk>
Subject: Re: a whitelist for outgoing syn port 80, 443 traffic for hosting
Date: Wed, 07 Feb 2007 21:24:10 +0100
Message-ID: <45CA356A.3000706@yahoo.co.uk>
References: <45CA0B2A.7010704@pacific.net> <45CA1D0E.2040603@yahoo.co.uk>
	<45CA23D0.5050702@pacific.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45CA23D0.5050702@pacific.net>
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
Content-Type: text/plain; charset="windows-1252"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ken A wrote:
>>>> Is anyone aware of a whitelist of hostnames of port 80,443 OUTGOING
>>>> traffic that should be considered 'normal' in a hosting environment?
>>>> ie: SYN traffic to ups.com, authorize.net, technorati, for ecommerce,
>>>> blogging, etc..
>>>>
>>>> Categorizing traffic as good/bad is useful in this day of many php
>>>> remote file include bugs.
>>>>
>>>> Thanks,
>=20
> Maybe this is what you are looking for :
>=20
> http://someonewhocares.org/hosts/zero/
>=20
>> Thanks, but I'm looking for a whitelist for a fairly wide range of web
>> applications, not a blacklist. There are plenty of good blacklists out
>> there. surbl.org, uribl.com , etc. :-)
>> Ken


As a matter of fact, I thought something you can put in a blacklist
could be useful, because it cannot be in the whitelist you are looking
for. But, thinking about it again, it is quite clear I would prefer a
small whitelist rather than a very huge blacklist.

Sorry.

- --
Franck Joncourt
http://www.debian.org
http://smhteam.info/wiki/
GPG server : pgpkeys.mit.edu
Fingerprint : C10E D1D0 EF70 0A2A CACF  9A3C C490 534E 75C0 89FE
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFFyjVqxJBTTnXAif4RAoNBAKDD3HkFIrXh0ibViKiJnuu7l2UQAwCffV1A
tCuQUzJbHAeWcQA6vIoyWqM=3D
=3DsrtS
-----END PGP SIGNATURE-----

	=09
___________________________________________________________=20
Try the all-new Yahoo! Mail. "The New Version is radically easier to use" =
=96 The Wall Street Journal=20
http://uk.docs.yahoo.com/nowyoucan.html


