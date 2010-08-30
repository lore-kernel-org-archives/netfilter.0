From: Thomas Jacob <jacob@internet24.de>
Subject: Re: IPv6 routing
Date: Mon, 30 Aug 2010 14:24:01 +0200
Message-ID: <1283171041.16291.63.camel@enterprise.ims-firmen.de>
References: <4C7B8741.3030908@abpni.co.uk> <4C7B89EB.7090807@abpni.co.uk>
	 <alpine.LNX.2.01.1008301242380.15716@obet.zrqbmnf.qr>
	 <4C7B8BD2.1060009@abpni.co.uk>  <4C7B91A2.50707@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C7B91A2.50707@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org

On Mon, 2010-08-30 at 12:10 +0100, Jonathan Tripathy wrote:
> On a side note: netfilter currently has arptables to stop arp cache 
> poisoning. Is there any similar thing for NDP poisoning? I can prevent 
> the actual flow of non-icmpv6 IP traffic to a host by using ip6tables on 
> my bridge device (which sits in the middle of all hosts), however this 
> won't stop DOS attacks..

Neighbour discovery is using link local multicast addresses, so
you only need to be worried about being flooded from your LAN,
same as with arp. If you are worried about it, then I think
ip6tables doesn't do much for you at the moment, I am afraid. IPv6
support is a long way from being up to IPv4 standards in Linux
(and elsewhere). Please let the list know if you find a solution ;)

BTW, I wouldn't accept all icmpv6 packets if you're security
conscious, you really only need the following for basic
IPv6 connectivity:

(Taken from Ubuntu's ufw package)

(linked to INPUT chain)

target     prot opt source               destination         
ACCEPT     ipv6-icmp    anywhere             anywhere
ipv6-icmp neighbour-solicitation 
ACCEPT     ipv6-icmp    anywhere             anywhere
ipv6-icmp neighbour-advertisement 
ACCEPT     ipv6-icmp    anywhere             anywhere
ipv6-icmp router-solicitation 
ACCEPT     ipv6-icmp    anywhere             anywhere
ipv6-icmp router-advertisement 

(and maybe not even the last two, if you are using
static routing).



> Cheers
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


