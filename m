From: zrm <zrm@trustiosity.com>
Subject: Re: nftables NAT & Gaming Consoles
Date: Sun, 10 May 2020 20:10:50 -0400
Message-ID: <c7fdbdf6-938a-50d7-a4b4-90afa0de5a84@trustiosity.com>
References: <7f0d599d-8eaa-74ef-37ff-8c56c0ae126b@softtalker.com>
 <fef11a27-2497-aaf4-1774-87d8f9bf2187@trustiosity.com>
 <d7d787bb-6e8b-2657-eca7-3c98a1b3d8ee@softtalker.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=trustiosity.com;
        s=mx; t=1589155850; bh=LgQrCC03ZQQ1JjdVq7tE1TC37/p7UO+itVyEkAzREPo=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=oa28kvTfEGPkl19dBZAuJgLx9ubLzZfmNjYuaK2Os53vXl3B4s/KcLl0OjCaInMi2
         sNbqb22VnW0v1ZBURm3OarE3QkwVWHfsgkgXoqP4IalkASlsGPDwVGo85EXOh9bCtO
         Yj1vEvpnijBHViWg2L8c0JvYPZpjhnrXFeDtJLps=
In-Reply-To: <d7d787bb-6e8b-2657-eca7-3c98a1b3d8ee@softtalker.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mike Dillinger <miked@softtalker.com>, netfilter@vger.kernel.org

On 5/10/20 19:39, Mike Dillinger wrote:
>=20
> Thanks for the expeditious response!
>=20
> Xbox wants the following ports open: 88 (UDP), 3074 (UDP and TCP), 53=20
> (UDP and TCP), 80 (TCP), 500 (UDP), 3544 (UDP), 4500 (UDP).=A0 53 and 80 =

> are for outgoing only as far as I know, so we're really focused on 88,=20
> 3074, 500, 3544, and 4500.=A0 I know when the ports were closed, many of =

> the multiplayer features didn't work.=A0 For instance, joining a group=20
> game and in-game chat were two of them. Once the ports were opened,=20
> everything worked great.
>=20
> Now add a second console and the need to mimic the behavior.=A0 That seem=
s=20
> to be the challenge.=A0 I don't know how to get incoming NAT to route=20
> properly to the source Xbox, and specifically when both are up and=20
> running at the same time.=A0 Changing ports is not an option since=20
> Microsoft controls the ports.=A0 To my knowledge, I can't change incoming=
=20
> ports on the console nor can I change the ports coming from the WAN side.
>=20
> I have only one public IPv4 address.
>=20
> -MikeD

So the way NAT works for outgoing connections is that the first packet=20
of the connection has a 5-tuple, e.g. UDP 192.168.0.2:12345 to=20
203.0.113.53:53, and the NAT translates it to a different one, e.g. UDP=20
198.51.100.42:12345 (your public IP) to 203.0.113.53:53. Then when a UDP=20
packet comes back from 203.0.113.53:53 to 198.51.100.42:12345, the NAT=20
knows to forward it to 192.168.0.2:12345.

If at the same time it sees a UDP packet from 192.168.0.3:34567 to=20
8.8.8.8:53, it'll translate that to 198.51.100.42:34567 and everything=20
is fine. It can tell the difference between packets from 203.0.113.53:53=20
because they'll either be to 198.51.100.42:12345 or 198.51.100.42:23456=20
and thereby know where to forward it. Even if the original packet is=20
from 192.168.0.3:12345, then it'll translate the port too and use e.g.=20
198.51.100.42:12346 and still have an unambiguous translation.

For incoming connections, that doesn't work. The first packet is from=20
the remote peer. You get a packet from UDP 192.0.2.10:12345 to=20
198.51.100.42:4500, which internal host should it go to? There is no=20
connection tracking entry yet and now the first packet doesn't contain=20
the address of either internal host.

The normal solution to this is to either use a different public IP=20
address or a different port for each internal host. Alternative=20
solutions are inherently protocol-specific and not even guaranteed to=20
actually exist. I don't know anything specific to tell you about what=20
protocol(s) Xbox uses. There doesn't appear to be a conntrack helper for=20
this.

The simplest solution if it really has to use specific ports is to get=20
another public IP address. ISPs often offer these on business-class=20
connections, or you may be able to get one from a VPN provider.
