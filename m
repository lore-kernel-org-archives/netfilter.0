From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Matching on protocols inside IPv6 IPSec AH (legacy vs nft)
Date: Fri, 23 Jun 2023 00:00:40 +0200
Message-ID: <ZJTEiNy6v0QR+ovT@calendula>
References: <CAPEBPyMNe5dPTC9Dwp888M5RR-2ThC7ZtuaQPxNG+5VqbJinsQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAPEBPyMNe5dPTC9Dwp888M5RR-2ThC7ZtuaQPxNG+5VqbJinsQ@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jacek Tomasiak <jtomasiak@arista.com>
Cc: netfilter@vger.kernel.org

On Thu, Jun 22, 2023 at 03:25:44PM +0200, Jacek Tomasiak wrote:
> Hello,
> 
> I'm working on migrating from legacy iptables to iptables-nft and I encountered
> a change in behaviour in handling the IPSec AH protocol.
> 
> With following two ipv6 rules:
> -A INPUT -p ipv6-icmp --icmpv6-type echo-request -j ACCEPT
> -A INPUT -m ipv6header --header ah --soft -j ACCEPT
> 
> After sending packets with following scapy code:
> # ping6 without AH
> pck = IPv6()/ICMPv6EchoRequest()
> send(pck)
> # ping6 with AH
> sa = SecurityAssociation(AH, spi=0)
> apck = sa.encrypt(pck)
> send(apck)
> 
> I get this from ip6tables-nft -vS:
> -P INPUT ACCEPT -c 0 0
> -P FORWARD ACCEPT -c 0 0
> -P OUTPUT ACCEPT -c 0 0
> -A INPUT -p ipv6-icmp -m icmp6 --icmpv6-type 128 -c 1 48 -j ACCEPT
> -A INPUT -m ipv6header --header ah --soft -c 1 64 -j ACCEPT
> 
> Hovewer, with ip6tables-legacy -vS:
> -P INPUT ACCEPT -c 1 48
> -P FORWARD ACCEPT -c 0 0
> -P OUTPUT ACCEPT -c 1 48
> -A INPUT -p ipv6-icmp -m icmp6 --icmpv6-type 128 -c 2 112 -j ACCEPT
> -A INPUT -m ipv6header --header ah --soft -c 0 0 -j ACCEPT
> 
> My main concern is that in the nft version the AH rule matches one of the ICMP
> packets even though the ICMP rule is higher up on the list.
> 
> I tried to debug this and it seems to be related to this change:
> https://github.com/torvalds/linux/commit/568af6de058cb2b0c5b98d98ffcf37cdc6bc38a7
> IIUC, this "stop ipv6_find_hdr on AH" is not a regression but intended behavior.
> 
> Now the question: is there some way to define rules which will match
> the same way
> as it works in iptables-legacy? That is, look at the inner protocol
> and not stop on AH?

IIRC behaviour between iptables-legacy and ip6tables-legacy with
regards to AH is inconsistent, because ip6tables-legacy -p matches on
the inner header encapsulated by AH, but iptables-legacy matches on AH
with -p.
