From: Alexander Griesser <alexander.griesser@lkh-vil.or.at>
Subject: Re: iptables - Couldn't load target error
Date: Wed, 19 Dec 2007 12:56:57 +0100
Message-ID: <47690709.2020807@lkh-vil.or.at>
References: <200712191221.58597.schane@osmozis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <busybox-bounces@busybox.net>
In-Reply-To: <200712191221.58597.schane@osmozis.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://busybox.net/cgi-bin/mailman/listinfo/busybox>,
	<mailto:busybox-request@busybox.net?subject=unsubscribe>
List-Archive: <http://busybox.net/lists/busybox>
List-Post: <mailto:busybox@busybox.net>
List-Help: <mailto:busybox-request@busybox.net?subject=help>
List-Subscribe: <http://busybox.net/cgi-bin/mailman/listinfo/busybox>,
	<mailto:busybox-request@busybox.net?subject=subscribe>
Sender: busybox-bounces@busybox.net
Errors-To: busybox-bounces@busybox.net
To: Saravanan Chanemouganandam <schane@osmozis.com>
Cc: busybox@busybox.net, linux-arm@lists.arm.linux.org.uk, netfilter@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Saravanan Chanemouganandam wrote:
> iptables with MASQUERADE support throws Couldn't load target error. The 
> following strace shows that it tries to open libraries in the /lib and in 
> the /usr/lib instead of /lib/iptables.

Maybe because your LD_LIBRARY_PATH needs to be adapted accordingly?

man ldconfig

ciao,
- --
Alexander Griesser (Netzwerkadministration)
E-Mail: alexander.griesser@lkh-vil.or.at | Web: http://www.lkh-vil.or.at
KABEG LKH Villach | Nikolaigasse 43 | 9500 Villach
Tel.:   +43 4242 208 3061 | Fax.:   +43 4242 971 3061
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQFHaQcJ66HVD6KUm1oRAvm8AJ44DrrsphkQ13OGAxB7xKK1Ma8GFQCfatGA
0jeJVKaO0JcQrW5CTlWReaU=
=PlTs
-----END PGP SIGNATURE-----
