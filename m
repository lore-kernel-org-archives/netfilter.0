From: =?ISO-8859-15?Q?Niccol=F2_Belli?= <darkbasic@linuxsystems.it>
Subject: Re: [LARTC] Problem with ip spoofing load balancing
Date: Wed, 26 Oct 2011 14:26:49 +0200
Message-ID: <4EA7FC89.8060907@linuxsystems.it>
References: <4EA733C5.2050101@linuxsystems.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=linuxsystems.it;
	s=linuxsystems.it; t=1319631970;
	bh=eT1sEjGWciXa9AMatsEfNzi1oiFkN4p6Rx4Rr1/Vubc=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	b=DDyek9J2+3y20hvsOxNnx6EY6BYukRJlGd99v/DUvy54P5QUREK6ypScEqRKaZo9P
	 iqFEqtZprH/iHJhd9Q6/YKuEsB9Ol0Ue9qypH2QMXxTFytQtwhQdzX8SgIIM99HU9s
	 FID/jAnWzmTkas0dv0USJqa2Y8bhK0m3ROD6F3c4=
In-Reply-To: <4EA733C5.2050101@linuxsystems.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org
Cc: wireshark-users@wireshark.org, lartc@lists.linuxsystems.it

I did some dumps with the ulogd pcap target:

http://mail.linuxsystems.it/broken-nospoof-client.pcap
http://mail.linuxsystems.it/broken-nospoof-server.pcap
http://mail.linuxsystems.it/broken-spoofing-client.pcap
http://mail.linuxsystems.it/broken-spoofing-server.pcap
http://mail.linuxsystems.it/working-spoofing-client.pcap
http://mail.linuxsystems.it/working-spoofing-server.pcap

"client" means it is the dump on the client side.
"server" means it is the dump on the server side.
"spoofing" means I sent the output using the ppp0 link (the server IP=20
belongs to the nas0 subnet and so it receives the incoming packets from=
=20
nas0).
"nospoof" means I did not use ppp0 at all.
"broken" means the client is the one which does not load the page when=20
spoofing is enabled.
"working" means the client is the one which does load the page when=20
spoofing is enabled.
Both clients (broken and working) do load the page when spoofing is=20
disabled.

nas0 is RFC 2684 routed, it has a 16 IP subnet and a 1500 MTU. The=20
provider is Telecom Italia.
ppp0 is pppoatm, it has a single static IP and a 1492 MTU. The provider=
=20
is Tiscali.

The modem is a Solos multi-port ADSL2+ PCI card.

I opened the dumps with ethereal and it clearly shows a problem:
HTTP	[TCP Previous segment lost] Continuation or non-HTTP traffic
and some
TCP	[TCP Dup ACK 4#1] 39243 > http [ACK] [...]
both RED.

but I don't know how to interpret it.

Why doesn't ip spoofing load balancing work for every client?

Thanks,
Niccol=F2



Il 26/10/2011 00:10, Niccol=F2 Belli ha scritto:
> Hi,
> My router is a linux box with two adsl lines attached, one with a 16 =
IP
> subnet and another with a single static address.
>
> Since I need more upload bandwidth and my isp allows me to do ip
> spoofing, I decided to do an ip spoofing load bal.
>
> Unfortunately it doesn't work with every client and I don't know why =
:(
>
> nas0 is the adsl with the public subnet, ppp0 is the adsl with the
> single static ip. server_ip is one of the IPs of the subnet.
>
>
> This is the log with a working client:
>
> SERVER:
> Oct 25 22:45:47 firewall kernel: [22098.077637] **NEW** IN NAS0
> CONNIN=3Dnas0 OUT=3DethWEB SRC=3D<client_ip> DST=3D<server_ip> LEN=3D=
60 TOS=3D0x00
> PREC=3D0x00 TTL=3D58 ID=3D16271 DF PROTO=3DTCP SPT=3D25258 DPT=3D80 W=
INDOW=3D14600
> RES=3D0x00 SYN URGP=3D0
> Oct 25 22:45:47 firewall kernel: [22098.096517] OUT PPP0 CONNIN=3Deth=
WEB
> OUT=3Dppp0 SRC=3D<server_ip> DST=3D<client_ip> LEN=3D60 TOS=3D0x00 PR=
EC=3D0x00
> TTL=3D63 ID=3D0 DF PROTO=3DTCP SPT=3D80 DPT=3D25258 WINDOW=3D5792 RES=
=3D0x00 ACK SYN
> URGP=3D0 MARK=3D0x4
> Oct 25 22:45:48 firewall kernel: [22098.195139] IN NAS0 CONNIN=3Dnas0
> OUT=3DethWEB SRC=3D<client_ip> DST=3D<server_ip> LEN=3D52 TOS=3D0x00 =
PREC=3D0x00
> TTL=3D58 ID=3D16272 DF PROTO=3DTCP SPT=3D25258 DPT=3D80 WINDOW=3D229 =
RES=3D0x00 ACK
> URGP=3D0 MARK=3D0x4
> Oct 25 22:45:48 firewall kernel: [22098.214590] IN NAS0 CONNIN=3Dnas0
> OUT=3DethWEB SRC=3D<client_ip> DST=3D<server_ip> LEN=3D655 TOS=3D0x00=
 PREC=3D0x00
> TTL=3D58 ID=3D16273 DF PROTO=3DTCP SPT=3D25258 DPT=3D80 WINDOW=3D229 =
RES=3D0x00 ACK
> PSH URGP=3D0 MARK=3D0x4
> Oct 25 22:45:48 firewall kernel: [22098.233922] OUT PPP0 CONNIN=3Deth=
WEB
> OUT=3Dppp0 SRC=3D<server_ip> DST=3D<client_ip> LEN=3D52 TOS=3D0x00 PR=
EC=3D0x00
> TTL=3D63 ID=3D51475 DF PROTO=3DTCP SPT=3D80 DPT=3D25258 WINDOW=3D438 =
RES=3D0x00 ACK
> URGP=3D0 MARK=3D0x4
> Oct 25 22:45:48 firewall kernel: [22098.315441] OUT PPP0 CONNIN=3Deth=
WEB
> OUT=3Dppp0 SRC=3D<server_ip> DST=3D<client_ip> LEN=3D1482 TOS=3D0x00 =
PREC=3D0x00
> TTL=3D63 ID=3D51476 DF PROTO=3DTCP SPT=3D80 DPT=3D25258 WINDOW=3D438 =
RES=3D0x00 ACK
> URGP=3D0 MARK=3D0x4
> Oct 25 22:45:48 firewall kernel: [22098.335592] OUT PPP0 CONNIN=3Deth=
WEB
> OUT=3Dppp0 SRC=3D<server_ip> DST=3D<client_ip> LEN=3D155 TOS=3D0x00 P=
REC=3D0x00
> TTL=3D63 ID=3D51477 DF PROTO=3DTCP SPT=3D80 DPT=3D25258 WINDOW=3D438 =
RES=3D0x00 ACK
> PSH URGP=3D0 MARK=3D0x4
> Oct 25 22:45:48 firewall kernel: [22098.355670] OUT PPP0 CONNIN=3Deth=
WEB
> OUT=3Dppp0 SRC=3D<server_ip> DST=3D<client_ip> LEN=3D52 TOS=3D0x00 PR=
EC=3D0x00
> TTL=3D63 ID=3D51478 DF PROTO=3DTCP SPT=3D80 DPT=3D25258 WINDOW=3D438 =
RES=3D0x00 ACK
> FIN URGP=3D0 MARK=3D0x4
> Oct 25 22:45:48 firewall kernel: [22098.434146] IN NAS0 CONNIN=3Dnas0
> OUT=3DethWEB SRC=3D<client_ip> DST=3D<server_ip> LEN=3D52 TOS=3D0x00 =
PREC=3D0x00
> TTL=3D58 ID=3D16274 DF PROTO=3DTCP SPT=3D25258 DPT=3D80 WINDOW=3D273 =
RES=3D0x00 ACK
> URGP=3D0 MARK=3D0x4
> Oct 25 22:45:48 firewall kernel: [22098.454836] IN NAS0 CONNIN=3Dnas0
> OUT=3DethWEB SRC=3D<client_ip> DST=3D<server_ip> LEN=3D52 TOS=3D0x00 =
PREC=3D0x00
> TTL=3D58 ID=3D16275 DF PROTO=3DTCP SPT=3D25258 DPT=3D80 WINDOW=3D273 =
RES=3D0x00 ACK
> URGP=3D0 MARK=3D0x4
> Oct 25 22:45:48 firewall kernel: [22098.473351] IN NAS0 CONNIN=3Dnas0
> OUT=3DethWEB SRC=3D<client_ip> DST=3D<server_ip> LEN=3D52 TOS=3D0x00 =
PREC=3D0x00
> TTL=3D58 ID=3D16276 DF PROTO=3DTCP SPT=3D25258 DPT=3D80 WINDOW=3D273 =
RES=3D0x00 ACK
> FIN URGP=3D0 MARK=3D0x4
> Oct 25 22:45:48 firewall kernel: [22098.492317] IN NAS0 CONNIN=3Dnas0
> OUT=3DethWEB SRC=3D<client_ip> DST=3D<server_ip> LEN=3D52 TOS=3D0x00 =
PREC=3D0x00
> TTL=3D58 ID=3D16277 DF PROTO=3DTCP SPT=3D25258 DPT=3D80 WINDOW=3D273 =
RES=3D0x00 ACK
> URGP=3D0 MARK=3D0x4
> Oct 25 22:45:48 firewall kernel: [22098.510745] OUT PPP0 CONNIN=3Deth=
WEB
> OUT=3Dppp0 SRC=3D<server_ip> DST=3D<client_ip> LEN=3D52 TOS=3D0x00 PR=
EC=3D0x00
> TTL=3D63 ID=3D51479 DF PROTO=3DTCP SPT=3D80 DPT=3D25258 WINDOW=3D438 =
RES=3D0x00 ACK
> URGP=3D0 MARK=3D0x4
>
> CLIENT:
> Oct 25 22:46:27 laptop kernel: [92080.819184] *NEW* OUT CONN IN=3D
> OUT=3Dwlan1 SRC=3D192.168.1.2 DST=3D<server_ip> LEN=3D60 TOS=3D0x00 P=
REC=3D0x00
> TTL=3D64 ID=3D16271 DF PROTO=3DTCP SPT=3D34877 DPT=3D80 WINDOW=3D1460=
0 RES=3D0x00 SYN
> URGP=3D0
> Oct 25 22:46:27 laptop kernel: [92080.938028] IN CONN IN=3Dwlan1 OUT=3D
> MAC=3D00:c0:ca:21:8a:e6:f0:7d:68:fb:4f:e3:08:00 SRC=3D<server_ip>
> DST=3D192.168.1.2 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D50 ID=3D0 DF =
PROTO=3DTCP
> SPT=3D80 DPT=3D34877 WINDOW=3D5792 RES=3D0x00 ACK SYN URGP=3D0
> Oct 25 22:46:27 laptop kernel: [92080.938067] OUT CONN IN=3D OUT=3Dwl=
an1
> SRC=3D192.168.1.2 DST=3D<server_ip> LEN=3D52 TOS=3D0x00 PREC=3D0x00 T=
TL=3D64
> ID=3D16272 DF PROTO=3DTCP SPT=3D34877 DPT=3D80 WINDOW=3D229 RES=3D0x0=
0 ACK URGP=3D0
> Oct 25 22:46:27 laptop kernel: [92080.938565] OUT CONN IN=3D OUT=3Dwl=
an1
> SRC=3D192.168.1.2 DST=3D<server_ip> LEN=3D655 TOS=3D0x00 PREC=3D0x00 =
TTL=3D64
> ID=3D16273 DF PROTO=3DTCP SPT=3D34877 DPT=3D80 WINDOW=3D229 RES=3D0x0=
0 ACK PSH URGP=3D0
> Oct 25 22:46:27 laptop kernel: [92081.075375] IN CONN IN=3Dwlan1 OUT=3D
> MAC=3D00:c0:ca:21:8a:e6:f0:7d:68:fb:4f:e3:08:00 SRC=3D<server_ip>
> DST=3D192.168.1.2 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D50 ID=3D51475=
 DF PROTO=3DTCP
> SPT=3D80 DPT=3D34877 WINDOW=3D438 RES=3D0x00 ACK URGP=3D0
> Oct 25 22:46:27 laptop kernel: [92081.174877] IN CONN IN=3Dwlan1 OUT=3D
> MAC=3D00:c0:ca:21:8a:e6:f0:7d:68:fb:4f:e3:08:00 SRC=3D<server_ip>
> DST=3D192.168.1.2 LEN=3D1482 TOS=3D0x00 PREC=3D0x00 TTL=3D51 ID=3D514=
76 DF PROTO=3DTCP
> SPT=3D80 DPT=3D34877 WINDOW=3D438 RES=3D0x00 ACK URGP=3D0
> Oct 25 22:46:27 laptop kernel: [92081.174903] OUT CONN IN=3D OUT=3Dwl=
an1
> SRC=3D192.168.1.2 DST=3D<server_ip> LEN=3D52 TOS=3D0x00 PREC=3D0x00 T=
TL=3D64
> ID=3D16274 DF PROTO=3DTCP SPT=3D34877 DPT=3D80 WINDOW=3D273 RES=3D0x0=
0 ACK URGP=3D0
> Oct 25 22:46:27 laptop kernel: [92081.178769] IN CONN IN=3Dwlan1 OUT=3D
> MAC=3D00:c0:ca:21:8a:e6:f0:7d:68:fb:4f:e3:08:00 SRC=3D<server_ip>
> DST=3D192.168.1.2 LEN=3D155 TOS=3D0x00 PREC=3D0x00 TTL=3D50 ID=3D5147=
7 DF PROTO=3DTCP
> SPT=3D80 DPT=3D34877 WINDOW=3D438 RES=3D0x00 ACK PSH URGP=3D0
> Oct 25 22:46:27 laptop kernel: [92081.178793] OUT CONN IN=3D OUT=3Dwl=
an1
> SRC=3D192.168.1.2 DST=3D<server_ip> LEN=3D52 TOS=3D0x00 PREC=3D0x00 T=
TL=3D64
> ID=3D16275 DF PROTO=3DTCP SPT=3D34877 DPT=3D80 WINDOW=3D273 RES=3D0x0=
0 ACK URGP=3D0
> Oct 25 22:46:27 laptop kernel: [92081.178861] OUT CONN IN=3D OUT=3Dwl=
an1
> SRC=3D192.168.1.2 DST=3D<server_ip> LEN=3D52 TOS=3D0x00 PREC=3D0x00 T=
TL=3D64
> ID=3D16276 DF PROTO=3DTCP SPT=3D34877 DPT=3D80 WINDOW=3D273 RES=3D0x0=
0 ACK FIN URGP=3D0
> Oct 25 22:46:27 laptop kernel: [92081.198553] IN CONN IN=3Dwlan1 OUT=3D
> MAC=3D00:c0:ca:21:8a:e6:f0:7d:68:fb:4f:e3:08:00 SRC=3D<server_ip>
> DST=3D192.168.1.2 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D50 ID=3D51478=
 DF PROTO=3DTCP
> SPT=3D80 DPT=3D34877 WINDOW=3D438 RES=3D0x00 ACK FIN URGP=3D0
> Oct 25 22:46:27 laptop kernel: [92081.198590] OUT CONN IN=3D OUT=3Dwl=
an1
> SRC=3D192.168.1.2 DST=3D<server_ip> LEN=3D52 TOS=3D0x00 PREC=3D0x00 T=
TL=3D64
> ID=3D16277 DF PROTO=3DTCP SPT=3D34877 DPT=3D80 WINDOW=3D273 RES=3D0x0=
0 ACK URGP=3D0
> Oct 25 22:46:28 laptop kernel: [92081.351125] IN CONN IN=3Dwlan1 OUT=3D
> MAC=3D00:c0:ca:21:8a:e6:f0:7d:68:fb:4f:e3:08:00 SRC=3D<server_ip>
> DST=3D192.168.1.2 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D50 ID=3D51479=
 DF PROTO=3DTCP
> SPT=3D80 DPT=3D34877 WINDOW=3D438 RES=3D0x00 ACK URGP=3D0
>
>
>
> This is the log with a *NOT* working client:
>
> SERVER:
> Oct 25 22:32:55 firewall kernel: [21325.121680] **NEW** IN NAS0
> CONNIN=3Dnas0 OUT=3DethWEB SRC=3D<client_ip> DST=3D<server_ip> LEN=3D=
60 TOS=3D0x00
> PREC=3D0x00 TTL=3D54 ID=3D14919 DF PROTO=3DTCP SPT=3D31549 DPT=3D80 W=
INDOW=3D5840
> RES=3D0x00 SYN URGP=3D0
> Oct 25 22:32:55 firewall kernel: [21325.140239] OUT PPP0 CONNIN=3Deth=
WEB
> OUT=3Dppp0 SRC=3D<server_ip> DST=3D<client_ip> LEN=3D60 TOS=3D0x00 PR=
EC=3D0x00
> TTL=3D63 ID=3D0 DF PROTO=3DTCP SPT=3D80 DPT=3D31549 WINDOW=3D5792 RES=
=3D0x00 ACK SYN
> URGP=3D0 MARK=3D0x4
> Oct 25 22:32:55 firewall kernel: [21325.236986] IN NAS0 CONNIN=3Dnas0
> OUT=3DethWEB SRC=3D<client_ip> DST=3D<server_ip> LEN=3D52 TOS=3D0x00 =
PREC=3D0x00
> TTL=3D54 ID=3D14920 DF PROTO=3DTCP SPT=3D31549 DPT=3D80 WINDOW=3D46 R=
ES=3D0x00 ACK
> URGP=3D0 MARK=3D0x4
> Oct 25 22:32:55 firewall kernel: [21325.267581] IN NAS0 CONNIN=3Dnas0
> OUT=3DethWEB SRC=3D<client_ip> DST=3D<server_ip> LEN=3D653 TOS=3D0x00=
 PREC=3D0x00
> TTL=3D54 ID=3D14921 DF PROTO=3DTCP SPT=3D31549 DPT=3D80 WINDOW=3D46 R=
ES=3D0x00 ACK PSH
> URGP=3D0 MARK=3D0x4
> Oct 25 22:32:55 firewall kernel: [21325.286615] OUT PPP0 CONNIN=3Deth=
WEB
> OUT=3Dppp0 SRC=3D<server_ip> DST=3D<client_ip> LEN=3D52 TOS=3D0x00 PR=
EC=3D0x00
> TTL=3D63 ID=3D55122 DF PROTO=3DTCP SPT=3D80 DPT=3D31549 WINDOW=3D438 =
RES=3D0x00 ACK
> URGP=3D0 MARK=3D0x4
> Oct 25 22:32:55 firewall kernel: [21325.385647] OUT PPP0 CONNIN=3Deth=
WEB
> OUT=3Dppp0 SRC=3D<server_ip> DST=3D<client_ip> LEN=3D137 TOS=3D0x00 P=
REC=3D0x00
> TTL=3D63 ID=3D55124 DF PROTO=3DTCP SPT=3D80 DPT=3D31549 WINDOW=3D438 =
RES=3D0x00 ACK
> PSH URGP=3D0 MARK=3D0x4
> Oct 25 22:32:55 firewall kernel: [21325.405173] OUT PPP0 CONNIN=3Deth=
WEB
> OUT=3Dppp0 SRC=3D<server_ip> DST=3D<client_ip> LEN=3D52 TOS=3D0x00 PR=
EC=3D0x00
> TTL=3D63 ID=3D55125 DF PROTO=3DTCP SPT=3D80 DPT=3D31549 WINDOW=3D438 =
RES=3D0x00 ACK
> FIN URGP=3D0 MARK=3D0x4
> Oct 25 22:32:55 firewall kernel: [21325.484020] IN NAS0 CONNIN=3Dnas0
> OUT=3DethWEB SRC=3D<client_ip> DST=3D<server_ip> LEN=3D64 TOS=3D0x00 =
PREC=3D0x00
> TTL=3D54 ID=3D14922 DF PROTO=3DTCP SPT=3D31549 DPT=3D80 WINDOW=3D46 R=
ES=3D0x00 ACK
> URGP=3D0 MARK=3D0x4
> Oct 25 22:32:55 firewall kernel: [21325.504418] IN NAS0 CONNIN=3Dnas0
> OUT=3DethWEB SRC=3D<client_ip> DST=3D<server_ip> LEN=3D64 TOS=3D0x00 =
PREC=3D0x00
> TTL=3D54 ID=3D14923 DF PROTO=3DTCP SPT=3D31549 DPT=3D80 WINDOW=3D46 R=
ES=3D0x00 ACK
> URGP=3D0 MARK=3D0x4
>
> CLIENT:
> Oct 25 22:32:54 shoutcast-server kernel: [180468.541703] *NEW* OUT CO=
NN
> IN=3D OUT=3Deth0 SRC=3D192.168.203.10 DST=3D<server_ip> LEN=3D60 TOS=3D=
0x00
> PREC=3D0x00 TTL=3D64 ID=3D14919 DF PROTO=3DTCP SPT=3D49680 DPT=3D80 W=
INDOW=3D5840
> RES=3D0x00 SYN URGP=3D0
> Oct 25 22:32:55 shoutcast-server kernel: [180468.659871] IN CONN IN=3D=
eth0
> OUT=3D MAC=3D00:01:2e:2d:72:e3:00:11:92:95:25:72:08:00 SRC=3D<server_=
ip>
> DST=3D192.168.203.10 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D48 ID=3D0 =
DF PROTO=3DTCP
> SPT=3D80 DPT=3D49680 WINDOW=3D5792 RES=3D0x00 ACK SYN URGP=3D0
> Oct 25 22:32:55 shoutcast-server kernel: [180468.659935] OUT CONN IN=3D
> OUT=3Deth0 SRC=3D192.168.203.10 DST=3D<server_ip> LEN=3D52 TOS=3D0x00=
 PREC=3D0x00
> TTL=3D64 ID=3D14920 DF PROTO=3DTCP SPT=3D49680 DPT=3D80 WINDOW=3D46 R=
ES=3D0x00 ACK URGP=3D0
> Oct 25 22:32:55 shoutcast-server kernel: [180468.660406] OUT CONN IN=3D
> OUT=3Deth0 SRC=3D192.168.203.10 DST=3D<server_ip> LEN=3D653 TOS=3D0x0=
0 PREC=3D0x00
> TTL=3D64 ID=3D14921 DF PROTO=3DTCP SPT=3D49680 DPT=3D80 WINDOW=3D46 R=
ES=3D0x00 ACK PSH
> URGP=3D0
> Oct 25 22:32:55 shoutcast-server kernel: [180468.805969] IN CONN IN=3D=
eth0
> OUT=3D MAC=3D00:01:2e:2d:72:e3:00:11:92:95:25:72:08:00 SRC=3D<server_=
ip>
> DST=3D192.168.203.10 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D48 ID=3D55=
122 DF
> PROTO=3DTCP SPT=3D80 DPT=3D49680 WINDOW=3D438 RES=3D0x00 ACK URGP=3D0
> Oct 25 22:32:55 shoutcast-server kernel: [180468.908678] IN CONN IN=3D=
eth0
> OUT=3D MAC=3D00:01:2e:2d:72:e3:00:11:92:95:25:72:08:00 SRC=3D<server_=
ip>
> DST=3D192.168.203.10 LEN=3D137 TOS=3D0x00 PREC=3D0x00 TTL=3D48 ID=3D5=
5124 DF
> PROTO=3DTCP SPT=3D80 DPT=3D49680 WINDOW=3D438 RES=3D0x00 ACK PSH URGP=
=3D0
> Oct 25 22:32:55 shoutcast-server kernel: [180468.908733] OUT CONN IN=3D
> OUT=3Deth0 SRC=3D192.168.203.10 DST=3D<server_ip> LEN=3D64 TOS=3D0x00=
 PREC=3D0x00
> TTL=3D64 ID=3D14922 DF PROTO=3DTCP SPT=3D49680 DPT=3D80 WINDOW=3D46 R=
ES=3D0x00 ACK URGP=3D0
> Oct 25 22:32:55 shoutcast-server kernel: [180468.924857] IN CONN IN=3D=
eth0
> OUT=3D MAC=3D00:01:2e:2d:72:e3:00:11:92:95:25:72:08:00 SRC=3D<server_=
ip>
> DST=3D192.168.203.10 LEN=3D52 TOS=3D0x00 PREC=3D0x00 TTL=3D48 ID=3D55=
125 DF
> PROTO=3DTCP SPT=3D80 DPT=3D49680 WINDOW=3D438 RES=3D0x00 ACK FIN URGP=
=3D0
> Oct 25 22:32:55 shoutcast-server kernel: [180468.924914] OUT CONN IN=3D
> OUT=3Deth0 SRC=3D192.168.203.10 DST=3D<server_ip> LEN=3D64 TOS=3D0x00=
 PREC=3D0x00
> TTL=3D64 ID=3D14923 DF PROTO=3DTCP SPT=3D49680 DPT=3D80 WINDOW=3D46 R=
ES=3D0x00 ACK URGP=3D0
>
>
>
> As you can see both clients do receive the spoofed packets, but the
> second one can't load the page.
>
>
> Suggestions?
>
> Thanks,
> Niccol=F2
> _______________________________________________
> LARTC mailing list
> LARTC@lists.linuxsystems.it
> http://lists.linuxsystems.it/listinfo/lartc

