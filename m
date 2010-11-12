From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: [SOLVED] Re: ClusterIP and MAC NAT
Date: Fri, 12 Nov 2010 16:28:01 -0600
Message-ID: <4CDDBF71.7040504@riverviewtech.net>
References: <1288103438.2727.69.camel@nerino>	 <4CC70D22.20109@riverviewtech.net> <1289234180.6644.33.camel@nerino>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1289234180.6644.33.camel@nerino>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/08/10 10:36, Michele Codutti wrote:
> Hello everyone today I managed to nat a multicast address of a clustered
> ip. So I'm writing to the ML to keep track of the solution.

I'm glad that you got things working the way that you wanted them to.

Thank you for replying to the mailing list so that others can search the 
archives in the future.

> The servers and the bridges all are Debian Lenny with only packaged
> software, the router is a Cisco 7200 VXR.

*nod*

> There are only 3 ebtables rules to do the trick:
>    ebtables -t nat -A PREROUTING \
>       --in-interface "$OUTERFACE" \
>       --protocol arp \
>       --arp-opcode Request \
>       --arp-ip-dst "$ip" \
>       --jump arpreply \
>       --arpreply-mac "$UMAC_OUI:" \
>       --arpreply-target DROP
>    ebtables -t nat -A PREROUTING \
>       --in-interface "$OUTERFACE" \
>       --destination "$UMAC_OUI:$MAC_EUI" \
>       --jump dnat 
>       --to-destination "$MMAC_OUI:$MAC_EUI" \
>       --dnat-target ACCEPT
>    ebtables -t nat -A POSTROUTING \
>       --out-interface "$OUTERFACE" \
>       --protocol arp \
>       --arp-opcode Request \
>       --arp-ip-src "$ip" \
>       --jump snat \
>       --snat-arp \
>       --to-source "$UMAC_OUI:$MAC_EUI" \
>       --snat-target ACCEPT
> Where:
>  - $ip is the cluster ip shared by servers;
>  - $OUTERFACE is the interface of the bridge connected
>    on router ethernet segment;
>  - $MMAC_OUI is the multicast OUI part of the MAC address;
>  - $MMAC_OUI is the unicast OUI part of the MAC address;
>  - $MAC_EUI is the final part of the MAC address.

Did you mean $UMAC_OUI for the unicast?

> Special thanks to Grant Taylor.

Id's say you are welcome, but I didn't do any thing other than point in 
a direction and say yes it could be done.



Grant. . . .
