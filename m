From: John <futurasci@gmail.com>
Subject: Re: Strange ip_conntrack values
Date: Sun, 18 Jul 2004 15:16:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <ef83df6b04071806162f449492@mail.gmail.com>
References: <ef83df6b040718033163810a15@mail.gmail.com> <200407181146.30331.Antony@Soft-Solutions.co.uk> <ef83df6b0407180428f43532d@mail.gmail.com> <200407181313.47640.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407181313.47640.Antony@Soft-Solutions.co.uk>
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

> Tcpdump is a good packet sniffer but it does not show the data in a
> user-friendly format.

I've tried to load my tcpdump file but ethereal doesn't recognize it
... is there a way to configure tcpdump fot that ?

my data are like this :

04:30:00.662037 IP deathpolka.nyogtha.org.62238 > mydomaine.net.http:
. ack 3067679957 win 64240
04:30:00.662331 IP sts-12e87.adsl.wanadoo.nl.4164 >
mydomaine.net.http: . ack 3331465322 win 17520
04:30:00.662617 IP deathpolka.nyogtha.org.62238 > mydomaine.net.http:
F 0:0(0) ack 1 win 64240

> I suggest you install ethereal on a machine (does not have to be the firewall)
> and load the tcpdump output file into that.   It will help show you the
> connections in a meaningful format, and you can look for FIN-ACK packets
> which are not replied, multiple FIN-ACKs, etc.
> 
> Also, do you have a snapshot of /proc/net/ip_conntrack from any time during
> 4am-6am?   If not, I suggest you take another tcpdump log (rather than 2
> hours, I suggest something much shorter, say 10 minutes, because the timer
> you are interested in expires after 2 minutes, so you should get enough
> examples of whatever's happening within a 10 minute window), and take a
> snapshot of /proc/net/ip_conntrack at the start and end of the tcpdump log
> (perhaps a couple of times in the middle as well).
> 
> That should give you a traffic stream (of a manageable size) to look at in
> ethereal and compare to the contents of the conntrack table to work out where
> the TIME_WAIT entries are coming from.

ok good idea I'll try this tonight

> By the way, you're not blocking any packets which are important to closing
> connections, are you?   Such as FIN-ACK or RST?   Maybe checking the packet
> counters from "iptables -L -nvx; iptables -L -t nat -nvx" might show
> something interesting?

I'm not enough experienced to try to interpret it . here is a copy if
u can have a look, I've not seen something too strange :

thanks for your help

Chain INPUT (policy DROP 15947 packets, 1548815 bytes)
    pkts      bytes target     prot opt in     out     source         
     destination
    3251   196544 MALFORMED  all  --  *      *       0.0.0.0/0        
   0.0.0.0/0          state INVALID
       0        0 MALFORMED  all  -f  *      *       0.0.0.0/0        
   0.0.0.0/0
       1       40 MALFORMED  tcp  --  *      *       0.0.0.0/0        
   0.0.0.0/0          state NEW tcp flags:0x3F/0x03
       0        0 MALFORMED  tcp  --  *      *       0.0.0.0/0        
   0.0.0.0/0          state NEW tcp flags:0x3F/0x29
  846218 117145998 ACCEPT     udp  --  *      *       0.0.0.0/0       
    0.0.0.0/0          state RELATED,ESTABLISHED
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0        
   0.0.0.0/0          state RELATED tcp flags:!0x16/0x02
     162     7916 ACCEPT     tcp  --  *      *       0.0.0.0/0        
   0.0.0.0/0          state RELATED tcp flags:0x16/0x02
 2156908 103774704 ACCEPT     tcp  --  *      *       0.0.0.0/0       
    0.0.0.0/0          state ESTABLISHED tcp flags:0x16/0x02
423113683 25328463653 ACCEPT     tcp  --  *      *       0.0.0.0/0    
       0.0.0.0/0          state ESTABLISHED tcp flags:!0x16/0x02
   15377  1042496 ACCEPT     all  --  lo     *       127.0.0.1        
   0.0.0.0/0
   78330  4735198 ACCEPT     all  --  lo     *       MYIP        MYIP
    4288   339738 ACCEPT     udp  --  eth0   *       0.0.0.0/0        
   0.0.0.0/0          udp spt:53
   37115  2929800 ACCEPT     udp  --  eth0   *       0.0.0.0/0        
   0.0.0.0/0          udp dpt:53
       6      240 ACCEPT     tcp  --  eth0   *       0.0.0.0/0        
   0.0.0.0/0          tcp spt:53
      36     1528 ACCEPT     tcp  --  eth0   *       0.0.0.0/0        
   0.0.0.0/0          tcp dpt:53
130986256 6441434116 ACCEPT     tcp  --  eth0   *       0.0.0.0/0     
      0.0.0.0/0          state NEW tcp dpt:80 flags:0x16/0x02
  440496 18258310 ACCEPT     tcp  --  eth0   *       0.0.0.0/0        
   0.0.0.0/0          state NEW tcp dpt:80 flags:!0x16/0x02
     123     6156 ACCEPT     tcp  --  eth0   *       0.0.0.0/0        
   0.0.0.0/0          state NEW tcp dpt:22 flags:0x16/0x02
     317    15508 ACCEPT     tcp  --  eth0   *       0.0.0.0/0        
   0.0.0.0/0          state NEW tcp dpt:21 flags:0x16/0x02
    6190   318804 ACCEPT     tcp  --  eth0   *       0.0.0.0/0        
   0.0.0.0/0          state NEW tcp dpt:25 flags:0x16/0x02
    5747   278968 ACCEPT     tcp  --  eth0   *       0.0.0.0/0        
   0.0.0.0/0          state NEW tcp dpt:110 flags:0x16/0x02
    1750    84000 ACCEPT     tcp  --  eth0   *       0.0.0.0/0        
   0.0.0.0/0          state NEW tcp dpt:10000 flags:0x16/0x02
   39411  3711874 ACCEPT     icmp --  eth0   *       0.0.0.0/0        
   0.0.0.0/0
   95124  7419672 REJECT     udp  --  eth0   *       0.0.0.0/0        
   0.0.0.0/0          udp dpt:137 reject-with icmp-port-unreachable
   15552  1469086 LOG        all  --  *      *       0.0.0.0/0        
   0.0.0.0/0          limit: avg 1/sec burst 5 LOG flags 0 level 4
prefix `IPT [DROPED] : '

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source         
     destination

Chain OUTPUT (policy ACCEPT 325971709 packets, 53608243217 bytes)
    pkts      bytes target     prot opt in     out     source         
     destination

Chain MALFORMED (4 references)
    pkts      bytes target     prot opt in     out     source         
     destination
    3196   193448 LOG        all  --  *      *       0.0.0.0/0        
   0.0.0.0/0          limit: avg 1/sec burst 5 LOG flags 0 level 4
prefix `IPT [MALFORMED] : '
    3252   196584 REJECT     all  --  *      *       0.0.0.0/0        
   0.0.0.0/0          reject-with icmp-port-unreachable
Chain PREROUTING (policy ACCEPT 127860795 packets, 6290596491 bytes)
    pkts      bytes target     prot opt in     out     source         
     destination

Chain POSTROUTING (policy ACCEPT 140964 packets, 10420602 bytes)
    pkts      bytes target     prot opt in     out     source         
     destination

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source         
     destination

