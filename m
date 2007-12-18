From: =?UTF-8?B?U8KOw6liYXN0aWVuIENyYW1hdHRl?= 
	<scramatte@zensoluciones.com>
Subject: ipt_connlimit, ipt_geoip, esfq patches  won't compile with 2.6.23
 kernel
Date: Tue, 18 Dec 2007 21:36:14 +0100
Message-ID: <47682F3E.1050606@zensoluciones.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Hello

ipt_connlimit, ipt_geoip, esfq won't compile with 2.6.23 kernel=20
And seems that ipt_time give some error too !


I've download the iptables 1.3.8 source and  the latest PatchOmaticNG
snapshot.

net/ipv4/netfilter/ipt_time.c:155: aviso: inicializaci=C3=B3n desde un =
tipo
de puntero incompatible
net/ipv4/netfilter/ipt_time.c:159: aviso: inicializaci=C3=B3n desde un =
tipo
de puntero incompatible
  CC [M]  net/ipv4/netfilter/ipt_connlimit.o
net/ipv4/netfilter/ipt_connlimit.c: En la funci=C3=B3n =E2=80=98count_t=
hem=E2=80=99:
net/ipv4/netfilter/ipt_connlimit.c:98: error: demasiados argumentos par=
a
la funci=C3=B3n =E2=80=98nf_conntrack_find_get=E2=80=99
net/ipv4/netfilter/ipt_connlimit.c: En el nivel principal:
net/ipv4/netfilter/ipt_connlimit.c:312: aviso: inicializaci=C3=B3n desd=
e un
tipo de puntero incompatible
net/ipv4/netfilter/ipt_connlimit.c:316: aviso: inicializaci=C3=B3n desd=
e un
tipo de puntero incompatible
make[4]: *** [net/ipv4/netfilter/ipt_connlimit.o] Error 1
make[3]: *** [net/ipv4/netfilter] Error 2
make[2]: *** [net/ipv4] Error 2
make[1]: *** [net] Error 2


net/ipv4/netfilter/ipt_geoip.c: En la funci=C3=B3n =E2=80=98match=E2=80=
=99:
net/ipv4/netfilter/ipt_geoip.c:113: error: =E2=80=98const struct sk_buf=
f=E2=80=99 no
tiene un miembro llamado =E2=80=98nh=E2=80=99
net/ipv4/netfilter/ipt_geoip.c: En el nivel principal:
net/ipv4/netfilter/ipt_geoip.c:280: aviso: inicializaci=C3=B3n desde un=
 tipo
de puntero incompatible
net/ipv4/netfilter/ipt_geoip.c:284: aviso: inicializaci=C3=B3n desde un=
 tipo
de puntero incompatible
net/ipv4/netfilter/ipt_geoip.c: En la funci=C3=B3n =E2=80=98init=E2=80=99=
:
net/ipv4/netfilter/ipt_geoip.c:291: error: declaraci=C3=B3n impl=C3=ADc=
ita de la
funci=C3=B3n =E2=80=98ipt_register_match=E2=80=99
net/ipv4/netfilter/ipt_geoip.c: En la funci=C3=B3n =E2=80=98fini=E2=80=99=
:
net/ipv4/netfilter/ipt_geoip.c:296: error: declaraci=C3=B3n impl=C3=ADc=
ita de la
funci=C3=B3n =E2=80=98ipt_unregister_match=E2=80=99
make[4]: *** [net/ipv4/netfilter/ipt_geoip.o] Error 1
make[3]: *** [net/ipv4/netfilter] Error 2
make[2]: *** [net/ipv4] Error 2
make[1]: *** [net] Error 2
make[1]: se sale del directorio
`/usr/src/etch-router-0.5.1/linux/linux-2.6.23.9'


net/sched/sch_esfq.c: En la funci=C3=B3n =E2=80=98esfq_hash=E2=80=99:
net/sched/sch_esfq.c:145: error: =E2=80=98struct sk_buff=E2=80=99 no ti=
ene un miembro
llamado =E2=80=98nh=E2=80=99
net/sched/sch_esfq.c:161: error: =E2=80=98struct sk_buff=E2=80=99 no ti=
ene un miembro
llamado =E2=80=98nh=E2=80=99
net/sched/sch_esfq.c: En la funci=C3=B3n =E2=80=98esfq_dump=E2=80=99:
net/sched/sch_esfq.c:654: aviso: la inicializaci=C3=B3n crea un puntero=
 desde
un entero sin una conversi=C3=B3n
make[3]: *** [net/sched/sch_esfq.o] Error 1
make[2]: *** [net/sched] Error 2
make[1]: *** [net] Error 2


Does anyone has got patch for 2.6.23 ?

Regards


