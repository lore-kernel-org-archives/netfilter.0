From: Renato Carvalho <carvalho@nooracom.com>
Subject: Re: iptables related
Date: Thu, 11 Dec 2003 10:08:43 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312111008.43743.carvalho@nooracom.com>
References: <20031208191947.GA1603@msservices> <200312081928.28282.Antony@Soft-Solutions.co.uk> <20031208194434.GA1780@msservices>
Reply-To: carvalho@nooracom.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031208194434.GA1780@msservices>
Content-Description: clearsigned data
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Je > hello ,
Je > Iam not able to ping. why ?
Je > iptables -P INPUT DROP
Je > iptables -A INPUT -p tcp --sport 80 -j ACCEPT

You are not able to ping because you dont READ the manual.
There are so many good tutorials about iptables.
=46irst, read this below and you find all your answers. If you cannot find =
why=20
your linux box do not ping, tell us:
http://iptables-tutorial.frozentux.net/


=2D --=20
=2D ------------------------------------------------
Renato Carvalho
<carvalho@nooracom.com>
Nooracom/Technet
+55 21 2221-6995
Linux Registered User #208419 <http://counter.li.org>

A UNIX saleslady, Lenore,
Enjoys work, but she likes the beach more.
	She found a good way
	To combine work and play:
She sells C shells by the seashore.
=2D ------------------------------------------------
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iQCVAwUBP9heS4RJ2OfKh4GMAQIgIgQAjgzxwPgNTtSKJzlwX1nYkXw9KEITaWPP
l04e27xCIRtJwHjdHDn957iTOz9tGHZZMuxU65CSfuZhVqKtH+/vzLPXEQw7ZfAh
ebs6SG//7TyGCUU7U7Dkz2bBgWM1aPsHtmhilD5TgQOCBZLzJJCJxuSKWOUEtXp+
HrRBrBul1A8=3D
=3DiGoC
=2D----END PGP SIGNATURE-----


