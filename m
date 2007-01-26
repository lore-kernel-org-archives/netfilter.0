From: "Saurabh Mehrotra" <saurabh1980@gmail.com>
Subject: Re: Iptables problem
Date: Fri, 26 Jan 2007 19:47:03 +0530
Message-ID: <9c9832d0701260617m1393f7b4gf8b94985a641adf6@mail.gmail.com>
References: <9c9832d0701260319q2b686090k28d63d92e2c58646@mail.gmail.com>
	<4587.1169819624@laika.gnusto.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4587.1169819624@laika.gnusto.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi Ted,

Many thanks for reply....

Please find output of

iptables -v -L

Chain INPUT (policy DROP 1 packets, 40 bytes)
 pkts bytes target     prot opt in     out     source
destination
35353 2552K ACCEPT     all  --  any    any     anywhere
anywhere            state RELATED,ESTABLISHED
10736  644K lo_In_RULE_0  all  --  lo     any     anywhere
anywhere
  242 22264 Cid459E8205.0  all  --  any    any     anywhere
 10.150.0.225        state NEW
   59  3174 Cid459E8205.0  all  --  any    any     anywhere
 trench1ams          state NEW
    0     0 Cid459E82B3.2  udp  --  any    any     anywhere
 anywhere            udp multiport dports snmptrap,syslog,tftp state
NEW
    8   570 Cid459E81DA.0  udp  --  any    any     anywhere
 anywhere            udp dpt:domain state NEW
    8   570 Cid459E81DA.1  udp  --  any    any     anywhere
 anywhere            udp dpt:domain state NEW
    0     0 Cid459E8281.2  udp  --  any    any     anywhere
 anywhere            udp dpt:domain state NEW
    0     0 Cid45A018F5.0  all  --  any    any     10.150.0.225
 anywhere
    0     0 Cid45A018F5.0  all  --  any    any     trench1ams
 anywhere
    0     0 Cid45A018F5.0  all  --  any    any     trench1ams
 anywhere
  262 23360 RULE_5     all  --  any    any     anywhere
anywhere

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 ACCEPT     all  --  any    any     anywhere
anywhere            state RELATED,ESTABLISHED
    0     0 Cid459E8205.4  all  --  any    any     anywhere
 10.150.0.226        state NEW
    0     0 Cid459E8205.4  all  --  any    any     anywhere
 212.165.108.5       state NEW
    0     0 Cid459E8205.4  all  --  any    any     anywhere
 10.150.65.12        state NEW
    0     0 Cid459E8205.4  all  --  any    any     anywhere
 212.165.65.4        state NEW
    0     0 Cid459E8205.4  all  --  any    any     anywhere
 10.150.65.13        state NEW
    0     0 Cid459E8205.4  all  --  any    any     anywhere
 212.165.65.5        state NEW
    0     0 Cid459E82B3.4  udp  --  any    any     anywhere
 anywhere            udp multiport dports snmptrap,syslog,tftp state
NEW
    0     0 Cid459E81DA.3  udp  --  any    any     anywhere
 anywhere            udp dpt:domain state NEW
    0     0 Cid459E8281.3  udp  --  any    any     anywhere
 anywhere            udp dpt:domain state NEW
    0     0 RULE_5     all  --  any    any     anywhere
anywhere

Chain OUTPUT (policy DROP 2 packets, 256 bytes)
 pkts bytes target     prot opt in     out     source
destination
31640 2770K ACCEPT     all  --  any    any     anywhere
anywhere            state RELATED,ESTABLISHED
10736  644K lo_Out_RULE_0  all  --  any    lo      anywhere
 anywhere
    0     0 Cid459E8205.2  all  --  any    any     anywhere
 10.150.0.226        state NEW
    1    74 Cid459E8205.2  all  --  any    any     anywhere
 212.165.108.5       state NEW
    0     0 Cid459E8205.2  all  --  any    any     anywhere
 10.150.65.12        state NEW
    0     0 Cid459E8205.2  all  --  any    any     anywhere
 212.165.65.4        state NEW
    0     0 Cid459E8205.2  all  --  any    any     anywhere
 10.150.65.13        state NEW
    0     0 Cid459E8205.2  all  --  any    any     anywhere
 212.165.65.5        state NEW
    0     0 Cid459E82B3.0  all  --  any    any     10.150.0.225
 anywhere            state NEW
 1119 80580 Cid459E82B3.0  all  --  any    any     trench1ams
 anywhere            state NEW
 1104 78714 Cid459E81DA.2  udp  --  any    any     anywhere
 anywhere            udp dpt:domain state NEW
    0     0 Cid459E8281.0  udp  --  any    any     anywhere
 anywhere            udp dpt:domain state NEW
    0     0 Cid459E8281.1  udp  --  any    any     anywhere
 anywhere            udp dpt:domain state NEW
    0     0 Cid45A018F5.1  all  --  any    any     10.150.0.225
 anywhere
   14  1738 Cid45A018F5.1  all  --  any    any     trench1ams
 anywhere
    0     0 Cid45A018F5.1  all  --  any    any     trench1ams
 anywhere
   14  1738 RULE_5     all  --  any    any     anywhere
anywhere

Chain Cid459E81DA.0 (1 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 RULE_2     all  --  any    any     10.150.0.225
anywhere
    0     0 RULE_2     all  --  any    any     trench1ams
anywhere

Chain Cid459E81DA.1 (1 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 RULE_2     all  --  any    any     10.150.0.226
anywhere
    8   570 RULE_2     all  --  any    any     212.165.108.5
anywhere
    0     0 RULE_2     all  --  any    any     10.150.65.12
anywhere
    0     0 RULE_2     all  --  any    any     212.165.65.4
anywhere
    0     0 RULE_2     all  --  any    any     10.150.65.13
anywhere
    0     0 RULE_2     all  --  any    any     212.165.65.5
anywhere

Chain Cid459E81DA.2 (1 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 RULE_2     all  --  any    any     10.150.0.225
anywhere
 1104 78714 RULE_2     all  --  any    any     trench1ams
anywhere

Chain Cid459E81DA.3 (1 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 RULE_2     all  --  any    any     10.150.0.226
anywhere
    0     0 RULE_2     all  --  any    any     212.165.108.5
anywhere
    0     0 RULE_2     all  --  any    any     10.150.65.12
anywhere
    0     0 RULE_2     all  --  any    any     212.165.65.4
anywhere
    0     0 RULE_2     all  --  any    any     10.150.65.13
anywhere
    0     0 RULE_2     all  --  any    any     212.165.65.5
anywhere

Chain Cid459E8205.0 (2 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 Cid459E8205.1  icmp --  any    any     anywhere
 anywhere            icmp ttl-zero-during-reassembly
    0     0 Cid459E8205.1  icmp --  any    any     anywhere
 anywhere            icmp ttl-zero-during-transit
    0     0 Cid459E8205.1  icmp --  any    any     anywhere
 anywhere            icmp port-unreachable
  242 22264 Cid459E8205.1  icmp --  any    any     anywhere
 anywhere            icmp type 8 code 0
    0     0 Cid459E8205.1  icmp --  any    any     anywhere
 anywhere            icmp type 0 code 0
    0     0 Cid459E8205.1  icmp --  any    any     anywhere
 anywhere            icmp host-unreachable
   50  2536 Cid459E8205.1  tcp  --  any    any     anywhere
 anywhere            tcp dpt:ssh
    1    68 Cid459E8205.1  udp  --  any    any     anywhere
 anywhere            udp dpt:snmp

Chain Cid459E8205.1 (8 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 ACCEPT     all  --  any    any     212.165.120.6
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.38
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.7
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.39
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.9
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.4
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.36
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.208
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.5
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.37
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.209
anywhere
    0     0 ACCEPT     all  --  any    any     POPA
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.44
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.216
anywhere
    0     0 ACCEPT     all  --  any    any     POPB
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.45
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.217
anywhere
    0     0 ACCEPT     all  --  any    any
host-83-146-60-149.bulldogdsl.com  anywhere
    0     0 ACCEPT     all  --  any    any     fre-67677.easynet.co.uk
 anywhere
    1    48 ACCEPT     all  --  any    any
host-84-9-3-176.bulldogdsl.com/28  anywhere
    0     0 ACCEPT     all  --  any    any
host-83-146-45-128.bulldogdsl.com/28  anywhere
    0     0 ACCEPT     all  --  any    any     213.250.154.166
anywhere
    0     0 ACCEPT     all  --  any    any     prodba.plus.com
anywhere
    0     0 ACCEPT     all  --  any    any     83.71.198.237
anywhere
   29  1392 ACCEPT     all  --  any    any
121.247.160.154.Ahmedabad-static-bb.vsnl.net.in  anywhere
    1    68 ACCEPT     all  --  any    any     POPB.Staging
anywhere

Chain Cid459E8205.2 (6 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 Cid459E8205.3  icmp --  any    any     anywhere
 anywhere            icmp ttl-zero-during-reassembly
    0     0 Cid459E8205.3  icmp --  any    any     anywhere
 anywhere            icmp ttl-zero-during-transit
    0     0 Cid459E8205.3  icmp --  any    any     anywhere
 anywhere            icmp port-unreachable
    0     0 Cid459E8205.3  icmp --  any    any     anywhere
 anywhere            icmp type 8 code 0
    0     0 Cid459E8205.3  icmp --  any    any     anywhere
 anywhere            icmp type 0 code 0
    0     0 Cid459E8205.3  icmp --  any    any     anywhere
 anywhere            icmp host-unreachable
    0     0 Cid459E8205.3  tcp  --  any    any     anywhere
 anywhere            tcp dpt:ssh
    0     0 Cid459E8205.3  udp  --  any    any     anywhere
 anywhere            udp dpt:snmp

Chain Cid459E8205.3 (8 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 ACCEPT     all  --  any    any     212.165.120.6
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.38
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.7
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.39
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.9
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.4
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.36
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.208
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.5
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.37
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.209
anywhere
    0     0 ACCEPT     all  --  any    any     POPA
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.44
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.216
anywhere
    0     0 ACCEPT     all  --  any    any     POPB
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.45
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.217
anywhere
    0     0 ACCEPT     all  --  any    any
host-83-146-60-149.bulldogdsl.com  anywhere
    0     0 ACCEPT     all  --  any    any     fre-67677.easynet.co.uk
 anywhere
    0     0 ACCEPT     all  --  any    any
host-84-9-3-176.bulldogdsl.com/28  anywhere
    0     0 ACCEPT     all  --  any    any
host-83-146-45-128.bulldogdsl.com/28  anywhere
    0     0 ACCEPT     all  --  any    any     213.250.154.166
anywhere
    0     0 ACCEPT     all  --  any    any     prodba.plus.com
anywhere
    0     0 ACCEPT     all  --  any    any     83.71.198.237
anywhere
    0     0 ACCEPT     all  --  any    any
121.247.160.154.Ahmedabad-static-bb.vsnl.net.in  anywhere
    0     0 ACCEPT     all  --  any    any     POPB.Staging
anywhere

Chain Cid459E8205.4 (6 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 Cid459E8205.5  icmp --  any    any     anywhere
 anywhere            icmp ttl-zero-during-reassembly
    0     0 Cid459E8205.5  icmp --  any    any     anywhere
 anywhere            icmp ttl-zero-during-transit
    0     0 Cid459E8205.5  icmp --  any    any     anywhere
 anywhere            icmp port-unreachable
    0     0 Cid459E8205.5  icmp --  any    any     anywhere
 anywhere            icmp type 8 code 0
    0     0 Cid459E8205.5  icmp --  any    any     anywhere
 anywhere            icmp type 0 code 0
    0     0 Cid459E8205.5  icmp --  any    any     anywhere
 anywhere            icmp host-unreachable
    0     0 Cid459E8205.5  tcp  --  any    any     anywhere
 anywhere            tcp dpt:ssh
    0     0 Cid459E8205.5  udp  --  any    any     anywhere
 anywhere            udp dpt:snmp

Chain Cid459E8205.5 (8 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 ACCEPT     all  --  any    any     212.165.120.6
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.38
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.7
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.39
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.9
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.4
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.36
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.208
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.5
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.37
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.209
anywhere
    0     0 ACCEPT     all  --  any    any     POPA
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.44
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.216
anywhere
    0     0 ACCEPT     all  --  any    any     POPB
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.45
anywhere
    0     0 ACCEPT     all  --  any    any     212.165.120.217
anywhere
    0     0 ACCEPT     all  --  any    any
host-83-146-60-149.bulldogdsl.com  anywhere
    0     0 ACCEPT     all  --  any    any     fre-67677.easynet.co.uk
 anywhere
    0     0 ACCEPT     all  --  any    any
host-84-9-3-176.bulldogdsl.com/28  anywhere
    0     0 ACCEPT     all  --  any    any
host-83-146-45-128.bulldogdsl.com/28  anywhere
    0     0 ACCEPT     all  --  any    any     213.250.154.166
anywhere
    0     0 ACCEPT     all  --  any    any     prodba.plus.com
anywhere
    0     0 ACCEPT     all  --  any    any     83.71.198.237
anywhere
    0     0 ACCEPT     all  --  any    any
121.247.160.154.Ahmedabad-static-bb.vsnl.net.in  anywhere
    0     0 ACCEPT     all  --  any    any     POPB.Staging
anywhere

Chain Cid459E8281.0 (1 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 RULE_3     all  --  any    any     anywhere
10.150.0.225
    0     0 RULE_3     all  --  any    any     anywhere
trench1ams

Chain Cid459E8281.1 (1 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 RULE_3     all  --  any    any     anywhere
10.150.0.226
    0     0 RULE_3     all  --  any    any     anywhere
212.165.108.5
    0     0 RULE_3     all  --  any    any     anywhere
10.150.65.12
    0     0 RULE_3     all  --  any    any     anywhere
212.165.65.4
    0     0 RULE_3     all  --  any    any     anywhere
10.150.65.13
    0     0 RULE_3     all  --  any    any     anywhere
212.165.65.5

Chain Cid459E8281.2 (1 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 RULE_3     all  --  any    any     anywhere
10.150.0.225
    0     0 RULE_3     all  --  any    any     anywhere
trench1ams

Chain Cid459E8281.3 (1 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 RULE_3     all  --  any    any     anywhere
10.150.0.226
    0     0 RULE_3     all  --  any    any     anywhere
212.165.108.5
    0     0 RULE_3     all  --  any    any     anywhere
10.150.65.12
    0     0 RULE_3     all  --  any    any     anywhere
212.165.65.4
    0     0 RULE_3     all  --  any    any     anywhere
10.150.65.13
    0     0 RULE_3     all  --  any    any     anywhere
212.165.65.5

Chain Cid459E82B3.0 (2 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 Cid459E82B3.1  udp  --  any    any     anywhere
 anywhere            udp multiport dports snmptrap,syslog,tftp

Chain Cid459E82B3.1 (1 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.6
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.38
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.7
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.39
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.9
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.4
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.36
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.208
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.5
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.37
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.209
    0     0 ACCEPT     all  --  any    any     anywhere
POPA
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.44
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.216
    0     0 ACCEPT     all  --  any    any     anywhere
POPB
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.45
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.217
    0     0 ACCEPT     all  --  any    any     anywhere
host-83-146-60-149.bulldogdsl.com
    0     0 ACCEPT     all  --  any    any     anywhere
fre-67677.easynet.co.uk
    0     0 ACCEPT     all  --  any    any     anywhere
host-84-9-3-176.bulldogdsl.com/28
    0     0 ACCEPT     all  --  any    any     anywhere
host-83-146-45-128.bulldogdsl.com/28
    0     0 ACCEPT     all  --  any    any     anywhere
213.250.154.166
    0     0 ACCEPT     all  --  any    any     anywhere
prodba.plus.com
    0     0 ACCEPT     all  --  any    any     anywhere
83.71.198.237
    0     0 ACCEPT     all  --  any    any     anywhere
121.247.160.154.Ahmedabad-static-bb.vsnl.net.in
    0     0 ACCEPT     all  --  any    any     anywhere
POPB.Staging

Chain Cid459E82B3.2 (1 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 Cid459E82B3.3  all  --  any    any     10.150.0.226
 anywhere
    0     0 Cid459E82B3.3  all  --  any    any     212.165.108.5
 anywhere
    0     0 Cid459E82B3.3  all  --  any    any     10.150.65.12
 anywhere
    0     0 Cid459E82B3.3  all  --  any    any     212.165.65.4
 anywhere
    0     0 Cid459E82B3.3  all  --  any    any     10.150.65.13
 anywhere
    0     0 Cid459E82B3.3  all  --  any    any     212.165.65.5
 anywhere

Chain Cid459E82B3.3 (6 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.6
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.38
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.7
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.39
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.9
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.4
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.36
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.208
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.5
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.37
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.209
    0     0 ACCEPT     all  --  any    any     anywhere
POPA
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.44
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.216
    0     0 ACCEPT     all  --  any    any     anywhere
POPB
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.45
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.217
    0     0 ACCEPT     all  --  any    any     anywhere
host-83-146-60-149.bulldogdsl.com
    0     0 ACCEPT     all  --  any    any     anywhere
fre-67677.easynet.co.uk
    0     0 ACCEPT     all  --  any    any     anywhere
host-84-9-3-176.bulldogdsl.com/28
    0     0 ACCEPT     all  --  any    any     anywhere
host-83-146-45-128.bulldogdsl.com/28
    0     0 ACCEPT     all  --  any    any     anywhere
213.250.154.166
    0     0 ACCEPT     all  --  any    any     anywhere
prodba.plus.com
    0     0 ACCEPT     all  --  any    any     anywhere
83.71.198.237
    0     0 ACCEPT     all  --  any    any     anywhere
121.247.160.154.Ahmedabad-static-bb.vsnl.net.in
    0     0 ACCEPT     all  --  any    any     anywhere
POPB.Staging

Chain Cid459E82B3.4 (1 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 Cid459E82B3.5  all  --  any    any     10.150.0.226
 anywhere
    0     0 Cid459E82B3.5  all  --  any    any     212.165.108.5
 anywhere
    0     0 Cid459E82B3.5  all  --  any    any     10.150.65.12
 anywhere
    0     0 Cid459E82B3.5  all  --  any    any     212.165.65.4
 anywhere
    0     0 Cid459E82B3.5  all  --  any    any     10.150.65.13
 anywhere
    0     0 Cid459E82B3.5  all  --  any    any     212.165.65.5
 anywhere

Chain Cid459E82B3.5 (6 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.6
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.38
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.7
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.39
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.9
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.4
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.36
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.208
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.5
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.37
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.209
    0     0 ACCEPT     all  --  any    any     anywhere
POPA
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.44
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.216
    0     0 ACCEPT     all  --  any    any     anywhere
POPB
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.45
    0     0 ACCEPT     all  --  any    any     anywhere
212.165.120.217
    0     0 ACCEPT     all  --  any    any     anywhere
host-83-146-60-149.bulldogdsl.com
    0     0 ACCEPT     all  --  any    any     anywhere
fre-67677.easynet.co.uk
    0     0 ACCEPT     all  --  any    any     anywhere
host-84-9-3-176.bulldogdsl.com/28
    0     0 ACCEPT     all  --  any    any     anywhere
host-83-146-45-128.bulldogdsl.com/28
    0     0 ACCEPT     all  --  any    any     anywhere
213.250.154.166
    0     0 ACCEPT     all  --  any    any     anywhere
prodba.plus.com
    0     0 ACCEPT     all  --  any    any     anywhere
83.71.198.237
    0     0 ACCEPT     all  --  any    any     anywhere
121.247.160.154.Ahmedabad-static-bb.vsnl.net.in
    0     0 ACCEPT     all  --  any    any     anywhere
POPB.Staging

Chain Cid45A018F5.0 (3 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 RULE_4     all  --  any    any     anywhere
10.150.0.225
    0     0 RULE_4     all  --  any    any     anywhere
trench1ams
    0     0 RULE_4     all  --  any    any     anywhere
trench1ams

Chain Cid45A018F5.1 (3 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 RULE_4     all  --  any    any     anywhere
10.150.0.225
    0     0 RULE_4     all  --  any    any     anywhere
trench1ams
    0     0 RULE_4     all  --  any    any     anywhere
trench1ams

Chain RULE_2 (16 references)
 pkts bytes target     prot opt in     out     source
destination
 1112 79284 LOG        all  --  any    any     anywhere
anywhere            LOG level info prefix `RULE 2 -- ACCEPT '
 1112 79284 ACCEPT     all  --  any    any     anywhere
anywhere

Chain RULE_3 (16 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 LOG        all  --  any    any     anywhere
anywhere            LOG level info prefix `RULE 3 -- ACCEPT '
    0     0 ACCEPT     all  --  any    any     anywhere
anywhere

Chain RULE_4 (6 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 LOG        all  --  any    any     anywhere
anywhere            LOG level info prefix `RULE 4 -- ACCEPT '
    0     0 ACCEPT     all  --  any    any     anywhere
anywhere

Chain RULE_5 (3 references)
 pkts bytes target     prot opt in     out     source
destination
  276 25098 LOG        all  --  any    any     anywhere
anywhere            LOG level info prefix `RULE 5 -- DENY '
  276 25098 DROP       all  --  any    any     anywhere
anywhere

Chain lo_In_RULE_0 (1 references)
 pkts bytes target     prot opt in     out     source
destination
10736  644K LOG        all  --  any    any     anywhere
anywhere            LOG level info prefix `RULE 0 -- ACCEPT '
10736  644K ACCEPT     all  --  any    any     anywhere
anywhere

Chain lo_Out_RULE_0 (1 references)
 pkts bytes target     prot opt in     out     source
destination
10736  644K LOG        all  --  any    any     anywhere
anywhere            LOG level info prefix `RULE 0 -- ACCEPT '
10736  644K ACCEPT     all  --  any    any     anywhere
anywhere


thanks

Saurabh

On 1/26/07, Ted Phelps <phelps@gnusto.com> wrote:
> "Saurabh Mehrotra" writes:
> > I am using Red Hat Enterprise Linux AS release 4 (Nahant Update 3) with
> > Kernel 2.6.9-34.ELsmp #1
> >
> > I am using Iptables for firewall .
> >
> > But without firewall I m able to nslookup my own DNS server but whenever I
> > enabled firewall I am not able to nslookup to my own system.
>
> It sounds like your firewall is blocking DNS traffic.
>
> You'll have to show us your firewall rules if we're going to be able to
> help you:
>
>     iptables -v -L
>
> Cheers,
> -Ted
>

