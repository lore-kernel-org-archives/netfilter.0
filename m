From: Eric Ellis <eellis@mail.co.gilchrist.fl.us>
Subject: Re: port translation
Date: Thu, 06 Jan 2005 08:34:42 -0500
Message-ID: <41DD3E72.9070202@mail.co.gilchrist.fl.us>
References: <EINSTEINdGuysj7L2Sg00000bb4@einstein.systemmetrics.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <EINSTEINdGuysj7L2Sg00000bb4@einstein.systemmetrics.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Richard <richard@o-matrix.org>, netfilter@lists.netfilter.org

Richard:


 From http://iptables-tutorial.frozentux.net/iptables-tutorial.html#MATCHES

This is the source match, which is used to match packets, based on their 
source IP address. The main form can be used to match single IP 
addresses, such as 192.168.1.1. It could also be used with a netmask in 
a CIDR "bit" form, by specifying the number of ones (1's) on the left 
side of the network mask. This means that we could for example add /24 
to use a 255.255.255.0 netmask. We could then match whole IP ranges, 
such as our local networks or network segments behind the firewall. The 
line would then look something like 192.168.0.0/24. This would match all 
packets in the 192.168.0.x range. Another way is to do it with an 
regular netmask in the 255.255.255.255 form (i.e., 
192.168.0.0/255.255.255.0). We could also invert the match with an ! 
just as before. If we were in other words to use a match in the form of 
--source ! 192.168.0.0/24, we would match all packets with a source 
address not coming from within the 192.168.0.x range. The default is to 
match all IP addresses.

The easy way is to use a netmask.  If you have a random set of 
addresses, then I'm not shure that there is an easy way.  Perhaps Jason 
would know more.

Richard wrote:
> Hi,
> 
> I am trying to work on port translation. One inside host with source port
> xxx would always have the same port yyy after nat. Even after the conntrack
> expires, I still want outside incoming packet to port yyy be able to map to
> the same host and port. This is what I did,
> 
> Assume inside 192.168.25.150:5000 maps to outside 66.1.2.3:60150 on
> interface vlan1,
> 
> # allow outside traffic to come in
> iptables -t nat -I PREROUTING -p udp -i vlan1 -d 66.1.2.3 --dport 60150 -j
> DNAT --to-destination 192.168.25.150:5000
> 
> # allow outside traffic to go through the router
> iptables -t filter -I FORWARD -p udp -i vlan1 --dport 5060 -j ACCEPT
> 
> # allow inside traffic to go out
> iptables -t nat -I POSTROUTING -p udp -s 192.168.25.150 --sport 5000 -j SNAT
> -o vlan1 --to-source 66.1.2.3:60150
> 
> Can someone please confirm that this is the right way to do it?
> 
> Also if I have multiple internal hosts, for example, one hundred host
> 192.168.25.1xy:5000 maps to 66.1.2.3:601xy, is there a quick way to do it
> instead of 100 blocks of iptables statements?
> 
> Thanks,
> Richard
> 
> 


