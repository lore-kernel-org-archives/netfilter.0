From: "sean darcy" <seandarcy@hotmail.com>
Subject: Can't load MASQUERADE module!
Date: Sun, 22 Jun 2003 19:11:30 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law8-F37m4esTQJju6D0006e154@hotmail.com>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'm trying to a simple NAT scripton a rh9 rawhide kernel:

/sbin/modprobe iptable_nat

/sbin/iptables -t nat     -F
/sbin/iptables -t nat     -A POSTROUTING -o  eth0        -j MASQUERADE

Which gives the error:

iptables: No chain/target/match by that name

or, if I plug in a -v :
MASQUERADE  all opt -- in * out eth0  0.0.0.0/0  -> 0.0.0.0/0
iptables: No chain/target/match by that name

But this works:

/sbin/iptables -t nat     -A POSTROUTING -o  eth0     -j SNAT --to-source 
10.10.10.1

So I figure I need some kernel module installed. I find these from lsmod:

iptable_mangle          2712   0  (autoclean) (unused)
ipt_state               1048   2  (autoclean)
iptable_filter          2348   1  (autoclean)
iptable_nat            20632   1
ip_conntrack           26120   2  [ipt_state iptable_nat]
ip_tables              14520   6  [iptable_mangle ipt_state iptable_filter 
iptable_nat]

In the modules kernel/net/ipv4/netfilter folder I see ipt_MASQUERADE. So...

/sbin/modprobe ipt_MASQUERADE
/lib/modules/2.4.20-20.1.2013.nptl/kernel/net/ipv4/netfilter/ipchains.o: 
init_module: Device or resource busy
Hint: insmod errors can be caused by incorrect module parameters, including 
invalid IO or IRQ parameters.
      You may find more information in syslog or the output from dmesg
/lib/modules/2.4.20-20.1.2013.nptl/kernel/net/ipv4/netfilter/ipchains.o: 
insmod 
/lib/modules/2.4.20-20.1.2013.nptl/kernel/net/ipv4/netfilter/ipchains.o 
failed
/lib/modules/2.4.20-20.1.2013.nptl/kernel/net/ipv4/netfilter/ipchains.o: 
insmod ipt_MASQUERADE failed

which I assume means that ipchains has to be loaded too, but can't be since 
this is 2.4.x kernel. modules.dep has this:

modules/2.4.20-20.1.2013.nptl/kernel/net/ipv4/netfilter/ipt_MASQUERADE.o:  
/lib/modules/2.4.20-20.1.2013.nptl/kernel/net/ipv4/netfilter/ip_conntrack.o 
\
        
/lib/modules/2.4.20-20.1.2013.nptl/kernel/net/ipv4/netfilter/ipchains.o \
        
/lib/modules/2.4.20-20.1.2013.nptl/kernel/net/ipv4/netfilter/ip_tables.o


Any help would be really appreciated.

sean

_________________________________________________________________
STOP MORE SPAM with the new MSN 8 and get 2 months FREE*  
http://join.msn.com/?page=features/junkmail


