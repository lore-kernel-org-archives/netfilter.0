From: Sasa Stupar <sasa@stupar.homelinux.net>
Subject: Re: MAC address and iptables
Date: Mon, 01 Mar 2004 07:27:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4042D7E8.2010604@stupar.homelinux.net>
References: <4041ED0A.9070001@stupar.homelinux.net> <40422B1D.5010406@stupar.homelinux.net> <40425D27.60604@stupar.homelinux.net> <200402292203.59216.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------060206010002000101070805"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200402292203.59216.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Netfilter-List <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.
--------------060206010002000101070805
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

  > If you can post your ruleset in a format we can understand 
("iptables -L -nvx;
> iptables -L -t nat -nvx" is good), keep the ruleset to the smallest possible 
> number which shows the problem you have, and explain what you changed when 
> the problem started, we may be able to help.

OK, I have done ruleset in the format you have advised and they are 
attached. I have made two pair: on before (working config) and one after 
the change. I have named it as follows:
- for command "iptables -L -nvx" they are called iptables-before and 
iptables-after
- for command "iptables -L -t nat -nvx" they are called 
iptables-nat-before and iptables-nat-after

I hope that it is now more readable. Sorry, but I am new to this.

Thank you again for helping me,
Sasa


--------------060206010002000101070805
Content-Type: text/plain;
 name="iptables-nat-before"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="iptables-nat-before"

Chain PREROUTING (policy ACCEPT 195701 packets, 58695023 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
       0        0 DNAT       tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:21 to:192.168.10.10:21 
       0        0 DNAT       udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:21 to:192.168.10.10:21 
       0        0 DNAT       tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:25 to:192.168.10.10:25 
       0        0 DNAT       udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:25 to:192.168.10.10:25 
       0        0 DNAT       tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:80 to:192.168.10.10:80 
       0        0 DNAT       udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:80 to:192.168.10.10:80 
       0        0 DNAT       tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:110 to:192.168.10.10:110 
       0        0 DNAT       udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:110 to:192.168.10.10:110 
       0        0 DNAT       tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:443 to:192.168.10.10:443 
       0        0 DNAT       udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:443 to:192.168.10.10:443 
       0        0 DNAT       tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:465 to:192.168.10.10:465 
       0        0 DNAT       udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:465 to:192.168.10.10:465 
       0        0 DNAT       tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:995 to:192.168.10.10:995 
       0        0 DNAT       udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:995 to:192.168.10.10:995 
       1       48 DNAT       tcp  --  eth1   *      !192.168.10.10        0.0.0.0/0          tcp dpt:80 to:192.168.10.10:3128 
       0        0 DNAT       tcp  --  eth2   *      !192.168.10.10        0.0.0.0/0          tcp dpt:80 to:192.168.10.10:3128 

Chain POSTROUTING (policy ACCEPT 7354 packets, 377864 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
       0        0 SNAT       tcp  --  *      *       192.168.10.0/24      192.168.10.10      tcp dpt:21 to:192.168.10.111 
       0        0 SNAT       tcp  --  *      *       192.168.10.0/24      192.168.10.10      tcp dpt:25 to:192.168.10.111 
       0        0 SNAT       tcp  --  *      *       192.168.10.0/24      192.168.10.10      tcp dpt:80 to:192.168.10.111 
       0        0 SNAT       tcp  --  *      *       192.168.10.0/24      192.168.10.10      tcp dpt:110 to:192.168.10.111 
       0        0 SNAT       tcp  --  *      *       192.168.10.0/24      192.168.10.10      tcp dpt:443 to:192.168.10.111 
       0        0 SNAT       tcp  --  *      *       192.168.10.0/24      192.168.10.10      tcp dpt:465 to:192.168.10.111 
       0        0 SNAT       tcp  --  *      *       192.168.10.0/24      192.168.10.10      tcp dpt:995 to:192.168.10.111 
       8      471 MASQUERADE  all  --  *      eth0    0.0.0.0/0            0.0.0.0/0          
       0        0 ACCEPT     all  --  *      *       194.249.51.64/26     0.0.0.0/0          
       1       48 SNAT       all  --  *      eth1    192.168.10.0/24      192.168.10.10      to:192.168.10.111 
       0        0 SNAT       all  --  *      eth2    192.168.1.0/24       192.168.10.10      to:192.168.1.111 

Chain OUTPUT (policy ACCEPT 8235 packets, 626936 bytes)
    pkts      bytes target     prot opt in     out     source               destination         

--------------060206010002000101070805
Content-Type: text/plain;
 name="iptables-after"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="iptables-after"

Chain INPUT (policy DROP 6 packets, 360 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
       0        0 UNCLEAN    all  --  eth0   *       0.0.0.0/0            0.0.0.0/0          unclean 
       0        0 ACCEPT     tcp  --  *      *       127.0.0.1            0.0.0.0/0          tcp flags:!0x16/0x02 
       0        0 ACCEPT     udp  --  *      *       127.0.0.1            0.0.0.0/0          
       0        0 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0          
       0        0 LD         icmp --  *      *       0.0.0.0/0            194.249.51.64/26   icmp type 8 
       0        0 LD         udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:33434 
       0        0 LD         icmp --  *      *       0.0.0.0/0            194.249.51.64/26   icmp type 3 
       0        0 LD         icmp --  *      *       0.0.0.0/0            194.249.51.64/26   icmp type 3 code 1 
       0        0 LD         icmp --  *      *       0.0.0.0/0            194.249.51.64/26   icmp type 13 
       0        0 LD         icmp --  *      *       0.0.0.0/0            194.249.51.64/26   icmp type 14 
       0        0 LD         icmp --  *      *       0.0.0.0/0            194.249.51.64/26   icmp type 17 
       0        0 LD         icmp --  *      *       0.0.0.0/0            194.249.51.64/26   icmp type 18 
       0        0 LD         icmp --  *      *       0.0.0.0/0            194.249.51.64/26   icmp type 5 
       0        0 LD         icmp --  *      *       0.0.0.0/0            194.249.51.64/26   icmp type 4 
       0        0 LD         all  --  *      *       0.0.0.0/0            0.0.0.0/0          state INVALID 
       0        0 LD         all  -f  *      *       0.0.0.0/0            0.0.0.0/0          limit: avg 10/min burst 5 
      13     1215 myrules    all  --  *      *       192.168.10.0/24      0.0.0.0/0          
       0        0 myrules    all  --  *      *       192.168.1.0/24       0.0.0.0/0          
       0        0 LD         all  --  eth0   *       0.0.0.0/8            194.249.51.64/26   
       0        0 LD         all  --  eth0   *       1.0.0.0/8            194.249.51.64/26   
       0        0 LD         all  --  eth0   *       2.0.0.0/8            194.249.51.64/26   
       0        0 LD         all  --  eth0   *       5.0.0.0/8            194.249.51.64/26   
       0        0 LD         all  --  eth0   *       7.0.0.0/8            194.249.51.64/26   
       0        0 LD         all  --  eth0   *       10.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       23.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       27.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       31.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       36.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       37.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       39.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       41.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       42.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       49.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       50.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       58.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       59.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       70.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       71.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       72.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       73.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       74.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       75.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       76.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       77.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       78.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       79.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       83.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       84.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       85.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       86.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       87.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       88.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       89.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       90.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       91.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       92.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       93.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       94.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       95.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       96.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       97.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       98.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       99.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       100.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       101.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       102.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       103.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       104.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       105.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       106.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       107.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       108.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       109.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       110.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       111.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       112.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       113.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       114.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       115.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       116.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       117.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       118.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       119.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       120.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       121.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       122.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       123.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       124.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       125.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       126.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       127.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       169.254.0.0/16       194.249.51.64/26   
       0        0 LD         all  --  eth0   *       172.16.0.0/12        194.249.51.64/26   
       0        0 LD         all  --  eth0   *       173.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       174.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       175.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       176.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       177.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       178.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       179.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       180.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       181.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       182.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       183.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       184.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       185.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       186.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       187.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       189.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       190.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       192.0.2.0/24         194.249.51.64/26   
       0        0 LD         all  --  eth0   *       192.168.0.0/16       194.249.51.64/26   
       0        0 LD         all  --  eth0   *       197.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       198.18.0.0/15        194.249.51.64/26   
       0        0 LD         all  --  eth0   *       223.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       224.0.0.0/3          194.249.51.64/26   
       0        0 LD         tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:31337 limit: avg 2/min burst 5 
       0        0 LD         udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:31337 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:33270 limit: avg 2/min burst 5 
       0        0 LD         udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:33270 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:1234 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:6711 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:16660 flags:0x16/0x02 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:60001 flags:0x16/0x02 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpts:12345:12346 limit: avg 2/min burst 5 
       0        0 LD         udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpts:12345:12346 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:135 limit: avg 2/min burst 5 
       0        0 LD         udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:135 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:1524 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:27665 limit: avg 2/min burst 5 
       0        0 LD         udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:27444 limit: avg 2/min burst 5 
       0        0 LD         udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:31335 limit: avg 2/min burst 5 
       0        0 LD         all  --  *      *       224.0.0.0/8          0.0.0.0/0          
       0        0 LD         all  --  *      *       0.0.0.0/0            224.0.0.0/8        
       0        0 LD         all  --  *      *       255.255.255.255      0.0.0.0/0          
       0        0 LD         all  --  *      *       0.0.0.0/0            0.0.0.0            
       0        0 DROP       all  --  eth0   *       10.0.0.255           0.0.0.0/0          
       0        0 DROP       all  --  eth0   *       0.0.0.0              0.0.0.0/0          
       0        0 DROP       all  --  eth0   *       0.0.0.0/0            255.255.255.255    
       0        0 DROP       all  --  eth0   *       0.0.0.0/0            0.0.0.0            
       0        0 LD         all  --  *      *       0.0.0.0/0            0.0.0.0/0          state INVALID 
       0        0 LD         all  -f  *      *       0.0.0.0/0            0.0.0.0/0          limit: avg 10/min burst 5 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:20 flags:!0x16/0x02 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:21 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:25 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:465 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:53 
       0        0 ACCEPT     udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:53 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:80 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:443 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:143 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:110 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:995 
       0        0 LD         tcp  --  *      *       0.0.0.0/0            0.0.0.0/0          tcp flags:!0x16/0x02 state NEW 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0          tcp spt:20 dpts:1023:65535 flags:!0x16/0x02 state RELATED 
       0        0 STATE      tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpts:1024:65535 
       0        0 ACCEPT     udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpts:1023:65535 
       0        0 LD         all  --  *      *       0.0.0.0/0            0.0.0.0/0          

Chain FORWARD (policy DROP 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
       0        0 UNCLEAN    all  --  *      *       0.0.0.0/0            0.0.0.0/0          unclean 
       0        0 TCPMSS     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0          tcp flags:0x06/0x02 TCPMSS clamp to PMTU 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            192.168.10.10      tcp dpt:21 
       0        0 ACCEPT     udp  --  *      *       0.0.0.0/0            192.168.10.10      udp dpt:21 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            192.168.10.10      tcp dpt:25 
       0        0 ACCEPT     udp  --  *      *       0.0.0.0/0            192.168.10.10      udp dpt:25 
      18     3062 ACCEPT     tcp  --  *      *       0.0.0.0/0            192.168.10.10      tcp dpt:80 
       0        0 ACCEPT     udp  --  *      *       0.0.0.0/0            192.168.10.10      udp dpt:80 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            192.168.10.10      tcp dpt:110 
       0        0 ACCEPT     udp  --  *      *       0.0.0.0/0            192.168.10.10      udp dpt:110 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            192.168.10.10      tcp dpt:443 
       0        0 ACCEPT     udp  --  *      *       0.0.0.0/0            192.168.10.10      udp dpt:443 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            192.168.10.10      tcp dpt:465 
       0        0 ACCEPT     udp  --  *      *       0.0.0.0/0            192.168.10.10      udp dpt:465 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            192.168.10.10      tcp dpt:995 
       0        0 ACCEPT     udp  --  *      *       0.0.0.0/0            192.168.10.10      udp dpt:995 
      24    26007 myrules    all  --  *      eth0    192.168.10.0/24      0.0.0.0/0          
       0        0 myrules    all  --  *      *       0.0.0.0/0            192.168.10.0/24    
       0        0 myrules    all  --  *      eth0    192.168.1.0/24       0.0.0.0/0          
       0        0 myrules    all  --  *      *       0.0.0.0/0            192.168.1.0/24     
       0        0 myrules    tcp  --  eth1   eth1    192.168.10.0/24      192.168.10.10      tcp dpt:3128 
       0        0 myrules    tcp  --  eth2   eth2    192.168.1.0/24       192.168.10.10      tcp dpt:3128 

Chain OUTPUT (policy DROP 4 packets, 218 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
       0        0 UNCLEAN    all  --  *      eth0    0.0.0.0/0            0.0.0.0/0          unclean 
       0        0 ACCEPT     all  --  *      lo      0.0.0.0/0            0.0.0.0/0          
       0        0 LD         tcp  --  *      *       194.249.51.64/26     0.0.0.0/0          tcp dpt:31337 limit: avg 2/min burst 5 
       0        0 LD         udp  --  *      *       194.249.51.64/26     0.0.0.0/0          udp dpt:31337 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       194.249.51.64/26     0.0.0.0/0          tcp dpt:33270 limit: avg 2/min burst 5 
       0        0 LD         udp  --  *      *       194.249.51.64/26     0.0.0.0/0          udp dpt:33270 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       194.249.51.64/26     0.0.0.0/0          tcp dpt:1234 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       194.249.51.64/26     0.0.0.0/0          tcp dpt:6711 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       194.249.51.64/26     0.0.0.0/0          tcp dpt:16660 flags:0x16/0x02 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       194.249.51.64/26     0.0.0.0/0          tcp dpt:60001 flags:0x16/0x02 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       194.249.51.64/26     0.0.0.0/0          tcp dpts:12345:12346 limit: avg 2/min burst 5 
       0        0 LD         udp  --  *      *       194.249.51.64/26     0.0.0.0/0          udp dpts:12345:12346 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       194.249.51.64/26     0.0.0.0/0          tcp dpt:135 limit: avg 2/min burst 5 
       0        0 LD         udp  --  *      *       194.249.51.64/26     0.0.0.0/0          udp dpt:135 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       194.249.51.64/26     0.0.0.0/0          tcp dpt:1524 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       194.249.51.64/26     0.0.0.0/0          tcp dpt:27665 limit: avg 2/min burst 5 
       0        0 LD         udp  --  *      *       194.249.51.64/26     0.0.0.0/0          udp dpt:27444 limit: avg 2/min burst 5 
       0        0 LD         udp  --  *      *       194.249.51.64/26     0.0.0.0/0          udp dpt:31335 limit: avg 2/min burst 5 
       0        0 LD         all  --  *      *       224.0.0.0/8          0.0.0.0/0          
       0        0 LD         all  --  *      *       0.0.0.0/0            224.0.0.0/8        
       0        0 LD         all  --  *      *       255.255.255.255      0.0.0.0/0          
       0        0 LD         all  --  *      *       0.0.0.0/0            0.0.0.0            
       0        0 DROP       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0          tcp flags:!0x16/0x02 state NEW 
      17      941            all  --  *      *       0.0.0.0/0            0.0.0.0/0          TTL match TTL == 64 
       0        0 ACCEPT     icmp --  *      eth0    194.249.51.64/26     0.0.0.0/0          
      16      872 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0          

Chain LD (158 references)
    pkts      bytes target     prot opt in     out     source               destination         
       0        0 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0          LOG flags 0 level 4 
       0        0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0          

Chain SANITY (0 references)
    pkts      bytes target     prot opt in     out     source               destination         
       0        0 LD         all  --  *      *       0.0.0.0/0            0.0.0.0/0          

Chain STATE (1 references)
    pkts      bytes target     prot opt in     out     source               destination         
       0        0 LD         all  --  !lo    *       0.0.0.0/0            0.0.0.0/0          state NEW 
       0        0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0          state RELATED,ESTABLISHED 
       0        0 LD         all  --  *      *       0.0.0.0/0            0.0.0.0/0          

Chain UNCLEAN (3 references)
    pkts      bytes target     prot opt in     out     source               destination         
       0        0 LD         all  --  *      *       0.0.0.0/0            0.0.0.0/0          

Chain myrules (8 references)
    pkts      bytes target     prot opt in     out     source               destination         
       0        0 ACCEPT     all  --  *      *       192.168.10.1         0.0.0.0/0          MAC 00:0C:6E:F1:F3:48 
       0        0 ACCEPT     all  --  *      *       192.168.10.111       0.0.0.0/0          MAC 00:50:BF:7A:5E:E5 
       0        0 ACCEPT     all  --  *      *       192.168.1.111        0.0.0.0/0          MAC 00:40:F4:60:D0:39 
      37    27222 ACCEPT     all  --  *      *       192.168.10.10        0.0.0.0/0          MAC 00:C0:26:28:8E:59 
       0        0 ACCEPT     all  --  *      *       194.249.51.74        0.0.0.0/0          MAC 00:30:4F:24:58:01 
       0        0 ACCEPT     all  --  *      *       192.168.10.30        0.0.0.0/0          MAC 00:E0:18:88:53:F0 
       0        0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0          

--------------060206010002000101070805
Content-Type: text/plain;
 name="iptables-before"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="iptables-before"

Chain INPUT (policy DROP 4 packets, 250 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
       0        0 UNCLEAN    all  --  eth0   *       0.0.0.0/0            0.0.0.0/0          unclean 
       0        0 ACCEPT     tcp  --  *      *       127.0.0.1            0.0.0.0/0          tcp flags:!0x16/0x02 
       0        0 ACCEPT     udp  --  *      *       127.0.0.1            0.0.0.0/0          
       0        0 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0          
       0        0 LD         icmp --  *      *       0.0.0.0/0            194.249.51.64/26   icmp type 8 
       0        0 LD         udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:33434 
       0        0 LD         icmp --  *      *       0.0.0.0/0            194.249.51.64/26   icmp type 3 
       0        0 LD         icmp --  *      *       0.0.0.0/0            194.249.51.64/26   icmp type 3 code 1 
       0        0 LD         icmp --  *      *       0.0.0.0/0            194.249.51.64/26   icmp type 13 
       0        0 LD         icmp --  *      *       0.0.0.0/0            194.249.51.64/26   icmp type 14 
       0        0 LD         icmp --  *      *       0.0.0.0/0            194.249.51.64/26   icmp type 17 
       0        0 LD         icmp --  *      *       0.0.0.0/0            194.249.51.64/26   icmp type 18 
       0        0 LD         icmp --  *      *       0.0.0.0/0            194.249.51.64/26   icmp type 5 
       0        0 LD         icmp --  *      *       0.0.0.0/0            194.249.51.64/26   icmp type 4 
       0        0 LD         all  --  *      *       0.0.0.0/0            0.0.0.0/0          state INVALID 
       0        0 LD         all  -f  *      *       0.0.0.0/0            0.0.0.0/0          limit: avg 10/min burst 5 
      42     2859 ACCEPT     all  --  *      *       192.168.10.0/24      0.0.0.0/0          
       0        0 ACCEPT     all  --  *      *       192.168.1.0/24       0.0.0.0/0          
       0        0 LD         all  --  eth0   *       0.0.0.0/8            194.249.51.64/26   
       0        0 LD         all  --  eth0   *       1.0.0.0/8            194.249.51.64/26   
       0        0 LD         all  --  eth0   *       2.0.0.0/8            194.249.51.64/26   
       0        0 LD         all  --  eth0   *       5.0.0.0/8            194.249.51.64/26   
       0        0 LD         all  --  eth0   *       7.0.0.0/8            194.249.51.64/26   
       0        0 LD         all  --  eth0   *       10.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       23.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       27.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       31.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       36.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       37.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       39.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       41.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       42.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       49.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       50.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       58.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       59.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       70.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       71.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       72.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       73.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       74.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       75.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       76.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       77.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       78.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       79.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       83.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       84.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       85.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       86.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       87.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       88.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       89.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       90.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       91.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       92.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       93.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       94.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       95.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       96.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       97.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       98.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       99.0.0.0/8           194.249.51.64/26   
       0        0 LD         all  --  eth0   *       100.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       101.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       102.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       103.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       104.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       105.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       106.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       107.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       108.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       109.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       110.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       111.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       112.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       113.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       114.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       115.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       116.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       117.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       118.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       119.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       120.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       121.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       122.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       123.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       124.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       125.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       126.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       127.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       169.254.0.0/16       194.249.51.64/26   
       0        0 LD         all  --  eth0   *       172.16.0.0/12        194.249.51.64/26   
       0        0 LD         all  --  eth0   *       173.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       174.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       175.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       176.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       177.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       178.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       179.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       180.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       181.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       182.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       183.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       184.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       185.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       186.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       187.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       189.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       190.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       192.0.2.0/24         194.249.51.64/26   
       0        0 LD         all  --  eth0   *       192.168.0.0/16       194.249.51.64/26   
       0        0 LD         all  --  eth0   *       197.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       198.18.0.0/15        194.249.51.64/26   
       0        0 LD         all  --  eth0   *       223.0.0.0/8          194.249.51.64/26   
       0        0 LD         all  --  eth0   *       224.0.0.0/3          194.249.51.64/26   
       0        0 LD         tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:31337 limit: avg 2/min burst 5 
       0        0 LD         udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:31337 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:33270 limit: avg 2/min burst 5 
       0        0 LD         udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:33270 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:1234 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:6711 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:16660 flags:0x16/0x02 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:60001 flags:0x16/0x02 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpts:12345:12346 limit: avg 2/min burst 5 
       0        0 LD         udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpts:12345:12346 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:135 limit: avg 2/min burst 5 
       0        0 LD         udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:135 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:1524 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:27665 limit: avg 2/min burst 5 
       0        0 LD         udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:27444 limit: avg 2/min burst 5 
       0        0 LD         udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:31335 limit: avg 2/min burst 5 
       0        0 LD         all  --  *      *       224.0.0.0/8          0.0.0.0/0          
       0        0 LD         all  --  *      *       0.0.0.0/0            224.0.0.0/8        
       0        0 LD         all  --  *      *       255.255.255.255      0.0.0.0/0          
       0        0 LD         all  --  *      *       0.0.0.0/0            0.0.0.0            
       0        0 DROP       all  --  eth0   *       10.0.0.255           0.0.0.0/0          
       0        0 DROP       all  --  eth0   *       0.0.0.0              0.0.0.0/0          
       0        0 DROP       all  --  eth0   *       0.0.0.0/0            255.255.255.255    
       0        0 DROP       all  --  eth0   *       0.0.0.0/0            0.0.0.0            
       0        0 LD         all  --  *      *       0.0.0.0/0            0.0.0.0/0          state INVALID 
       0        0 LD         all  -f  *      *       0.0.0.0/0            0.0.0.0/0          limit: avg 10/min burst 5 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:20 flags:!0x16/0x02 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:21 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:25 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:465 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:53 
       0        0 ACCEPT     udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:53 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:80 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:443 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:143 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:110 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:995 
       0        0 LD         tcp  --  *      *       0.0.0.0/0            0.0.0.0/0          tcp flags:!0x16/0x02 state NEW 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0          tcp spt:20 dpts:1023:65535 flags:!0x16/0x02 state RELATED 
       0        0 STATE      tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpts:1024:65535 
       1       91 ACCEPT     udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpts:1023:65535 
       0        0 LD         all  --  *      *       0.0.0.0/0            0.0.0.0/0          

Chain FORWARD (policy DROP 0 packets, 0 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
       0        0 UNCLEAN    all  --  *      *       0.0.0.0/0            0.0.0.0/0          unclean 
      17      932 TCPMSS     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0          tcp flags:0x06/0x02 TCPMSS clamp to PMTU 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            192.168.10.10      tcp dpt:21 
       0        0 ACCEPT     udp  --  *      *       0.0.0.0/0            192.168.10.10      udp dpt:21 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            192.168.10.10      tcp dpt:25 
       0        0 ACCEPT     udp  --  *      *       0.0.0.0/0            192.168.10.10      udp dpt:25 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            192.168.10.10      tcp dpt:80 
       0        0 ACCEPT     udp  --  *      *       0.0.0.0/0            192.168.10.10      udp dpt:80 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            192.168.10.10      tcp dpt:110 
       0        0 ACCEPT     udp  --  *      *       0.0.0.0/0            192.168.10.10      udp dpt:110 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            192.168.10.10      tcp dpt:443 
       0        0 ACCEPT     udp  --  *      *       0.0.0.0/0            192.168.10.10      udp dpt:443 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            192.168.10.10      tcp dpt:465 
       0        0 ACCEPT     udp  --  *      *       0.0.0.0/0            192.168.10.10      udp dpt:465 
       0        0 ACCEPT     tcp  --  *      *       0.0.0.0/0            192.168.10.10      tcp dpt:995 
       0        0 ACCEPT     udp  --  *      *       0.0.0.0/0            192.168.10.10      udp dpt:995 
      63     3696 ACCEPT     all  --  *      eth0    192.168.10.0/24      0.0.0.0/0          
      70     8690 ACCEPT     all  --  *      *       0.0.0.0/0            192.168.10.0/24    
       0        0 ACCEPT     all  --  *      eth0    192.168.1.0/24       0.0.0.0/0          
       0        0 ACCEPT     all  --  *      *       0.0.0.0/0            192.168.1.0/24     
       0        0 ACCEPT     tcp  --  eth1   eth1    192.168.10.0/24      192.168.10.10      tcp dpt:3128 
       0        0 ACCEPT     tcp  --  eth2   eth2    192.168.1.0/24       192.168.10.10      tcp dpt:3128 

Chain OUTPUT (policy DROP 1 packets, 69 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
       0        0 UNCLEAN    all  --  *      eth0    0.0.0.0/0            0.0.0.0/0          unclean 
       0        0 ACCEPT     all  --  *      lo      0.0.0.0/0            0.0.0.0/0          
      60     4930 ACCEPT     all  --  *      *       192.168.10.0/24      0.0.0.0/0          
       0        0 ACCEPT     all  --  *      *       192.168.1.0/24       0.0.0.0/0          
       0        0 ACCEPT     icmp --  *      *       192.168.10.0/24      0.0.0.0/0          
       0        0 ACCEPT     icmp --  *      *       192.168.1.0/24       0.0.0.0/0          
       0        0 LD         tcp  --  *      *       194.249.51.64/26     0.0.0.0/0          tcp dpt:31337 limit: avg 2/min burst 5 
       0        0 LD         udp  --  *      *       194.249.51.64/26     0.0.0.0/0          udp dpt:31337 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       194.249.51.64/26     0.0.0.0/0          tcp dpt:33270 limit: avg 2/min burst 5 
       0        0 LD         udp  --  *      *       194.249.51.64/26     0.0.0.0/0          udp dpt:33270 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       194.249.51.64/26     0.0.0.0/0          tcp dpt:1234 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       194.249.51.64/26     0.0.0.0/0          tcp dpt:6711 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       194.249.51.64/26     0.0.0.0/0          tcp dpt:16660 flags:0x16/0x02 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       194.249.51.64/26     0.0.0.0/0          tcp dpt:60001 flags:0x16/0x02 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       194.249.51.64/26     0.0.0.0/0          tcp dpts:12345:12346 limit: avg 2/min burst 5 
       0        0 LD         udp  --  *      *       194.249.51.64/26     0.0.0.0/0          udp dpts:12345:12346 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       194.249.51.64/26     0.0.0.0/0          tcp dpt:135 limit: avg 2/min burst 5 
       0        0 LD         udp  --  *      *       194.249.51.64/26     0.0.0.0/0          udp dpt:135 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       194.249.51.64/26     0.0.0.0/0          tcp dpt:1524 limit: avg 2/min burst 5 
       0        0 LD         tcp  --  *      *       194.249.51.64/26     0.0.0.0/0          tcp dpt:27665 limit: avg 2/min burst 5 
       0        0 LD         udp  --  *      *       194.249.51.64/26     0.0.0.0/0          udp dpt:27444 limit: avg 2/min burst 5 
       0        0 LD         udp  --  *      *       194.249.51.64/26     0.0.0.0/0          udp dpt:31335 limit: avg 2/min burst 5 
       0        0 LD         all  --  *      *       224.0.0.0/8          0.0.0.0/0          
       0        0 LD         all  --  *      *       0.0.0.0/0            224.0.0.0/8        
       0        0 LD         all  --  *      *       255.255.255.255      0.0.0.0/0          
       0        0 LD         all  --  *      *       0.0.0.0/0            0.0.0.0            
       0        0 DROP       tcp  --  *      *       0.0.0.0/0            0.0.0.0/0          tcp flags:!0x16/0x02 state NEW 
       1       75            all  --  *      *       0.0.0.0/0            0.0.0.0/0          TTL match TTL == 64 
       0        0 ACCEPT     icmp --  *      eth0    194.249.51.64/26     0.0.0.0/0          
       1       75 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0          

Chain LD (158 references)
    pkts      bytes target     prot opt in     out     source               destination         
       0        0 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0          LOG flags 0 level 4 
       0        0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0          

Chain SANITY (0 references)
    pkts      bytes target     prot opt in     out     source               destination         
       0        0 LD         all  --  *      *       0.0.0.0/0            0.0.0.0/0          

Chain STATE (1 references)
    pkts      bytes target     prot opt in     out     source               destination         
       0        0 LD         all  --  !lo    *       0.0.0.0/0            0.0.0.0/0          state NEW 
       0        0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0          state RELATED,ESTABLISHED 
       0        0 LD         all  --  *      *       0.0.0.0/0            0.0.0.0/0          

Chain UNCLEAN (3 references)
    pkts      bytes target     prot opt in     out     source               destination         
       0        0 LD         all  --  *      *       0.0.0.0/0            0.0.0.0/0          

--------------060206010002000101070805
Content-Type: text/plain;
 name="iptables-nat-after"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="iptables-nat-after"

Chain PREROUTING (policy ACCEPT 195663 packets, 58692648 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
       0        0 DNAT       tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:21 to:192.168.10.10:21 
       0        0 DNAT       udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:21 to:192.168.10.10:21 
       0        0 DNAT       tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:25 to:192.168.10.10:25 
       0        0 DNAT       udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:25 to:192.168.10.10:25 
       0        0 DNAT       tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:80 to:192.168.10.10:80 
       0        0 DNAT       udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:80 to:192.168.10.10:80 
       0        0 DNAT       tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:110 to:192.168.10.10:110 
       0        0 DNAT       udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:110 to:192.168.10.10:110 
       0        0 DNAT       tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:443 to:192.168.10.10:443 
       0        0 DNAT       udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:443 to:192.168.10.10:443 
       0        0 DNAT       tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:465 to:192.168.10.10:465 
       0        0 DNAT       udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:465 to:192.168.10.10:465 
       0        0 DNAT       tcp  --  *      *       0.0.0.0/0            194.249.51.64/26   tcp dpt:995 to:192.168.10.10:995 
       0        0 DNAT       udp  --  *      *       0.0.0.0/0            194.249.51.64/26   udp dpt:995 to:192.168.10.10:995 
       0        0 DNAT       tcp  --  eth1   *      !192.168.10.10        0.0.0.0/0          tcp dpt:80 to:192.168.10.10:3128 
       0        0 DNAT       tcp  --  eth2   *      !192.168.10.10        0.0.0.0/0          tcp dpt:80 to:192.168.10.10:3128 

Chain POSTROUTING (policy ACCEPT 7354 packets, 377864 bytes)
    pkts      bytes target     prot opt in     out     source               destination         
       0        0 SNAT       tcp  --  *      *       192.168.10.0/24      192.168.10.10      tcp dpt:21 to:192.168.10.111 
       0        0 SNAT       tcp  --  *      *       192.168.10.0/24      192.168.10.10      tcp dpt:25 to:192.168.10.111 
       0        0 SNAT       tcp  --  *      *       192.168.10.0/24      192.168.10.10      tcp dpt:80 to:192.168.10.111 
       0        0 SNAT       tcp  --  *      *       192.168.10.0/24      192.168.10.10      tcp dpt:110 to:192.168.10.111 
       0        0 SNAT       tcp  --  *      *       192.168.10.0/24      192.168.10.10      tcp dpt:443 to:192.168.10.111 
       0        0 SNAT       tcp  --  *      *       192.168.10.0/24      192.168.10.10      tcp dpt:465 to:192.168.10.111 
       0        0 SNAT       tcp  --  *      *       192.168.10.0/24      192.168.10.10      tcp dpt:995 to:192.168.10.111 
       0        0 MASQUERADE  all  --  *      eth0    0.0.0.0/0            0.0.0.0/0          
       0        0 ACCEPT     all  --  *      *       194.249.51.64/26     0.0.0.0/0          
       0        0 SNAT       all  --  *      eth1    192.168.10.0/24      192.168.10.10      to:192.168.10.111 
       0        0 SNAT       all  --  *      eth2    192.168.1.0/24       192.168.10.10      to:192.168.1.111 

Chain OUTPUT (policy ACCEPT 8233 packets, 626786 bytes)
    pkts      bytes target     prot opt in     out     source               destination         

--------------060206010002000101070805--

