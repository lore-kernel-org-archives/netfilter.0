From: "james.Q.L" <shijialeeee@yahoo.ca>
Subject: Re: problem reach the internal.
Date: Sun, 1 Dec 2002 17:35:24 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20021201223524.57072.qmail@web14503.mail.yahoo.com>
References: <200211301027.23099.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200211301027.23099.netfilter@newkirk.us>
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
To: netfilter@newkirk.us
Cc: netfilter@lists.netfilter.org


> > [root@cozy166 Qiang]#iptables -L -n --line-numbers
> >
> > Chain FORWARD (policy DROP)
> > num  target     prot opt source               destination
> > 1    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0          state
> > RELATED,ESTABLISHED 2    ACCEPT     tcp  --  0.0.0.0/0           
> > 192.168.0.3        tcp dpt:80 3    ACCEPT     all  --  0.0.0.0/0           
> > 0.0.0.0/0
> > 4    LOG        all  --  0.0.0.0/0            0.0.0.0/0          LOG flags
> > 0 level 4
> >
> > the line num 3 and num 2 are swapped.
> >
> > i tried reset the counter of ruleset and make connection test to it. i
> > found something that i don't understand. when i am testing from an internal
> > machine to INET_IP:8888 the ruleset for filter table is (counter has reset
> > to zero)
> >
> > [root@cozy166 Qiang]#iptables -L -v -n --line-numbers
> >
> > Chain FORWARD (policy DROP 5 packets, 224 bytes)
> > num   pkts bytes target     prot opt in     out     source       destination 
> > 1    11806   15M ACCEPT     all  --  eth1   eth0    0.0.0.0/0  
> >          0.0.0.0/0          state RELATED,ESTABLISHED
> > 2        3   144 ACCEPT     tcp  --  *      *       0.0.0.0/0           
> > 	192.168.0.3        tcp dpt:80
> > 3     8000  341K ACCEPT     all  --  eth0   eth1    0.0.0.0/0           
> > 	0.0.0.0/0 
> > 4        5   224 LOG        all  --  *      *       0.0.0.0/0    
> >        0.0.0.0/0          LOG flags 0 level 4
> >
> > Chain OUTPUT (policy ACCEPT 13143 packets, 996K bytes)
> > num   pkts bytes target     prot opt in     out     source              
> > destination
> >
> > Chain drop-and-log-it (0 references)
> > num   pkts bytes target     prot opt in     out     source              
> > destination 
> > 1        0     0 DROP       all  --  *      *       0.0.0.0/0  
> >          0.0.0.0/0
> >
> > ####
> > noticed that the Forward chain has (policy DROP 5 packets, 224 bytes) and
> > the line num 2 has 3 counter and 144bytes hits. it's gotta be a problem
> > here.

haven't nailed the problem yet.. can i ask further help please ? 

#eth0 is internal IF, eth1 external IF.

#dmesg | tail

FWD drop IN=eth0 OUT=eth0 SRC=192.168.0.3 DST=192.168.0.12 LEN=64 TOS=0x00 PREC=0x00 TTL=127
ID=22869 DF PROTO=TCP SPT=80 DPT=1026 WINDOW=17520 RES=0x00 ACK SYN URGP=0 

so it's the FWD chain problem?

# request INET_IP:8888 from internal machine 192.168.0.12. only one type of msg greped out.
#grep 192.168.0.12 /proc/net/ip_conntrack

tcp      6 59 SYN_RECV src=192.168.0.12 dst=65.48.28.33 sport=1109 dport=8888 src=192.168.0.3
dst=192.168.0.1 sport=80 dport=1109 use=1 

this seeems to be SYN/ACK in return. but no established further on..

here is more verbose iptables dump.. 
from iptables -L -v -n

Chain FORWARD (policy DROP 130 packets, 7822 bytes)
 pkts bytes target     prot opt in     out     source               destination         
1292K 1462M ACCEPT     all  --  eth1   eth0    0.0.0.0/0            0.0.0.0/0          state
RELATED,ESTABLISHED 
   55  3204 ACCEPT     tcp  --  *      *       0.0.0.0/0            192.168.0.3        tcp dpt:80 
18402 1286K ACCEPT     all  --  eth0   eth1    0.0.0.0/0            0.0.0.0/0          
   53  3296 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0          LOG flags 0
level 4 prefix `FWD DROP ' 

from iptables -L -v -n -t nat

Chain PREROUTING (policy ACCEPT 51091 packets, 3818K bytes)
 pkts bytes target     prot opt in     out     source               destination         
    7   396 DNAT       tcp  --  *      *       0.0.0.0/0            65.48.28.33        tcp
dpt:8888 to:192.168.0.3:80 

Chain POSTROUTING (policy ACCEPT 276 packets, 46588 bytes)
 pkts bytes target     prot opt in     out     source               destination         
   10   576 SNAT       tcp  --  *      *       192.168.0.0/24       192.168.0.3        tcp dpt:80
to:192.168.0.1 
 5715  315K MASQUERADE  all  --  *      eth1    0.0.0.0/0            0.0.0.0/0      


many thanks,

=====
/James.Q.L

______________________________________________________________________ 
Post your free ad now! http://personals.yahoo.ca

