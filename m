From: Jaga Doe <jaga.doe@aol.com>
Subject: Re: Redirect bridged traffic
Date: Thu, 6 Feb 2020 16:43:37 +0000 (UTC)
Message-ID: <54308857.271223.1581007417521@mail.yahoo.com>
References: <54308857.271223.1581007417521.ref@mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1581007420; bh=2xHa5bxJ2BL8krUzC/xXu+gu0h7VGY35zxIs56kk9uE=; h=Date:From:To:Cc:Subject:References:From:Subject; b=d5ndMbglrAGw6Sv7jujoopExS7q4Un2W6PB5/6CeO3HrBqwbHd/myqmJR9sRJc5LVy9Dk5SrhgyHtx8KbZ/E+sCqmhw128pWx+q5PoGsbDsG0slraTChmX9lmGhjQeGrTIiryeFcG/zGb8oXEY723Tgrg/tqeJawYbsU1Bd/XGoPFZI1eqs7WnzY3Tzgt7Meg/yqjFyXkB9RwoG93cBE14cKWnGPRJdGKqbAed/CSn6E96bUZehYdumMrM6jVomIUEebK5CUr6bkmnSmQWDjTn/FCeUddZ+KlcXI0YDWMjcRW+2mL70dhEVJ4WrgPqCytSlHH6SwT7kisIRHDQkh5A==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: fw@strlen.de
Cc: netfilter@vger.kernel.org

You are totally right. Adding an IP address to the bridge, is passing the r=
edirect drop stage. I thought that having all SRC/DST parameters set in the=
 package, is supposed to have the data flow completed.
However. after adding the bridge IP, the package seems that is getting lost=
 in another step. In order to troubleshoot the issue I have created all hoo=
ks for all chains in ip, inet and bridge tables. For understanding easier w=
here the package is I have created the tables with the naming tb_<table typ=
e> and rules ch_<chain type>_<hook>.

 The nftrace feature is allowing me to follow how the package is traversing=
 the network stack:

trace id ff3b1d8d bridge tb_bridge ch_filter_prerouting packet: iif "eth1" =
ether saddr f4:8c:50:fa:1f:e5 ether daddr 00:0c:29:15:7b:a0 ip saddr 192.16=
8.0.21 ip daddr 192.168.0.123 ip dscp 0x04 ip ecn not-ect ip ttl 64 ip id 6=
4068 ip protocol tcp ip length 60 tcp sport 46206 tcp dport 3000 tcp flags =
=3D=3D syn tcp window 64240=20
trace id ff3b1d8d bridge tb_bridge ch_filter_prerouting rule log tcp dport =
3000 meta pkttype set host ether daddr set 00:0c:29:15:7b:a0 counter packet=
s 8 bytes 480 meta nftrace set 1 (verdict continue)
trace id ff3b1d8d bridge tb_bridge ch_filter_prerouting rule log tcp dport =
3000 comment "bridge-filter-prerouting" (verdict continue)
trace id ff3b1d8d bridge tb_bridge ch_filter_prerouting verdict continue=20
trace id ff3b1d8d bridge tb_bridge ch_filter_prerouting policy accept=20
trace id ff3b1d8d inet tb_inet ch_nat_prerouting packet: iif "br0" ether sa=
ddr f4:8c:50:fa:1f:e5 ether daddr 00:0c:29:15:7b:a0 ip saddr 192.168.0.21 i=
p daddr 192.168.0.123 ip dscp 0x04 ip ecn not-ect ip ttl 64 ip id 64068 ip =
protocol tcp ip length 60 tcp sport 46206 tcp dport 3000 tcp flags =3D=3D s=
yn tcp window 64240=20
trace id ff3b1d8d inet tb_inet ch_nat_prerouting rule log tcp dport 3000 co=
unter packets 8 bytes 480 redirect to :3000 (verdict accept)
trace id ff3b1d8d inet tb_inet ch_filter_prerouting packet: iif "br0" ether=
 saddr f4:8c:50:fa:1f:e5 ether daddr 00:0c:29:15:7b:a0 ip saddr 192.168.0.2=
1 ip daddr 192.168.100.10 ip dscp 0x04 ip ecn not-ect ip ttl 64 ip id 64068=
 ip protocol tcp ip length 60 tcp sport 46206 tcp dport 3000 tcp flags =3D=
=3D syn tcp window 64240=20
trace id ff3b1d8d inet tb_inet ch_filter_prerouting rule log tcp dport 3000=
 comment "inet-filter-prerouting" (verdict continue)
trace id ff3b1d8d inet tb_inet ch_filter_prerouting verdict continue=20
trace id ff3b1d8d inet tb_inet ch_filter_prerouting policy accept=20
trace id ff3b1d8d ip tb_ip ch_filter_prerouting packet: iif "br0" ether sad=
dr f4:8c:50:fa:1f:e5 ether daddr 00:0c:29:15:7b:a0 ip saddr 192.168.0.21 ip=
 daddr 192.168.100.10 ip dscp 0x04 ip ecn not-ect ip ttl 64 ip id 64068 ip =
length 60 tcp sport 46206 tcp dport 3000 tcp flags =3D=3D syn tcp window 64=
240=20
trace id ff3b1d8d ip tb_ip ch_filter_prerouting rule log tcp dport 3000 com=
ment "ip-filter-prerouting" (verdict continue)
trace id ff3b1d8d ip tb_ip ch_filter_prerouting verdict continue=20
trace id ff3b1d8d ip tb_ip ch_filter_prerouting policy accept=20

From this capture I can see that the package is going throuh prerouting in =
all tables, the last one being ip table. Here even though the verdict is co=
ntinue and the policy accept, the package cannot be seen in other hooks inp=
ut, forward, output or postrouting (therefore the application listening loc=
ally to 3000 is not getting the connection request). It seems that the pack=
age is simply vanishing.

The nstat is returning:
#3661.1804289383 sampling_interval=3D10 time_const=3D60
IpInReceives                    66                 6.6
IpInAddrErrors                  0                  0.4
IpInDelivers                    53                 4.6
IpOutRequests                   52                 4.5
IpOutNoRoutes                   1                  0.1
TcpInSegs                       53                 4.6
TcpOutSegs                      56                 4.7
TcpRetransSegs                  2                  0.1
Ip6InReceives                   1                  0.1
Ip6InMcastPkts                  1                  0.1
Ip6InOctets                     72                 6.4
Ip6OutOctets                    0                  0.6
Ip6InMcastOctets                72                 6.3
Ip6OutMcastOctets               0                  0.6
Ip6InNoECTPkts                  1                  0.1
TcpExtDelayedACKs               1                  0.1
TcpExtTCPHPHits                 0                  0.3
TcpExtTCPPureAcks               14                 0.9
TcpExtTCPHPAcks                 32                 2.7
TcpExtTCPLossProbes             3                  0.1
TcpExtTCPBacklogCoalesce        1                  0.1
TcpExtTCPDSACKRecv              2                  0.1
TcpExtIPReversePathFilter       10                 1.2
TcpExtTCPAutoCorking            12                 1.2
TcpExtTCPOrigDataSent           52                 4.3
TcpExtTCPDelivered              54                 4.4
IpExtInOctets                   4275             526.9
IpExtOutOctets                  23132           1469.2
IpExtInBcastOctets              0                  4.4
IpExtInNoECTPkts                66                 6.6

Any idea on how to troubleshoot?

Thanks,
Jaga

-----Original Message-----
From: Florian Westphal <fw@strlen.de>
To: Jaga Doe <jaga.doe@aol.com>
Cc: fw <fw@strlen.de>; netfilter <netfilter@vger.kernel.org>
Sent: Thu, Feb 6, 2020 10:46 am
Subject: Re: Redirect bridged traffic

Jaga Doe <jaga.doe@aol.com> wrote:
>=C2=A0 =C2=A0 =C2=A0  Hello,
>=20
>=C2=A0 =C2=A0 I have discovered a great mechanism of understanding what is=
 happening, but setting nftrace flag. With that I can see the dataflow:
>=20
> trace id 9af9e0b6 bridge tbrFilter cbrRedirect packet: iif "eth1" ether s=
addr f4:8c:50:fa:1f:e5 ether daddr 00:0c:29:15:7b:a0 ip saddr 192.168.0.21 =
ip daddr 192.168.0.123 ip dscp 0x04 ip ecn not-ect ip ttl 64 ip id 18388 ip=
 protocol tcp ip length 60 tcp sport 40902 tcp dport 3000 tcp flags =3D=3D =
syn tcp window 64240=20
> trace id 9af9e0b6 bridge tbrFilter cbrRedirect rule log tcp dport 3000 me=
ta pkttype set host ether daddr set 00:0c:29:15:7b:a0 counter packets 5 byt=
es 300 meta nftrace set 1 (verdict continue)
> trace id 9af9e0b6 bridge tbrFilter cbrRedirect verdict continue=20
> trace id 9af9e0b6 bridge tbrFilter cbrRedirect policy accept=20
> trace id 9af9e0b6 inet tlcRedirect clcRedirect packet: iif "br0" ether sa=
ddr f4:8c:50:fa:1f:e5 ether daddr 00:0c:29:15:7b:a0 ip saddr 192.168.0.21 i=
p daddr 192.168.0.123 ip dscp 0x04 ip ecn not-ect ip ttl 64 ip id 18388 ip =
protocol tcp ip length 60 tcp sport 40902 tcp dport 3000 tcp flags =3D=3D s=
yn tcp window 64240=20
> trace id 9af9e0b6 inet tlcRedirect clcRedirect rule log tcp dport 3000 co=
unter packets 5 bytes 300 redirect to :3000 (verdict drop)
>=20
> I don't understand why the redirect rule is leading to the drop verdict.

Most simple explanation: your bridge doesn't have an ip address
(redirect is really just 'dnat to' with the primary address of the
 incoming interface).

