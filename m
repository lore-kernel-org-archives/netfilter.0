From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Transfer ipv6 packages over ipv4 iptables gateway to ipv4 ISP's
 network
Date: Fri, 17 Oct 2008 12:45:51 -0500
Message-ID: <48F8CF4F.3010704@riverviewtech.net>
References: <1814bfe70810151332r61aa900see2931df5dddcdb0@mail.gmail.com> <slrngfdqhi.3bf.petr.pisar@album.ics.muni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <slrngfdqhi.3bf.petr.pisar@album.ics.muni.cz>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/16/08 02:16, Petr Pisar wrote:
> `Translating' is not proper word unless you mean real NAT-PT (Network 
> address translation and protocol translation).

I was going to use the term "gatewaying" to describe what needed to be 
done between the IPv6 and the IPv4 protocols.  "Translating" is usually 
done /with in/ a single protocol and "gatewaying" is usually done 
/between/ two protocols.  At least that's my take on it.

> If you want just to connect your IPv6 island via IPv4 Internet to 
> native IPv6 Internet backbone (i.e. bypass your lazy ISP), use 6to4 
> (in case you have public IPv4 address on your gateway) or AYIYA (in 
> other case). This is called tunneling and former post enlightened it 
> already.

*nod*

> If you want to be able to connect from your IPv6 host to IPv4 only 
> servers in IPv4 Internet, you have to choices:
> 
> Provide to all IPv6 hosts IPv4 connectivity (i.e. dual stack 
> solution), or do NAT-PT on your gateway.

I think the OP is wanting to avoid dual stack despite this probably 
being the simpler of the options.

> NAT-PT translates one protocol family into other one. However due to 
> some differences between these two protocols, the translation is not 
> seamless (like IPv4 NAPT). Thus there exist few limitations and 
> different solutions how to achieve it.
> 
> I know only about RFC3142 (An IPv6-to-IPv4 Transport Relay 
> Translator) implementation and it's pTRTd 
> <http://www.litech.org/ptrtd/> and totd 
> (http://www.vermicelli.pasta.cs.uit.no/software/totd.html). It works 
> following:
> 
> IPv6 only client asks totd name server for AAAA record of IPv4 only 
> host. The name server provides fake answer resolving to network 
> prefix routed to pTRTd server. Then your client sends IPv6 TCP or UDP 
> packet to given fake IPv6 address, the packet recieves pTRTd server 
> (a userspace daemon capturing packets on TUN network interface), 
> pTRTd established mapping between IPv6 and IPv4 transport addresses, 
> translates the packet into IPv4 protocol and transmits it to the real 
> IPv4 only host in IPv4 Internet. Of course the pTRTd processes 
> returing responses and forward them to your IPv6 client as IPv6 
> packets.
> 
> Thus your IPv6 only hosts can see whole IPv4 world as a subnet in 
> IPv6 address space.

Very interesting!

I now have a reason to mess with IPv6.



Grant. . . .


P.S.  Very good reply.  I was going to try to sum up the bit about 
translation verses gatewaying, but I think you did a better job than I 
could have.
