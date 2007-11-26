From: Aiko Barz <aiko@deepco.de>
Subject: Re: INVALID FIN/ACK packets
Date: Mon, 26 Nov 2007 23:10:06 +0100
Message-ID: <20071126221006.GA5729@motoko>
References: <20071114100226.GA29362@thorin.admin.heise.de> <473B782F.2030907@olivier.pk.wau.nl> <Pine.LNX.4.64.0711151040590.13029@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="yEPQxsgoJgBvi8ip"
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.64.0711151040590.13029@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Olivier Sessink <lists@olivier.pk.wau.nl>, netfilter@vger.kernel.org


--yEPQxsgoJgBvi8ip
Content-Type: multipart/mixed; boundary="dDRMvlgZJXvWKvBx"
Content-Disposition: inline


--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 15, 2007 at 10:57:44AM +0100, Jozsef Kadlecsik wrote:
> On Wed, 14 Nov 2007, Olivier Sessink wrote:
>=20
> > > I have one more server with this same kind of problem. "ACK RST" and
> > > "ACK FIN" packets are involved.
>=20
> Please enable full internal logging in netfilter and make sure at least=
=20
> one loggin target module is loaded in and record by tcpdump one full=20
> TCP session where such packets occurs. Then send me the generated kernel=
=20
> log and the dump file so that I could analyze it.=20

Hm,

maybe other people would like to look at it too. :)

Still don't have a tcpdump, but I attached the internal conntrack log.
I didn't do it on my servers, because they are in use. I used my
Notebook, which is having the same symptoms. My servers have several
thousand entries of this kind each day.

Bye,
    Aiko

PS.: I also tried the vanilla 2.6.23.9 kernel. Still suffering...
--=20
:wq

--dDRMvlgZJXvWKvBx
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment; filename="dmesg.txt"
Content-Transfer-Encoding: quoted-printable

Nov 25 17:00:22 motoko tcp_in_window: START
Nov 25 17:00:22 motoko tcp_in_window: src=3D___:48595 dst=3D___:80 seq=3D10=
03277754 ack=3D0 sack=3D0 win=3D5840 end=3D1003277755
Nov 25 17:00:22 motoko tcp_in_window: sender end=3D1003277755 maxend=3D1003=
277755 maxwin=3D5840 scale=3D7 receiver end=3D0 maxend=3D0 maxwin=3D1 scale=
=3D0
Nov 25 17:00:22 motoko tcp_in_window: src=3D___:48595 dst=3D___:80 seq=3D10=
03277754 ack=3D0 sack =3D0 win=3D5840 end=3D1003277755
Nov 25 17:00:22 motoko tcp_in_window: sender end=3D1003277755 maxend=3D1003=
277755 maxwin=3D5840 scale=3D7 receiver end=3D0 maxend=3D0 maxwin=3D1 scale=
=3D0=20
Nov 25 17:00:22 motoko tcp_in_window: I=3D1 II=3D1 III=3D1 IV=3D1
Nov 25 17:00:22 motoko tcp_in_window: res=3D1 sender end=3D1003277755 maxen=
d=3D1003277755 maxwin=3D5840 receiver end=3D0 maxend=3D5840 maxwin=3D1
Nov 25 17:00:22 motoko tcp_conntracks: src=3D___:48595 dst=3D___:80 syn=3D1=
 ack=3D0 fin=3D0 rst=3D0 old=3D0 new=3D1

Nov 25 17:00:23 motoko tcp_in_window: START
Nov 25 17:00:23 motoko tcp_in_window: src=3D___:80 dst=3D___:48595 seq=3D67=
1751393 ack=3D1003277755 sack=3D1003277755 win=3D4356 end=3D671751394
Nov 25 17:00:23 motoko tcp_in_window: sender end=3D0 maxend=3D5840 maxwin=
=3D1 scale=3D0 receiver end=3D1003277755 maxend=3D1003277755 maxwin=3D5840 =
scale=3D7
Nov 25 17:00:23 motoko tcp_in_window: src=3D___:80 dst=3D___:48595 seq=3D67=
1751393 ack=3D1003277755 sack =3D1003277755 win=3D4356 end=3D671751394
Nov 25 17:00:23 motoko tcp_in_window: sender end=3D671751394 maxend=3D67175=
1394 maxwin=3D4356 scale=3D0 receiver end=3D1003277755 maxend=3D1003277755 =
maxwin=3D5840 scale=3D7
Nov 25 17:00:23 motoko tcp_in_window: I=3D1 II=3D1 III=3D1 IV=3D1
Nov 25 17:00:23 motoko tcp_in_window: res=3D1 sender end=3D671751394 maxend=
=3D671751394 maxwin=3D4356 receiver end=3D1003277755 maxend=3D1003282111 ma=
xwin=3D5840
Nov 25 17:00:23 motoko tcp_conntracks: src=3D___:80 dst=3D___:48595 syn=3D1=
 ack=3D1 fin=3D0 rst=3D0 old=3D1 new=3D2

Nov 25 17:00:23 motoko tcp_in_window: START
Nov 25 17:00:23 motoko tcp_in_window: src=3D___:48595 dst=3D___:80 seq=3D10=
03277755 ack=3D671751394 sack=3D671751394 win=3D46 end=3D1003277755
Nov 25 17:00:23 motoko tcp_in_window: sender end=3D1003277755 maxend=3D1003=
282111 maxwin=3D5840 scale=3D7 receiver end=3D671751394 maxend=3D671751394 =
maxwin=3D4356 scale=3D0
Nov 25 17:00:23 motoko tcp_in_window: src=3D___:48595 dst=3D___:80 seq=3D10=
03277755 ack=3D671751394 sack =3D671751394 win=3D46 end=3D1003277755
Nov 25 17:00:23 motoko tcp_in_window: sender end=3D1003277755 maxend=3D1003=
282111 maxwin=3D5840 scale=3D7 receiver end=3D671751394 maxend=3D671751394 =
maxwin=3D4356 scale=3D0
Nov 25 17:00:23 motoko tcp_in_window: I=3D1 II=3D1 III=3D1 IV=3D1
Nov 25 17:00:23 motoko tcp_in_window: res=3D1 sender end=3D1003277755 maxen=
d=3D1003282111 maxwin=3D5888 receiver end=3D671751394 maxend=3D671757282 ma=
xwin=3D4356
Nov 25 17:00:23 motoko tcp_conntracks: src=3D___:48595 dst=3D___:80 syn=3D0=
 ack=3D1 fin=3D0 rst=3D0 old=3D2 new=3D3

Nov 25 17:00:23 motoko tcp_in_window: START
Nov 25 17:00:23 motoko tcp_in_window: src=3D___:48595 dst=3D___:80 seq=3D10=
03277755 ack=3D671751394 sack=3D671751394 win=3D46 end=3D1003278253
Nov 25 17:00:23 motoko tcp_in_window: sender end=3D1003277755 maxend=3D1003=
282111 maxwin=3D5888 scale=3D7 receiver end=3D671751394 maxend=3D671757282 =
maxwin=3D4356 scale=3D0
Nov 25 17:00:23 motoko tcp_in_window: src=3D___:48595 dst=3D___:80 seq=3D10=
03277755 ack=3D671751394 sack =3D671751394 win=3D46 end=3D1003278253
Nov 25 17:00:23 motoko tcp_in_window: sender end=3D1003277755 maxend=3D1003=
282111 maxwin=3D5888 scale=3D7 receiver end=3D671751394 maxend=3D671757282 =
maxwin=3D4356 scale=3D0
Nov 25 17:00:23 motoko tcp_in_window: I=3D1 II=3D1 III=3D1 IV=3D1
Nov 25 17:00:23 motoko tcp_in_window: res=3D1 sender end=3D1003278253 maxen=
d=3D1003282111 maxwin=3D5888 receiver end=3D671751394 maxend=3D671757282 ma=
xwin=3D4356
Nov 25 17:00:23 motoko tcp_conntracks: src=3D___:48595 dst=3D___:80 syn=3D0=
 ack=3D1 fin=3D0 rst=3D0 old=3D3 new=3D3

Nov 25 17:00:23 motoko tcp_in_window: START
Nov 25 17:00:23 motoko tcp_in_window: src=3D___:80 dst=3D___:48595 seq=3D67=
1751394 ack=3D1003278253 sack=3D1003278253 win=3D4854 end=3D671751814
Nov 25 17:00:23 motoko tcp_in_window: sender end=3D671751394 maxend=3D67175=
7282 maxwin=3D4356 scale=3D0 receiver end=3D1003278253 maxend=3D1003282111 =
maxwin=3D5888 scale=3D7
Nov 25 17:00:23 motoko tcp_in_window: src=3D___:80 dst=3D___:48595 seq=3D67=
1751394 ack=3D1003278253 sack =3D1003278253 win=3D4854 end=3D671751814
Nov 25 17:00:23 motoko tcp_in_window: sender end=3D671751394 maxend=3D67175=
7282 maxwin=3D4356 scale=3D0 receiver end=3D1003278253 maxend=3D1003282111 =
maxwin=3D5888 scale=3D7
Nov 25 17:00:23 motoko tcp_in_window: I=3D1 II=3D1 III=3D1 IV=3D1
Nov 25 17:00:23 motoko tcp_in_window: res=3D1 sender end=3D671751814 maxend=
=3D671757282 maxwin=3D4854 receiver end=3D1003278253 maxend=3D1003283107 ma=
xwin=3D5888
Nov 25 17:00:23 motoko tcp_conntracks: src=3D___:80 dst=3D___:48595 syn=3D0=
 ack=3D1 fin=3D0 rst=3D0 old=3D3 new=3D3

Nov 25 17:00:23 motoko tcp_in_window: START
Nov 25 17:00:23 motoko tcp_in_window: src=3D___:48595 dst=3D___:80 seq=3D10=
03278253 ack=3D671751814 sack=3D671751814 win=3D54 end=3D1003278253
Nov 25 17:00:23 motoko tcp_in_window: sender end=3D1003278253 maxend=3D1003=
283107 maxwin=3D5888 scale=3D7 receiver end=3D671751814 maxend=3D671757282 =
maxwin=3D4854 scale=3D0
Nov 25 17:00:23 motoko tcp_in_window: src=3D___:48595 dst=3D___:80 seq=3D10=
03278253 ack=3D671751814 sack =3D671751814 win=3D54 end=3D1003278253
Nov 25 17:00:23 motoko tcp_in_window: sender end=3D1003278253 maxend=3D1003=
283107 maxwin=3D5888 scale=3D7 receiver end=3D671751814 maxend=3D671757282 =
maxwin=3D4854 scale=3D0
Nov 25 17:00:23 motoko tcp_in_window: I=3D1 II=3D1 III=3D1 IV=3D1
Nov 25 17:00:23 motoko tcp_in_window: res=3D1 sender end=3D1003278253 maxen=
d=3D1003283107 maxwin=3D6912 receiver end=3D671751814 maxend=3D671758726 ma=
xwin=3D4854
Nov 25 17:00:23 motoko tcp_conntracks: src=3D___:48595 dst=3D___:80 syn=3D0=
 ack=3D1 fin=3D0 rst=3D0 old=3D3 new=3D3

Nov 25 17:00:23 motoko tcp_in_window: START
Nov 25 17:00:23 motoko tcp_in_window: src=3D___:48595 dst=3D___:80 seq=3D10=
03278253 ack=3D671751814 sack=3D671751814 win=3D54 end=3D1003278254
Nov 25 17:00:23 motoko tcp_in_window: sender end=3D1003278253 maxend=3D1003=
283107 maxwin=3D6912 scale=3D7 receiver end=3D671751814 maxend=3D671758726 =
maxwin=3D4854 scale=3D0
Nov 25 17:00:23 motoko tcp_in_window: src=3D___:48595 dst=3D___:80 seq=3D10=
03278253 ack=3D671751814 sack =3D671751814 win=3D54 end=3D1003278254
Nov 25 17:00:23 motoko tcp_in_window: sender end=3D1003278253 maxend=3D1003=
283107 maxwin=3D6912 scale=3D7 receiver end=3D671751814 maxend=3D671758726 =
maxwin=3D4854 scale=3D0
Nov 25 17:00:23 motoko tcp_in_window: I=3D1 II=3D1 III=3D1 IV=3D1
Nov 25 17:00:23 motoko tcp_in_window: res=3D1 sender end=3D1003278254 maxen=
d=3D1003283107 maxwin=3D6912 receiver end=3D671751814 maxend=3D671758726 ma=
xwin=3D4854
Nov 25 17:00:23 motoko tcp_conntracks: src=3D___:48595 dst=3D___:80 syn=3D0=
 ack=3D1 fin=3D1 rst=3D0 old=3D3 new=3D4
Nov 25 17:00:23 motoko tcp_new: sender end=3D2015426912 maxend=3D2015426912=
 maxwin=3D5840 scale=3D7 receiver end=3D0 maxend=3D0 maxwin=3D1 scale=3D0

Nov 25 17:00:23 motoko tcp_in_window: START
Nov 25 17:00:23 motoko tcp_in_window: src=3D___:80 dst=3D___:48595 seq=3D67=
1751814 ack=3D1003278253 sack=3D1003278253 win=3D4854 end=3D671751815
Nov 25 17:00:23 motoko tcp_in_window: sender end=3D671751814 maxend=3D67175=
8726 maxwin=3D4854 scale=3D0 receiver end=3D1003278254 maxend=3D1003283107 =
maxwin=3D6912 scale=3D7
Nov 25 17:00:23 motoko tcp_in_window: src=3D___:80 dst=3D___:48595 seq=3D67=
1751814 ack=3D1003278253 sack =3D1003278253 win=3D4854 end=3D671751815
Nov 25 17:00:23 motoko tcp_in_window: sender end=3D671751814 maxend=3D67175=
8726 maxwin=3D4854 scale=3D0 receiver end=3D1003278254 maxend=3D1003283107 =
maxwin=3D6912 scale=3D7
Nov 25 17:00:23 motoko tcp_in_window: I=3D1 II=3D1 III=3D1 IV=3D1
Nov 25 17:00:23 motoko tcp_in_window: res=3D1 sender end=3D671751815 maxend=
=3D671758726 maxwin=3D4854 receiver end=3D1003278254 maxend=3D1003283107 ma=
xwin=3D6912
Nov 25 17:00:23 motoko tcp_conntracks: src=3D___:80 dst=3D___:48595 syn=3D0=
 ack=3D1 fin=3D1 rst=3D0 old=3D4 new=3D6

Nov 25 17:00:23 motoko tcp_in_window: START
Nov 25 17:00:23 motoko tcp_in_window: src=3D___:48595 dst=3D___:80 seq=3D10=
03278254 ack=3D671751815 sack=3D671751815 win=3D54 end=3D1003278254
Nov 25 17:00:23 motoko tcp_in_window: sender end=3D1003278254 maxend=3D1003=
283107 maxwin=3D6912 scale=3D7 receiver end=3D671751815 maxend=3D671758726 =
maxwin=3D4854 scale=3D0
Nov 25 17:00:23 motoko tcp_in_window: src=3D___:48595 dst=3D___:80 seq=3D10=
03278254 ack=3D671751815 sack =3D671751815 win=3D54 end=3D1003278254
Nov 25 17:00:23 motoko tcp_in_window: sender end=3D1003278254 maxend=3D1003=
283107 maxwin=3D6912 scale=3D7 receiver end=3D671751815 maxend=3D671758726 =
maxwin=3D4854 scale=3D0
Nov 25 17:00:23 motoko tcp_in_window: I=3D1 II=3D1 III=3D1 IV=3D1
Nov 25 17:00:23 motoko tcp_in_window: res=3D1 sender end=3D1003278254 maxen=
d=3D1003283107 maxwin=3D6912 receiver end=3D671751815 maxend=3D671758727 ma=
xwin=3D4854
Nov 25 17:00:23 motoko tcp_conntracks: src=3D___:48595 dst=3D___:80 syn=3D0=
 ack=3D1 fin=3D0 rst=3D0 old=3D6 new=3D7

Nov 25 17:00:25 motoko tcp_in_window: START
Nov 25 17:00:25 motoko tcp_in_window: src=3D___:48595 dst=3D___:80 seq=3D10=
03278253 ack=3D671751815 sack=3D671751815 win=3D54 end=3D1003278254
Nov 25 17:00:25 motoko tcp_in_window: sender end=3D1003278254 maxend=3D1003=
283107 maxwin=3D6912 scale=3D7 receiver end=3D671751815 maxend=3D671758727 =
maxwin=3D4854 scale=3D0
Nov 25 17:00:25 motoko tcp_in_window: src=3D___:48595 dst=3D___:80 seq=3D10=
03278253 ack=3D671751815 sack =3D671751815 win=3D54 end=3D1003278254
Nov 25 17:00:25 motoko tcp_in_window: sender end=3D1003278254 maxend=3D1003=
283107 maxwin=3D6912 scale=3D7 receiver end=3D671751815 maxend=3D671758727 =
maxwin=3D4854 scale=3D0
Nov 25 17:00:25 motoko tcp_in_window: I=3D1 II=3D1 III=3D1 IV=3D1
Nov 25 17:00:25 motoko tcp_in_window: res=3D1 sender end=3D1003278254 maxen=
d=3D1003283107 maxwin=3D6912 receiver end=3D671751815 maxend=3D671758727 ma=
xwin=3D4854
Nov 25 17:00:25 motoko tcp_conntracks: src=3D___:48595 dst=3D___:80 syn=3D0=
 ack=3D1 fin=3D1 rst=3D0 old=3D7 new=3D7

Nov 25 17:00:25 motoko tcp_in_window: START
Nov 25 17:00:25 motoko tcp_in_window: src=3D___:80 dst=3D___:48595 seq=3D67=
1751814 ack=3D1003278254 sack=3D1003278254 win=3D54 end=3D671751814
Nov 25 17:00:25 motoko tcp_in_window: sender end=3D671751815 maxend=3D67175=
8727 maxwin=3D4854 scale=3D0 receiver end=3D1003278254 maxend=3D1003283107 =
maxwin=3D6912 scale=3D7
Nov 25 17:00:25 motoko tcp_in_window: src=3D___:80 dst=3D___:48595 seq=3D67=
1751814 ack=3D1003278254 sack =3D1003278254 win=3D54 end=3D671751814
Nov 25 17:00:25 motoko tcp_in_window: sender end=3D671751815 maxend=3D67175=
8727 maxwin=3D4854 scale=3D0 receiver end=3D1003278254 maxend=3D1003283107 =
maxwin=3D6912 scale=3D7
Nov 25 17:00:25 motoko tcp_in_window: I=3D1 II=3D1 III=3D1 IV=3D1
Nov 25 17:00:25 motoko tcp_in_window: res=3D1 sender end=3D671751815 maxend=
=3D671758727 maxwin=3D4854 receiver end=3D1003278254 maxend=3D1003283107 ma=
xwin=3D6912
Nov 25 17:00:25 motoko tcp_conntracks: src=3D___:80 dst=3D___:48595 syn=3D0=
 ack=3D0 fin=3D0 rst=3D1 old=3D7 new=3D8

Nov 25 17:00:27 motoko tcp_in_window: START
Nov 25 17:00:27 motoko tcp_in_window: src=3D___:48595 dst=3D___:80 seq=3D10=
03278253 ack=3D671751815 sack=3D671751815 win=3D54 end=3D1003278254
Nov 25 17:00:27 motoko tcp_in_window: sender end=3D1003278254 maxend=3D1003=
283107 maxwin=3D6912 scale=3D7 receiver end=3D671751815 maxend=3D671758727 =
maxwin=3D4854 scale=3D0
Nov 25 17:00:27 motoko tcp_in_window: src=3D___:48595 dst=3D___:80 seq=3D10=
03278253 ack=3D671751815 sack =3D671751815 win=3D54 end=3D1003278254
Nov 25 17:00:27 motoko tcp_in_window: sender end=3D1003278254 maxend=3D1003=
283107 maxwin=3D6912 scale=3D7 receiver end=3D671751815 maxend=3D671758727 =
maxwin=3D4854 scale=3D0
Nov 25 17:00:27 motoko tcp_in_window: I=3D1 II=3D1 III=3D1 IV=3D1
Nov 25 17:00:27 motoko tcp_in_window: res=3D1 sender end=3D1003278254 maxen=
d=3D1003283107 maxwin=3D6912 receiver end=3D671751815 maxend=3D671758727 ma=
xwin=3D4854
Nov 25 17:00:27 motoko tcp_conntracks: src=3D___:48595 dst=3D___:80 syn=3D0=
 ack=3D1 fin=3D1 rst=3D0 old=3D8 new=3D8

Nov 25 17:00:33 motoko tcp_in_window: START
Nov 25 17:00:33 motoko tcp_in_window: src=3D___:48595 dst=3D___:80 seq=3D10=
03278253 ack=3D671751815 sack=3D671751815 win=3D54 end=3D1003278254
Nov 25 17:00:33 motoko tcp_in_window: sender end=3D1003278254 maxend=3D1003=
283107 maxwin=3D6912 scale=3D7 receiver end=3D671751815 maxend=3D671758727 =
maxwin=3D4854 scale=3D0
Nov 25 17:00:33 motoko tcp_in_window: src=3D___:48595 dst=3D___:80 seq=3D10=
03278253 ack=3D671751815 sack =3D671751815 win=3D54 end=3D1003278254
Nov 25 17:00:33 motoko tcp_in_window: sender end=3D1003278254 maxend=3D1003=
283107 maxwin=3D6912 scale=3D7 receiver end=3D671751815 maxend=3D671758727 =
maxwin=3D4854 scale=3D0
Nov 25 17:00:33 motoko tcp_in_window: I=3D1 II=3D1 III=3D1 IV=3D1
Nov 25 17:00:33 motoko tcp_in_window: res=3D1 sender end=3D1003278254 maxen=
d=3D1003283107 maxwin=3D6912 receiver end=3D671751815 maxend=3D671758727 ma=
xwin=3D4854
Nov 25 17:00:33 motoko tcp_conntracks: src=3D___:48595 dst=3D___:80 syn=3D0=
 ack=3D1 fin=3D1 rst=3D0 old=3D8 new=3D8

Nov 25 17:00:45 motoko nf_ct_tcp: invalid new deleting.
Nov 25 17:00:45 motoko fire: OUTPUT IN=3D OUT=3Deth1 SRC=3D172.16.8.12 DST=
=3D195.71.11.83 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D19465 DF PROT=
O=3DTCP SPT=3D48595 DPT=3D80 WINDOW=3D54 RES=3D0x00 ACK FIN URGP=3D0
Nov 25 17:00:45 motoko fire: INVALID IN=3Dlo OUT=3D MAC=3D00:00:00:00:00:00=
:00:00:00:00:00:00:08:00 SRC=3D172.16.8.12 DST=3D172.16.8.12 LEN=3D80 TOS=
=3D0x00 PREC=3D0xC0 TTL=3D64 ID=3D29673 PROTO=3DICMP TYPE=3D3 CODE=3D13 [SR=
C=3D172.16.8.12 DST=3D195.71.11.83 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D64=
 ID=3D19465 DF PROTO=3DTCP SPT=3D48595 DPT=3D80 WINDOW=3D54 RES=3D0x00 ACK =
FIN URGP=3D0 ]

Nov 25 17:01:08 motoko nf_ct_tcp: invalid new deleting.
Nov 25 17:01:08 motoko fire: OUTPUT IN=3D OUT=3Deth1 SRC=3D172.16.8.12 DST=
=3D195.71.11.83 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D19466 DF PROT=
O=3DTCP SPT=3D48595 DPT=3D80 WINDOW=3D54 RES=3D0x00 ACK FIN URGP=3D0
Nov 25 17:01:08 motoko fire: INVALID IN=3Dlo OUT=3D MAC=3D00:00:00:00:00:00=
:00:00:00:00:00:00:08:00 SRC=3D172.16.8.12 DST=3D172.16.8.12 LEN=3D80 TOS=
=3D0x00 PREC=3D0xC0 TTL=3D64 ID=3D29685 PROTO=3DICMP TYPE=3D3 CODE=3D13 [SR=
C=3D172.16.8.12 DST=3D195.71.11.83 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D64=
 ID=3D19466 DF PROTO=3DTCP SPT=3D48595 DPT=3D80 WINDOW=3D54 RES=3D0x00 ACK =
FIN URGP=3D0 ]

Nov 25 17:01:54 motoko nf_ct_tcp: invalid new deleting.
Nov 25 17:01:54 motoko fire: OUTPUT IN=3D OUT=3Deth1 SRC=3D172.16.8.12 DST=
=3D195.71.11.83 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D19467 DF PROT=
O=3DTCP SPT=3D48595 DPT=3D80 WINDOW=3D54 RES=3D0x00 ACK FIN URGP=3D0
Nov 25 17:01:54 motoko fire: INVALID IN=3Dlo OUT=3D MAC=3D00:00:00:00:00:00=
:00:00:00:00:00:00:08:00 SRC=3D172.16.8.12 DST=3D172.16.8.12 LEN=3D80 TOS=
=3D0x00 PREC=3D0xC0 TTL=3D64 ID=3D29697 PROTO=3DICMP TYPE=3D3 CODE=3D13 [SR=
C=3D172.16.8.12 DST=3D195.71.11.83 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D64=
 ID=3D19467 DF PROTO=3DTCP SPT=3D48595 DPT=3D80 WINDOW=3D54 RES=3D0x00 ACK =
FIN URGP=3D0 ]

Nov 25 17:03:26 motoko nf_ct_tcp: invalid new deleting.
Nov 25 17:03:26 motoko fire: OUTPUT IN=3D OUT=3Deth1 SRC=3D172.16.8.12 DST=
=3D195.71.11.83 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D19468 DF PROT=
O=3DTCP SPT=3D48595 DPT=3D80 WINDOW=3D54 RES=3D0x00 ACK FIN URGP=3D0
Nov 25 17:03:26 motoko fire: INVALID IN=3Dlo OUT=3D MAC=3D00:00:00:00:00:00=
:00:00:00:00:00:00:08:00 SRC=3D172.16.8.12 DST=3D172.16.8.12 LEN=3D80 TOS=
=3D0x00 PREC=3D0xC0 TTL=3D64 ID=3D29709 PROTO=3DICMP TYPE=3D3 CODE=3D13 [SR=
C=3D172.16.8.12 DST=3D195.71.11.83 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D64=
 ID=3D19468 DF PROTO=3DTCP SPT=3D48595 DPT=3D80 WINDOW=3D54 RES=3D0x00 ACK =
FIN URGP=3D0 ]



--dDRMvlgZJXvWKvBx--

--yEPQxsgoJgBvi8ip
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFHS0Q+emsPkv+IVCERAj8qAKCEHomOaZWwIU9lv1uLcGF+v087oACfU1tG
m6g/jg18Lrl+6uN+6psywIM=
=gJNc
-----END PGP SIGNATURE-----

--yEPQxsgoJgBvi8ip--
