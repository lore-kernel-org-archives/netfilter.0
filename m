From: Vigneswaran R <vignesh@atc.tcs.com>
Subject: Re: DHCP request behavior in my particular FORWARD configuration
Date: Wed, 07 Sep 2011 10:29:10 +0530
Message-ID: <4E66FA1E.4020208@atc.tcs.com>
References: <001A9DB93A594CC4B78CC0951AEB1E8A@poweredge1800> <4E65A7D8.9070109@atc.tcs.com> <703EC899C8BC4A66A3D74736C78249FC@poweredge1800>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <703EC899C8BC4A66A3D74736C78249FC@poweredge1800>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Julio A. Romero" <julioarr@fisica.uh.cu>, netfilter@vger.kernel.org

I will try to answer based on my theoretical knowledge.

On 09/07/2011 05:36 AM, Julio A. Romero wrote:
> I thought that those requests would follow the udpport chain (DHCP is
> supported on udp ports 67 and 68). But I think that you could be right.
>
> Why the DHCP broadcasts are restricted to the local area?
>
> How would client and gateway (firewall) know to where it goes the request?

1. The Ethernet card (NIC) in the gateway or any other machine accepts 
the network packets, only if their MAC address or a broadcast MAC 
address is specified in the packet as the target.

2. After receiving the packet, the iptables comes into picture.

a) If the target IP specified in the packet is owned by the machine or 
the target IP is a *broadcast IP*, then the packet will be put into the 
INPUT chain and will be given to the local application who is listening 
on the specific port, if any. So, broadcast packets' life end here 
(unless you have some application running to re-broadcast).

b) If the target IP specified in the packet is not owned by the machine, 
then it will be put into the FORWARD chain (and the rules in various 
tables apply). This is how gateway is being used to forward packets.

> I don't have a real router. My gateway (firewall) is a server with two
> interfaces between two unreal networks (INT:10.6.13.0/24 and
> EXT:10.6.100.0/24).
>
> Some DHCP servers are in external networks and my DHCP server is 10.6.13.5
>
> I want to avoid that the DHCP-requests from my network clients to cross
> the gateway (firewall).

You don't have to do anything to achieve this. By default broadcasts 
(including DHCP-requests) will not cross the gateway as I mentioned earlier.


Regards,
Vignesh


>
>
> Regards,
>
> julio
>
>
> ----- Original Message ----- From: "Vigneswaran R" <vignesh@atc.tcs.com>
> To: <netfilter@vger.kernel.org>
> Sent: Tuesday, September 06, 2011 12:55 AM
> Subject: Re: DHCP request behavior in my particular FORWARD configuration
>
>
>> On 09/02/2011 07:25 AM, Julio A. Romero wrote:
>>> Hi all, what happen with DHCP requests trying to forward below?
>>
>> As a relatively new user to iptables, I couldn't understand the
>> following rules completely. However, if I remember correctly, the
>> broadcasts (DHCP or any other) will not reach FORWARD chain; will go
>> into INPUT chain.
>>
>> Sorry, if you know this already.
>>
>> Regards,
>> Vignesh
>>
>>>
>>> Thanks,
>>>
>>> julio
>>>
>>>
>>>
>>>
>>>
>>> ##################################################################
>>>
>>> # ipv4 - policies configuration - zero all - flush all chains - delete
>>> defined chains #
>>> #################################################################
>>> iptables -P INPUT DROP
>>> iptables -P FORWARD DROP
>>> iptables -P OUTPUT DROP
>>> iptables -t raw -P OUTPUT ACCEPT
>>> iptables -t raw -P PREROUTING ACCEPT
>>> iptables -t mangle -P INPUT ACCEPT
>>> iptables -t mangle -P FORWARD ACCEPT
>>> iptables -t mangle -P OUTPUT ACCEPT
>>> iptables -t mangle -P PREROUTING ACCEPT
>>> iptables -t mangle -P POSTROUTING ACCEPT
>>> iptables -Z
>>> iptables -F
>>> iptables -X
>>> iptables -t nat -Z
>>> iptables -t nat -F
>>> iptables -t nat -X
>>> iptables -t raw -Z
>>> iptables -t raw -F
>>> iptables -t raw -X
>>> iptables -t mangle -Z
>>> iptables -t mangle -F
>>> iptables -t mangle -X
>>> #######
>>> # END #
>>> #######
>>>
>>>
>>> ##########################
>>> # ipv4 - FILTER - srcnetfilter #
>>> #########################
>>> # SRCNETFILTER RULES
>>> #
>>> # Create srcnetfilter
>>> iptables -N srcnetfilter
>>> # Return to back the connections from trust networks
>>> iptables -A srcnetfilter -s $NETWORKS -j RETURN
>>> # Deny all other traffic
>>> iptables -A srcnetfilter -j DROP
>>> #######
>>> # END #
>>> #######
>>>
>>> ##########################
>>> # ipv4 - FILTER - dstnetfilter #
>>> #########################
>>> # DSTNETFILTER RULES
>>> #
>>> # Create dstnetfilter
>>> iptables -N dstnetfilter
>>> # Return to back the connections toward trust networks
>>> iptables -A dstnetfilter -d $NETWORKS -j RETURN
>>> # Deny all other traffic
>>> iptables -A dstnetfilter -j DROP
>>> #######
>>> # END #
>>> #######
>>>
>>> ########################
>>> # ipv4 - FILTER - average #
>>> #######################
>>> # AVERAGE RULES
>>> #
>>> # Create average
>>> iptables -N average
>>> # Maximum limit of global connections
>>> iptables -A average -m connlimit --connlimit-mask 0 \
>>> --connlimit-above $GLOBAL_CONNECTIONS -j LOG --log-prefix
>>> "FW:average:GCs>LIMIT "
>>> iptables -A average -m connlimit --connlimit-mask 0 \
>>> --connlimit-above $GLOBAL_CONNECTIONS -j REJECT
>>> # Restrict the number of parallel connections per client IP
>>> iptables -A average -m connlimit --connlimit-mask 32 \
>>> --connlimit-above $CONNECTIONS_PER_IP -j LOG --log-prefix
>>> "FW:average:CCs>LIMIT "
>>> iptables -A average -m connlimit --connlimit-mask 32 \
>>> --connlimit-above $CONNECTIONS_PER_IP -j REJECT
>>> # Global traffic rate average
>>> iptables -A average -m fuzzy --lower-limit $LOWER_LIMIT \
>>> --upper-limit $UPPER_LIMIT -j LOG --log-prefix "FW:average:GTRA:REJECT "
>>> iptables -A average -m fuzzy --lower-limit $LOWER_LIMIT \
>>> --upper-limit $UPPER_LIMIT -j REJECT
>>> # Traffic rate control above the lower limit per client IP
>>> iptables -A average -m connlimit --connlimit-mask 32 \
>>> ! --connlimit-above $CONNECTIONS_PER_IP -m fuzzy \
>>> --lower-limit $LOWER_LIMIT_PER_IP --upper-limit $UPPER_LIMIT_PER_IP \
>>> -j LOG --log-prefix "FW:average:TRC_PIP:REJECT "
>>> iptables -A average -m connlimit --connlimit-mask 32 \
>>> ! --connlimit-above $CONNECTIONS_PER_IP -m fuzzy \
>>> --lower-limit $LOWER_LIMIT_PER_IP --upper-limit $UPPER_LIMIT_PER_IP -j
>>> REJECT
>>> # Allow the traffic below the lower limit per client IP
>>> iptables -A average -m hashlimit --hashlimit-mode srcip
>>> --hashlimit-srcmask 32 \
>>> --hashlimit-upto $FREE_PACKETS --hashlimit-burst $BURST \
>>> --hashlimit-name average -j ACCEPT
>>> #######
>>> # END #
>>> #######
>>>
>>> ############################
>>> # ipv4 - FILTER - netfilter_fwd #
>>> ###########################
>>> # NETFILTER_FWD RULES
>>> #
>>> # Create netfilter_fwd
>>> iptables -N netfilter_fwd
>>> # LOG and DROP untrue connections
>>> iptables -A netfilter_fwd -s $GW_NETWORKS -j LOG --log-prefix
>>> "FW:FWD:BOX->* "
>>> iptables -A netfilter_fwd -s $GW_NETWORKS -j DROP
>>> iptables -A netfilter_fwd -d $GW_NETWORKS -j LOG --log-prefix
>>> "FW:FWD:*->BOX "
>>> iptables -A netfilter_fwd -d $GW_NETWORKS -j DROP
>>> iptables -A netfilter_fwd -i $INT_IFACEs -o $EXT_IFACEs -d $INT_NETWORKS
>>> -j LOG \
>>> --log-prefix "FW:FWD:I->E:dst:INT_NET "
>>> iptables -A netfilter_fwd -i $INT_IFACEs -o $EXT_IFACEs -d $INT_NETWORKS
>>> -j DROP
>>> iptables -A netfilter_fwd -i $EXT_IFACEs -o $INT_IFACEs -s $INT_NETWORKS
>>> -j LOG \
>>> --log-prefix "FW:FWD:E->I:src:INT_NET "
>>> iptables -A netfilter_fwd -i $EXT_IFACEs -o $INT_IFACEs -s $INT_NETWORKS
>>> -j DROP
>>> # Send outgoing traffic to dstnetfilter for validation of the
>>> destination
>>> iptables -A netfilter_fwd -i $INT_IFACEs -o $EXT_IFACEs -s $INT_NETWORKS
>>> -g dstnetfilter
>>> # Send incoming traffic to srcnetfilter for validation of the source
>>> iptables -A netfilter_fwd -i $EXT_IFACEs -o $INT_IFACEs -d $INT_NETWORKS
>>> -g srcnetfilter
>>> # LOG and DROP all other traffic
>>> iptables -A netfilter_fwd -j LOG --log-prefix "FW:FWD:netfilter_fwd:? "
>>> iptables -A netfilter_fwd -j DROP
>>> #######
>>> # END #
>>> #######
>>>
>>> ... more chains of filter table... (udpport, tcpport, icmpfilter,
>>> tcpfilter, udpfilter, netfilter_out, netfilter_in, INPUT, OUTPUT)
>>>
>>> ###########################
>>> # ipv4 - FILTER - FORWARD #
>>> ##########################
>>> # FORWARD RULES
>>> #
>>> # Forward all traffic to netfilter_fwd
>>> iptables -A FORWARD -j netfilter_fwd
>>> # Allow (established|related) connections in returned traffic of
>>> netfilter_fwd
>>> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>>> # Send all other ICMP returned packets to icmpfilter
>>> iptables -A FORWARD -p icmp -g icmpfilter
>>> # Send all other UDP returned packets to udpport
>>> iptables -A FORWARD -p udp -g udpport
>>> # Send all other TCP returned packets to tcpport
>>> iptables -A FORWARD -p tcp -g tcpport
>>> # Send all other returned fragmented packets to average
>>> iptables -A FORWARD -f -j average
>>> # Log for debugger
>>> iptables -A FORWARD -j LOG --log-prefix "FW:FWD:? "
>>> #######
>>> # END #
>>> #######
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at http://vger.kernel.org/majordomo-info.html
>
>
> --------------------------------------------------------------------------------
>
>
>
>
> No virus found in this incoming message.
> Checked by AVG - www.avg.com
> Version: 9.0.901 / Virus Database: 271.1.1/3879 - Release Date: 09/05/11
> 14:35:00
>

