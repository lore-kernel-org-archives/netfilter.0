From: Bill <boober95@rogers.com>
Subject: Re: Problem inserting a new connection with conntrack
Date: Wed, 24 Feb 2016 15:17:03 -0500
Message-ID: <201602241517.04319.boober95@rogers.com>
References: <A404B5896AB4F5468A8755AFC23F7317E42DE77F@EXMDB04.org.aalto.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rogers.com; s=s2048; t=1456345026; bh=nRE+mT8ZS3gDpbWIh5Aboxa8iODDEsQteYok48ply0I=; h=From:To:Subject:Date:Cc:References:In-Reply-To:From:Subject; b=LiqZMSa77EU7t1+QfZ7UmwrqQ+ikG8+DpU6s/U8aTUig3Lu3C9g2+jA51MNjblxIvb68JB3hAo1MOZvxk8usK4f5lPg6Negg98SJ0fcBwYKicGlJ2pirW6yWIUhfMBqIzdDNhZ9hxdlNp2jLkxmRsi/ZLC8Syg/dUrc3CtFf/0A+KSaqXjp+idLZAg3pSnaarjxZM8f9IIfkMe91tTooe+Cw/XR51pN4gw4me6LDZjMAxkJn692XxEv+1LUHH3/raaCTdhsInj+frGltUmktP7UFWe2W4a7az9ZADqb6yYux5hb66CpMqT4ofrAqyklqLMeCjiRgGTwEtlApqP9EQg==
In-Reply-To: <A404B5896AB4F5468A8755AFC23F7317E42DE77F@EXMDB04.org.aalto.fi>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Llorente Santos Jesus <jesus.llorente.santos@aalto.fi>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I have been looking at a similar problem without success, at least so f=
ar. =20
But I believe part of the problem is the connections you have created a=
re=20
never recognized as having anything to do with the traffic that follows=
=2E

I have been looking at 'expectation's which allow creating entries that=
 match=20
later traffic and when they do they become regular connections.  I am d=
oing=20
this in some experiments to understand application level gateways.

=46or the 'expectation' and the ALG there needs to be kernel modules th=
at do the=20
IP translation of the following traffic, the modules are 'helpers'.  Yo=
u can=20
see examples for FTP and TFTP in the kernel modules sources and docs.

Have a look at the hacking document, especially the section on tracking=
/nat:

http://www.netfilter.org/documentation/HOWTO/netfilter-hacking-HOWTO-4.=
html#ss4.4

=46or a complete example the TFTP modules are pretty small:

http://lxr.free-electrons.com/source/net/netfilter/
http://lxr.free-electrons.com/source/net/netfilter/nf_conntrack_tftp.c
http://lxr.free-electrons.com/source/net/netfilter/nf_nat_tftp.c

Anyhow, what I am trying to do is reverse NAT traversal, ie a machine o=
n the=20
WAN connects to the NAT with a DNS name inside, and the NAT uses connec=
tion=20
tracking and DNS to make entries so it can connect inside, but the traf=
fic=20
will look like it is coming/going to the NAT and the outside machine, w=
ith=20
the NAT translating, so the internal IP is not on the WAN. (ie a DNS/AL=
G).

Having said all that I could be wrong as I don't have it working and th=
us lack=20
evidence for my understanding.  Hopefully I can get parts of it working=
=2E

If you make progress let me know, as I sure would like a better underst=
anding=20
and perhaps a simpler solution that I am trying.

Bill


On Tuesday 09 February 2016 13:07, Llorente Santos Jesus wrote:
> Dear all,
>
> I'm facing problems when trying to insert a custom made connection wi=
th
> conntrack-tools. I am running a VM  with Ubuntu 14.04, kernel 3.19.0-=
33 and
> conntrack v1.4.1. My network setup is the following:
>
> Host-A: (lan0 @ 192.168.0.101) <---> (lan0 @ 192.168.0.1) Router (wan=
0 @
> 198.18.0.10) <---> (wan0: 198.18.0.100) Host-B
>
> The Host-A uses the router's IP as default gateway i.e. 192.168.0.1. =
The
> Router has the ip_forwarding and MASQUERADE enabled for doing NAT, i.=
e.
> iptables -t nat -A POSTROUTING -s 192.168.0.0/24 -o wan0 -j MASQUERAD=
E.
>
> Now, I am attempting to play around with the connections created by t=
he NAT
> and insert some custom made entries into the NAT table. I have tried =
to
> create NAT entries that correspond to outgoing traffic from Host-A to=
wards
> Host-B, for both TCP and UDP with the following commands:
>
> #conntrack --create --orig-src 192.168.0.101 --orig-dst 198.18.0.100
> --reply-src 198.18.0.100 --reply-dst 198.18.0.10 --proto 17 --orig-po=
rt-src
> 2222 --orig-port-dst 1111 --reply-port-src 1111 --reply-port-dst 2222
> --timeout 60 #conntrack --create --orig-src 192.168.0.101 --orig-dst
> 198.18.0.100 --reply-src 198.18.0.100 --reply-dst 198.18.0.10 --proto=
 6 =20
> --orig-port-src 2222 --orig-port-dst 1111 --reply-port-src 1111
> --reply-port-dst 2222 --timeout 60 --state SYN_SENT
>
> Using "conntrack --event" we can display a real-time event log. After
> inserting the previous 2 flows the output is the following:
>
> [UPDATE] udp      17 60 src=3D192.168.0.101 dst=3D198.18.0.100 sport=3D=
2222
> dport=3D1111 [UNREPLIED] src=3D198.18.0.100 dst=3D198.18.0.10 sport=3D=
1111
> dport=3D2222 mark=3D0 [UPDATE] tcp      6 60 SYN_SENT src=3D192.168.0=
=2E101
> dst=3D198.18.0.100 sport=3D2222 dport=3D1111 [UNREPLIED] src=3D198.18=
=2E0.100
> dst=3D198.18.0.10 sport=3D1111 dport=3D2222 mark=3D0
>
> The client in Host-A is running: nc -u -p 2222 198.18.0.100 1111 /  n=
c -p
> 2222 198.18.0.100 1111 The server in Host-B is running: nc -u -l 1111=
 / nc
> -l 1111
>
> Using Wireshark I can see how the packet leaves the interface wan0 of=
 the
> router, however it isn't mangled as SNAT so the packet are forwarded =
with
> the private IP address of the Host-A. This happens for both TCP and U=
DP.
> After the T timeout the entries expire and they are deleted. It seems=
 to me
> that the conntrack insertion works correctly, but for some reason the=
 NAT
> mangling is not happening anywhere. I have tried adding with flows wi=
th
> different --status and --state values, to no avail. [DESTROY] udp    =
  17
> src=3D192.168.0.101 dst=3D198.18.0.100 sport=3D2222 dport=3D1111 [UNR=
EPLIED]
> src=3D198.18.0.100 dst=3D198.18.0.10 sport=3D1111 dport=3D2222 [DESTR=
OY] tcp      6
> src=3D192.168.0.101 dst=3D198.18.0.100 sport=3D2222 dport=3D1111 [UNR=
EPLIED]
> src=3D198.18.0.100 dst=3D198.18.0.10 sport=3D1111 dport=3D2222
>
>
> Of course, if I don't create any state manually everything works fine=
=2E The
> following can be seen from the conntrack events. 1. For the UDP conne=
ction
>  [NEW] udp      17 30 src=3D192.168.0.101 dst=3D198.18.0.100 sport=3D=
2222
> dport=3D1111 [UNREPLIED] src=3D198.18.0.100 dst=3D198.18.0.10 sport=3D=
1111
> dport=3D2222 [UPDATE] udp      17 30 src=3D192.168.0.101 dst=3D198.18=
=2E0.100
> sport=3D2222 dport=3D1111 src=3D198.18.0.100 dst=3D198.18.0.10 sport=3D=
1111
> dport=3D2222 [UPDATE] udp      17 180 src=3D192.168.0.101 dst=3D198.1=
8.0.100
> sport=3D2222 dport=3D1111 src=3D198.18.0.100 dst=3D198.18.0.10 sport=3D=
1111
> dport=3D2222 [ASSURED]
>
> 2. For the TCP connection
>  [NEW] tcp      6 120 SYN_SENT src=3D192.168.0.101 dst=3D198.18.0.100
> sport=3D2222 dport=3D1111 [UNREPLIED] src=3D198.18.0.100 dst=3D198.18=
=2E0.10
> sport=3D1111 dport=3D2222 [UPDATE] tcp      6 60 SYN_RECV src=3D192.1=
68.0.101
> dst=3D198.18.0.100 sport=3D2222 dport=3D1111 src=3D198.18.0.100 dst=3D=
198.18.0.10
> sport=3D1111 dport=3D2222 [UPDATE] tcp      6 432000 ESTABLISHED
> src=3D192.168.0.101 dst=3D198.18.0.100 sport=3D2222 dport=3D1111 src=3D=
198.18.0.100
> dst=3D198.18.0.10 sport=3D1111 dport=3D2222 [ASSURED] [UPDATE] tcp   =
   6 120
> FIN_WAIT src=3D192.168.0.101 dst=3D198.18.0.100 sport=3D2222 dport=3D=
1111
> src=3D198.18.0.100 dst=3D198.18.0.10 sport=3D1111 dport=3D2222 [ASSUR=
ED] [UPDATE]
> tcp      6 30 LAST_ACK src=3D192.168.0.101 dst=3D198.18.0.100 sport=3D=
2222
> dport=3D1111 src=3D198.18.0.100 dst=3D198.18.0.10 sport=3D1111 dport=3D=
2222 [ASSURED]
> [UPDATE] tcp      6 120 TIME_WAIT src=3D192.168.0.101 dst=3D198.18.0.=
100
> sport=3D2222 dport=3D1111 src=3D198.18.0.100 dst=3D198.18.0.10 sport=3D=
1111
> dport=3D2222 [ASSURED]
>
> For helping me debug the situation I have enabled the trace in iptabl=
es as
> follows: iptables -t raw -A PREROUTING -j TRACE
> iptables -t raw -A OUTPUT -j TRACE
>
> For the working UDP and TCP  connections I can see these 2 additional
> traces that otherwise I don't if I set the entries myself. It seems t=
hat
> this is indeed creating the forwarding entries in the NAT. TRACE:
> nat:PREROUTING:policy:1 IN=3Dlan0 OUT=3D
> MAC=3D86:fd:78:53:64:91:52:29:24:5c:5d:f9:08:00 SRC=3D192.168.0.101
> DST=3D198.18.0.100 LEN=3D30 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D2335=
1 DF PROTO=3DUDP
> SPT=3D2222 DPT=3D1111 TRACE: nat:POSTROUTING:rule:1 IN=3D OUT=3Dwan0
> SRC=3D192.168.0.101 DST=3D198.18.0.100 LEN=3D30 TOS=3D0x00 PREC=3D0x0=
0 TTL=3D63
> ID=3D23351 DF PROTO=3DUDP SPT=3D2222 DPT=3D1111 LEN=3D10 TRACE:
> nat:PREROUTING:policy:1 IN=3Dlan0 OUT=3D
> MAC=3D86:fd:78:53:64:91:52:29:24:5c:5d:f9:08:00 SRC=3D192.168.0.101
> DST=3D198.18.0.100 LEN=3D60 TOS=3D0x00 PREC=3D0x00 TTL=3D64 ID=3D2256=
4 DF PROTO=3DTCP
> SPT=3D2222 DPT=3D1111 SEQ=3D67482932 ACK=3D0 WINDOW=3D29200 RES=3D0x0=
0 SYN URGP=3D0 OPT
> (020405B40402080A0059ED100000000001030307) TRACE: nat:POSTROUTING:rul=
e:1
> IN=3D OUT=3Dwan0 SRC=3D192.168.0.101 DST=3D198.18.0.100 LEN=3D60 TOS=3D=
0x00 PREC=3D0x00
> TTL=3D63 ID=3D22564 DF PROTO=3DTCP SPT=3D2222 DPT=3D1111 SEQ=3D674829=
32 ACK=3D0
> WINDOW=3D29200 RES=3D0x00 SYN URGP=3D0 OPT
> (020405B40402080A0059ED100000000001030307)
>
>
> Sorry for the lengthy email, I thought it was for the best to give al=
l the
> facts that I could gather to explain the situation.
>
> I would appreciate very much any kind of help you could give me. I ha=
ve hit
> this issue for a while now and cannot seem to get around it. My goal =
is to
> create very specific SNAT and DNAT entries as well as playing around =
with
> Application Layer Gateway for some protocols.
>
> Thanks a lot in advance!
>
> Jes=FAs Llorente Santos
> Networking Technology
> Department of Communications and Networking
> Aalto University
>
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
