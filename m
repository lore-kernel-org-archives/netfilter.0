From: Petr Pisar <petr.pisar@atlas.cz>
Subject: Re: Transfer ipv6 packages over ipv4 iptables gateway to ipv4 ISP's network
Date: Thu, 16 Oct 2008 07:16:02 +0000 (UTC)
Message-ID: <slrngfdqhi.3bf.petr.pisar@album.ics.muni.cz>
References: <1814bfe70810151332r61aa900see2931df5dddcdb0@mail.gmail.com>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On 2008-10-15, Elvir Kuric <omasnjak@gmail.com> wrote:
>
> I am wondering does someone has experinece with translation from ipv6
> ---> ipv4

`Translating' is not proper word unless you mean real NAT-PT (Network
address translation and protocol translation).

If you want just to connect your IPv6 island via IPv4 Internet to native IPv6
Internet backbone (i.e. bypass your lazy ISP), use 6to4 (in case you
have public IPv4 address on your gateway) or AYIYA (in other case). This
is called tunneling and former post enlightened it already.

If you want to be able to connect from your IPv6 host to IPv4 only
servers in IPv4 Internet, you have to choices:

Provide to all IPv6 hosts IPv4 connectivity (i.e. dual stack solution),
or do NAT-PT on your gateway.

NAT-PT translates one protocol family into other one. However due to
some differences between these two protocols, the translation is not
seamless (like IPv4 NAPT). Thus there exist few limitations and
different solutions how to achieve it.

I know only about RFC3142 (An IPv6-to-IPv4 Transport Relay Translator)
implementation and it's pTRTd <http://www.litech.org/ptrtd/> and totd
(http://www.vermicelli.pasta.cs.uit.no/software/totd.html). It works
following:

IPv6 only client asks totd name server for AAAA record of IPv4 only
host. The name server provides fake answer resolving to network prefix
routed to pTRTd server. Then your client sends IPv6 TCP or UDP packet to
given fake IPv6 address, the packet recieves pTRTd server (a
userspace daemon capturing packets on TUN network interface), pTRTd
established mapping between IPv6 and IPv4 transport addresses,
translates the packet into IPv4 protocol and transmits it to the real
IPv4 only host in IPv4 Internet. Of course the pTRTd processes returing
responses and forward them to your IPv6 client as IPv6 packets.

Thus your IPv6 only hosts can see whole IPv4 world as a subnet in IPv6
address space.

-- Petr

