From: jose nuno neto <jose.neto@liber4e.com>
Subject: RE: FTP SERVER ACCESS
Date: Sun, 26 Oct 2003 13:07:36 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067173655.3024.2.camel@janis>
References: <LFEHKEBEBHAFGJBMNKAOGEIPCDAA.markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <LFEHKEBEBHAFGJBMNKAOGEIPCDAA.markee@bandwidthco.com>
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
To: markee@bandwidthco.com
Cc: netfilter@lists.netfilter.org

Hi,

this is the output of lsmod

ipt_mark                1216   1  (autoclean)
ipt_MARK                1632  13  (autoclean)
ipt_TOS                 1856   6  (autoclean)
iptable_mangle          3040   1
ipt_multiport           1440   7
ip_conntrack_ftp        5088   0  (unused)
ip_conntrack_irc        4256   0  (unused)
ipt_REJECT              4000   2
ipt_LOG                 4384  10
ipt_limit               1728   2
ipt_state               1344  20
ip_conntrack           26100   3  [ip_conntrack_ftp ip_conntrack_irc
ipt_state]
ipt_unclean             7872   2
iptable_filter          2528   1
ip_tables              13760  11  [ipt_mark ipt_MARK ipt_TOS
iptable_mangle ipt_multiport ipt_REJECT ipt_LOG ipt_limit ipt_state
ipt_unclean iptable_filter]


it shoes unused for ip_conntrack_ftp is this good?


On Sat, 2003-10-25 at 21:59, Mark E. Donaldson wrote:
> FTP is one of the most difficult protocols to get through a firewall.  To
> begin with, are you using the netfilter ftp connection tracking module?
> $MODPROBE ip_conntrack_ftp
> 
> Start with this.  If you need more help let me know.
> 
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Jose Nuno Neto
> Sent: Friday, October 24, 2003 7:15 AM
> To: netfilter@lists.netfilter.org
> Subject: FTP SERVER ACCESS
> 
> 
> Hi,
> 
> I have a friewall script from
> http://www.rfxnetworks.com/apf.php
> 
> I've followed intructions and have access to everythin i wnat except for
> FTP Server
> Can anyone point what ports/action must i do?
> 
> thanx
> 
> -------------------------------------------
> 
> iptables -L
> 
> Chain INPUT (policy ACCEPT)
> target     prot opt source               destination
> IN_UNCLEAN  all  --  anywhere             anywhere           unclean
> ACCEPT     all  --  anywhere             anywhere
> TELNET_LOG  tcp  --  anywhere             anywhere           tcp dpt:telnet
> state NEW
> SSH_LOG    tcp  --  anywhere             anywhere           tcp dpt:ssh
> state NEW
> DROP       all  --  1.0.0.0/8            anywhere
> DROP       all  --  2.0.0.0/8            anywhere
> DROP       all  --  5.0.0.0/8            anywhere
> DROP       all  --  7.0.0.0/8            anywhere
> DROP       all  --  23.0.0.0/8           anywhere
> DROP       all  --  27.0.0.0/8           anywhere
> DROP       all  --  31.0.0.0/8           anywhere
> DROP       all  --  36.0.0.0/8           anywhere
> DROP       all  --  37.0.0.0/8           anywhere
> DROP       all  --  39.0.0.0/8           anywhere
> DROP       all  --  41.0.0.0/8           anywhere
> DROP       all  --  42.0.0.0/8           anywhere
> DROP       all  --  58.0.0.0/8           anywhere
> DROP       all  --  59.0.0.0/8           anywhere
> DROP       all  --  60.0.0.0/8           anywhere
> DROP       all  --  70.0.0.0/8           anywhere
> DROP       all  --  71.0.0.0/8           anywhere
> DROP       all  --  72.0.0.0/8           anywhere
> DROP       all  --  73.0.0.0/8           anywhere
> DROP       all  --  74.0.0.0/8           anywhere
> DROP       all  --  75.0.0.0/8           anywhere
> DROP       all  --  76.0.0.0/8           anywhere
> DROP       all  --  77.0.0.0/8           anywhere
> DROP       all  --  78.0.0.0/8           anywhere
> DROP       all  --  78.0.0.0/8           anywhere
> DROP       all  --  79.0.0.0/8           anywhere
> DROP       all  --  83.0.0.0/8           anywhere
> DROP       all  --  84.0.0.0/8           anywhere
> DROP       all  --  85.0.0.0/8           anywhere
> DROP       all  --  86.0.0.0/8           anywhere
> DROP       all  --  87.0.0.0/8           anywhere
> DROP       all  --  88.0.0.0/8           anywhere
> DROP       all  --  89.0.0.0/8           anywhere
> DROP       all  --  90.0.0.0/8           anywhere
> DROP       all  --  91.0.0.0/8           anywhere
> DROP       all  --  92.0.0.0/8           anywhere
> DROP       all  --  93.0.0.0/8           anywhere
> DROP       all  --  94.0.0.0/8           anywhere
> DROP       all  --  95.0.0.0/8           anywhere
> DROP       all  --  96.0.0.0/8           anywhere
> DROP       all  --  97.0.0.0/8           anywhere
> DROP       all  --  98.0.0.0/8           anywhere
> DROP       all  --  99.0.0.0/8           anywhere
> DROP       all  --  100.0.0.0/8          anywhere
> DROP       all  --  101.0.0.0/8          anywhere
> DROP       all  --  102.0.0.0/8          anywhere
> DROP       all  --  103.0.0.0/8          anywhere
> DROP       all  --  104.0.0.0/8          anywhere
> DROP       all  --  105.0.0.0/8          anywhere
> DROP       all  --  106.0.0.0/8          anywhere
> DROP       all  --  107.0.0.0/8          anywhere
> DROP       all  --  108.0.0.0/8          anywhere
> DROP       all  --  109.0.0.0/8          anywhere
> DROP       all  --  110.0.0.0/8          anywhere
> DROP       all  --  111.0.0.0/8          anywhere
> DROP       all  --  112.0.0.0/8          anywhere
> DROP       all  --  113.0.0.0/8          anywhere
> DROP       all  --  114.0.0.0/8          anywhere
> DROP       all  --  115.0.0.0/8          anywhere
> DROP       all  --  116.0.0.0/8          anywhere
> DROP       all  --  117.0.0.0/8          anywhere
> DROP       all  --  118.0.0.0/8          anywhere
> DROP       all  --  119.0.0.0/8          anywhere
> DROP       all  --  120.0.0.0/8          anywhere
> DROP       all  --  121.0.0.0/8          anywhere
> DROP       all  --  122.0.0.0/8          anywhere
> DROP       all  --  123.0.0.0/8          anywhere
> DROP       all  --  124.0.0.0/8          anywhere
> DROP       all  --  124.0.0.0/8          anywhere
> DROP       all  --  125.0.0.0/8          anywhere
> DROP       all  --  126.0.0.0/8          anywhere
> DROP       all  --  128.66.0.0/16        anywhere
> DROP       all  --  172.16.0.0/12        anywhere
> DROP       all  --  197.0.0.0/8          anywhere
> DROP       all  --  221.0.0.0/8          anywhere
> DROP       all  --  222.0.0.0/8          anywhere
> DROP       all  --  223.0.0.0/8          anywhere
> DROP       all  --  240.0.0.0/4          anywhere
> DROP       tcp  --  anywhere             anywhere           multiport dports
> smux,snmp,31337,33270,1234,6711,16660,60001,12345,12346,ingreslock,27665,274
> 44,31335
> DROP       udp  --  anywhere             anywhere           multiport dports
> smux,snmp,31337,33270,1234,6711,16660,60001,12345,12346,ingreslock,27665,274
> 44,31335
> DROP       all  --  BASE-ADDRESS.MCAST.NET/8  anywhere
> DROP       all  --  anywhere             BASE-ADDRESS.MCAST.NET/8
> LD         all  --  255.255.255.255      anywhere
> LD         all  --  anywhere             0.0.0.0
> DROP       tcp  --  anywhere             anywhere           tcp
> flags:FIN,SYN,RST,PSH,ACK,URG/NONE
> DROP       tcp  --  anywhere             anywhere           tcp
> flags:FIN,SYN/FIN,SYN
> DROP       tcp  --  anywhere             anywhere           tcp
> flags:SYN,RST/SYN,RST
> DROP       tcp  --  anywhere             anywhere           tcp
> flags:FIN,RST/FIN,RST
> DROP       tcp  --  anywhere             anywhere           tcp
> flags:FIN,ACK/FIN
> DROP       tcp  --  anywhere             anywhere           tcp
> flags:PSH,ACK/PSH
> DROP       tcp  --  anywhere             anywhere           tcp
> flags:ACK,URG/URG
> DROP       tcp  --  anywhere             anywhere           tcp
> flags:FIN,SYN,RST,PSH,ACK,URG/FIN,PSH,URG
> DROP       tcp  --  anywhere             anywhere           tcp
> flags:FIN,SYN,RST,PSH,ACK,URG/FIN,SYN,RST,ACK,URG
> DROP       tcp  --  anywhere             anywhere           tcp
> flags:FIN,SYN,RST,PSH,ACK,URG/FIN,SYN,RST,PSH,ACK,URG
> DROP       tcp  --  anywhere             anywhere           tcp
> flags:FIN,SYN,RST,PSH,ACK,URG/FIN
> DROP       all  --  anywhere             anywhere           state INVALID
> DROP       tcp  --  anywhere             anywhere           tcp option=64
> DROP       tcp  --  anywhere             anywhere           tcp option=128
> FUDP       udp  -f  anywhere             anywhere
> PZ         udp  --  anywhere             anywhere           udp dpt:0
> PZ         tcp  --  anywhere             anywhere           tcp dpt:0
> REJECT     tcp  --  anywhere             anywhere           tcp dpt:auth
> reject-with icmp-port-unreachable
> REJECT     udp  --  anywhere             anywhere           udp dpt:auth
> reject-with icmp-port-unreachable
> DROP       udp  --  anywhere             anywhere           multiport dports
> netbios-ns,netbios-dgm
> DROP       udp  --  anywhere             255.255.255.255
> ACCEPT     udp  --  anywhere             anywhere           udp spt:domain
> dpts:1023:65535
> ACCEPT     tcp  --  anywhere             anywhere           tcp
> dpts:1023:65535 state RELATED,ESTABLISHED
> ACCEPT     udp  --  anywhere             anywhere           udp
> dpts:1023:65535 state RELATED,ESTABLISHED
> ACCEPT     tcp  --  anywhere             anywhere           tcp spt:ssh
> dpts:login:65535 state RELATED,ESTABLISHED
> ACCEPT     udp  --  anywhere             anywhere           udp dpt:ssh
> state ESTABLISHED
> ACCEPT     tcp  --  anywhere             anywhere           tcp
> spts:1023:65535 dpt:ftp state RELATED,ESTABLISHED
> ACCEPT     tcp  --  anywhere             anywhere           multiport dports
> ftp,ftp-data state RELATED,ESTABLISHED
> ACCEPT     udp  --  anywhere             anywhere           multiport dports
> ftp,ftp-data state RELATED,ESTABLISHED
> ACCEPT     tcp  --  anywhere             xxx.SERVER.IP.xxx    tcp
> dpt:ftp-data
> ACCEPT     tcp  --  anywhere             xxx.SERVER.IP.xxx     tcp dpt:ftp
> ACCEPT     tcp  --  anywhere             xxx.SERVER.IP.xxx     tcp dpt:ssh
> ACCEPT     tcp  --  anywhere             xxx.SERVER.IP.xxx     tcp dpt:smtp
> ACCEPT     tcp  --  anywhere             xxx.SERVER.IP.xxx     tcp
> dpt:domain
> ACCEPT     tcp  --  anywhere             xxx.SERVER.IP.xxx     tcp dpt:http
> ACCEPT     tcp  --  anywhere             xxx.SERVER.IP.xxx     tcp dpt:https
> ACCEPT     tcp  --  anywhere             xxx.SERVER.IP.xxx     tcp dpt:pop3
> ACCEPT     tcp  --  anywhere             xxx.SERVER.IP.xxx     tcp dpt:imap
> ACCEPT     tcp  --  anywhere             xxx.SERVER.IP.xxx     tcp dpt:19638
> ACCEPT     udp  --  anywhere             xxx.SERVER.IP.xxx     udp
> dpt:ftp-data
> ACCEPT     udp  --  anywhere             xxx.SERVER.IP.xxx     udp
> dpt:domain
> ACCEPT     icmp --  anywhere             anywhere           icmp
> destination-unreachable
> ACCEPT     icmp --  anywhere             anywhere           icmp redirect
> ACCEPT     icmp --  anywhere             anywhere           icmp
> time-exceeded
> ACCEPT     icmp --  anywhere             anywhere           icmp echo-reply
> ACCEPT     icmp --  anywhere             anywhere           icmp type 30
> ACCEPT     icmp --  anywhere             anywhere           icmp
> echo-request
> DROP       icmp --  anywhere             anywhere
> ACCEPT     udp  --  anywhere             anywhere           udp
> dpts:traceroute:33523
> ACCEPT     tcp  --  anywhere             xxx.SERVER.IP.xxx     tcp
> dpt:ftp-data
> ACCEPT     tcp  --  anywhere             xxx.SERVER.IP.xxx     tcp dpt:ftp
> ACCEPT     tcp  --  anywhere             xxx.SERVER.IP.xxx     tcp dpt:ssh
> ACCEPT     tcp  --  anywhere             xxx.SERVER.IP.xxx     tcp dpt:smtp
> ACCEPT     tcp  --  anywhere             xxx.SERVER.IP.xxx     tcp
> dpt:domain
> ACCEPT     tcp  --  anywhere             xxx.SERVER.IP.xxx     tcp dpt:http
> ACCEPT     tcp  --  anywhere             xxx.SERVER.IP.xxx     tcp dpt:https
> ACCEPT     tcp  --  anywhere             xxx.SERVER.IP.xxx     tcp dpt:pop3
> ACCEPT     tcp  --  anywhere             xxx.SERVER.IP.xxx     tcp dpt:imap
> ACCEPT     tcp  --  anywhere             xxx.SERVER.IP.xxx     tcp dpt:19638
> ACCEPT     udp  --  anywhere             xxx.SERVER.IP.xxx     udp
> dpt:ftp-data
> ACCEPT     udp  --  anywhere             xxx.SERVER.IP.xxx     udp
> dpt:domain
> DROP       tcp  --  anywhere             anywhere           tcp
> flags:!SYN,RST,ACK/SYN state NEW
> UDP_POL    udp  --  anywhere             anywhere
> TCP_POL    tcp  --  anywhere             anywhere
> DROP       all  --  anywhere             anywhere
> 
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination
> 
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
> OUT_UNCLEAN  all  --  anywhere             anywhere           unclean
> ACCEPT     all  --  anywhere             anywhere
> DROP       all  --  BASE-ADDRESS.MCAST.NET/8  anywhere
> DROP       all  --  anywhere             BASE-ADDRESS.MCAST.NET/8
> LD         all  --  255.255.255.255      anywhere
> LD         all  --  anywhere             0.0.0.0
> DROP       tcp  --  anywhere             anywhere           tcp
> flags:FIN,SYN,RST,PSH,ACK,URG/NONE
> DROP       tcp  --  anywhere             anywhere           tcp
> flags:FIN,SYN/FIN,SYN
> DROP       tcp  --  anywhere             anywhere           tcp
> flags:SYN,RST/SYN,RST
> DROP       tcp  --  anywhere             anywhere           tcp
> flags:FIN,RST/FIN,RST
> DROP       tcp  --  anywhere             anywhere           tcp
> flags:FIN,ACK/FIN
> DROP       tcp  --  anywhere             anywhere           tcp
> flags:PSH,ACK/PSH
> DROP       tcp  --  anywhere             anywhere           tcp
> flags:ACK,URG/URG
> FUDP       udp  -f  anywhere             anywhere
> PZ         udp  --  anywhere             anywhere           udp dpt:0
> PZ         tcp  --  anywhere             anywhere           tcp dpt:0
> ACCEPT     udp  --  anywhere             anywhere           udp
> spts:1023:65535 dpt:domain
> ACCEPT     tcp  --  anywhere             anywhere           tcp
> dpts:1023:65535 state RELATED,ESTABLISHED
> ACCEPT     udp  --  anywhere             anywhere           udp
> dpts:1023:65535 state RELATED,ESTABLISHED
> ACCEPT     tcp  --  anywhere             anywhere           tcp spt:ftp
> dpts:1023:65535 state RELATED,ESTABLISHED
> ACCEPT     tcp  --  anywhere             anywhere           multiport dports
> ftp,ftp-data state RELATED,ESTABLISHED
> ACCEPT     udp  --  anywhere             anywhere           multiport dports
> ftp,ftp-data state RELATED,ESTABLISHED
> ACCEPT     tcp  --  xxx.SERVER.IP.xxx       anywhere           tcp
> dpt:ftp-data
> ACCEPT     tcp  --  xxx.SERVER.IP.xxx       anywhere           tcp dpt:ftp
> ACCEPT     tcp  --  xxx.SERVER.IP.xxx       anywhere           tcp dpt:smtp
> ACCEPT     tcp  --  xxx.SERVER.IP.xxx       anywhere           tcp dpt:http
> ACCEPT     tcp  --  xxx.SERVER.IP.xxx       anywhere           tcp dpt:https
> ACCEPT     tcp  --  xxx.SERVER.IP.xxx       anywhere           tcp
> dpts:1000:40000
> ACCEPT     udp  --  xxx.SERVER.IP.xxx       anywhere           udp
> dpt:ftp-data
> ACCEPT     udp  --  xxx.SERVER.IP.xxx       anywhere           udp dpt:ftp
> ACCEPT     udp  --  xxx.SERVER.IP.xxx       anywhere           udp
> dpt:domain
> ACCEPT     tcp  --  xxx.SERVER.IP.xxx       anywhere           tcp
> dpt:ftp-data
> ACCEPT     tcp  --  xxx.SERVER.IP.xxx       anywhere           tcp dpt:ftp
> ACCEPT     tcp  --  xxx.SERVER.IP.xxx       anywhere           tcp dpt:smtp
> ACCEPT     tcp  --  xxx.SERVER.IP.xxx       anywhere           tcp dpt:http
> ACCEPT     tcp  --  xxx.SERVER.IP.xxx       anywhere           tcp dpt:https
> ACCEPT     tcp  --  xxx.SERVER.IP.xxx       anywhere           tcp
> dpts:1000:40000
> ACCEPT     udp  --  xxx.SERVER.IP.xxx       anywhere           udp
> dpt:ftp-data
> ACCEPT     udp  --  xxx.SERVER.IP.xxx       anywhere           udp dpt:ftp
> ACCEPT     udp  --  xxx.SERVER.IP.xxx       anywhere           udp
> dpt:domain
> DROP       tcp  --  anywhere             anywhere           tcp
> flags:!SYN,RST,ACK/SYN state NEW
> DROP       tcp  --  anywhere             anywhere           tcp
> flags:!SYN,RST,ACK/SYN state NEW
> ACCEPT     icmp --  anywhere             anywhere
> DROP       all  --  anywhere             anywhere
> 
> Chain FUDP (2 references)
> target     prot opt source               destination
> LOG        all  --  anywhere             anywhere           LOG level
> warning prefix `** UDP Frag **'
> DROP       all  --  anywhere             anywhere
> 
> Chain IN_UNCLEAN (1 references)
> target     prot opt source               destination
> UNCLEAN    all  --  anywhere             anywhere
> LOG        all  --  anywhere             anywhere           LOG level
> warning prefix `** UNCLEAN ** '
> 
> Chain LA (0 references)
> target     prot opt source               destination
> LOG        all  --  anywhere             anywhere           LOG level
> warning
> ACCEPT     all  --  anywhere             anywhere
> 
> Chain LD (4 references)
> target     prot opt source               destination
> LOG        all  --  anywhere             anywhere           LOG level
> warning
> DROP       all  --  anywhere             anywhere
> 
> Chain OUT_UNCLEAN (1 references)
> target     prot opt source               destination
> UNCLEAN    all  --  anywhere             anywhere
> LOG        all  --  anywhere             anywhere           LOG level
> warning prefix `** UNCLEAN ** '
> 
> Chain PZ (4 references)
> target     prot opt source               destination
> LOG        all  --  anywhere             anywhere           LOG level
> warning prefix `** Port Zero **'
> DROP       all  --  anywhere             anywhere
> 
> Chain SANITY (0 references)
> target     prot opt source               destination
> DROP       all  --  anywhere             anywhere
> 
> Chain SSH_LOG (1 references)
> target     prot opt source               destination
> LOG        all  --  anywhere             anywhere           LOG level
> warning prefix `** SSH ** '
> 
> Chain STATE (0 references)
> target     prot opt source               destination
> ACCEPT     all  --  anywhere             anywhere           state
> RELATED,ESTABLISHED
> ACCEPT     all  --  anywhere             anywhere           state NEW
> DROP       all  --  anywhere             anywhere
> 
> Chain TCP_POL (1 references)
> target     prot opt source               destination
> LOG        tcp  --  anywhere             anywhere           limit: avg 1/sec
> burst 5 LOG level warning prefix `** TCP DROP ** '
> DROP       all  --  anywhere             anywhere
> 
> Chain TELNET_LOG (1 references)
> target     prot opt source               destination
> LOG        all  --  anywhere             anywhere           LOG level
> warning prefix `** TELNET ** '
> 
> Chain UDP_POL (1 references)
> target     prot opt source               destination
> LOG        udp  --  anywhere             anywhere           limit: avg 1/sec
> burst 5 LOG level warning prefix `** UDP DROP ** '
> DROP       all  --  anywhere             anywhere
> 
> Chain UNCLEAN (2 references)
> target     prot opt source               destination
> DROP       all  --  anywhere             anywhere
> 
> 
> 



