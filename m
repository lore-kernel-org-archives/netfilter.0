From: Jason Opperisano <opie@817west.com>
Subject: Re: No Internet Connection
Date: Fri, 10 Sep 2004 11:33:19 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094830398.1900.132.camel@wolfpack.ljm.dom>
References: <20040910144901.42036.qmail@web50204.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040910144901.42036.qmail@web50204.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Fri, 2004-09-10 at 10:49, Giancarlo Boaron wrote:
> So, here goes my script:
> 
> INET_IP=`ifconfig eth0 | grep inet | cut -d : -f 2 |
> cut -d ' ' -f 2`

maybe this is an ifconfig quirk, but that does not produce an IP address
on my machine here (FC1).  it actually produces nothing.  the working
version here is:

ifconfig eth0 | grep inet | cut -d : -f 2 | cut -d ' ' -f 1

however, might i suggest:

ip -4 -o addr sh eth0 | awk 'NR==1 {print $4}' | cut -d/ -f1

> $IPTABLES -N tcp_invalidos
> 
> $IPTABLES -A tcp_invalidos -p tcp --tcp-flags SYN,ACK
> SYN,ACK \
> -m state --state NEW -j REJECT --reject-with tcp-reset
> $IPTABLES -A tcp_invalidos -p tcp ! --syn -m state
> --state NEW -j LOG \
> --log-prefix "Novo nao SYN:"
> $IPTABLES -A tcp_invalidos -p tcp ! --syn -m state
> --state NEW -j DROP

there's a state called INVALID ("-m state --state INVALID") that could
probably do most of the work for you here...

> $IPTABLES -A OUTPUT -p tcp -j tcp_invalidos
> 
> $IPTABLES -A OUTPUT -p udp --sport 68 --dport 67 -j
> ACCEPT
> 
> $IPTABLES -A OUTPUT -p all -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> 
> $IPTABLES -A OUTPUT -p icmp --icmp-type 8 -j ACCEPT
> 
> $IPTABLES -A OUTPUT -p tcp --dport 53 -j ACCEPT
> $IPTABLES -A OUTPUT -p udp --dport 53 -j ACCEPT
> 
> $IPTABLES -A OUTPUT -p tcp --dport 80 -s $INET_IP -o
> $INET_IFACE -j ACCEPT
> $IPTABLES -A OUTPUT -p tcp --dport 443 -s $INET_IP -o
> $INET_IFACE -j ACCEPT
> $IPTABLES -A OUTPUT -p tcp --dport 21 -s $INET_IP -o
> $INET_IFACE -j ACCEPT
> 
> # ICQ:
> $IPTABLES -A OUTPUT -p tcp -d 64.12.163.197 -o
> $INET_IFACE -j ACCEPT

are you running an ICQ client on your firewall?  the above rule implies
that you are.  i can't say i recommend this at all.  if your intention
is to allow ICQ *through* the firewall--this rule belongs in FORWARD.

> $IPTABLES -A INPUT -p tcp -j tcp_invalidos
> 
> $IPTABLES -A INPUT -p udp --sport 67 --dport 68 -j
> ACCEPT
> 
> $IPTABLES -A INPUT -p ALL -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> 
> $IPTABLES -A INPUT -p tcp --dport 53 -j ACCEPT
> $IPTABLES -A INPUT -p udp --dport 53 -j ACCEPT
> 
> # SQUID:
> $IPTABLES -A INPUT -i $LAN_IFACE -p tcp --dport 80 -j
> ACCEPT
> 
> $IPTABLES -A FORWARD -p tcp -j tcp_invalidos
> 
> $IPTABLES -A FORWARD -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> 
> $IPTABLES -A FORWARD -m mac --mac-source $Mac1 -j
> ACCEPT
> 
> $IPTABLES -A FORWARD -m mac --mac-source $Mac2 -j
> ACCEPT
> 
> $IPTABLES -A FORWARD -m mac --mac-source $Mac3 -j
> ACCEPT
> 
> $IPTABLES -A FORWARD -m mac --mac-source $Mac4 -j
> ACCEPT
> 
> $IPTABLES -A FORWARD -p tcp --dport 53 -j ACCEPT
> $IPTABLES -A FORWARD -p udp --dport 53 -j ACCEPT
> 
> $IPTABLES -A FORWARD -d <my pop server> -p tcp --dport
> 110 \
> -i $LAN_IFACE -j ACCEPT
> 
> $IPTABLES -A FORWARD -d <my smtp server> -p tcp
> --dport 25 \
> -i $LAN_IFACE -j ACCEPT
> 
> $IPTABLES -A FORWARD -p tcp --dport 21 -i $LAN_IFACE
> -j ACCEPT
> $IPTABLES -A FORWARD -p tcp --dport 80 -i $LAN_IFACE
> -j ACCEPT
> $IPTABLES -A FORWARD -p tcp --dport 443 -i $LAN_IFACE
> -j ACCEPT
> 
> $IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT
> --to-source $INET_IP
> 
> That's it. Another question: When I configure this
> script to run automatically after rebooting the
> server, I receive this error message (3 times): "Bad
> argument eth0" so the script doesn't work, neither my
> Internet access from my LAN and I can't find where is
> the error.

it's probably related to the fact that your $INET_IP variable expands to
a text string, not an IP address.

> However, after rebooting the server and loggin in as
> root, I can run the script from command line. It works
> and my LAN can access the Internet during that short
> time (about 20 minutes. However, I didn't test the
> DHCP rules to ckeck if it continues to happen).

are you running your firewall script before your external interface has
an IP address?  if so--this would explain it.  your DHCP client is most
likely being spawned by your /etc/init.d/network script, which usually
kicks off pretty early in rc2.

i cannot explain the "20 minute" phenomenon you refer to.

-j

-- 
Jason Opperisano <opie@817west.com>


