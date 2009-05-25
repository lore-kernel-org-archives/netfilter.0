From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: How do we arp for NAT?  Secondary IPs, proxy arp? something else?
Date: Mon, 25 May 2009 11:14:32 +0200
Message-ID: <4A1A6178.8080907@plouf.fr.eu.org>
References: <4A19235F.4070306@opendreams.net> <4A192D38.90008@redpill-linpro.com> <4A19B5F1.4080000@opendreams.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4A19B5F1.4080000@opendreams.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Jesse Molina a =E9crit :
>=20
> To restate my question:  What alternative ways are there to make the=20
> GNU/Linux system reply to ARP requests for an IP, without that IP bei=
ng=20
> an actual interface on the host, or that interface must not be used b=
y=20
> local services *in any way*, for the reasons of using it via SNAT/DNA=
T?

ip route add local <address>/<mask> table local dev <interface>

This way <address>/<mask> will be considered local by the system which=20
will reply to ARP requests for it, actually usable by any local process=
,=20
but won't appear assigned to <interface> so chances are that no local=20
process will use it unless told explicitly.
