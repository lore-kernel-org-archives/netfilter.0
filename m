From: "Wang, Baojun" <wangbj@lzu.edu.cn>
Subject: Re: SYN Proxy for iptables?
Date: Tue, 24 Apr 2007 09:44:38 +0800
Message-ID: <377440548.13549@eyou.net>
References: <377364863.05092@lzu.edu.cn>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart7277508.GFY4uqRNTz";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <377364863.05092@lzu.edu.cn>
Message-Id: <200704240944.38382.wangbj@lzu.edu.cn>
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

--nextPart7277508.GFY4uqRNTz
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hope this solve this problem:

# This enables SYN flood protection.
# The SYN cookies activation allows your system to accept an unlimited
# number of TCP connections while still trying to give reasonable
# service during a denial of service attack.
if [ "$SYSCTL" =3D "" ]
then
    echo "1" > /proc/sys/net/ipv4/tcp_syncookies
else
    $SYSCTL net.ipv4.tcp_syncookies=3D"1"
fi

make sure `CONFIG_SYN_COOKIES' is compiled into the kernel while configurin=
g=20
the kernel.

On Tuesday 24 April 2007 03:24, Andrew Kraslavsky wrote:
> Hello,
>
> For SYN flood protection, it seems OpenBSD's pf deploys something they ca=
ll
> a "SYN proxy" whereby the 3 step TCP handshake is completed by this proxy
> so as to avoid SYN floods to the actual target.
>
> This OpenBSD pf feature is described here:
> http://www.openbsd.org/faq/pf/filter.html#synproxy
>
> The target is only brought into the picture if and when the handshake is
> complete.
>
> I guess pf must then adjust the real target's sequence numbers so as not =
to
> confuse the initiator of the connection.
>
> Has something like this been implemented via iptables?
>
> If not, are there any plans to do so?
>
> Thanks,
>
> - Andrew Kraslavsky
>
> _________________________________________________________________
> MSN is giving away a trip to Vegas to see Elton John.=EF=BF=BD Enter to w=
in today.
> http://msnconcertcontest.com?icid-nceltontagline

=2D-=20
Wang, Baojun                                        Lanzhou University
Distributed & Embedded System Lab              http://dslab.lzu.edu.cn
School of Information Science and Engeneering        wangbj@lzu.edu.cn
Tianshui South Road 222. Lanzhou 730000                     .P.R.China
Tel:+86-931-8912025                                Fax:+86-931-8912022

--nextPart7277508.GFY4uqRNTz
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQBGLWEGIuIOr7tpgg0RAptyAJ9RyGoDbBYxoaTht9cLuLSvRASPIgCgkVFx
tO9YpPckxrzAfkMK98hkpT0=
=cXH9
-----END PGP SIGNATURE-----

--nextPart7277508.GFY4uqRNTz--

