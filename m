From: "Ricardo A" <racham@hotmail.com>
Subject: Re: Stealth on emule....
Date: Mon, 07 Jun 2004 17:59:29 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY1-F169qCppZHFoX60000b505@hotmail.com>
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


>From: Antony Stone <Antony@Soft-Solutions.co.uk>
>Reply-To: <netfilter@lists.netfilter.org>
>To: <netfilter@lists.netfilter.org>
>Subject: Re: Stealth on emule....
>Date: Mon, 7 Jun 2004 15:51:17 +0100
>I see no rule in your ruleset allowing those packets through the FORWARD 
>chain
>on your machine, therefore it won't pass them on to the client?
>
>Maybe I'm missing something because of the layout of the rules - if you 
>think
>the appropriate FORWARDing rules are there, please post the output of
>"iptables -L -nvx; iptables -L -t nat -nvx; iptables -L -t mangle -nvx"
>because I find this an easier format to understand for such a long ruleset.

OK, Thanks you Antony...

Linux:~# iptables -L -nvx
Chain INPUT (policy DROP 29421 packets, 1718646 bytes)
    pkts      bytes target     prot opt in     out     source
destination
  101717  5292111 bad_tcp_packets  tcp  --  *      *       0.0.0.0/0
0.0.0.0/0
    6560   808679 ACCEPT     all  --  eth1   *       192.0.0.0/8
0.0.0.0/0
       2      244 ACCEPT     all  --  lo     *       127.0.0.1
0.0.0.0/0
       0        0 ACCEPT     all  --  lo     *       192.168.111.1
0.0.0.0/0
       0        0 ACCEPT     all  --  lo     *       200.xxx.xxx.xxx
0.0.0.0/0
    3142   642016 ACCEPT     all  --  *      *       0.0.0.0/0
200.xxx.xxx.xxx       state
RELATED,ESTABLISHED
   24164  1124548 tcp_packets  tcp  --  eth0   *       0.0.0.0/0
0.0.0.0/0
    4464  1114537 udp_packets  udp  --  eth0   *       0.0.0.0/0
0.0.0.0/0
     927    46338 icmp_packets  icmp --  eth0   *       0.0.0.0/0
0.0.0.0/0
   13005   809968 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0          limit: avg 3/min
burst 3 LOG flags 0 level 7 prefix `IPT INPUT packet died: '

Chain FORWARD (policy DROP 11272 packets, 552279 bytes)
    pkts      bytes target     prot opt in     out     source
destination
14218836 7001833881 bad_tcp_packets  tcp  --  *      *       0.0.0.0/0
0.0.0.0/0
7966884 4793464646 ACCEPT     all  --  eth1   *       0.0.0.0/0
0.0.0.0/0
6585552 2237493007 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0          state
RELATED,ESTABLISHED
    8688   425676 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0          limit: avg 3/min
burst 3 LOG flags 0 level 7 prefix `IPT FORWARD packet died: '

Chain OUTPUT (policy DROP 2 packets, 128 bytes)
    pkts      bytes target     prot opt in     out     source
destination
    5192   230734 bad_tcp_packets  tcp  --  *      *       0.0.0.0/0
0.0.0.0/0
       2      244 ACCEPT     all  --  *      *       127.0.0.1
0.0.0.0/0
    2127   454165 ACCEPT     all  --  *      *       192.168.111.1
0.0.0.0/0
    8965   590752 ACCEPT     all  --  *      *       200.xxx.xxx.xxx
0.0.0.0/0
       0        0 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0          limit: avg 3/min
burst 3 LOG flags 0 level 7 prefix `IPT OUTPUT packet died: '

Chain allowed (3 references)
    pkts      bytes target     prot opt in     out     source
destination
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp
flags:0x16/0x02
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          state
RELATED,ESTABLISHED
       0        0 DROP       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0

Chain bad_tcp_packets (3 references)
    pkts      bytes target     prot opt in     out     source
destination
    4819   230860 REJECT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp
flags:0x12/0x12 state NEW reject-with tcp-reset
   75974  5381480 LOG        tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp
flags:!0x16/0x02 state NEW LOG flags 0 level 4 prefix `New not syn:'
   75974  5381480 DROP       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp
flags:!0x16/0x02 state NEW

Chain icmp_packets (1 references)
    pkts      bytes target     prot opt in     out     source
destination
     251     7920 DROP       icmp --  *      *       0.0.0.0/0
0.0.0.0/0          icmp type 8
      54     3372 DROP       icmp --  *      *       0.0.0.0/0
0.0.0.0/0          icmp type 11

Chain tcp_packets (1 references)
    pkts      bytes target     prot opt in     out     source
destination
       0        0 allowed    tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp dpt:4661
       0        0 allowed    tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp dpt:4662
       0        0 allowed    tcp  --  *      *       0.0.0.0/0
0.0.0.0/0          tcp dpt:4711

Chain udp_packets (1 references)
    pkts      bytes target     prot opt in     out     source
destination
       0        0 ACCEPT     udp  --  *      *       0.0.0.0/0
0.0.0.0/0          udp dpt:2074
       0        0 ACCEPT     udp  --  *      *       0.0.0.0/0
0.0.0.0/0          udp dpt:4000
       0        0 ACCEPT     udp  --  *      *       0.0.0.0/0
0.0.0.0/0          udp dpt:4665
       0        0 ACCEPT     udp  --  *      *       0.0.0.0/0
0.0.0.0/0          udp dpt:4672
    1774   609945 DROP       udp  --  eth0   *       0.0.0.0/0
255.255.255.255    udp dpts:67:68
Linux:~#
---------------
----------------

Linux:~# iptables -L -t nat -nvx
Chain PREROUTING (policy ACCEPT 459191 packets, 27464157 bytes)
    pkts      bytes target     prot opt in     out     source
destination
      63     2809 DNAT       tcp  --  *      *       0.0.0.0/0
200.xxx.xxx.xxx       tcp dpt:4661
to:192.168.111.2:4661
   11346   555376 DNAT       tcp  --  *      *       0.0.0.0/0
200.xxx.xxx.xxx       tcp dpt:4662
to:192.168.111.2:4662
       0        0 DNAT       udp  --  *      *       0.0.0.0/0
200.xxx.xxx.xxx       udp dpt:4665
to:192.168.111.2:4665
       0        0 DNAT       udp  --  *      *       0.0.0.0/0
200.xxx.xxx.xxx       udp dpt:4672
to:192.168.111.2:4672

Chain POSTROUTING (policy ACCEPT 1 packets, 208 bytes)
    pkts      bytes target     prot opt in     out     source
destination
  350137 19348610 SNAT       all  --  *      eth0    0.0.0.0/0
0.0.0.0/0          to:200.xxx.xxx.xxx

Chain OUTPUT (policy ACCEPT 1354 packets, 176307 bytes)
    pkts      bytes target     prot opt in     out     source
destination
Linux:~#
------------------

Linux:~# iptables -L -t mangle -nvx
Chain PREROUTING (policy ACCEPT 14720036 packets, 7058043928 bytes)
    pkts      bytes target     prot opt in     out     source
destination

Chain INPUT (policy ACCEPT 119262 packets, 7994213 bytes)
    pkts      bytes target     prot opt in     out     source
destination

Chain FORWARD (policy ACCEPT 14600748 packets, 7050048259 bytes)
    pkts      bytes target     prot opt in     out     source
destination

Chain OUTPUT (policy ACCEPT 11528 packets, 1085092 bytes)
    pkts      bytes target     prot opt in     out     source
destination

Chain POSTROUTING (policy ACCEPT 14597456 packets, 7049102787 bytes)
    pkts      bytes target     prot opt in     out     source
destination
Linux:~#
-----------------------
---------------------
And please, Antony, I don't have great iptables knowledge... you could tell 
me
what rule should add and what
rule should remove or to modify (and how... ) so that it works????

I thank you cordially your help
Richard

_________________________________________________________________
Protect your PC - get McAfee.com VirusScan Online 
http://clinic.mcafee.com/clinic/ibuy/campaign.asp?cid=3963


