From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Rules methodology vs. network topology: clarifications
Date: Sat, 14 Sep 2002 09:58:19 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020914085822.ZXJV13709.mta07-svc.ntlworld.com@there>
References: <002001c25b8a$e1210fd0$0101a8c0@nebuchadnezza>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002001c25b8a$e1210fd0$0101a8c0@nebuchadnezza>
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
To: iptables-list <netfilter@lists.netfilter.org>

On Saturday 14 September 2002 2:05 am, Tim wrote:

> THE TOPOLOGY: Cisco 806 DSL router with two Ethernet ports one for the
> internet and one for my LAN. The internet port will obviously be configured
> with a static public ip address. The LAN Ethernet port will have a private
> ip address=192.168.2.2. Network Address Translations will be executed at
> the router.

Please clarify that last point - "NAT will be executed at the router".   None 
of the further detail you have given says what actual NAT is being performed, 
and I think it's important that we know what this is.

> On the firewall I have three NICs, one that connects from the router/LAN
> Ethernet port, eth0=192.168.2.1; one for the DMZ, eth1=172.16.16.1; and one
> for my internal network, eth2=192.168.1.11.

Sounds like a good arrangement.

> All chain policies are DROP !!!

Including OUTPUT ???   You might want to be careful about that one...

> CLARIFICATIONS: If my understandings are correct, ( please, suggestions are
> welcomed ), I should be writing rules on the PREROUTING chain that will
> allow desirable incoming connections/traffic from the Internet, translated
> from the router to eth0=192.168.2.1, ( the first NIC on the firewall from
> the router [192.168.2.0/24 subnet] ), to be allowed to desired LAN/DMZ
> server ports, i.e., mail, webserver, ftp, ssh...etc. Is this correct so far?

Well, it's certainly one way of doing it, but I thought you said you were 
going to be doing NAT on the DSL router, so why does it now look like you're 
doing it on the firewall ?   It'll work, yes, but it's just not necessarily 
what I thought you said you were going to do.

> Example: iptables -t nat -A PREROUTING -p tcp -d 192.168.2.0/24 --dport 80
> -j DNAT --to-destination 172.16.16.5

How many addresses do you have on the 192.168.2.0/24 network ???   I thought 
there were only two machines - the DSL router on .2 and the firewall on .1

I would expect this rule to read:
iptables -A PREROUTING -t nat -d 192.168.2.1 -p tcp --dport 80 -j DNAT --to 
172.16.16.5
or even
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j DNAT --to 
172.16.16.5

> On the FORWARD chain, I should be writing rules to allow
> connections/traffic to be routed to its final ip address/port destination
> and the ability to respond to the originating connection.

Correct.

> Example: iptables -A FORWARD -p tcp  --dport 80 -d 172.16.16.5 -j ACCEPT
>                iptables -A FORWARD -p tcp  --dport 25 -d 192.168.1.3 -j
> ACCEPT iptables -A FORWARD -p tcp  --dport 110 -d 192.168.1.3 -j ACCEPT
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

I would recommend you put that last rule first in the chain, because it will 
match the vast majority of packets, therefore you want it to match without 
the overhead of having checked three other rules first.

> On the POSTROUTING chain, the rules are to allow all outgoing connections
> to the internet and allow all related,established connections back in

Correct.

> Example: iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to-source
> $INTERNETIP?
>
> Being that the router is the one that is doing all the translations, the
> POSTROUTING rule is the one where I'm hesitating on. Should I be doing SNAT
> to the actual Internet ip or should I be doing SNAT to the 192.168.2.2
> Ethernet port on the router and then allowing the router to translate out
> to the internet?  ..... hence my need for clarification.

Since you did the initial PREROUTING NAT from address 192.168.2.2, that is 
the address you should do your POSTROUTING NAT to.

Think of it this way: when a reply packet comes back from the Internet to 
your network, what would the DSL router try to do with it if it had (a) the 
external Internet IP, or (b) 192.168.2.2, as the destination address ?

> As mentioned above, I have seen quite a few examples of rules for different
> topologies, and either I'm confused or the people that wrote then don't
> have all their oars in the water. CASE: The policies for certain chains are
> to DROP packets, yet they write rules to DROP packets. I was under the
> impression that if you set a DROP policy for any of the chains, all
> traffic/packets coming to that chain will be DROP (not allowed to traverse)
> unless a rules is explicitly written ACCEPT the specified traffic or
> otherwise. Did I miss something or are these rules written by these people
> null and void.

Depends what order the rules are written in.   There is every possibility 
that the people who wrote the rules you have seen did not entirely know what 
they were doing, and have written some pointless rules.   However, a ruleset 
such as this performs a useful function:

iptables -P FORWARD DROP
iptables -A FORWARD -s 192.168.1.100 -j DROP
iptables -A FORWARD -s 192.168.1.0/24 -j ACCEPT

It allows all machines in the 192.168.1.0/24 network, except the machine 
192.168.100, to pass packets through the firewall, and stops any other source 
address from sending packets through.

Antony.

-- 

Abandon hope, all ye who enter here.
You'll feel much better about things once you do.

