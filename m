From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: firewall rules
Date: Wed, 11 Sep 2002 18:36:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020911173648.UKVY287.mta02-svc.ntlworld.com@there>
References: <Pine.LNX.4.44.0209111458010.2195-100000@fire.ethosuk.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0209111458010.2195-100000@fire.ethosuk.org.uk>
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

On Wednesday 11 September 2002 3:12 pm, Scott van Looy wrote:

> Also, if I'm using pre and postrouting, do these filters bypass the 
> FORWARD chain? If so I'm probably wasting my time with lots of the forward 
> rules ;)

No.   PREROUTING and POSTROUTING are for address translation (you *can* 
filter in these chains, but you *really* shouldn't...).   FORWARD is for 
filtering, and you do have to have the right combination of rules in both / 
all three chains to get things working.

> #Default rules (there's no problem with a default accept on output is
> #there?)

Not really, no.   It only becomes a problem if your firewall gets rooted and 
someone starts running an application you don't want on it, generating 
packets to the Internet.   If someone else has got that far, though, they can 
probably turn your firewall rules off altogether, though.

> $IPTABLES -F INPUT
> $IPTABLES -P INPUT DROP
> $IPTABLES -F OUTPUT
> $IPTABLES -P OUTPUT ACCEPT
> $IPTABLES -F FORWARD
> $IPTABLES -P FORWARD DROP
> $IPTABLES -t nat -F

Very nice.

> echo "   Assigning IPs"
> /sbin/ifconfig ppp0:1 213.152.47.234 netmask 255.255.255.248
> /sbin/ifconfig ppp0:2 213.152.47.235 netmask 255.255.255.248
> /sbin/ifconfig ppp0:3 213.152.47.236 netmask 255.255.255.248
> /sbin/ifconfig ppp0:4 213.152.47.237 netmask 255.255.255.248
> /sbin/ifconfig ppp0:5 213.152.47.238 netmask 255.255.255.248
>
> echo "   Setting pre and post routing"
> $IPTABLES -t nat -A POSTROUTING -s 192.168.0.2 -o ppp0 -j SNAT \
>         --to-source 213.152.47.234
> $IPTABLES -t nat -A PREROUTING -i ppp0 -d 213.152.47.234 -j DNAT \
>         --to-destination 192.168.0.2
> $IPTABLES -t nat -A POSTROUTING -s 192.168.0.27 -o ppp0 -j SNAT \
>         --to-source 213.152.47.235
> $IPTABLES -t nat -A PREROUTING -i ppp0 -d 213.152.47.235 -j DNAT \
>         --to-destination 192.168.0.27
> $IPTABLES -t nat -A POSTROUTING -s 192.168.0.3 -o ppp0 -j SNAT \
>         --to-source 213.152.47.236
> $IPTABLES -t nat -A PREROUTING -i ppp0 -d 213.152.47.236 -j DNAT \
>         --to-destination 192.168.0.3

All looks fine so far.

> #Is setting the forward here setting it to globally forward
> # everything thus making the rest of the forward ruleset pintless?
>
> $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT

Okay, so this rule allows absolutely everything outbound.

Doesn't mean the rest of the rules are pointless, because you may want to 
allow some stuff inbound.   You won't be able to restrict anything outbound 
after this rule, though.

> #Forward rules for other machines on the internal network
> #Open ports > 1023
> $IPTABLES -A FORWARD -p tcp --dport ! 0:1023 -j ACCEPT
> $IPTABLES -A FORWARD -p udp --destination-port ! 0:1023 -j ACCEPT

Ugh :-(   What are these rules for ???   Why do you want absolutely anything 
to get in from the outside on high ports !?

> #Except certain stuff (Netmeeting/SSH/dns/identd/etc)
> $IPTABLES -A FORWARD -p udp --destination-port 111 -j ACCEPT
> $IPTABLES -A FORWARD -p tcp --dport 111 -j ACCEPT
> $IPTABLES -A FORWARD -p tcp --dport 113 -j ACCEPT
> $IPTABLES -A FORWARD -p tcp --dport 522 -j ACCEPT
> $IPTABLES -A FORWARD -p tcp --dport 443 -j ACCEPT
> $IPTABLES -A FORWARD -p tcp --dport 22 -j ACCEPT
> $IPTABLES -A FORWARD -p udp --destination-port 53 -j ACCEPT
> $IPTABLES -A FORWARD -p icmp -j ACCEPT

Are you *sure* you want to allow port 111 in ?

The rest I can understand, except for port 522 - what's that ?

> #Input rules for the firewall/server
>
> #Open ports > 1023
> $IPTABLES -A INPUT -p tcp --dport ! 0:1023 -j ACCEPT
> $IPTABLES -A INPUT -p udp --destination-port ! 0:1023 -j ACCEPT

Ugh again.   Makes me think you haven't heard of connection tracking and 
using -m state --state ESTABLISHED,RELATED ?

> #Except certain stuff (Netmeeting/SSH/dns/http/etc)
> $IPTABLES -A INPUT -i $INTIF -p udp --destination-port 137 -j ACCEPT
> $IPTABLES -A INPUT -p udp --destination-port 111 -j ACCEPT
> $IPTABLES -A INPUT -p tcp --dport 111 -j ACCEPT
> $IPTABLES -A INPUT -p tcp --dport 993 -j ACCEPT
> $IPTABLES -A INPUT -p tcp --dport 113 -j ACCEPT
> $IPTABLES -A INPUT -p tcp --dport 389 -j ACCEPT
> $IPTABLES -A INPUT -p tcp --dport 522 -j ACCEPT
> $IPTABLES -A INPUT -p tcp --dport 80 -j ACCEPT
> $IPTABLES -A INPUT -p tcp --dport 443 -j ACCEPT
> $IPTABLES -A INPUT -p tcp --dport 22 -j ACCEPT
> $IPTABLES -A INPUT -p tcp --dport 25 -j ACCEPT
> $IPTABLES -A INPUT -p tcp --dport 110 -j ACCEPT
> $IPTABLES -A INPUT -p udp --destination-port 53 -j ACCEPT
> $IPTABLES -A INPUT -p tcp --dport 143 -j ACCEPT
> $IPTABLES -A INPUT -p udp --destination-port 138 -j ACCEPT
> $IPTABLES -A INPUT -p tcp --dport 139 -j ACCEPT
> $IPTABLES -A INPUT -p icmp -j ACCEPT

Seems like a surprising amount of stuff to allow in to your firewall ?   Are 
yu really running all these services on the firewall box itself ?

> #Stuff to transparent proxy using squid
> $IPTABLES -t nat -A PREROUTING -i $INTIF -p tcp --dport 80 -j \
>         REDIRECT --to-port 3128

Fair enough.

> #Stuff to enable Netmeeting/MSN
> $IPTABLES -t nat -A PREROUTING -i br0 -p tcp --dport 1863 -j \
>         REDIRECT --to-ports 1863
> $IPTABLES -t nat -A PREROUTING -i br0 -p tcp --dport 389 -j \
>         REDIRECT --to-ports 389
> $IPTABLES -t nat -A PREROUTING -i br0 -p tcp --dport 522 -j \
>         REDIRECT --to-ports 522

Ah.   So that explains what some of the port numbers I didn't recognise are 
for.   Fair enough.

> How's that? Is it likely to be reasonably secure?

Not bad except that I *really* don't like the "allow all access to high 
ports" policy, and I'm not convinced that you need all those rules in your 
INPUT chain.

Do you know that iptables is different from ipchains, and packets going 
*through* an iptables firewall traverse only the FORWARD filtering chain, not 
INPUT or OUTPUT as well ?

I also think you should find out about connection tracking, and consider 
whether a rule such as

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

at the top of your ruleset would help you get rid of that "open all high 
ports" policy.

Hope this helps,

Antony.

-- 

If at first you don't succeed, destroy all the evidence that you tried.

