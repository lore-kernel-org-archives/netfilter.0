From: Jason Opperisano <opie@817west.com>
Subject: Re: Final IPTables script (hopefully)
Date: Wed, 29 Dec 2004 15:07:35 -0500
Message-ID: <1104350854.7318.62.camel@hubcap.ljm.dom>
References: <6.1.2.0.0.20041228154423.18f8ee30@corpmail.courtesymortgage.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6.1.2.0.0.20041228154423.18f8ee30@corpmail.courtesymortgage.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tue, 2004-12-28 at 18:48, Jason Williams wrote:
> #Custom chains
> 
> $IPTABLES -N tcp_packets

typo:  $IPTABLES -N bad_tcp_packets

> # bad_tcp_packets chain
> 
> $IPTABLES -A bad_tcp_packets -p tcp --tcp-flags SYN,ACK SYN,ACK -m state 
> --state NEW -j REJECT --reject-with tcp-reset
> $IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j LOG 
> --log-prefix "New not syn:"
> $IPTABLES -A bad_tcp_packets -p tcp ! --syn -m state --state NEW -j DROP

you also never jump to this custom chain anywhere in your rules below. 
maybe you wanted:

  $IPTABLES -A INPUT -j bad_tcp_packets
  $IPTABLES -A FORWARD -j bad_tcp_packets

but i don't really know for sure.

> Like the idea of this rule. Trying to prevent NMAP scans, xmas scans etc.
> 
> # Rules for incoming packets from the internet.
> 
> $IPTABLES -A INPUT -p ALL -d $INET_IFACE -m state --state 
> ESTABLISHED,RELATED -j ACCEPT

typo:  "-d $INET_IFACE" expands to "-d eth0" my guess is you either mean
"-d $INET_IP" or "-i $INET_IFACE" from your explanation below i guess
it's the latter.

and the "-p ALL" is still unnecessary...

> $IPTABLES -A INPUT -i $LAN_IFACE -s 172.16.1.2 --dport 22 -j ACCEPT
> $IPTABLES -A INPUT -p ALL -i $LO_IFACE -s $LO_IP -j ACCEPT
> 
> Should allow traffic to flow freely from the firewall to the internet and 
> accept returning connections. No connections from the internet that are 
> intiated will be accepted.
> Acceping SSH from 172.16.1.2 on the private LAN.
> Accceptin loopback interface.
> 
> # Accept the packets we actually want to forward
> 
> $IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A FORWARD -i $LAN_IFACE -o $INET_IFACE -s $LAN_IP_RANGE -j ACCEPT
> 
> Pass out private LAN traffic and return it. First rule is in line for 
> better performance.
> 
> # Special OUTPUT rules to decide which IP's to allow.
> 
> $IPTABLES -A OUTPUT -j ACCEPT
> 
> Simple enough.
> 
> 
> #NAT SETUP
> 
> $IPTABLES -t nat -A POSTROUTING -s $LAN_IP -o $INET_IFACE -j SNAT 
> --to-source $INET_IP
> 
> Do SNAT for trafffic on the private LAN.

typo:  $LAN_IP = 192.168.0.2; which i'm guessing is the IP of the
firewall itself.  i think you mean $LAN_IP_RANGE

> Feel good about these rules. Just wante to ask one last time before I go 
> live, in case i booger it up and need help

the theory is good; just missing some polish in the execution.

-j

--
"Kids, you tried your best and you failed miserably. The lesson is,
 never try."
	--The Simpsons


