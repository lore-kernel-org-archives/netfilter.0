From: "Eduardo Spremolla" <edspremolla@antel.com.uy>
Subject: SNAT and IPSEC
Date: Tue, 12 Apr 2005 15:08:12 -0300
Message-ID: <1113329293.29536.13.camel@fly.in.iantel.com.uy>
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
To: netfilter@lists.netfilter.org

I have 2 local networks 10.2.2.0/24 and 10.37.130.0/24 interconnected by
a ipsec tunnel running on kernel 2.6 native ipsec. So far so good.

Now the admin of 10.37.130.0 wants me to NAT my network to 10.3.3.0
because he had a ip conflict. I cant SNAT because when the packet goes
to nat post it has been encapsulated in ESP and had the firewalls
address, as you can see in the bottom log snipe.I try to use NETMAP in
mangle PREROUTING, but it changes the dest ip , not the source.

Is this possible?

Thanks in advance for any clue.

LALO

55:55 mgl pre IN=3Deth0 OUT=3D SRC=3D10.2.2.3 DST=3D10.37.130.7 LEN=3D48 =
TTL=3D128
ID=3D644 DF PROTO=3DTCP SPT=3D1094 DPT=3D80 WINDOW=3D65535 RES=3D0x00 =
SYN URGP=3D0=20
55:55 nat pre IN=3Deth0 OUT=3D SRC=3D10.2.2.3 DST=3D10.37.130.7 LEN=3D48 =
TTL=3D128
ID=3D644 DF PROTO=3DTCP SPT=3D1094 DPT=3D80 WINDOW=3D65535 RES=3D0x00 =
SYN URGP=3D0=20
55:55 fwr IN=3Deth0 OUT=3Dppp0 SRC=3D10.2.2.3 DST=3D10.37.130.7 LEN=3D48 =
TTL=3D127
ID=3D644 DF PROTO=3DTCP SPT=3D1094 DPT=3D80 WINDOW=3D65535 RES=3D0x00 =
SYN URGP=3D0=20
55:55 mgl post IN=3D OUT=3Dppp0 SRC=3D200.2.40.44 DST=3D200.40.244.6 =
LEN=3D104
TTL=3D64 ID=3D257 DF PROTO=3DESP SPI=3D0x3368448=20
55:55 nat post IN=3D OUT=3Dppp0 SRC=3D200.2.40.44 DST=3D200.40.244.6 =
LEN=3D104
TTL=3D64 ID=3D257 DF PROTO=3DESP SPI=3D0x3368448=20

55:56 mgl pre IN=3Dppp0 OUT=3D MAC=3D SRC=3D200.40.244.6 =
DST=3D200.2.40.44 LEN=3D104
TTL=3D58 ID=3D49185 DF PROTO=3DESP SPI=3D0xb6601be=20
55:56 inp IN=3Dppp0 OUT=3D MAC=3D SRC=3D200.40.244.6 DST=3D200.2.40.44 =
LEN=3D104
TTL=3D58 ID=3D49185 DF PROTO=3DESP SPI=3D0xb6601be=20
55:56 mgl pre IN=3Dppp0 OUT=3D MAC=3D SRC=3D10.37.130.7 DST=3D10.2.2.3 =
LEN=3D48
TTL=3D63 ID=3D0 DF PROTO=3DTCP SPT=3D80 DPT=3D1094 WINDOW=3D5840 =
RES=3D0x00 ACK SYN
URGP=3D0=20
55:56 fwr IN=3Dppp0 OUT=3Deth0 SRC=3D10.37.130.7 DST=3D10.2.2.3 LEN=3D48 =
TTL=3D62
ID=3D0 DF PROTO=3DTCP SPT=3D80 DPT=3D1094 WINDOW=3D5840 RES=3D0x00 ACK =
SYN URGP=3D0=20
55:56 mgl post IN=3D OUT=3Deth0 SRC=3D10.37.130.7 DST=3D10.2.2.3 =
LEN=3D48 TTL=3D62
ID=3D0 DF PROTO=3DTCP SPT=3D80 DPT=3D1094 WINDOW=3D5840 RES=3D0x00 ACK =
SYN URGP=3D0=20

55:56 mgl pre IN=3Deth0 OUT=3D SRC=3D10.2.2.3 DST=3D10.37.130.7 LEN=3D40 =
TTL=3D128
ID=3D645 DF PROTO=3DTCP SPT=3D1094 DPT=3D80 WINDOW=3D65535 RES=3D0x00 =
ACK URGP=3D0=20
55:56 fwr IN=3Deth0 OUT=3Dppp0 SRC=3D10.2.2.3 DST=3D10.37.130.7 LEN=3D40 =
TTL=3D127
ID=3D645 DF PROTO=3DTCP SPT=3D1094 DPT=3D80 WINDOW=3D65535 RES=3D0x00 =
ACK URGP=3D0=20
55:56 mgl post IN=3D OUT=3Dppp0 SRC=3D200.2.40.44 DST=3D200.40.244.6 =
LEN=3D96
TTL=3D64 ID=3D257 DF PROTO=3DESP SPI=3D0x3368448=20

56:03 mgl pre IN=3Deth0 OUT=3D SRC=3D10.2.2.3 DST=3D10.37.130.7 LEN=3D41 =
TTL=3D128
ID=3D646 DF PROTO=3DTCP SPT=3D1094 DPT=3D80 WINDOW=3D65535 RES=3D0x00 =
ACK PSH
URGP=3D0=20
56:03 fwr IN=3Deth0 OUT=3Dppp0 SRC=3D10.2.2.3 DST=3D10.37.130.7 LEN=3D41 =
TTL=3D127
ID=3D646 DF PROTO=3DTCP SPT=3D1094 DPT=3D80 WINDOW=3D65535 RES=3D0x00 =
ACK PSH
URGP=3D0=20
56:03 mgl post IN=3D OUT=3Dppp0 SRC=3D200.2.40.44 DST=3D200.40.244.6 =
LEN=3D96
TTL=3D64 ID=3D3 DF PROTO=3DESP SPI=3D0x3368448=20

56:04 mgl pre IN=3Dppp0 OUT=3D MAC=3D SRC=3D200.40.244.6 =
DST=3D200.2.40.44 LEN=3D96
TTL=3D58 ID=3D49185 DF PROTO=3DESP SPI=3D0xb6601be=20
56:04 inp IN=3Dppp0 OUT=3D MAC=3D SRC=3D200.40.244.6 DST=3D200.2.40.44 =
LEN=3D96
TTL=3D58 ID=3D49185 DF PROTO=3DESP SPI=3D0xb6601be=20
56:04 mgl pre IN=3Dppp0 OUT=3D MAC=3D SRC=3D10.37.130.7 DST=3D10.2.2.3 =
LEN=3D40
TTL=3D63 ID=3D9879 DF PROTO=3DTCP SPT=3D80 DPT=3D1094 WINDOW=3D5840 =
RES=3D0x00 ACK
URGP=3D0=20
56:04 fwr IN=3Dppp0 OUT=3Deth0 SRC=3D10.37.130.7 DST=3D10.2.2.3 LEN=3D40 =
TTL=3D62
ID=3D9879 DF PROTO=3DTCP SPT=3D80 DPT=3D1094 WINDOW=3D5840 RES=3D0x00 =
ACK URGP=3D0=20
56:04 mgl post IN=3D OUT=3Deth0 SRC=3D10.37.130.7 DST=3D10.2.2.3 =
LEN=3D40 TTL=3D62
ID=3D9879 DF PROTO=3DTCP SPT=3D80 DPT=3D1094 WINDOW=3D5840 RES=3D0x00 =
ACK URGP=3D0=20

56:04 mgl pre IN=3Deth0 OUT=3D SRC=3D10.2.2.3 DST=3D10.37.130.7 LEN=3D41 =
TTL=3D128
ID=3D647 DF PROTO=3DTCP SPT=3D1094 DPT=3D80 WINDOW=3D65535 RES=3D0x00 =
ACK PSH
URGP=3D0=20
56:04 fwr IN=3Deth0 OUT=3Dppp0 SRC=3D10.2.2.3 DST=3D10.37.130.7 LEN=3D41 =
TTL=3D127
ID=3D647 DF PROTO=3DTCP SPT=3D1094 DPT=3D80 WINDOW=3D65535 RES=3D0x00 =
ACK PSH
URGP=3D0=20
56:04 mgl post IN=3D OUT=3Dppp0 SRC=3D200.2.40.44 DST=3D200.40.244.6 =
LEN=3D96
TTL=3D64 ID=3D15414 DF PROTO=3DESP SPI=3D0x3368448


Este e-mail y cualquier posible archivo adjunto est=E1 dirigido =
=FAnicamente al destinatario del mensaje y contiene informaci=F3n que =
puede ser confidencial. Si Ud. no es el destinatario correcto por favor =
notifique al remitente respondiendo este mensaje y elimine =
inmediatamente el e-mail y los posibles archivos adjuntos al mismo de su =
sistema. Est=E1 prohibida cualquier utilizaci=F3n, difusi=F3n o copia de =
este e-mail por cualquier persona o entidad que no sean las =
espec=EDficas destinatarias del mensaje. ANTEL no acepta ninguna =
responsabilidad con respecto a cualquier comunicaci=F3n que haya sido =
emitida incumpliendo nuestra Pol=EDtica de Seguridad de la =
Informaci=F3n.
. . . . . . . . .
This e-mail and any attachment is confidential and is intended solely =
for the addressee(s). If you are not intended recipient please inform =
the sender inmediately, answering this e-mail and delete it as well as =
the attached files. Any use, circulation or copy of this e-mail by any =
person or entity that not is the specific addressee(s) is prohibited. =
ANTEL is not responsible for any communication emitted without =
respecting our Information Security Policy.

