From: Aleksandar Milivojevic <alex@milivojevic.org>
Subject: Re: problem with netfilter, ipsec and gre combination
Date: Mon, 08 Aug 2005 09:41:20 -0500
Message-ID: <20050808094120.3tdddu3zogc44k80@www.milivojevic.org>
References: <42F44612.2030605@milivojevic.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <42F44612.2030605@milivojevic.org>
Content-disposition: inline
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: netfilter@lists.netfilter.org

Quoting Aleksandar Milivojevic <alex@milivojevic.org>:

> I've run into the problem where Netfilter is not putting packets into 
> established state (where they should be).
>
> Basically, I have a setup that consist of two testing machines acting 
> as VPN gateways.  Machine A with IP addresses of 192.168.1.1 and 
> 192.168.2.1, and machine B with IP address of 192.168.3.1 and 
> 192.168.4.1.  The 1.1 and 3.1 act as "external" IP addresses.  2.1 
> and 4.1 are on the "local networks" that I want to connect with a 
> tunnel.
>
> I've setup GRE tunnel between them like this (on machine A, machine B 
> has the same thing in opposite direction, the route is to 
> 192.168.2.0/24, and the interface name is neta):
>
> # modprobe ip_gre
> # ip tunnel add netb mode gre remote 192.168.3.1 local 192.168.1.1 ttl 255
> # ip link set netb up
> # ip addr add 10.0.0.1 dev netb
> # ip route add 192.168.4.0/24 dev netb src 192.168.2.1
>
> Then I defined IPSec policy between 192.168.1.1 and 192.168.3.1, 
> transport mode, required, using racoon for automatic keying.
>
> If I ping 192.168.4.1 from 192.168.2.1 everything works fine.  
> Packets go into the GRE tunnel, which than goes over IPSec.
>
> If I ping 192.168.3.1 from 192.168.1.1, things do not work.  After 
> lots of debugging (basically logging all traffic in all 
> tables/chains, and looking at the output of iptables -nvxL), it seems 
> that returning packets are not placed into established state.
>
> On machine B, I have this set of rules:
>
> # standard stuff to handle established connections
>
> -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> # gre/ipsec/ike stuff
>
> -A INPUT -i eth0 -p esp -s 192.168.1.1 -d 192.168.3.1 -j ACCEPT
> -A OUTPUT -o eth0 -p esp -s 192.168.3.1 -d 192.168.1.1 -j ACCEPT
> -A INPUT -i eth0 -p gre -s 192.168.1.1 -d 192.168.3.1 -j ACCEPT
> -A OUTPUT -o eth0 -p gre -s 192.168.3.1 -d 192.168.1.1 -j ACCEPT
> -A INPUT -i eth0 -p udp --sport 500 --dport 500 -s 192.168.1.1 -d 
> 192.168.3.1 -j ACCEPT
> -A INPUT -i eth0 -p udp --sport 500 --dport 500 -s 192.168.3.1 -d 
> 192.168.1.1 -j ACCEPT
>
> # rules to allow ping from the other end (direct and through the tunnel)
>
> -A INPUT -i eth0 -p icmp --icmp-type ping -s 192.168.1.1 -d 
> 192.168.3.1 -m state --state NEW -j ACCEPT
> -A INPUT -i neta -p icmp --icmp-type ping -s 192.168.2.1 -d 
> 192.168.4.1 -m state --state NEW -j ACCEPT
>
> # log everything before dropping it
>
> -A INPUT -j LOG --log-prefix "INPUT "
> -A OUTPUT -j LOG --log-prefix "OUTPUT "
> -A FORWARD -j LOG --log-prefix "FORWARD "
>
> As I wrote, when I do "ping -c 1 192.168.3.1" from machine A using 
> 192.168.1.1 as source address, and looking at the output of iptables 
> -nvxL, I can see counter incremented for ESP packet, counter for ICMP 
> ping is incremented, but the ICMP pong is not cought by the second 
> rule (accept all established/related), and falls to the bottom of the 
> chain (gets logged and dropped).
>
> On the other hand, if I'm doing "ping -c 192.168.4.1" from machine A 
> using 192.168.2.1 as source address, everything just works (and I see 
> counters incremented as expected).

I did some additional testing, and it seems that the problem is not related to
GRE at all.

If IPSec is defined between two hosts in transport mode, Netfilter does 
not seem
to place returning packets into established state.  Sounds like a bug in
Netfilter.  I'll make a short posting to the devel list describing this.


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.



