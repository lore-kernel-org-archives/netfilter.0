From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: How is Kazaa getting out without a rule?
Date: Sat, 8 Mar 2003 13:26:43 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030308132643.611e6f0a.arnt@c2i.net>
References: <20030307233027.80633.qmail@web80410.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030307233027.80633.qmail@web80410.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Fri, 7 Mar 2003 15:30:27 -0800 (PST), 
Tasha Smith <tashamaillist@yahoo.com> wrote in message 
<20030307233027.80633.qmail@web80410.mail.yahoo.com>:

> Hiiii,
> I was wandering if somone can help explain this to me, Below is my
> firewall script, eth1 is my LAN interface and eth0 is Internet in the
> on the FIREWALL/ROUTER machine. But from my LAN windows machines 
> could not connect MSN messanger until i created a forward rule for
> port 1863. BUT kazaa from my LAN CAN connect to the outside world
> without creating rule. How is this possible? and does that mean if i
> have a trojan on one of my windows machine it can get out and make a
> connection to somewhere on the NET tooo? Thanks guys for the help!   

..for ideas, try grep kaaza from a tcpdump run, I'd guess it uses 
high ports.  These high ports _are_ open, until _you_ close them.

..check your box to see what apps etc you have running, shut down 
and remove those you don't need/want, close ports on whatever you 
need/want running for internal but not external users, X, webmin, 
dhcp, tftp etc, ymmv.

> ########################################################
> # This will also update my ipaddress.
> IP_INET=`/sbin/ifconfig eth0 | grep inet | cut -d: -f2 | cut -d\  -f1`
> 
> # Remove any existing rules from all chains.
> iptables --flush
> iptables -t nat --flush
> iptables -t mangle --flush
> 
> # Unlimited access on the loopback interface.
> iptables -A INPUT  -i lo -j ACCEPT
> iptables -A OUTPUT -o lo -j ACCEPT
>       
> # Set the default policy to drop.
> iptables --policy INPUT DROP
> iptables --policy FORWARD DROP
> iptables --policy OUTPUT ACCEPT
> 
> iptables -t nat --policy PREROUTING ACCEPT
> iptables -t nat --policy OUTPUT ACCEPT
> iptables -t nat --policy POSTROUTING ACCEPT
> 
> iptables -t mangle --policy PREROUTING ACCEPT
> iptables -t mangle --policy OUTPUT ACCEPT
> 
> # Allow stateful connections 
> iptables -A INPUT   -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A OUTPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT

..why this stateful OUTPUT ?

> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
> # Allow Access for DNS UDP for my ISP DNS server.
> if [ "$CONNECTION_TRACKING" = "1" ]; then
>    iptables -A OUTPUT -o eth0 -p udp \
>             -s $IP_INET --sport 1024:65535 \
>             -d 208.53.4.130 --dport 53 \

..here, many prefer calling their hosts etc "A.B.C.130" when asking 
online, some feel safer that way etc, ymmv. 

>             -m state --state NEW -j ACCEPT
> fi
> 
> iptables -A OUTPUT -o eth0 -p udp \
>          -s $IP_INET     --sport 1024:65535 \
>          -d 208.53.4.130 --dport 53 -j ACCEPT
> 
> 
> if [ "$CONNECTION_TRACKING" = "1" ]; then
>     iptables -A OUTPUT -o eth0 -p udp \
>              -s $IP_INET --sport 1024:65535 \
>              -d 208.53.4.150 --dport 53 \
>              -m state --state NEW -j ACCEPT
> fi
> 
> iptables -A OUTPUT -o eth0 -p udp \
>          -s $IP_INET --sport 1024:65535 \
>          -d 208.53.4.150 --dport 53 -j ACCEPT
>        
> # Allow access for my ISP DHCP server.
> if [ "$CONNECTION_TRACKING" = "1" ]; then
>     iptables -A OUTPUT -o eth0 -p udp \
>              -s $IP_NET --sport 1024:65535 \
>              -d 208.53.4.129 --dport 67 \
>              -m state --state NEW -j ACCEPT
> fi
> 
> iptables -A OUTPUT -o eth0 -p udp \
>          -s $IP_INET      --sport 1024:65535 \
>          -d 208.53.4.129  --dport 67 -j ACCEPT
> 
> 
> # Allow access to remote webservers PORT 80.
> if [ "$CONNECTION_TRACKING" = "1" ]; then
>     iptables -A OUTPUT -o eth0 -p tcp \
>              -s $IP_INET --sport 1024:65535 \
>              --dport 80 -m state --state NEW -j ACCEPT
> fi
> 
> iptables -A OUTPUT -o eth0 -p tcp \
>          -s $IP_INET --sport 1024:65535 \
>          --dport 80 -j ACCEPT
> 
> 
> # Attempt to connect to HHTPS connections.
> if [ "$CONNECTION_TRACKING" = "1" ]; then
>      iptables -A OUTPUT -o eth0 -p tcp \
>               -m state --state NEW --dport 443 \
>               --sport 1024:65535 \
>               -j ACCEPT
> fi
> 
> iptables -A OUTPUT -o eth0 -p tcp \
>          -s $IP_INET --sport 1024:65535 \
>          --dport 443 -j ACCEPT
>  
> 
> # Fragmented ICMP Messages.
> iptables -A INPUT -i eth0 --fragment -p icmp -j LOG \
>          --log-prefix "Fragmented ICMP: "
> iptables -A INPUT -i eth0 --fragment -p icmp -j DROP \
> 
> # Source Quench Control
> iptables -A INPUT -i eth0 -p icmp \
>          --icmp-type source-quench -d $IP_INET -j ACCEPT
> iptables -A OUTPUT -o eth0 -p icmp \
>          -s $IP_INET --icmp-type source-quench -j ACCEPT
> 
> # Parameter Problem Status.
> iptables -A INPUT -i eth0 -p icmp \
>          --icmp-type parameter-problem -d $IP_INET -j ACCEPT
> iptables -A OUTPUT -o eth0 -p icmp \
>          -s $IP_INET --icmp-type parameter-problem -j ACCEPT
> 
> # Destination Unreachable Error.
> iptables -A INPUT -i eth0 -p icmp \
>          --icmp-type destination-unreachable -d $IP_INET -j ACCEPT
> iptables -A OUTPUT -o eth0 -p icmp \
>          -s $IP_INET --icmp-type fragmentation-needed -j ACCEPT
> iptables -A OUTPUT -o eth0 -p icmp \
>          -s $IP_INET --icmp-type destination-unreachable -j DROP
> 
> # Time Exceeded Status
> iptables -A INPUT -i eth0 -p icmp \
>          --icmp-type time-exceeded -d $IP_INET -j ACCEPT
> 
> # Allow Outgoing pings to remote hosts
> if [ "$CONNECTION_TRACKING" = "1" ]; then
>      iptables -A OUTPUT -o eth0 -p icmp \
>               -s $IP_INET --icmp-type echo-request \
>               -m state --state NEW -j ACCEPT
> fi
> 
> iptables -A OUTPUT -o eth0 -p icmp \
>          -s $IP_INET --icmp-type echo-request -j ACCEPT
> 
> # Incoming ping from Remote Hosts.
> if [ "$CONNECTION_TRACKING" = "1" ]; then
>      iptables -A INPUT -i eth0 -p icmp \
>               -s 208.53.1.231 --icmp-type echo-request -d $IP_INET \
>               -m state --state NEW -j ACCEPT
> fi
> 
> iptables -A INPUT -i eth0 -p icmp \
>          -s 208.53.1.231 --icmp-type echo-request -d $IP_INET -j
>          ACCEPT
> iptables -A OUTPUT -o eth0 -p icmp \
>          -s $IP_INET --icmp-type echo-reply -d 209.53.1.231 -j ACCEPT
> 
> # Fowarding is allowed in the direction

..which direction, outbound?

> iptables -A FORWARD -i eth1 -p tcp --dport 80 -j ACCEPT
> iptables -A FORWARD -i eth1 -p tcp -m multiport --dport 25,80,110,443
> -j ACCEPT iptables -A FORWARD -i eth1 -p tcp -m multiport --dport 1863
> -j ACCEPT iptables -A FORWARD -i eth1 -p tcp -m multiport --dport 1863
> -j ACCEPT
> 
> # Enables Packet Forwarding
> iptables -t nat -A POSTROUTING -o eth0  -j MASQUERADE
> 
> echo 1 > /proc/sys/net/ipv4/ip_forward 
> 

..I don't see any problems with your script except where noted.

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.


