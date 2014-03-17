From: =?utf-8?Q?Bram_van_den_Hout?= <bram@legno.nl>
Subject: Rewrite destination IP
Date: Mon, 17 Mar 2014 12:42:08 +0100
Message-ID: <zarafa.5326df90.0b5a.15412cab2d2a09ca@detroit>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?Q?netfilter=40vger=2Ekernel=2Eorg?= <netfilter@vger.kernel.org>

Hi,

Is it possible to change the destination IP address of an incoming pack=
et and have a local running server proces on application layer answer t=
o the changed IP address ?

To be more clear. I have a hosting software suite that is configured to=
 run on a registered public IP address (a.b.c.d).
The actual server is behind a firewall and has a private IP address. I =
have configured a virtual interface with the public IP address a.b.c.d.

eth0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Link encap:Ethernet=C2=A0 HWaddr 00:=
0c:29:f5:10:9f=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inet addr:192.16=
8.100.11=C2=A0 Bcast:192.168.100.255=C2=A0 Mask:255.255.255.0

eth0:0=C2=A0=C2=A0=C2=A0 Link encap:Ethernet=C2=A0 HWaddr 00:0c:29:f5:1=
0:9f=C2=A0=20
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 inet addr:a.b.c.=
d=C2=A0 Bcast:a.b.c.d=C2=A0 Mask:255.255.255.255

Incoming packets have destination IP : 192.168.100.11.
I would like to change the destination to a.b.c.d and have for instance=
 a webserver listening on a.b.c.d:80 and with directive <virtualhost a.=
b.c.d:80> answer to that request.

I have tried :

iptables -t nat -A PREROUTING -i eth0 -d 192.168.100.11 -j NETMAP --to =
a.b.c.d/32

When checking the result of this command with tcpdump, I don't see any =
translation.

What am I missing ?

Thank you very much for your response !

Cheers,

Bram
