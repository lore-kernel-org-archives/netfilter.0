From: Daniel David Benson <dan@spoontail.com>
Subject: Re: Leaking ICMP and UDP packets
Date: Tue, 20 Apr 2004 10:13:18 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0404191102000.2276-100000@dudester.spoontail.com>
References: <200404191845.21225.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404191845.21225.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


> Are you sure they are un-NATted packets "leaking" through netfilter, and not 
> ICMP packets being sent back to some remote system by the firewall itself, 
> saying "host unreachable" etc?

Finally, after 24 hours I got the following packets on my front edge 
(public) interface:

09:57:48.388232 10.101.10.103 > 169.254.85.249: icmp: time exceeded in-transit
09:58:03.386143 10.101.10.103 > 169.254.85.249: icmp: time exceeded in-transit
09:58:18.386973 10.101.10.103 > 169.254.85.249: icmp: time exceeded in-transit

* This internal IP isn't any of the 1 to 1 NATs listed below and should 
come out as the global NAT IP.

> 1. What's your Internet bandwidth?

It's a 6 Mb/s pipe -- symetric -- ethernet drop within from a provider 
within our building.

> 2. How many conntrack table entries do you typically have (wc -l 
> /proc/net/ip_conntrack)?

Looks to hover around 4300 entries.  This is what I set the table size to:

echo "200000" > /proc/sys/net/ipv4/ip_conntrack_max

> 3. Do you have any DNAT rules for incoming packets, as well as the SNAT rule 
> you've already posted?

Here are all my NAT entries:

####
####  PREROUTING Chain
####

$IPTABLES -t nat -A PREROUTING -i $EXT_IFACE \
-d $EXT_DMZ1 -j DNAT --to-destination $INT_DMZ1
 
$IPTABLES -t nat -A PREROUTING -i $EXT_IFACE \
-d $EXT_DMZ2 -j DNAT --to-destination $INT_DMZ2
 
$IPTABLES -t nat -A PREROUTING -i $EXT_IFACE \
-d $EXT_INEWS -j DNAT --to-destination $INT_INEWS
                                                                                
$IPTABLES -t nat -A PREROUTING -i $EXT_IFACE \
-d $EXT_CABLE -j DNAT --to-destination $INT_CABLE
                                                                                
$IPTABLES -t nat -A PREROUTING -i $EXT_IFACE \
-d $EXT_CABLEDEV -j DNAT --to-destination $INT_CABLEDEV
                                                                                
$IPTABLES -t nat -A PREROUTING -i $EXT_IFACE \
-d $EXT_TRANSFER -j DNAT --to-destination $INT_TRANSFER
                                                                                
$IPTABLES -t nat -A PREROUTING -i eth0 \
-d $EXT_QADMZ1 -j DNAT --to-destination $INT_QADMZ1
                                                                                
####
####  POSTROUTING Chain
####

$IPTABLES -t nat -A POSTROUTING -o $EXT_IFACE \
-s $INT_DMZ1 -j SNAT --to-source $EXT_DMZ1

$IPTABLES -t nat -A POSTROUTING -o $EXT_IFACE \
-s $INT_DMZ2 -j SNAT --to-source $EXT_DMZ2

#$IPTABLES -t nat -A POSTROUTING -o $EXT_IFACE \
#-s $INT_QAWEB1 -j SNAT --to-source $EXT_QAWEB1

$IPTABLES -t nat -A POSTROUTING -o $EXT_IFACE \
-s $INT_INEWS -j SNAT --to-source $EXT_INEWS

$IPTABLES -t nat -A POSTROUTING -o $EXT_IFACE \
-s $INT_CABLE -j SNAT --to-source $EXT_CABLE

$IPTABLES -t nat -A POSTROUTING -o $EXT_IFACE \
-s $INT_CABLEDEV -j SNAT --to-source $EXT_CABLEDEV

$IPTABLES -t nat -A POSTROUTING -o $EXT_IFACE \
-s $INT_TRANSFER -j SNAT --to-source $EXT_TRANSFER

$IPTABLES -t nat -A POSTROUTING -o $EXT_IFACE \
-s $INT_QADMZ1 -j SNAT --to-source $EXT_QADMZ1

$IPTABLES -t nat -A POSTROUTING -o $EXT_IFACE -j SNAT --to-source $EXT_IP

> 4. Are you doing anything in the mangle table?

No

> 5. Do you run any services on the firewall, or is it just a filtering router?

It's just a filtering router.  I have three NICS -- Public, Private, and 
DMZ.  Everything seems to NAT fine except some of these ICMP type packets 
and it looks like UDP packets associated with NTP.

Any help would be much appreciated.  Sorry for such a vague initial 
writeup.

-Dan



