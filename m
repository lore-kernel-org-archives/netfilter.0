From: "Marius Mertens" <marius.mertens@gmx.de>
Subject: Re: Packets that should have been DNATted appearing in INPUT table
Date: Sat, 8 Jan 2005 01:43:50 +0100
Message-ID: <003601c4f51b$22c36790$4206a8c0@loki>
References: <000901c4f350$7b3d1370$4206a8c0@loki>	<20050106155557.GA28339@bender.817west.com>
	<008001c4f40f$a6fde380$4206a8c0@loki>
	<41DEEC58.2020504@utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: netfilter@lists.netfilter.org

On Friday, January 07, 2005 9:08 PM,
Michael Gale wrote:

> I believe you are misunderstanding what is happening, your rule:
>
> iptables -A INPUT -i ppp0 -p tcp --dport 4664 -j DROP
>
> Should not affect packets you are forwarding, because those packets
> from outside that are being sent to a internal machine should be
> matched against the FORWARD and not the INPUT.

Yes, this is exactly my problem: As you said, forwarded packets should never 
be matched against rules in INPUT. And thats where the DROP rule above 
enters the game: I just inserted it as a very primitive "test", just to have 
a packet counter for packets matching criteria "-i ppp0 -p tcp --dport 4664" 
in INPUT and expected it to be constantly zero. The only purpose of this 
drop rule is to show me, how many packets (matching the same criteria "-i 
ppp0 -p tcp --dport 4664") have not been DNATed in PREROUTING.

> So some where packets are not matching the PREROUTING rule, either you
> have a rule above that is causing some packets to be accept before
> they reach the PREROUTING rule.

Again, I fully agree: Something made some of the packets not match the DNAT 
rule in PREROUTING, otherwise INPUT would never have seen them. I hope you 
can see anything abnormal with my rules, because I am really stuck with that 
problem.

> You could to a iptables -t nat -vnL and iptables -vnL and provide the
> out put. Plus if you are running test where are you running them from
> ?

Please see the complete output below. The "test" I do is no active testing. 
I just run the application (which communicates with machines on the 
internet, outside my LAN) on the box in my LAN the router should DNAT to and 
monitor the packet counters of the rules I added for diagnostic purpose. I 
am sure you already have noticed, but as my english is not that good, I 
would now like to let the rules talk for themselves ;-)
Just one final comment: I temporarily "tidied up" (yes, I know that this 
setup doesn't make sense for a productive system ;-)) my ruleset in order 
not to flood this list with unnecessary stuff (my actual ruleset is rather 
looooong and the things I removed are irrelevant for the problem, but please 
see for yourself). I fear it will get ugly enough, because of that automatic 
linebreak ;-)

Thanks for your patience,

Marius


Output of iptables -vnL

Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source 
destination
    4   420 ACCEPT     all  --  lo     *       0.0.0.0/0 
0.0.0.0/0
  789  925K DROP       tcp  --  ppp0   *       0.0.0.0/0 
0.0.0.0/0           tcp dpt:4664
    0     0 ACCEPT     tcp  --  ppp0   *       0.0.0.0/0 
0.0.0.0/0           tcp dpt:22
  347 30488 ACCEPT     tcp  --  eth0   *       0.0.0.0/0 
0.0.0.0/0           tcp dpt:22
    3   194 ACCEPT     udp  --  eth0   *       0.0.0.0/0 
0.0.0.0/0           udp dpt:53
    0     0 ACCEPT     tcp  --  eth0   *       0.0.0.0/0 
0.0.0.0/0           tcp dpt:53
    2   656 ACCEPT     udp  --  eth0   *       0.0.0.0/0 
0.0.0.0/0           udp dpt:67
    0     0 ACCEPT     udp  --  eth0   *       0.0.0.0/0 
0.0.0.0/0           udp dpt:123
   10   924 ACCEPT     udp  --  eth0   *       0.0.0.0/0 
0.0.0.0/0           udp dpt:137
   10  2401 ACCEPT     udp  --  eth0   *       0.0.0.0/0 
0.0.0.0/0           udp dpt:138
   25  3098 ACCEPT     tcp  --  eth0   *       0.0.0.0/0 
0.0.0.0/0           tcp dpt:139
   16  2287 ACCEPT     tcp  --  eth0   *       0.0.0.0/0 
0.0.0.0/0           tcp dpt:445
  428 20960 DROP       tcp  --  ppp0   *       0.0.0.0/0 
0.0.0.0/0           tcp flags:0x16/0x02
   63  5744 ACCEPT     all  --  *      *       0.0.0.0/0 
0.0.0.0/0           state RELATED,ESTABLISHED
    1    60 ACCEPT     all  --  eth0   *       0.0.0.0/0 
0.0.0.0/0
  123 17315 DROP       all  --  ppp0   *       0.0.0.0/0 
0.0.0.0/0

Chain FORWARD (policy ACCEPT 292K packets, 138M bytes)
 pkts bytes target     prot opt in     out     source 
destination

Chain OUTPUT (policy ACCEPT 462 packets, 39562 bytes)
 pkts bytes target     prot opt in     out     source 
destination
    4   420 ACCEPT     all  --  *      lo      0.0.0.0/0 
0.0.0.0/0


Output of  iptables -t nat -vnL

Chain PREROUTING (policy ACCEPT 5765 packets, 288K bytes)
 pkts bytes target     prot opt in     out     source 
destination
    0     0 DNAT       tcp  --  ppp0   *       0.0.0.0/0 
0.0.0.0/0           tcp dpt:1070 to:192.168.6.66
    0     0 DNAT       tcp  --  ppp0   *       0.0.0.0/0 
0.0.0.0/0           tcp dpt:6112 to:192.168.6.66
    0     0 DNAT       tcp  --  ppp0   *       0.0.0.0/0 
0.0.0.0/0           tcp dpt:38930 to:192.168.6.66
 2166  116K DNAT       tcp  --  ppp0   *       0.0.0.0/0 
0.0.0.0/0           tcp dpt:4664 to:192.168.6.10
 1505 72854 DNAT       udp  --  ppp0   *       0.0.0.0/0 
0.0.0.0/0           udp dpt:9053 to:192.168.6.10
    0     0 DNAT       tcp  --  ppp0   *       0.0.0.0/0 
0.0.0.0/0           tcp dpt:6881 to:192.168.6.10
    0     0 DNAT       tcp  --  ppp0   *       0.0.0.0/0 
0.0.0.0/0           tcp dpt:4884 to:192.168.6.10
    0     0 DNAT       udp  --  ppp0   *       0.0.0.0/0 
0.0.0.0/0           udp dpt:6886 to:192.168.6.10
    0     0 DNAT       tcp  --  ppp0   *       0.0.0.0/0 
0.0.0.0/0           tcp dpt:4663 to:192.168.6.11
    0     0 DNAT       udp  --  ppp0   *       0.0.0.0/0 
0.0.0.0/0           udp dpt:6052 to:192.168.6.11

Chain POSTROUTING (policy ACCEPT 3709 packets, 193K bytes)
 pkts bytes target     prot opt in     out     source 
destination
 5283  252K MASQUERADE  all  --  *      ppp0    192.168.6.0/24 
0.0.0.0/0

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source 
destination 


