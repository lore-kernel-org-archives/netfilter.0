From: Jason Opperisano <opie@817west.com>
Subject: Re: Suse 9.1 port forwarding woes
Date: Mon, 10 Jan 2005 15:32:53 -0500
Message-ID: <20050110203253.GA10924@bender.817west.com>
References: <41E2E585.9040308@overdrawn.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <41E2E585.9040308@overdrawn.net>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Mon, Jan 10, 2005 at 12:28:53PM -0800, Nathan March wrote:
> Despite my best attempts, I cannot seem to get port forwarding working 
> on a suse 9.1 machine using iptables.
> 
> My firewall.sh:
> 
> #!/bin/bash
> 
> IPTABLES='/usr/sbin/iptables'
> 
> EXTIF='eth0'
> INTIF1='eth1'
> INTIF2='eth2'
> 
> /bin/echo 1 > /proc/sys/net/ipv4/ip_forward
> 
> $IPTABLES -F
> $IPTABLES -t nat -F
> $IPTABLES -X
> 
> $IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
> 
> $IPTABLES -A FORWARD -m state --state ESTABLISHED -j ACCEPT
> $IPTABLES -A FORWARD -p icmp -m state --state RELATED -j ACCEPT
> 
> 
> $IPTABLES -A FORWARD -i $INTIF1 -o $EXTIF -m state --state 
> NEW,ESTABLISHED -j ACCEPT
> $IPTABLES -A FORWARD -i $INTIF2 -o $EXTIF -m state --state 
> NEW,ESTABLISHED -j ACCEPT
> 
> $IPTABLES -A INPUT --protocol tcp --dport 22 -j ACCEPT
> $IPTABLES -A INPUT --protocol tcp --dport 25 -j ACCEPT
> $IPTABLES -A INPUT --protocol tcp --dport 143 -j ACCEPT
> 
> $IPTABLES -A FORWARD -i eth0 -d 192.168.0.3 --protocol tcp --dport 80 -j 
> ACCEPT
> $IPTABLES -A PREROUTING -i eth0 -t nat -p tcp --dport 80 -j DNAT --to 
> 192.168.0.3:80
> 
> 
> After the script runs:
> linux:~ # iptables --list
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination        
> ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ssh
> ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:smtp
> ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:imap
> 
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination        
> ACCEPT     all  --  anywhere             anywhere            state 
> ESTABLISHED
> ACCEPT     icmp --  anywhere             anywhere            state RELATED
> ACCEPT     all  --  anywhere             anywhere            state 
> NEW,ESTABLISHED
> ACCEPT     all  --  anywhere             anywhere            state 
> NEW,ESTABLISHED
> ACCEPT     tcp  --  anywhere             192.168.0.3         tcp 
> dpt:http flags:FIN,SYN,RST,ACK/SYN state NEW
> 
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination        
> linux:~ # iptables -t nat --list
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination        
> DNAT       tcp  --  anywhere             anywhere            tcp 
> dpt:http to:192.168.0.3
> 
> Chain POSTROUTING (policy ACCEPT)
> target     prot opt source               destination        
> MASQUERADE  all  --  anywhere             anywhere           
> 
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
> 
> Anyone have any ideas what I'm doing wrong?

i can tell you that the output of "iptables --list" you provide here does
not reflect the script above.  which might be the root of your problem.

-j

--
"The lesson is: Our God is vengeful! O spiteful one, show me who to
 smite and they shall be smoten!!!"
        --The Simpsons

