From: Thomas Scheffczyk <thomas.scheffczyk@verwaltung.uni-mainz.de>
Subject: Re: DNAT NOT WORKING
Date: Thu, 25 Dec 2003 19:31:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FEB2CEE.601@verwaltung.uni-mainz.de>
References: <20031224102405.67307.qmail@web10105.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="------------enig075359B4C9C9FDF6B723C55B"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031224102405.67307.qmail@web10105.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: madhav bhasin <madhavbhasin@yahoo.com>
Cc: netfilter@lists.netfilter.org

This is an OpenPGP/MIME signed message (RFC 2440 and 3156)
--------------enig075359B4C9C9FDF6B723C55B
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

madhav bhasin wrote:

 > $IT -t nat -A PREROUTING -p TCP -i $INET_IFACE -d
 > &INET_DNS  --dport 53 -j DNAT --to-destinaion $DMZ_DNS
 > $IT -t nat -A PREROUTING -p UDP -i $INET_IFACE -d
 > &INET_DNS  --dport 53 -j DNAT --to-destinaion $DMZ_DNS

IMHO it should be '--to-destination' instead of '--to-destinaion'.


F&G

Thomas

--------------enig075359B4C9C9FDF6B723C55B
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (MingW32)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD4DBQE/6yz4ICWLj6LjFjIRAja8AJiWEY4F45HTWZX3UmC+x43B5eqAAJ0akKH/
4jM7z/eS4uxF0mBDEata+g==
=U/Pi
-----END PGP SIGNATURE-----

--------------enig075359B4C9C9FDF6B723C55B--

