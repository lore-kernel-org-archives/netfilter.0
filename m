From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: about a LOG rule
Date: Sat, 25 May 2013 14:39:55 +0200
Message-ID: <51A0B11B.3030007@plouf.fr.eu.org>
References: <ab378212c155fe05c806847dc5435193.squirrel@mail.fisica.uh.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ab378212c155fe05c806847dc5435193.squirrel@mail.fisica.uh.cu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: julioarr@fisica.uh.cu
Cc: netfilter@vger.kernel.org

Hello,

julioarr@fisica.uh.cu a =E9crit :
>=20
> What does this mean?
>=20
> May 18 12:14:55 firewall kernel: [97390.813579] INPUT_ALL_ACCEPT_lo-1
> IN=3Dlo OUT=3D MAC=3D00:00:00:00:00:00:00:00:00:00:00:00:08:00 SRC=3D=
10.0.0.2
> DST=3D10.0.0.2 LEN=3D107 TOS=3D0x00 PREC=3D0xC0 TTL=3D64 ID=3D62342 P=
ROTO=3DICMP TYPE=3D3
> CODE=3D1 [SRC=3D10.0.0.2 DST=3D173.194.69.108 LEN=3D79 TOS=3D0x00 PRE=
C=3D0x00 TTL=3D64
> ID=3D61005 DF PROTO=3DTCP SPT=3D38040 DPT=3D587 WINDOW=3D133 RES=3D0x=
00 ACK PSH FIN
> URGP=3D0 ]

Some iptables rule logged that the local machine 10.0.0.2 sent to itsel=
f
an ICMP packet with type 3 (destination unreachable) and code 1 (host
unreachable) in response to an attempt to send a TCP packet to
173.194.69.108.

"Host unreachable" usually means ARP resolution failure, but
173.194.69.108 is not on the network directly connected to 10.0.0.2, so
it probably means that the ARP resolution for the gateway IP address
found in the routing table for that destination failed for any reason
(wrong gateway address, network failure...).
