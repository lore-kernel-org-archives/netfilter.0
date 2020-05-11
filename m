From: Mike Dillinger <miked@softtalker.com>
Subject: Re: nftables NAT & Gaming Consoles
Date: Mon, 11 May 2020 08:01:47 -0700
Message-ID: <d268775c-09b2-a838-2d74-996377c25497@softtalker.com>
References: <7f0d599d-8eaa-74ef-37ff-8c56c0ae126b@softtalker.com>
 <fef11a27-2497-aaf4-1774-87d8f9bf2187@trustiosity.com>
 <d7d787bb-6e8b-2657-eca7-3c98a1b3d8ee@softtalker.com>
 <c7fdbdf6-938a-50d7-a4b4-90afa0de5a84@trustiosity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <c7fdbdf6-938a-50d7-a4b4-90afa0de5a84@trustiosity.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: zrm <zrm@trustiosity.com>, netfilter@vger.kernel.org

> So the way NAT works for outgoing connections is that the first packet of=
 the connection has a 5-tuple, e.g. UDP 192.168.0.2:12345 to 203.0.113.53:5=
3, and the NAT translates it to a different one, e.g. UDP 198.51.100.42:123=
45 (your public IP) to 203.0.113.53:53. Then when a UDP packet comes back f=
rom 203.0.113.53:53 to 198.51.100.42:12345, the NAT knows to forward it to =
192.168.0.2:12345.
>
> If at the same time it sees a UDP packet from 192.168.0.3:34567 to 8.8.8.=
8:53, it'll translate that to 198.51.100.42:34567 and everything is fine. I=
t can tell the difference between packets from 203.0.113.53:53 because they=
'll either be to 198.51.100.42:12345 or 198.51.100.42:23456 and thereby kno=
w where to forward it. Even if the original packet is from 192.168.0.3:1234=
5, then it'll translate the port too and use e.g. 198.51.100.42:12346 and s=
till have an unambiguous translation.
>
> For incoming connections, that doesn't work. The first packet is from the=
 remote peer. You get a packet from UDP 192.0.2.10:12345 to 198.51.100.42:4=
500, which internal host should it go to? There is no connection tracking e=
ntry yet and now the first packet doesn't contain the address of either int=
ernal host.
>
> The normal solution to this is to either use a different public IP addres=
s or a different port for each internal host. Alternative solutions are inh=
erently protocol-specific and not even guaranteed to actually exist. I don'=
t know anything specific to tell you about what protocol(s) Xbox uses. Ther=
e doesn't appear to be a conntrack helper for this.
>
> The simplest solution if it really has to use specific ports is to get an=
other public IP address. ISPs often offer these on business-class connectio=
ns, or you may be able to get one from a VPN provider.

Thank you very much for the info.

 From my understanding, this is not an issue with IPv6 so I may enable IPv6=
 and try it out, although there may be other headaches associated with that=
.=A0 I am also not sure if some of my older network devices support IPv6 so=
 I'm likely looking at a hybrid LAN if I go in that direction.=A0 My ISP su=
pports IPv6 so the WAN side should be covered.=A0 I'll have to think about =
this.=A0 Thanks again.

-MikeD
