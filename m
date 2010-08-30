From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Re: IPv6 routing
Date: Mon, 30 Aug 2010 13:33:33 +0100
Message-ID: <4C7BA51D.8030004@abpni.co.uk>
References: <4C7B8741.3030908@abpni.co.uk> <4C7B89EB.7090807@abpni.co.uk>	 <alpine.LNX.2.01.1008301242380.15716@obet.zrqbmnf.qr>	 <4C7B8BD2.1060009@abpni.co.uk>  <4C7B91A2.50707@abpni.co.uk> <1283171041.16291.63.camel@enterprise.ims-firmen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1283171041.16291.63.camel@enterprise.ims-firmen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Thomas Jacob <jacob@internet24.de>, netfilter@vger.kernel.org


On 30/08/10 13:24, Thomas Jacob wrote:
> On Mon, 2010-08-30 at 12:10 +0100, Jonathan Tripathy wrote:
>    
>> On a side note: netfilter currently has arptables to stop arp cache
>> poisoning. Is there any similar thing for NDP poisoning? I can prevent
>> the actual flow of non-icmpv6 IP traffic to a host by using ip6tables on
>> my bridge device (which sits in the middle of all hosts), however this
>> won't stop DOS attacks..
>>      
> Neighbour discovery is using link local multicast addresses, so
> you only need to be worried about being flooded from your LAN,
> same as with arp. If you are worried about it, then I think
> ip6tables doesn't do much for you at the moment, I am afraid. IPv6
> support is a long way from being up to IPv4 standards in Linux
> (and elsewhere). Please let the list know if you find a solution ;)
>
> BTW, I wouldn't accept all icmpv6 packets if you're security
> conscious, you really only need the following for basic
> IPv6 connectivity:
>
> (Taken from Ubuntu's ufw package)
>
> (linked to INPUT chain)
>
> target     prot opt source               destination
> ACCEPT     ipv6-icmp    anywhere             anywhere
> ipv6-icmp neighbour-solicitation
> ACCEPT     ipv6-icmp    anywhere             anywhere
> ipv6-icmp neighbour-advertisement
> ACCEPT     ipv6-icmp    anywhere             anywhere
> ipv6-icmp router-solicitation
> ACCEPT     ipv6-icmp    anywhere             anywhere
> ipv6-icmp router-advertisement
>
> (and maybe not even the last two, if you are using
> static routing).
Hi Thomas,

Thanks for the excellent explanation.

Yes I am worried about by "LAN" being flooded, as my "LAN" actually 
hosts public (read: "untrusted") VPS for customers.

But ah well. I'm sure netfilter will have ndptables some day. We're only 
testing IPv6 at the minute anyway. And we've got iptables which will 
prevent any non-icmp traffic from working, as well as ebtables to 
prevent MAC spoofing.

That's good to know about the "fine-tuning" of the rules for icmpv6 - 
the is exactly what I was looking for!

Cheers

