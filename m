From: uniplex <uniplex@maximum-linux.net>
Subject: Re: problem with ip tables help required
Date: Sat, 08 Feb 2003 07:41:26 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E44B4A6.4040503@maximum-linux.net>
References: <OF56582234.0D18279E-ON65256CC6.00202B97-65256CC6.00203F99@diamond.philips.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: purushotham.krishnappa@philips.com
Cc: netfilter@lists.netfilter.org

purushotham.krishnappa@philips.com wrote:
> Hi

Hi

> 
> 
> The requirement is like this
> 
> 
>               WebServer-------------------- - ----Router/Firewall---------------------------------------client
>             10.60.90.7/8            eth1                  eth0                                         192.168.10.15
>                               10.60.90.5/8                 192.168.10.5/24
> 
> 

after looking at you're script it looks like you're missing a forward 
rule to allow the client to access the web server.

iptables -A FORWARD -i eth0 -o eth1 -p tcp --dport 80 -j ACCEPT

it also looks like you might want to masquerade your internal clients.

iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

also, unless the connection is actually to the Router/Firewall an INPUT 
rule does nothing. If it's a connection between the client and the 
webserver then only forward rules on the firewall will apply.

> 
> Router/Firewall ----->RH linux 8 using iptables
> 
> client should be able to access the webserver
> With out firewall rule i am able to access webserver  from client (ip forwarding is working fine)
> 
> 
> I have already set iptable rule pls see the attached file
> 
> 
> after FW rule is enable
> 
> i am not able to connect to webserver from 192.168.10.5  to 10.60.90.7    BUT i can ping 10.60.90.5
> I need clients to connect from 192.168.10.0/24  to able to connect to only port 80 on 10.161.90.7.8
> 
> (See attached file: firescript.txt)
> Rgds
> Puru
> 
> 
> ------------------------------------------------------------------------
> 
> # (1) Policies (default)
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP
> 
> # (2) User-defined chain for ACCEPTED TCP packets
> iptables -N okay
> iptables -A okay -p TCP --syn -j ACCEPT
> iptables -A okay -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A okay -p TCP -j DROP
> 
> # (3) INPUT chain rules
> # Rules for incoming packets from LAN
> iptables -A INPUT -p ALL -i eth1 -s 10.0.0.0/8 -j ACCEPT
> iptables -A INPUT -p ALL -i lo -s 127.0.0.1 -j ACCEPT
> iptables -A INPUT -p ALL -i lo -s 10.60.90.5 -j ACCEPT
> iptables -A INPUT -p ALL -i lo -s 192.168.10.5 -j ACCEPT
> iptables -A INPUT -p ALL -i eth1 -d 10.0.0.255 -j ACCEPT
> 
> # Rules for incoming packets from the internet
> 
> # Packets for established connections
> iptables -A INPUT -p ALL -d 192.168.10.5 -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
> # TCP rules
> iptables -A INPUT -p TCP -i eth0 -s 0/0 --destination-port 80 -j okay
> 
> # ICMP rules
> iptables -A INPUT -p ICMP -i eth0 -s 0/0 --icmp-type 8 -j ACCEPT
> iptables -A INPUT -p ICMP -i eth0 -s 0/0 --icmp-type 11 -j ACCEPT
> 
> # (4) FORWARD chain rules
> # Accept the packets we want to forward
> iptables -A FORWARD -i eth1 -j ACCEPT
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
> # (5) OUTPUT chain rules
> # ONly output packets with local address (no spoofing)
> iptables -A OUTPUT -p ALL -s 127.0.0.1 -j ACCEPT
> iptables -A OUTPUT -p ALL -s 10.60.90.5 -j ACCEPT
> iptables -A OUTPUT -p ALL -s 192.168.10.5 -j ACCEPT
> 
> # (6) dynamic NAT to do port forwarding
> iptables -t nat -A PREROUTING -p tcp -d 192.168.10.5 --dport 80 -j DNAT --to-destination 10.60.90.7



