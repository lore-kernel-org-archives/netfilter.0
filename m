From: Christer Ekholm <chrekh@bredband.net>
Subject: Re: route outgoing smtp via a specific interface
Date: Mon, 03 May 2004 01:25:04 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <86y8oatnsf.fsf@poke.localdomain>
References: <16533.31553.47397.464571@jane.localdomain>
	<200405030005.33281.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200405030005.33281.Antony@Soft-Solutions.co.uk> (Antony
 Stone's message of "Mon, 3 May 2004 00:05:33 +0100")
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Antony Stone <Antony@Soft-Solutions.co.uk> writes:

> On Sunday 02 May 2004 11:50 pm, Christer Ekholm wrote:
>
>> I have two IP-providers. And the faster one of them blocks smtp. I
>> have been trying to route smtp to the slower while still routing
>> everything else to the faster, without success. Is it possible at all?
>
> IProute2, http://lartc.org

Thankyou for the answer. I have read that, and tried everything I
could think of.  I think my problem is that I need this to work from
the host with the connections to the providers. (localhost).

Here is an attempt to describe what I have tried.

This is my configuration:

/etc/iproute2/rt_tables
#
# reserved values
#
255     local
254     main
253     default
0       unspec
#
# local
#
1       bb
2       bost

Provider one (called bb - very fast)
$ip addr show eth0
2: eth0: <BROADCAST,UP> mtu 1500 qdisc pfifo_fast qlen 1000
    link/ether 00:a0:cc:59:e9:c0 brd ff:ff:ff:ff:ff:ff
    inet 213.113.148.180/26 brd 213.113.148.191 scope global eth0

Provider two (called bost - slow but permits smtp)
$ip addr show eth1
3: eth1: <BROADCAST,UP> mtu 1500 qdisc pfifo_fast qlen 1000
    link/ether 00:10:5a:1e:ab:3e brd ff:ff:ff:ff:ff:ff
    inet 217.215.183.181/24 brd 217.215.183.255 scope global eth1

I also have a local network (not relevant for my problem) (i think)
$ip addr show eth2
4: eth2: <BROADCAST,UP> mtu 1500 qdisc pfifo_fast qlen 1000
    link/ether 00:10:4b:cb:c2:c6 brd ff:ff:ff:ff:ff:ff
    inet 192.168.1.2/24 brd 192.168.1.255 scope global eth2
    

I have dedicated routing tables for each provider

$ip route show table bb
213.113.148.128/26 dev eth0  scope link  src 213.113.148.180 
192.168.1.0/24 dev eth2  scope link 
127.0.0.0/8 dev lo  scope link 
default via 213.113.148.129 dev eth0 

$ip route show table bost
217.215.183.0/24 dev eth1  scope link  src 217.215.183.181 
192.168.1.0/24 dev eth2  scope link 
127.0.0.0/8 dev lo  scope link 
default via 217.215.183.1 dev eth1  src 217.215.183.181 

And table main looks like this.
$ip route show table main
213.113.148.128/26 dev eth0  proto kernel  scope link  src 213.113.148.180 
217.215.183.0/24 dev eth1  proto kernel  scope link  src 217.215.183.181 
192.168.1.0/24 dev eth2  proto kernel  scope link  src 192.168.1.2 
default via 213.113.148.129 dev eth0 

And I have a set of rules also.
$ip rule show
0:      from all lookup local 
101:    from 213.113.148.180 lookup bb 
102:    from 217.215.183.181 lookup bost 
32766:  from all lookup main 
32767:  from all lookup default 


Now this works perfectly, if provider(bb) stops working, i can very
quickly switch provider by changing the defaultroute in table main.

Now over to my not-so-successful experiments. :(

I have tried using the 'mangle' chain to mark smtp-packets, and then
using a rule to route that to the other provider. like this:

iptables -t mangle -A OUTPUT -p tcp --dport 25 -j MARK --set-mark 1
ip rule add prio 21 fwmark 1 table bost

The rules now looking like this:

$ip rule show
0:      from all lookup local 
21:     from all fwmark        1 lookup bost 
101:    from 213.113.148.180 lookup bb 
102:    from 217.215.183.181 lookup bost 
32766:  from all lookup main 
32767:  from all lookup default 

Then when I try it I get "No route to host".
$telnet vishnu.netfilter.org 25
Trying 213.95.27.115...
telnet: Unable to connect to remote host: No route to host

Next thing i tried was to add "nat" to the smtp-rule
$ip rule add prio 21 fwmark 1 table bost nat 217.215.183.181
$ip rule show
0:      from all lookup local 
21:     from all fwmark        1 lookup bost map-to 217.215.183.181 
101:    from 213.113.148.180 lookup bb 
102:    from 217.215.183.181 lookup bost 
32766:  from all lookup main 
32767:  from all lookup default 

Which got me one step further. The packets ar now detectable on
eth1. But still with the wrong source-address

tcpdump -n -i eth1 dst port 25
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on eth1, link-type EN10MB (Ethernet), capture size 68 bytes
00:24:14.311433 IP 213.113.148.180.48829 > 213.95.27.115.25: SWE 3230509301:3230509301(0) win 5840 <mss 1460,sackOK,timestamp 68840162[|tcp]>
00:24:17.304696 IP 213.113.148.180.48829 > 213.95.27.115.25: SWE 3230509301:3230509301(0) win 5840 <mss 1460,sackOK,timestamp 68840462[|tcp]>
00:24:23.304827 IP 213.113.148.180.48829 > 213.95.27.115.25: SWE 3230509301:3230509301(0) win 5840 <mss 1460,sackOK,timestamp 68841062[|tcp]>

My next thought was to use iptables to add a SNAT rule. But SNAT is only
allowed in POSTROUTING, and I think I would need that in OUTPUT

--
 Christer

