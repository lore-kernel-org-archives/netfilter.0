From: =?iso-8859-1?Q?Thomas_B=E4tzler?= <t.baetzler@bringe.com>
Subject: Weird nat/conntrack Problem with PASV FTP upload
Date: Thu, 5 Jun 2008 11:02:13 +0200
Message-ID: <E350C77ABFDBD242BDD51F5DA07905C102825E13@SONNE.gw.bringe.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi & thank you for taking the time to have a look at this.

The basic setup is like this:

(ftp client)<=3D>(my nat box)<=3Dbig pipe=3D>(their nat box)<=3D>(ftp s=
erver)

The FTP client is PHP5's FTP library on a Debian Etch box with kernel 2=
=2E6.23 built from a Debian source package.
My NAT box is also Debian Etch, recently upgraded to 2.6.25 using the c=
urrent Debian source package.
I Don't know much about the remote side, except that their FTP server i=
s supposedly ProFTPd on Debian Etch.

We use PASV FTP transfers for our uploads and that's been working o.k. =
for us most of the time.

I say "most of the time" because we lose the data connection in about 1=
% of the transfers (mostly files in the 100kB to 5MB Range).

I've tcpdump'ed a some of those transfers on the external interface of =
my NAT box and on the client, and I don't understand what's going on. L=
et me give you an example:

tcpdump -rtttS on myclient:

000000 IP myclient.56785 > server.39790: SWE 427872165:427872165(0) win=
 5840 <mss 1460,sackOK,timestamp 481846634 0,nop,w
scale 7>
015646 IP server.39790 > myclient.56785: SE 2283192455:2283192455(0) ac=
k 427872166 win 5792 <mss 1460,sackOK,timestamp 16317902 481846634,nop,=
wscale 7>
000010 IP myclient.56785 > server.39790: . ack 2283192456 win 46 <nop,n=
op,timestamp 481846636 16317902>
[...]
000002 IP myclient.56785 > server.39790: . 428128803:428131699(2896) ac=
k 2283192456 win 46 <nop,nop,timestamp 481846649 16317934>
000784 IP server.39790 > myclient.56785: . ack 428044995 win 696 <nop,n=
op,timestamp 16317935 481846647,nop,nop,sack 1 {428046443:428047891}>
000006 IP myclient.56785 > server.39790: . 428131699:428134083(2384) ac=
k 2283192456 win 46 <nop,nop,timestamp 481846649 16317935>
000002 IP server.39790 > myclient.56785: . ack 428047891 win 686 <nop,n=
op,timestamp 16317935 481846647>
000003 IP myclient.56785 > server.39790: . 428134083:428135699(1616) ac=
k 2283192456 win 46 <nop,nop,timestamp 481846649 16317935>
000004 IP server.39790 > myclient.56785: . ack 428049339 win 675 <nop,n=
op,timestamp 16317935 481846647>

tcpdump -rtttS on natbox:

000000 IP mynatbox.56785 > server.39790: SWE 427872165:427872165(0) win=
 5840 <mss 1460,sackOK,timestamp 481846634 0,nop,wscale 7>
015564 IP server.39790 > mynatbox.56785: SE 2283192455:2283192455(0) ac=
k 427872166 win 5792 <mss 1460,sackOK,timestamp 16317902 481846634,nop,=
wscale 7>
000062 IP mynatbox.56785 > server.39790: . ack 2283192456 win 46 <nop,n=
op,timestamp 481846636 16317902>
[...]
000004 IP mynatbox.56785 > server.39790: . 428128803:428130251(1448) ac=
k 2283192456 win 46 <nop,nop,timestamp 481846649 16317934>
000034 IP mynatbox.56785 > server.39790: . 428130251:428131699(1448) ac=
k 2283192456 win 46 <nop,nop,timestamp 481846649 16317934>
000560 IP server.39790 > mynatbox.56785: . ack 428042099 win 700 <nop,n=
op,timestamp 16317935 481846647,nop,nop,sack 1 {428046443:428047891}>
000020 IP mynatbox.56785 > server.39790: R 428042099:428042099(0) win 0
000002 IP server.39790 > mynatbox.56785: . ack 428042099 win 700 <nop,n=
op,timestamp 16317935 481846647,nop,nop,sack 2 {428043547:428044995}{42=
8046443:428047891}>
000005 IP mynatbox.56785 > server.39790: R 428042099:428042099(0) win 0
000002 IP server.39790 > mynatbox.56785: . ack 428044995 win 696 <nop,n=
op,timestamp 16317935 481846647,nop,nop,sack 1 {428046443:428047891}>
000006 IP server.39790 > mynatbox.56785: . ack 428047891 win 686 <nop,n=
op,timestamp 16317935 481846647>
000005 IP server.39790 > mynatbox.56785: . ack 428049339 win 675 <nop,n=
op,timestamp 16317935 481846647>


Now I don't know why myclient thinks it's sending 2k+ byte segments, si=
nce its interface MTU is definitely 1500, and it also agreed on a mss o=
f 1460. Since myclient's NIC is an e1000, it might be tcp segmentation =
offload at work.

No, what's really scaring me is that natbox tries to tear down the data=
 connection for no apparent reason. Like in the example shown, it seems=
 to happen mostly when server sends a selective ack for an out-of-order=
 segment. Sometimes server just shrugs the rst off and keeps on acking =
data, but at other times it gives in and tears down the connection.

I'm grateful for any pointer or explanation you might have for me. Righ=
t now I'm at my wit's end.

TIA,
Thomas
--=20
BRINGE Informationstechnik GmbH
Zur Seeplatte 12
D-76228 Karlsruhe
Germany

=46on: +49 721 94246-0
=46on: +49 171 5438457
=46ax: +49 721 94246-66
Web: http://www.bringe.de/

Gesch=E4ftsf=FChrer: Dipl.-Ing. (FH) Martin Bringe
Ust.Id: DE812936645, HRB 108943 Mannheim=20
