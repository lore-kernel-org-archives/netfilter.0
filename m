From: Frederic de Villamil <neuro@seclab.jp>
Subject: Re: simple config question
Date: Sun, 28 Mar 2004 11:53:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040328095350.GA6334@jesus.seclab.jp>
References: <000a01c41470$9dbe3ec0$8a361645@Earthlink.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HcAYCG3uE/tztfnV"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000a01c41470$9dbe3ec0$8a361645@Earthlink.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Eric McAfee <emcafee@earthlink.net>
Cc: netfilter@lists.netfilter.org


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, 27 Mar 2004, Eric McAfee wrote:

> I need to know the iptables command that would restrict all access to my server except for my computer's Dreamweaver program and ccbill's access to my password file. I know it would be some variation of:
> iptables -A INPUT -i ppp0 -p tcp --syn -j DROP

Hi,
what  you're going  to do  is drop  every new  TCP connection  to your
interface ppp0.

What you want to to should be something like that

iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

iptables -A INPUT -s 127.0.0.1 -j ACCEPT
iptables -A OUTPUT -s 127.0.0.1 -j ACCEPT

iptables -A INPUT -s $MACHINE -j ACCEPT
iptables -A OUTPUT -s $MACHINE -j ACCEPT

$machine is your machine IP address.

regards
Frederic
--
http://www.seclab.jp

--HcAYCG3uE/tztfnV
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (FreeBSD)

iD8DBQFAZqCuYBnsNILdO64RAlOHAJ99bo5g4Hf/wRvy46Sv0IMRUIwPAQCfaERE
DjsjDnaRHGY92aiw1DOYJ+4=
=MgQJ
-----END PGP SIGNATURE-----

--HcAYCG3uE/tztfnV--

