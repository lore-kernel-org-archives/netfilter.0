From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Connectiontracking of IPv6 on modified Fritzbox
Date: Fri, 30 Jan 2009 15:28:15 +0100
Message-ID: <49830E7F.2020105@plouf.fr.eu.org>
References: <20090130132342.207450@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090130132342.207450@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org
Cc: wlet@gmx.net

Hello,

wlet@gmx.net a =E9crit :
>=20
> I'm using the last svn snapshot which contains IPv6 support via
> sixxs.net. The kernel running on this box is "2.6.13.1-ohio" (MIPS).
>=20
> I want to use ip6tables to restrict the v6 traffic, but there is no
> possibility to do a connection tracking/stateful filtering.=20

The new netfilter conntrack aka 'nf_conntrack' supporting IPv6=20
connection tracking was added in the mainline kernel version 2.6.15.=20
However it lacked IPv4 NAT support (and support for "complex" protocols=
=20
except FTP) until version 2.6.20, so meanwhile you had to choose betwee=
n=20
IPv6 connection tracking provided by 'nf_conntrack' and IPv4 NAT=20
provided by the old IPv4-only conntrack aka 'ip_conntrack'.

=46or kernel versions earlier that 2.6.15, an 'nf_conntrack' patchlet w=
as=20
available in the patch-o-matic-ng until patch-o-matic-ng-20050918.=20
However it probably had a number of bugs which were corrected after=20
being merged in the mainline kernel.

> x_tables are also not availible.

x_tables was added in the mainline kernel version 2.6.16. It is not=20
related to nf_conntrack.
