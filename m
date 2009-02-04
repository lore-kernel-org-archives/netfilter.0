From: Yoann Juet <yoann.juet@univ-nantes.fr>
Subject: Re: Second failover failure with conntrackd - INVALID packets
Date: Wed, 04 Feb 2009 11:37:30 +0100
Message-ID: <49896FEA.3050803@univ-nantes.fr>
References: <497760CB.6090008@univ-nantes.fr> <49778AF4.7000201@netfilter.org> <4978425F.1030003@univ-nantes.fr> <4978A4F8.5060901@netfilter.org> <4979BA72.50405@univ-nantes.fr> <497C4440.7050809@netfilter.org> <497CA7A2.2000906@netfilter.org> <497E0EA9.1020408@univ-nantes.fr> <497E40B0.2090709@netfilter.org> <4981D4EB.3060007@univ-nantes.fr> <49881800.20707@netfilter.org>
Reply-To: yoann.juet@univ-nantes.fr
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030007080004050403010808"
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49881800.20707@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

This is a multi-part message in MIME format.
--------------030007080004050403010808
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

Hi pablo,

I still have an error as follows with conntrack 0.9.10:

#make
...
netfilter_conntrack.so -lnfnetlink
mcast.o: In function `mcast_dump_stats_extended':
/root/conntrack-tools-0.9.10/src/mcast.c:529: undefined reference to=20
`nlif_get_ifflags'
sync-mode.o: In function `mcast_iface_handler':
/root/conntrack-tools-0.9.10/src/sync-mode.c:203: undefined reference to=20
`nlif_get_ifflags'
sync-mode.o: In function `mcast_iface_candidate':
/root/conntrack-tools-0.9.10/src/sync-mode.c:185: undefined reference to=20
`nlif_get_ifflags'
collect2: ld returned 1 exit status
make[1]: *** [conntrackd] Erreur 1
make[1]: quittant le r=E9pertoire =AB /root/conntrack-tools-0.9.10/src =BB
make: *** [all-recursive] Erreur 1

Do you have an idea ? The compilation of conntrack 0.9.9 works on the=20
same machine.

Regards,

Pablo Neira Ayuso wrote:
> Hi Yoann,
>=20
> Yoann Juet wrote:
>>> Could you try latest conntrack-tools 0.9.10? I released them yesterday
>>> along with accumulated updates/fixes. Thanks!
>> I experience right now some difficulties to compile version 0.9.10 on
>> lenny. I keep you in touch with test results.
>=20
> Any update? I'm interested in your setup.
>=20


--------------030007080004050403010808
Content-Type: text/x-vcard; charset=utf-8;
 name="yoann_juet.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="yoann_juet.vcf"

begin:vcard
fn:Yoann Juet
n:Juet;Yoann
org;quoted-printable:;DSI Universit=C3=A9 de Nantes
adr;quoted-printable:BP92208;;2, rue de la Houssini=C3=A8re;Nantes;;44322;France
email;internet:yoann.juet@univ-nantes.fr
title;quoted-printable:Ing=C3=A9nieur s=C3=A9curit=C3=A9 & r=C3=A9seau
tel;work:02.51.12.53.93
tel;fax:02.51.12.58.60
x-mozilla-html:FALSE
version:2.1
end:vcard


--------------030007080004050403010808--
