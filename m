From: "Thomas Raef" <traef06@ebasedsecurity.com>
Subject: RE: missing  ip_set_ipporthash.h
Date: Thu, 9 Feb 2006 15:13:34 -0600
Message-ID: <D2EA20593E6AAD4DA6D07DE0EC12D161013334@ebs-2200.ebasedsecurity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="iso-8859-1"
To: =?iso-8859-1?Q?Samuel_D=EDaz_Garc=EDa?= <samueldg@arcoscom.com>
Cc: netfilter@lists.netfilter.org

When I try to 'make' in the ipset-2.2.8 directory, I get:

Ipset_ipporthash.c:31:52: linux/netfilter_ipv4/ip_set_ipporthash.h: No =
such file or directory

And find / -name ip_set_ipporthash.h shows nothing.

Please help!

Where I am going wrong?

I've created links as suggested.


-----Original Message-----
From: Samuel D=EDaz Garc=EDa [mailto:samueldg@arcoscom.com]=20
Sent: Thursday, February 09, 2006 11:50 AM
To: Thomas Raef
Cc: netfilter@lists.netfilter.org
Subject: Re: missing ip_set_ipporthash.h

I compile fine with 2.6.x (from 2.6.12 to 2.6.15.3 tested).

In README says that you need to apply "set" patch from patch-o-matic.

I always make kernel, and iptables with "all" patches without problems.

Create a link called linux into /usr/src to your kernel sources root =
(for=20
example "ln -s /usr/src/linux-2.6.15.3 /usr/src/linux)

The same with iptables ("ln -s /usr/src/iptables-1.3.5 =
/usr/src/iptables").

Put your pom-ng directory where you want, cd into your pom-ng directory =
and do=20
"./runme set"

Compile and install your kernel.

Disable your iptables boot scripts before reboot ("chkconfig --level =
2345=20
iptables off" under Fedora).

Reboot with your new kernel.

Goto your iptables sources directory, make and make install. Remember to =

uninstall your previous iptables package before install the new iptables =
or=20
rename old binaries/libs/libs directories.

The next is go into your ipset-2.2.8 directory and "make clean && make =
&& make=20
install"

That's all (as I remember).

Good luck.

Thomas Raef wrote:
> I'm trying to compile ipset-2.2.8 on my Debian Sarge 2.6.15 system I
> keep getting:
>=20
> linux/netfilter_ipv4/ip_set_ipporthash.h no such file or directory
>=20
> When I do:
>=20
> Find / -name ip_set_ipporthash.h
>=20
> It finds nothing.
>=20
> Please help
>=20
> Thank you in advance.
>=20
>=20
> Thomas J. Raef
> e-Based Security, Inc.
> www.ebasedsecurity.com
> "You're either hardened, or you're hacked!"
>=20
>=20
>=20

--=20
    Samuel D=EDaz Garc=EDa
     Director Gerente
ArcosCom Wireless, S.L.L.

CIF: B11828068
c/ Romero Gago, 19
Arcos de la Frontera
11630 - Cadiz

http://www.arcoscom.com

mailto:samueldg@arcoscom.com
msn: samueldg@arcoscom.com

M=F3vil: 651 93 72 48
Tlfn.: 956 70 13 15
Fax:   956 70 34 83

