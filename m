From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Please Review My Rules
Date: Tue, 27 Jun 2006 18:50:40 +0200
Message-ID: <44A161E0.7050804@rtij.nl>
References: <42CD7FAD-A949-4A63-9A0A-873EB8005FAF@servermotion.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42CD7FAD-A949-4A63-9A0A-873EB8005FAF@servermotion.com>
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
To: Chris Miller <cmiller@servermotion.com>
Cc: netfilter@lists.netfilter.org

Chris Miller wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hey guys, if it's not too much trouble I would like to ask you all to  
> take a second and review my rules. I have a CentOS box running  
> iptables. I have servers in two different VLAN's (VLAN 5 and VLAN 6)  
> that are all assigned private IP addresses in the 10.176.x.x range. I  
> assign the public IP addresses to the iptables firewall and use  
> static 1:1 NAT to translate traffic to the 10.176.x.x block. The  
> public network is in VLAN 9.
>
> In my example below, I have changed the public IP addresses to be  
> 192.168.x.x just for the sake of not revealing the real IP addresses.
>
> - -----------------------------------
> iptables -A INPUT -d 192.168.59.5 -p icmp -j REJECT --reject-with  
> icmp-port-unreachable
> iptables -A INPUT -d 192.168.59.7 -p icmp -j REJECT --reject-with  
> icmp-port-unreachable
> iptables -A INPUT -d 192.168.56.8 -p icmp -j REJECT --reject-with  
> icmp-port-unreachable
> iptables -A INPUT -d 192.168.58.4 -p icmp -j REJECT --reject-with  
> icmp-port-unreachable
> iptables -A INPUT -d 192.168.58.37 -p icmp -j REJECT --reject-with  
> icmp-port-unreachable
> iptables -A INPUT -d 192.168.57.6 -p icmp -j REJECT --reject-with  
> icmp-port-unreachable


Are these all adresses of the firewall? If not, these rules will not do 
anything.  If yes, why bother?

If your policy is set to ACCEPT, this will break things (most notably 
PMTUD). If your policy is set to DROP, why reject these?

Also note that if these are all the addresses of the firewall itself, 
the same can be achieved by simply saying

    iptables -A INPUT -p icmp -j REJECT --reject-with  
icmp-port-unreachable

Even then, take into account that these addresses are reachable from 
both the inside LANS as well as the outside, are you sure you want to 
restrict the inside as wel?

Normally I write rules like this:

iptables -A INPUT -i $EXT_IF -j FROM_INTERNET
iptables -A INPUT -i $VLAN5 -j FROM_VLAN5
iptables -A INPUT -i $VLAN6 -j FROM_VLAN6

and the define the respective chains that describe what traffic coming 
from that interface is allowed. I seldom make destiction on addresses 
(in the INPUT chain), making the distinction on interface is much easier 
in the long run.

>
> iptables -A FORWARD -o eth0.5 -m state --state  
> NEW,RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -o eth0.6 -m state --state  
> NEW,RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -i eth0.9 -m state --state RELATED,ESTABLISHED -j  
> ACCEPT


Fine, but why not for INPUT and OUTPUT?

>
> iptables -t nat -A PREROUTING -d 192.168.56.8 -i eth0.9 -j DNAT --to- 
> destination 10.176.56.8
> iptables -t nat -A PREROUTING -d 192.168.59.7 -i eth0.9 -j DNAT --to- 
> destination 10.176.59.7
> iptables -t nat -A PREROUTING -d 192.168.59.5 -i eth0.9 -j DNAT --to- 
> destination 10.176.59.5
> iptables -t nat -A PREROUTING -d 192.168.58.37 -i eth0.9 -j DNAT --to- 
> destination 10.176.58.37
> iptables -t nat -A PREROUTING -d 192.168.58.4 -i eth0.9 -j DNAT --to- 
> destination 10.176.58.4
> iptables -t nat -A PREROUTING -d 192.168.58.21 -i eth0.9 -j DNAT --to- 
> destination 10.176.58.21
> iptables -t nat -A PREROUTING -d 192.168.58.29 -i eth0.9 -j DNAT --to- 
> destination 10.176.58.29
> iptables -t nat -A PREROUTING -d 192.168.56.7 -i eth0.9 -j DNAT --to- 
> destination 10.176.56.7
> iptables -t nat -A PREROUTING -d 192.168.56.5 -i eth0.9 -j DNAT --to- 
> destination 10.176.56.5
> iptables -t nat -A PREROUTING -d 192.168.56.6 -i eth0.9 -j DNAT --to- 
> destination 10.176.56.6
> iptables -t nat -A PREROUTING -d 192.168.57.5 -i eth0.9 -j DNAT --to- 
> destination 10.176.57.5
>
> iptables -t nat -A POSTROUTING -s 10.176.56.8 -o eth0.9 -j SNAT --to- 
> source 192.168.56.8
> iptables -t nat -A POSTROUTING -s 10.176.59.7 -o eth0.9 -j SNAT --to- 
> source 192.168.59.7
> iptables -t nat -A POSTROUTING -s 10.176.59.5 -o eth0.9 -j SNAT --to- 
> source 192.168.59.5
> iptables -t nat -A POSTROUTING -s 10.176.58.37 -o eth0.9 -j SNAT --to- 
> source 192.168.58.37
> iptables -t nat -A POSTROUTING -s 10.176.58.4 -o eth0.9 -j SNAT --to- 
> source 192.168.58.4
> iptables -t nat -A POSTROUTING -s 10.176.58.21 -o eth0.9 -j SNAT --to- 
> source 192.168.58.21
> iptables -t nat -A POSTROUTING -s 10.176.58.29 -o eth0.9 -j SNAT --to- 
> source 192.168.58.29
> iptables -t nat -A POSTROUTING -s 10.176.56.7 -o eth0.9 -j SNAT --to- 
> source 192.168.56.7
> iptables -t nat -A POSTROUTING -s 10.176.56.5 -o eth0.9 -j SNAT --to- 
> source 192.168.56.5
> iptables -t nat -A POSTROUTING -s 10.176.56.6 -o eth0.9 -j SNAT --to- 
> source 192.168.56.6
> iptables -t nat -A POSTROUTING -s 10.176.57.5 -o eth0.9 -j SNAT --to- 
> source 192.168.57.5


There is a target (was it NETMAP?) that can do this in just two rules, 
it maps a complete subnet to another subnet.

> - -----------------------------------
>
> Currently I don't do any filtering, it just forwards any and all  
> requests for incoming traffic to whatever I have it set to translate  
> to. I'm going to create a separate chain for each server and jump to  
> that chain before I do the DNAT or SNAT rules to do traffic  
> filtering. Is that a good approach?


Fine. However that is not done before the DNAT, the filter chain is 
always executed after the PREROUTING chain. Keep that in mind when using 
--destination, you need to match on the DNATted addresses.

>
> Is there anything I should keep in mind when doing this type of setup?
>

I think I covered most.

HTH,
M4

