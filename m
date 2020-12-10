From: Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: Re: ipset 7.9 compilation fix on kernel 4.14
Date: Thu, 10 Dec 2020 23:19:19 +0100 (CET)
Message-ID: <alpine.DEB.2.23.453.2012102309430.14614@blackhole.kfki.hu>
References: <alpine.DEB.2.23.453.2011192141150.19567@blackhole.kfki.hu> <c4778467-3abe-b40f-c4f7-945576fa097f@wildgooses.com> <alpine.DEB.2.23.453.2012071419590.30865@blackhole.kfki.hu> <701adbbb-202a-4ee4-ce2e-ecaaed6dc3b5@wildgooses.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="110363376-271306815-1607638759=:14614"
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <701adbbb-202a-4ee4-ce2e-ecaaed6dc3b5@wildgooses.com>
List-ID: <netfilter.vger.kernel.org>
To: Ed W <lists@wildgooses.com>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--110363376-271306815-1607638759=:14614
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, 10 Dec 2020, Ed W wrote:

> There remains a compile warning, just wanted to bring to your attention=
:
>=20
> /var/tmp/portage/net-firewall/ipset-7.9/work/ipset-7.9/kernel/net/netfi=
lter/ips
> et/ip_set_core.c: In function 'ip_set_rename':
> /var/tmp/portage/net-firewall/ipset-7.9/work/ipset-7.9/kernel/net/netfi=
lter/ips
> et/ip_set_core.c:1359:2: warning: 'strncpy' specified bound 32 equals
> destination size [-Wstringop-truncation]
> =C2=A01359 |=C2=A0 strncpy(set->name, name2, IPSET_MAXNAMELEN);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
> =C2=A0 LD [M]=C2=A0/var/tmp/portage/net-firewall/ipset-7.9/work/ipset-7=
.9/kernel/net/netfilter/ips
> et/ip_set.o

That's a false warning: name2 comes from a netlink attribute which size=20
is limited to IPSET_MAXNAMELEN-1, including NUL. The compiler can't figur=
e=20
it out though.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key : https://wigner.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
--110363376-271306815-1607638759=:14614--
