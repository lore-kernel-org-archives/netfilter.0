From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: iptables not possible to respond on request which comes from
 ebtables
Date: Sat, 16 Jul 2016 09:37:07 +0200
Message-ID: <028a3c9d-bdc4-45f3-c194-7656019c2cd3@plouf.fr.eu.org>
References: <20160715213112.GA889@keyton-ntxbook.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20160715213112.GA889@keyton-ntxbook.localdomain>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: marko.rakamaric@gmail.com
Cc: netfilter@vger.kernel.org

Le 15/07/2016 =C3=A0 23:31, marko.rakamaric@gmail.com a =C3=A9crit :
>
> Here are iptable INPUT  logs:
> IPTIN=3Deth1 OUT=3D MAC=3D14:ea:31:1e:00:e1:20:1c:8a:b2:ef:85:08:00 S=
RC=3D192.168.1.44 DST=3D192.168.1.1 LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=
=3D64 ID=3D21871 DF PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D4104 SEQ=3D12
> IPTIN=3Deth1 OUT=3D MAC=3D14:ea:31:1e:00:e1:20:1c:8a:b2:ef:85:08:00 S=
RC=3D192.168.1.44 DST=3D192.168.1.1 LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=
=3D64 ID=3D21959 DF PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D4104 SEQ=3D13
> IPTIN=3Deth1 OUT=3D MAC=3D14:ea:31:1e:00:e1:20:1c:8a:b2:ef:85:08:00 S=
RC=3D192.168.1.44 DST=3D192.168.1.1 LEN=3D84 TOS=3D0x00 PREC=3D0x00 TTL=
=3D64 ID=3D21984 DF PROTO=3DICMP TYPE=3D8 CODE=3D0 ID=3D4104 SEQ=3D14
>
> Here are iptable OUTPUT logs:
> IPTIN=3D OUT=3Dbr0 SRC=3D192.168.1.1 DST=3D192.168.1.44 LEN=3D84 TOS=3D=
0x00 PREC=3D0x00 TTL=3D64 ID=3D62294 PROTO=3DICMP TYPE=3D0 CODE=3D0 ID=3D=
29857 SEQ=3D481
> IPTIN=3D OUT=3Dbr0 SRC=3D192.168.1.1 DST=3D192.168.1.44 LEN=3D84 TOS=3D=
0x00 PREC=3D0x00 TTL=3D64 ID=3D62378 PROTO=3DICMP TYPE=3D0 CODE=3D0 ID=3D=
29857 SEQ=3D482
> IPTIN=3D OUT=3Dbr0 SRC=3D192.168.1.1 DST=3D192.168.1.44 LEN=3D84 TOS=3D=
0x00 PREC=3D0x00 TTL=3D64 ID=3D62462 PROTO=3DICMP TYPE=3D0 CODE=3D0 ID=3D=
29857 SEQ=3D483

These INPUT and OUTPUT logs don't match. The ICMP ID and sequence=20
numbers are different. So I guess they were captured at different times=
=2E

> # broute BROUTING (ACCEPT):
> ebtables -t broute -A BROUTING -p IPv4 --logical-in br0 --ip-dst 192.=
168.1.1 -j redirect --redirect-target DROP
> ebtables -t broute -A BROUTING -p ARP --logical-in br0 --arp-ip-dst 1=
92.168.1.1 -j redirect --redirect-target DROP

May I ask what is the purpose of this strange setup ?
If the original destination is the bridging box itself, then you don't=20
need to do all this mangling.

> iptables:
> # INPUT (ACCEPT-only for testing)
> iptables -I INPUT -i br0 -d 192.168.1.1 -j ACCEPT

Note that the broute target causes the input interface to be the bridge=
=20
port (eth1) instead of the bridge (br0), as can be seen in the INPUT lo=
g.
So you must accept packets on this interface too.
Also you may need to check that /proc/sys/ipv4/conf/eth1/rp_filter is=20
set to 0 to disable source address validation which expects packets fro=
m=20
192.168.1.44 to be received on br0, not eth1 (iptables does not know=20
about bridging).
