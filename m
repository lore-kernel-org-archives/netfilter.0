From: Steven M Campbell <Netfilter@SCampbell.net>
Subject: Re: It seems I've found why conntrack blocks some packets
Date: Fri, 31 Mar 2006 08:20:15 -0500
Message-ID: <442D2C8F.1020505@SCampbell.net>
References: <57F9959B46E0FA4D8BA88AEDFBE582901674BC@pxtbenexd01.pxt.primeexalia.com>
	<cc4fcc140603300601j169864eexddc8fe3dd06c1a24@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <cc4fcc140603300601j169864eexddc8fe3dd06c1a24@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

We know from the message that we fell off of the end of the FORWARD chain (because the --log-prefix "FORWARD blocked: " is the only one to match the message....

Carlos Pastorino wrote:
	
> 
> $IPTABLES -A FORWARD -p ALL -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
> $IPTABLES -A FORWARD -p ICMP -i $DMZ_IFACE -s $DMZ_RANGE -j ACCEPT
> 
> $IPTABLES -A FORWARD -p TCP -i $DMZ_IFACE -o $INET_IFACE -s $DMZ_RANGE
> -d $0/0 --syn --dport domain -j ACCEPT
> $IPTABLES -A FORWARD -p TCP -i $DMZ_IFACE -o $INET_IFACE -s $DMZ_RANGE
> -d 0/0 --syn --dport ftp -j ACCEPT
> $IPTABLES -A FORWARD -p TCP -i $DMZ_IFACE -o $INET_IFACE -s $DMZ_RANGE
> -d 0/0 --syn --dport http -j ACCEPT
> $IPTABLES -A FORWARD -p TCP -i $DMZ_IFACE -o $INET_IFACE -s $DMZ_RANGE
> -d 0/0 --syn --dport smtp -j ACCEPT
> $IPTABLES -A FORWARD -p UDP -i $DMZ_IFACE -o $INET_IFACE -s $DMZ_RANGE
> -d 0/0 --dport domain -j ACCEPT
> $IPTABLES -A FORWARD -p UDP -i $DMZ_IFACE -o $INET_IFACE -s $DMZ_RANGE
> -d 0/0 --dport ntp -j ACCEPT
> 

deleted a bunch of drop and logs, these aren't the problem

> 
> $IPTABLES -A FORWARD -p TCP -i $INET_IFACE -s 0/0 -j pre_analysis
> 

I'm removing lines that deal with ports other than http

> $IPTABLES -A FORWARD -p ICMP -i $INET_IFACE -o $DMZ_IFACE -s
> $MONITORING -d $DMZ_RANGE -j ACCEPT
> $IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -s 0/0 -d
> $DMZ_WEBSERVER --syn --dport http -j ACCEPT
> $IPTABLES -A FORWARD -p TCP -i $INET_IFACE -o $DMZ_IFACE -s 0/0 -d
> $DMZ_WEBSERVER --syn --dport https -j ACCEPT
> 
> 
> [SOME FORWARD LINES SUPPRESSED]
> 
> $IPTABLES -A FORWARD -j LOG --log-prefix "FORWARD blocked: "
> 
> 

Unfortunately, you've needed to obscure the actual ip address (I understand) but I can't match the 'customerip' and 'webserverip' to the ${variables} above because I don't know the actual values for any of them.

Try to walk through the rules in your forward chain using the ip addresses you've captured and identify the rule you believe should allow these ack packets to go out.

