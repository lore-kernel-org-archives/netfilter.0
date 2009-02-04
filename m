From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Second failover failure with conntrackd - INVALID packets
Date: Wed, 04 Feb 2009 11:43:07 +0100
Message-ID: <4989713B.2010502@netfilter.org>
References: <497760CB.6090008@univ-nantes.fr> <49778AF4.7000201@netfilter.org> <4978425F.1030003@univ-nantes.fr> <4978A4F8.5060901@netfilter.org> <4979BA72.50405@univ-nantes.fr> <497C4440.7050809@netfilter.org> <497CA7A2.2000906@netfilter.org> <497E0EA9.1020408@univ-nantes.fr> <497E40B0.2090709@netfilter.org> <4981D4EB.3060007@univ-nantes.fr> <49881800.20707@netfilter.org> <49896FEA.3050803@univ-nantes.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49896FEA.3050803@univ-nantes.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: yoann.juet@univ-nantes.fr
Cc: netfilter@vger.kernel.org

Yoann Juet wrote:
> Hi pablo,
>=20
> I still have an error as follows with conntrack 0.9.10:
>=20
> #make
> ...
> netfilter_conntrack.so -lnfnetlink
> mcast.o: In function `mcast_dump_stats_extended':
> /root/conntrack-tools-0.9.10/src/mcast.c:529: undefined reference to
> `nlif_get_ifflags'
> sync-mode.o: In function `mcast_iface_handler':
> /root/conntrack-tools-0.9.10/src/sync-mode.c:203: undefined reference=
 to
> `nlif_get_ifflags'
> sync-mode.o: In function `mcast_iface_candidate':
> /root/conntrack-tools-0.9.10/src/sync-mode.c:185: undefined reference=
 to
> `nlif_get_ifflags'
> collect2: ld returned 1 exit status
> make[1]: *** [conntrackd] Erreur 1
> make[1]: quittant le r=E9pertoire =AB /root/conntrack-tools-0.9.10/sr=
c =BB
> make: *** [all-recursive] Erreur 1
>=20
> Do you have an idea ? The compilation of conntrack 0.9.9 works on the
> same machine.
>=20
> Regards,
>=20
> Pablo Neira Ayuso wrote:
>> Hi Yoann,
>>
>> Yoann Juet wrote:
>>>> Could you try latest conntrack-tools 0.9.10? I released them yeste=
rday
>>>> along with accumulated updates/fixes. Thanks!
>>> I experience right now some difficulties to compile version 0.9.10 =
on
>>> lenny. I keep you in touch with test results.
>>
>> Any update? I'm interested in your setup.

Damn. I forgot to update library dependencies. conntrack-tools-0.9.10
requires libnfnetlink-0.0.40. I'm going to fix this now in the git tree=
=2E

--=20
"Los honestos son inadaptados sociales" -- Les Luthiers
