From: Kapetanakis Giannis <bilias@edu.physics.uoc.gr>
Subject: Round robin load balance to local port range
Date: Fri, 06 Nov 2009 17:30:48 +0200
Message-ID: <4AF44128.5000301@edu.physics.uoc.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi all,

I'm trying to load balance (round robin) to multiple instances of openv=
pn
running locally in ports 9000-9004 without luck.

2.6.30.9-96.fc11 / iptables-1.4.3.1-1.fc11

=46or testing I tried first on the output chain to see if it works.

iptables -t nat -A OUTPUT -d 127.0.0.1 -m tcp -p tcp --dport 8000 -j=20
DNAT --to-destination :9000-9004
iptables -t filter -I INPUT 1 -m tcp -p tcp --dport 9000:9004 -j LOG

telnet 127.0.0.1 8000
telnet 127.0.0.1 8000
telnet 127.0.0.1 8000

Nov  6 17:27:20 localhost kernel: IN=3Dlo OUT=3D=20
MAC=3D00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=3D127.0.0.1=20
DST=3D127.0.0.1 LEN=3D60 TOS=3D0x10 PREC=3D0x00 TTL=3D64 ID=3D37697 DF =
PROTO=3DTCP=20
SPT=3D35462 DPT=3D9000 WINDOW=3D32792 RES=3D0x00 SYN URGP=3D0
Nov  6 17:27:21 localhost kernel: IN=3Dlo OUT=3D=20
MAC=3D00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=3D127.0.0.1=20
DST=3D127.0.0.1 LEN=3D60 TOS=3D0x10 PREC=3D0x00 TTL=3D64 ID=3D30693 DF =
PROTO=3DTCP=20
SPT=3D35463 DPT=3D9000 WINDOW=3D32792 RES=3D0x00 SYN URGP=3D0
Nov  6 17:27:22 localhost kernel: IN=3Dlo OUT=3D=20
MAC=3D00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=3D127.0.0.1=20
DST=3D127.0.0.1 LEN=3D60 TOS=3D0x10 PREC=3D0x00 TTL=3D64 ID=3D12621 DF =
PROTO=3DTCP=20
SPT=3D35464 DPT=3D9000 WINDOW=3D32792 RES=3D0x00 SYN URGP=3D0


As you can see all connections are natted but only port 9000 is being=20
used from the range.

I also tried with redirect
iptables -t nat -A OUTPUT -d 127.0.0.1 -m tcp -p tcp --dport 8000 -j=20
REDIRECT --to-ports 9000-9004
or even
iptables -t nat -A OUTPUT -d 127.0.0.1 -m tcp -p tcp --dport 8000 -j=20
DNAT --to-destination 127.0.0.1:9000-9004

same results, only port 9000.

According to the man page:

In  Kernels  up  to  2.6.10 you can add several --to-destination
               options. For those kernels, if you specify more than one=
 =20
desti-
               nation   address,  either  via  an  address  range  or =20
multiple
               --to-destination  options,  a  simple  round-robin =20
(one   after
               another  in  cycle)  load  balancing  takes  place=20
between these
               addresses.  Later Kernels (>=3D 2.6.11-rc1) don=A2t have=
 the=20
ability
               to NAT to multiple ranges anymore.

Either the kernel is doing some kind of hashing based on my src-ip=20
instead of round-robin
or the last phrase should change "to ranges anymore" instead of=20
"multiple ranges anymore"

I'm using a single range (ports 9000-9004) thus not multiple ranges.

Am I doing something wrong here or is it something I don't get?

best regards,

Giannis

