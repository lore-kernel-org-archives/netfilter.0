From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: IP Forwarding works on local port but not a remote port
Date: Fri, 05 Feb 2010 21:50:39 +0200
Message-ID: <1265399439.3910.29.camel@casper.meteor.dp.ua>
References: <81ed8b881002050747s73a79b0fqcb35ac2d15f3ddfd@mail.gmail.com>
	 <1265389890.3910.11.camel@casper.meteor.dp.ua>
	 <81ed8b881002051013n5f020a3fladfda4a5f33aa625@mail.gmail.com>
	 <1265394296.3910.19.camel@casper.meteor.dp.ua>
	 <81ed8b881002051114o520f3f92l2fd46ece17900edb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <81ed8b881002051114o520f3f92l2fd46ece17900edb@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Dan Daugherty <rescue@ddaniscool.com>
Cc: netfilter@vger.kernel.org

=F7 =F0=D4=CE, 05/02/2010 =D7 14:14 -0500, Dan Daugherty =D0=C9=DB=C5=D4=
:
> I had to make some changes to the ultimate destination since the
> machine I am trying to get to didn't have tcpdump and getting it for
> solaris isn't worth it to me.  Since I know this is an iptables issue=
,
> I'm good with using a different destination to test and then change i=
t
> in production.
>=20
> Dictionary:
> err.sfa.com is the machine from which I am testing. ip of 6.149
> sethra is the router. ip of 1.205
> vlad is the destination machine. ip of 1.206

Are you using /16 netmask?

> Commands used on sethra:
> iptables -F
> iptables -F -t nat
> iptables -t nat -A PREROUTING -p tcp -i eth0 --dport 1521 -j LOG
> --log-prefix '**LOG PRE** '
> iptables -t nat -A POSTROUTING -o eth0 -p tcp  -j LOG --log-prefix
> '**LOG POST** '
>=20
> iptables -t nat -A PREROUTING -p tcp --dport 1521 -i eth0 -j DNAT --t=
o
> 10.117.1.206:1521
> iptables -t nat -A POSTROUTING -o eth0 -d 10.117.1.206 -p tcp --dport
> 1521 -j SNAT --to-source 10.117.1.205
>=20
> err:~ dan$ telnet 10.117.1.205 1521
> Trying 10.117.1.205...
> telnet: connect to address 10.117.1.205: Operation timed out
> telnet: Unable to connect to remote host
>=20
> packet counts
> [root@sethra ~]# iptables -t nat -nvL
> Chain PREROUTING (policy ACCEPT 35405 packets, 42M bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>    22  1152 LOG        tcp  --  eth0   *       0.0.0.0/0
> 0.0.0.0/0           tcp dpt:1521 LOG flags 0 level 4 prefix `**LOG
> PRE** '
>    22  1152 DNAT       tcp  --  eth0   *       0.0.0.0/0
> 0.0.0.0/0           tcp dpt:1521 to:10.117.1.206:1521

22 connections (attempts) got DNATed.

> Chain POSTROUTING (policy ACCEPT 428 packets, 39754 bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>     0     0 LOG        tcp  --  *      eth0    0.0.0.0/0
> 0.0.0.0/0           LOG flags 0 level 4 prefix `**LOG POST** '
>     0     0 SNAT       tcp  --  *      eth0    0.0.0.0/0
> 10.117.1.206        tcp dpt:1521 to:10.117.1.205

None of them got SNATed. Why? Should they go out through eth0? Try to
remove "-o eth0".

Also do you have ip.forwarding enabled (sysctl -a | grep forward")?

Can you reach 10.117.1.205:1521 from sethra (telnet 10.117.1.205 1521)?

> Chain OUTPUT (policy ACCEPT 471 packets, 48328 bytes)
>  pkts bytes target     prot opt in     out     source
> destination
>=20
>=20
> Kernel logs:
> Feb  5 14:01:27 sethra kernel: **LOG PRE** IN=3Deth0 OUT=3D
> MAC=3D00:26:b9:3f:89:f9:00:17:f2:c8:24:8a:08:00 SRC=3D10.117.6.149
> DST=3D10.117.1.205 LEN=3D64 TOS=3D0x10 PREC=3D0x00 TTL=3D64 ID=3D1324=
4 DF
> PROTO=3DTCP SPT=3D62981 DPT=3D1521 WINDOW=3D65535 RES=3D0x00 SYN URGP=
=3D0
> Feb  5 14:01:28 sethra kernel: **LOG PRE** IN=3Deth0 OUT=3D
> MAC=3D00:26:b9:3f:89:f9:00:17:f2:c8:24:8a:08:00 SRC=3D10.117.6.149
> DST=3D10.117.1.205 LEN=3D64 TOS=3D0x10 PREC=3D0x00 TTL=3D64 ID=3D1431=
 DF PROTO=3DTCP
> SPT=3D62981 DPT=3D1521 WINDOW=3D65535 RES=3D0x00 SYN URGP=3D0
> Feb  5 14:01:29 sethra kernel: **LOG PRE** IN=3Deth0 OUT=3D
> MAC=3D00:26:b9:3f:89:f9:00:17:f2:c8:24:8a:08:00 SRC=3D10.117.6.149
> DST=3D10.117.1.205 LEN=3D64 TOS=3D0x10 PREC=3D0x00 TTL=3D64 ID=3D2140=
7 DF
> PROTO=3DTCP SPT=3D62981 DPT=3D1521 WINDOW=3D65535 RES=3D0x00 SYN URGP=
=3D0
> Feb  5 14:01:30 sethra kernel: **LOG PRE** IN=3Deth0 OUT=3D
> MAC=3D00:26:b9:3f:89:f9:00:17:f2:c8:24:8a:08:00 SRC=3D10.117.6.149
> DST=3D10.117.1.205 LEN=3D48 TOS=3D0x10 PREC=3D0x00 TTL=3D64 ID=3D4493=
1 DF
> PROTO=3DTCP SPT=3D62981 DPT=3D1521 WINDOW=3D65535 RES=3D0x00 SYN URGP=
=3D0
> Feb  5 14:01:31 sethra kernel: **LOG PRE** IN=3Deth0 OUT=3D
> MAC=3D00:26:b9:3f:89:f9:00:17:f2:c8:24:8a:08:00 SRC=3D10.117.6.149
> DST=3D10.117.1.205 LEN=3D48 TOS=3D0x10 PREC=3D0x00 TTL=3D64 ID=3D1740=
1 DF
> PROTO=3DTCP SPT=3D62981 DPT=3D1521 WINDOW=3D65535 RES=3D0x00 SYN URGP=
=3D0
> Feb  5 14:01:32 sethra kernel: **LOG PRE** IN=3Deth0 OUT=3D
> MAC=3D00:26:b9:3f:89:f9:00:17:f2:c8:24:8a:08:00 SRC=3D10.117.6.149
> DST=3D10.117.1.205 LEN=3D48 TOS=3D0x10 PREC=3D0x00 TTL=3D64 ID=3D2343=
0 DF
> PROTO=3DTCP SPT=3D62981 DPT=3D1521 WINDOW=3D65535 RES=3D0x00 SYN URGP=
=3D0
> Feb  5 14:01:34 sethra kernel: **LOG PRE** IN=3Deth0 OUT=3D
> MAC=3D00:26:b9:3f:89:f9:00:17:f2:c8:24:8a:08:00 SRC=3D10.117.6.149
> DST=3D10.117.1.205 LEN=3D48 TOS=3D0x10 PREC=3D0x00 TTL=3D64 ID=3D3420=
7 DF
> PROTO=3DTCP SPT=3D62981 DPT=3D1521 WINDOW=3D65535 RES=3D0x00 SYN URGP=
=3D0
> Feb  5 14:01:38 sethra kernel: **LOG PRE** IN=3Deth0 OUT=3D
> MAC=3D00:26:b9:3f:89:f9:00:17:f2:c8:24:8a:08:00 SRC=3D10.117.6.149
> DST=3D10.117.1.205 LEN=3D48 TOS=3D0x10 PREC=3D0x00 TTL=3D64 ID=3D7366=
 DF PROTO=3DTCP
> SPT=3D62981 DPT=3D1521 WINDOW=3D65535 RES=3D0x00 SYN URGP=3D0
> Feb  5 14:01:46 sethra kernel: **LOG PRE** IN=3Deth0 OUT=3D
> MAC=3D00:26:b9:3f:89:f9:00:17:f2:c8:24:8a:08:00 SRC=3D10.117.6.149
> DST=3D10.117.1.205 LEN=3D48 TOS=3D0x10 PREC=3D0x00 TTL=3D64 ID=3D3606=
8 DF
> PROTO=3DTCP SPT=3D62981 DPT=3D1521 WINDOW=3D65535 RES=3D0x00 SYN URGP=
=3D0
> Feb  5 14:02:02 sethra kernel: **LOG PRE** IN=3Deth0 OUT=3D
> MAC=3D00:26:b9:3f:89:f9:00:17:f2:c8:24:8a:08:00 SRC=3D10.117.6.149
> DST=3D10.117.1.205 LEN=3D48 TOS=3D0x10 PREC=3D0x00 TTL=3D64 ID=3D3293=
3 DF
> PROTO=3DTCP SPT=3D62981 DPT=3D1521 WINDOW=3D65535 RES=3D0x00 SYN URGP=
=3D0
> Feb  5 14:02:34 sethra kernel: **LOG PRE** IN=3Deth0 OUT=3D
> MAC=3D00:26:b9:3f:89:f9:00:17:f2:c8:24:8a:08:00 SRC=3D10.117.6.149
> DST=3D10.117.1.205 LEN=3D48 TOS=3D0x10 PREC=3D0x00 TTL=3D64 ID=3D3238=
9 DF
> PROTO=3DTCP SPT=3D62981 DPT=3D1521 WINDOW=3D65535 RES=3D0x00 SYN URGP=
=3D0
>=20
> TPCDUMP sethra
> [root@sethra ~]# tcpdump -i eth0 'port 1521'
> tcpdump: verbose output suppressed, use -v or -vv for full protocol d=
ecode
> listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes
> 14:01:27.126210 IP err.sfa.com.62981 > sethra.sfa.com.ncube-lm: S
> 3593594566:3593594566(0) win 65535 <mss 1460,nop,wscale
> 3,nop,nop,timestamp 635091437 0,sackOK,eol>
> 14:01:28.107814 IP err.sfa.com.62981 > sethra.sfa.com.ncube-lm: S
> 3593594566:3593594566(0) win 65535 <mss 1460,nop,wscale
> 3,nop,nop,timestamp 635091446 0,sackOK,eol>
> 14:01:29.108654 IP err.sfa.com.62981 > sethra.sfa.com.ncube-lm: S
> 3593594566:3593594566(0) win 65535 <mss 1460,nop,wscale
> 3,nop,nop,timestamp 635091456 0,sackOK,eol>
> 14:01:30.109676 IP err.sfa.com.62981 > sethra.sfa.com.ncube-lm: S
> 3593594566:3593594566(0) win 65535 <mss 1460,sackOK,eol>
> 14:01:31.110723 IP err.sfa.com.62981 > sethra.sfa.com.ncube-lm: S
> 3593594566:3593594566(0) win 65535 <mss 1460,sackOK,eol>
> 14:01:32.111917 IP err.sfa.com.62981 > sethra.sfa.com.ncube-lm: S
> 3593594566:3593594566(0) win 65535 <mss 1460,sackOK,eol>
> 14:01:34.113682 IP err.sfa.com.62981 > sethra.sfa.com.ncube-lm: S
> 3593594566:3593594566(0) win 65535 <mss 1460,sackOK,eol>
> 14:01:38.117485 IP err.sfa.com.62981 > sethra.sfa.com.ncube-lm: S
> 3593594566:3593594566(0) win 65535 <mss 1460,sackOK,eol>
> 14:01:46.125289 IP err.sfa.com.62981 > sethra.sfa.com.ncube-lm: S
> 3593594566:3593594566(0) win 65535 <mss 1460,sackOK,eol>
> 14:02:02.139805 IP err.sfa.com.62981 > sethra.sfa.com.ncube-lm: S
> 3593594566:3593594566(0) win 65535 <mss 1460,sackOK,eol>
> 14:02:34.169506 IP err.sfa.com.62981 > sethra.sfa.com.ncube-lm: S
> 3593594566:3593594566(0) win 65535 <mss 1460,sackOK,eol>
>=20
> 11 packets captured
> 11 packets received by filter
> 0 packets dropped by kernel
>=20
> TCPDUMP vlad
> [root@vlad ~]# tcpdump -i eth0 'port 1521'
> tcpdump: verbose output suppressed, use -v or -vv for full protocol d=
ecode
> listening on eth0, link-type EN10MB (Ethernet), capture size 96 bytes

vlad didn't even got requests, this is either routing or forwarding
problem.

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

