From: Zoltan Nagy <kirk@elte.hu>
Subject: kernel freeze issue
Date: Wed, 02 Nov 2005 21:45:45 +0100
Message-ID: <43692579.8000807@elte.hu>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org


summary of current configuration:

           +----- ext_if(eth1) 3c905TX ------ 34Mbit uplink
           |
           |
           |
         +------------+
         |   filter   +
         +------------+
           |  |  |
           |  |  +--- lan_if(eth5) rtl8169 - vlan1 ------ users/servers
           |  |
           |  +------ adm_if(eth0) 3c905TX - vlan2 ------ log server
           |
           +--------- core_if(eth3) 3c940
                      +inp_if(eth3.3)      - vlan 3  +
                      +out_if(eth3.4)      - vlan 4  +
                                                     |
                                                     |(cross-link cable)
                                                     |
               +------ core_if(eth0) 3c940 ----------+
               |
         +-----------+
         |    foo    +
         +-----------+
               |
               +------ adm_if(eth1) rtl8139 - vlan2


filter:
	arp proxy based
	route		-	policy routing - between local-domain1(C),local-domain2(2*C),uplink,foo(on failover this skipped)
	packet filter(netfilter)
				-	traffic accounting(ipt_account),flood/portscan protection
				-	packet filter
				-	TTL inc
				-	ipset's for extra port configurations
				-	ipt_condition(failover control)
				-	we have 2 domain's so it sends redirects for the hosts spoofing that it's our router(ipt_IPALTER)
foo:
	not configured because of the freezes...

problem:
	filter is freezes in random intervalls(30m - 6day) - on-board watchdog(i8xx) reboot's the system
	i've tryed many things, remove my custom patches...but it won't help ;)
	in the kernel trace i've last seen(i've a blurry image)
	the kernel remove some packages from the boomerang interface
	ip_rcv_finish, etc..
	ipt_do_table is the last in the call trace...

notice:
	crash happens when many of our beloved users use p2p software(this is also a tip)

next try:
	place a cisco to monitor ext_if and lan_if with tcpdump, open another file every 10m
	and when filter freezes i maybe have the packet that caused the freeze
	(small chance - but possible ;)

my tips was:
	ipt_condition	-	in pom it's <2.6.0 but i've read the code, and i think it's safe to use
	ipt_IPALTER	-	w/o it also freezes, so this isn't the problem
	ipset		-	i've a small patch on it...to enable inverted portmaps, i think it's safe
					i use portmap,ipmap,macipmap from it
	NAPI			-	yesterday i disabled it...since then no freezes
	ipt_TCPMSS	-	it wrote some warnings in dmesg, about packet size<64 - i've moved another rule before it
						 -p tcp --tcp-option ! 2    -j DROP
	boomerang		-	maybe the driver is a bit broken
	pom_patches	-	TTL set connmark CONNMARK account condition limit
	SMP			-	maybe, i haven't disabled it yet

today's surprise:
	ip l s eth0 promisc on	==> freeze, without any trace ;)

versions:
Linux filter 2.6.14-alt #5 SMP Tue Nov 8 16:40:49 CET 2005 i686 GNU/Linux
iptables-1.3.4
pom-20051031
ipset-2.2.6

some info about the system can be downloaded from
http://152.66.235.5/info-filter.tgz
this is my worst nightmare, any suggestions? ;)


