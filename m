From: Raymond Leach <raymondl@knowledgefactory.co.za>
Subject: Re: log - kernel BUG at transaction.c
Date: 06 Dec 2002 10:48:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039164490.18412.47.camel@rayw.knowledgefactory.co.za>
References: <1013773586.20021206092240@free.fr>
Reply-To: raymondl@knowledgefactory.co.za
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-zliByAeut5H0l492vMmK"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1013773586.20021206092240@free.fr>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter Mailing List <netfilter@lists.netfilter.org>


--=-zliByAeut5H0l492vMmK
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hi

Maybe I'm way off here, but I recall something similar being discussed
on this list previously and it was a file system corruption in the
journaling file system (reiserfs?).

Ray

On Fri, 2002-12-06 at 10:22, b.fx wrote:
> Hello list,
>=20
> Here is an incomprehensible log for me. Is anybody able to tell me
> wath does that mean, bad config, bug, need to be patch ?...
> I use a RedHat7.2 updated and a 2.4.18-18.7 kernel.
>=20
> thanks
>=20
> Dec  5 23:30:00 firewall kernel: Assertion failure in __journal_unfile_bu=
ffer() at transaction.c:1569: "transaction->t_nr_buffers >=3D 0"
> Dec  5 23:30:00 firewall kernel: ------------[ cut here ]------------
> Dec  5 23:30:00 firewall kernel: kernel BUG at transaction.c:1569!
> Dec  5 23:30:00 firewall kernel: invalid operand: 0000
> Dec  5 23:30:00 firewall kernel: ipt_MASQUERADE ipt_state ipt_limit ipt_L=
OG iptable_mangle iptable_filter ip_nat_irc ip_conntrack_ftp ip_nat_ftp ipt=
able_
> nat ip_conntrack ip_tables autofs 8139
> Dec  5 23:30:00 firewall kernel: CPU:    0
> Dec  5 23:30:01 firewall kernel: EIP:    0010:[8139too:__insmod_8139too_O=
/lib/modules/2.4.18-18.7.x/kernel/drivers+-198791/96]    Not tainted
> Dec  5 23:30:01 firewall kernel: EIP:    0010:[<c480e779>]    Not tainted
> Dec  5 23:30:01 firewall kernel: EFLAGS: 00010286
> Dec  5 23:30:01 firewall kernel:
> Dec  5 23:30:01 firewall kernel: EIP is at __journal_unfile_buffer [jbd] =
0xb9 (2.4.18-18.7.x)
> Dec  5 23:30:01 firewall kernel: eax: 0000006a   ebx: c2f88740   ecx: 000=
00000   edx: c2818000
> Dec  5 23:30:01 firewall kernel: esi: 00000000   edi: c0b8e490   ebp: 000=
00004   esp: c3f71e20
> Dec  5 23:30:01 firewall kernel: ds: 0018   es: 0018   ss: 0018
> Dec  5 23:30:01 firewall kernel: Process kjournald (pid: 12, stackpage=3D=
c3f71000)
> Dec  5 23:30:01 firewall kernel: Stack: c48141a0 c4813c0f c4813a40 000006=
21 c4814720 c0b8e490 c2f88740 00000000
> Dec  5 23:30:01 firewall kernel:        c480ed87 c0b8e490 00000001 c22dc3=
00 c0b8e490 0000000a c3f70000 c480eea4
> Dec  5 23:30:01 firewall kernel:        c0b8e490 c2f88740 00000004 c480fa=
db c0b8e490 c2f88740 00000004 00000001
> Dec  5 23:30:01 firewall kernel: Call Trace: [8139too:__insmod_8139too_O/=
lib/modules/2.4.18-18.7.x/kernel/drivers+-175712/96] .rodata.str1.32 [jbd] =
0x20
> (0xc3f71e20))
> Dec  5 23:30:01 firewall kernel: Call Trace: [<c48141a0>] .rodata.str1.32=
 [jbd] 0x20 (0xc3f71e20))
> Dec  5 23:30:01 firewall kernel: [8139too:__insmod_8139too_O/lib/modules/=
2.4.18-18.7.x/kernel/drivers+-177137/96] .rodata.str1.1 [jbd] 0x1df (0xc3f7=
1e24)
> )
> Dec  5 23:30:01 firewall kernel: [<c4813c0f>] .rodata.str1.1 [jbd] 0x1df =
(0xc3f71e24))
> Dec  5 23:30:01 firewall kernel: [8139too:__insmod_8139too_O/lib/modules/=
2.4.18-18.7.x/kernel/drivers+-177600/96] .rodata.str1.1 [jbd] 0x10 (0xc3f71=
e28))
> Dec  5 23:30:01 firewall kernel: [<c4813a40>] .rodata.str1.1 [jbd] 0x10 (=
0xc3f71e28))
> Dec  5 23:30:01 firewall kernel: [8139too:__insmod_8139too_O/lib/modules/=
2.4.18-18.7.x/kernel/drivers+-174304/96] .rodata.str1.32 [jbd] 0x5a0 (0xc3f=
71e30
> ))
> Dec  5 23:30:01 firewall kernel: [<c4814720>] .rodata.str1.32 [jbd] 0x5a0=
 (0xc3f71e30))
> Dec  5 23:30:01 firewall kernel: [8139too:__insmod_8139too_O/lib/modules/=
2.4.18-18.7.x/kernel/drivers+-197241/96] __journal_file_buffer [jbd] 0xd7 (=
0xc3f
> 71e40))
> Dec  5 23:30:01 firewall kernel: [<c480ed87>] __journal_file_buffer [jbd]=
 0xd7 (0xc3f71e40))
> Dec  5 23:30:01 firewall kernel: [8139too:__insmod_8139too_O/lib/modules/=
2.4.18-18.7.x/kernel/drivers+-196956/96] journal_file_buffer [jbd] 0x14 (0x=
c3f71
> e5c))
> Dec  5 23:30:01 firewall kernel: [<c480eea4>] journal_file_buffer [jbd] 0=
x14 (0xc3f71e5c))
> Dec  5 23:30:01 firewall kernel: [8139too:__insmod_8139too_O/lib/modules/=
2.4.18-18.7.x/kernel/drivers+-193829/96] journal_commit_transaction [jbd] 0=
x9cb
> (0xc3f71e6c))
> Dec  5 23:30:01 firewall kernel: [<c480fadb>] journal_commit_transaction =
[jbd] 0x9cb (0xc3f71e6c))
> Dec  5 23:30:01 firewall kernel: [schedule+533/576] schedule [kernel] 0x2=
15 (0xc3f71f7c))
> Dec  5 23:30:01 firewall kernel: [<c0115d95>] schedule [kernel] 0x215 (0x=
c3f71f7c))
> Dec  5 23:30:01 firewall kernel: [8139too:__insmod_8139too_O/lib/modules/=
2.4.18-18.7.x/kernel/drivers+-184680/96] kjournald [jbd] 0x118 (0xc3f71fc0)=
)
> Dec  5 23:30:01 firewall kernel: [<c4811e98>] kjournald [jbd] 0x118 (0xc3=
f71fc0))
> Dec  5 23:30:01 firewall kernel: [8139too:__insmod_8139too_O/lib/modules/=
2.4.18-18.7.x/kernel/drivers+-184992/96] commit_timeout [jbd] 0x0 (0xc3f71f=
d8))
> Dec  5 23:30:01 firewall kernel: [<c4811d60>] commit_timeout [jbd] 0x0 (0=
xc3f71fd8))
> Dec  5 23:30:01 firewall kernel: [kernel_thread+38/48] kernel_thread [ker=
nel] 0x26 (0xc3f71ff0))
> Dec  5 23:30:01 firewall kernel: [<c0107176>] kernel_thread [kernel] 0x26=
 (0xc3f71ff0))
--=20
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
(  Raymond Leach                       )
 ) Knowledge Factory                  (
(                                      )
 ) Tel: +27 11 445 8100               (
(  Fax: +27 11 445 8101                )
 )                                    (
(  http://www.knowledgefactory.co.za/  )
 ) http://www.saptg.co.za/            (
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   o                                o
    o                              o
        .--.                  .--.
       | o_o|                |o_o |
       | \_:|                |:_/ |
      / /   \\              //   \ \
     ( |     |)            (|     | )
     /`\_   _/'\          /'\_   _/`\
     \___)=3D(___/          \___)=3D(___/

--=-zliByAeut5H0l492vMmK
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQA98GRKh1fuR/Bv+ygRAseaAJ4mGZT6IxuRDgnAbXSHCoNkDoXlyACgovOc
thjNzpgjU8D/Q3H42g94xtI=
=sE65
-----END PGP SIGNATURE-----

--=-zliByAeut5H0l492vMmK--


