From: mike-netfilter@tiedyenetworks.com
Subject: BUG(?) - SNAT causes networking to stop.
Date: Thu, 31 Oct 2002 12:04:31 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210311202110.21650-100000@robotron.office.tiedyenetworks.com>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Howdy folks,

	I've got a router I am experamenting with SNAT on.  I've hit a 
situation where local ping processes are forced to stop transmitting (get 
caught in a loop on sendmsg() ) until the box receives packets from some 
external source (ping it from another machine on the network for example), 
and then it wakes right up without missing a beat. Experamentally, I've 
had ping waiting for several minutes this way. Typically it's able to fire 
off say 10 packets (and get replies) before it starts hanging. Using 
larger packets - say, 3000 bytes, results in only being able to fire off 3 
before stopping. I'm running tcpdump to verify that it's not emitting 
packets and strace to verify it's stuck looping on sendmsg(). Very weird.

	I think it's netfilter related because I can reset netfilter to 
zero rules (allow everything) and the problem goes away. Then I can run my 
netfilter script and the problem returns. The rule set I'm working 
with provides snat for the 8 /24 networks that will connect to this 
router, and provides each network with it's own seperate 'outgoing 
ip address' (for accounting and management conveience). Here's my nat 
table after my script sets it up:


Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
   86  4936 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0          

Chain POSTROUTING (policy ACCEPT 39 packets, 28092 bytes)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 SNAT       all  --  *      eth0    192.168.1.0/24       0.0.0.0/0          to:a.b.c.1 
    0     0 SNAT       all  --  *      eth0    192.168.2.0/24       0.0.0.0/0          to:a.b.c.2 
    0     0 SNAT       all  --  *      eth0    192.168.3.0/24       0.0.0.0/0          to:a.b.c.3 
    0     0 SNAT       all  --  *      eth0    192.168.4.0/24       0.0.0.0/0          to:a.b.c.4 
    1    84 SNAT       all  --  *      eth0    192.168.5.0/24       0.0.0.0/0          to:a.b.c.5 
    0     0 SNAT       all  --  *      eth0    192.168.6.0/24       0.0.0.0/0          to:a.b.c.6 
    0     0 SNAT       all  --  *      eth0    192.168.7.0/24       0.0.0.0/0          to:a.b.c.7 
    0     0 SNAT       all  --  *      eth0    192.168.8.0/24       0.0.0.0/0          to:a.b.c.8 

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination         
   39 28092 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0          

Chain logndrop (0 references)
 pkts bytes target     prot opt in     out     source               destination         
    0     0 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0          LOG flags 0 level 4 
    0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0          
	

	I'm running 2.4.19 with iptables 1.2.7a. If it helps, I'm also
running with these modules loaded:

Module                  Size  Used by
ipt_state                576   1 
ipt_LOG                 3376   2 
iptable_nat            13936   1 
ip_conntrack           13872   2  [ipt_state iptable_nat]
tulip                  37360   4 
e100                   64560   4 
pcnet32                13280   1 
mii                     1088   0  [pcnet32]
iptable_filter          1680   1  (autoclean)
ip_tables              10880   6  [ipt_state ipt_LOG iptable_nat iptable_filter]


	Can anyone suggest the next thing to look at?

	Thanks.
 

-- 

       TieDye Networks - peace, love, and fast downloads!

		Zoinks, scoob! Haunted flying saucers! 



