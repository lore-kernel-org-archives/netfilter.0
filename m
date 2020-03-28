From: Reindl Harald <h.reindl@thelounge.net>
Subject: Re: What is the BEST GUI frontend to iptables firewall?
Date: Sat, 28 Mar 2020 07:55:08 +0100
Message-ID: <8c378f9a-3948-2700-0c1c-a72b87c221b6@thelounge.net>
References: <65bb6d398e79b3d924f518d20f40b48e@teo-en-ming.com>
 <20200327172834.owufzw7dsjmidxvx@egarver>
 <28cbaf8218c0ba0f7463103ab80c58b9@teo-en-ming.com>
 <c04820af-48de-a8b1-8e17-991a77e3aa66@thelounge.net>
 <f9552aba86b3abf2245369eb4ba69d03@teo-en-ming.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <f9552aba86b3abf2245369eb4ba69d03@teo-en-ming.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming.com>
Cc: netfilter@vger.kernel.org



Am 28.03.20 um 07:49 schrieb Turritopsis Dohrnii Teo En Ming:
> On 2020-03-28 14:38, Reindl Harald wrote:
>> Am 28.03.20 um 02:30 schrieb Turritopsis Dohrnii Teo En Ming:
>>
>>> I think Cockpit functions like Webmin. Please correct me if I am wrong.
>>>
>>> What is output and forward filtering?
>>
>> Chain OUTPUT and Chain FORWARD?
>> outgoing traffic and forwarding traffic aka router
> 
> That means I can't configure a Linux router using firewalld?

firewalld is a toy for ordinary endusers and a *firewall* which deserves
that name is not just open ports form A to B

-----------------------------------------------------------------------------------------------
IPV4 TABLE MANGLE (STATEFUL PRE-NAT/FILTER)
-----------------------------------------------------------------------------------------------
Chain PREROUTING (policy ACCEPT 3 packets, 180 bytes)
num   pkts bytes target     prot opt in     out     source
 destination
1      987  132K ACCEPT     all  --  *      *       0.0.0.0/0
 0.0.0.0/0            ctstate RELATED,ESTABLISHED
2        3   180 INBOUND    all  --  wan    *       0.0.0.0/0
 0.0.0.0/0            ctstate NEW ! match-set EXCLUDES_IPV4 src
3        0     0 DROP       all  --  *      *       0.0.0.0/0
 0.0.0.0/0            ctstate INVALID

Chain INPUT (policy ACCEPT 715 packets, 44677 bytes)
num   pkts bytes target     prot opt in     out     source
 destination

Chain FORWARD (policy ACCEPT 275 packets, 87830 bytes)
num   pkts bytes target     prot opt in     out     source
 destination

Chain OUTPUT (policy ACCEPT 664 packets, 253K bytes)
num   pkts bytes target     prot opt in     out     source
 destination

Chain POSTROUTING (policy ACCEPT 939 packets, 341K bytes)
num   pkts bytes target     prot opt in     out     source
 destination

Chain INBOUND (1 references)
num   pkts bytes target     prot opt in     out     source
 destination
1        0     0 LD_SCAN    all  --  *      *       0.0.0.0/0
 0.0.0.0/0            match-set PORTSCAN_PORTS dst ! match-set
HONEYPOT_IPS_IPV4 dst
2        0     0 IPST_ALL   all  --  *      *       0.0.0.0/0
 0.0.0.0/0            recent: CHECK seconds: 2 hit_count: 200 name: all
side: source mask: 255.255.255.255
3        0     0 LD_R_ALL   all  --  *      *       0.0.0.0/0
 0.0.0.0/0            recent: UPDATE seconds: 2 hit_count: 150 name: all
side: source mask: 255.255.255.255
4        3   180            all  --  *      *       0.0.0.0/0
 0.0.0.0/0            recent: SET name: all side: source mask:
255.255.255.255
5        0     0 LD_C_ALL   all  --  *      *       0.0.0.0/0
 0.0.0.0/0            #conn src/24 > 250
6        0     0 LD_C_ALL   all  --  *      *       0.0.0.0/0
 0.0.0.0/0            #conn src/32 > 120
7        0     0 LD_C_ALL   all  --  *      *       0.0.0.0/0
 0.0.0.0/0            #conn src/16 > 500
8        3   180 IN_TCP     tcp  --  *      *       0.0.0.0/0
 0.0.0.0/0
9        0     0 IN_DNS     all  --  *      *       0.0.0.0/0
 0.0.0.0/0            match-set DNS_PORT dst
10       0     0 DROP       all  --  *      *       172.16.0.0/24
 0.0.0.0/0

Chain IN_DNS (1 references)
num   pkts bytes target     prot opt in     out     source
 destination
1        0     0 LD_C_ALL   all  --  *      *       0.0.0.0/0
 0.0.0.0/0            #conn src/32 > 50
2        0     0 LD_R_ALL   all  --  *      *       0.0.0.0/0
 0.0.0.0/0            recent: UPDATE seconds: 2 reap hit_count: 60 name:
dns side: source mask: 255.255.255.255
3        0     0            all  --  *      *       0.0.0.0/0
 0.0.0.0/0            recent: SET name: dns side: source mask:
255.255.255.255

Chain IN_FTP (1 references)
num   pkts bytes target     prot opt in     out     source
 destination
1        0     0 LD_R_ALL   all  --  *      *       0.0.0.0/0
 0.0.0.0/0            recent: UPDATE seconds: 2 reap hit_count: 20 name:
ftp side: source mask: 255.255.255.255
2        0     0            all  --  *      *       0.0.0.0/0
 0.0.0.0/0            recent: SET name: ftp side: source mask:
255.255.255.255

Chain IN_SSH (1 references)
num   pkts bytes target     prot opt in     out     source
 destination
1        0     0 LD_R_ALL   all  --  *      *       0.0.0.0/0
 0.0.0.0/0            recent: UPDATE seconds: 60 reap hit_count: 15
name: ssh side: source mask: 255.255.255.255
2        3   180            all  --  *      *       0.0.0.0/0
 0.0.0.0/0            recent: SET name: ssh side: source mask:
255.255.255.255

Chain IN_TCP (1 references)
num   pkts bytes target     prot opt in     out     source
 destination
1        0     0 DROP       tcp  --  *      *       0.0.0.0/0
 0.0.0.0/0            tcp flags:!0x17/0x02
2        0     0 DROP       tcp  --  *      *       0.0.0.0/0
 0.0.0.0/0            tcpmss match 1:500
3        0     0 DROP       all  --  *      *       0.0.0.0/0
 0.0.0.0/0            match-set BLOCKED_DYNAMIC_MAIL_IPV4 src match-set
PORTS_MAIL dst
4        3   180 IN_SSH     tcp  --  *      *       0.0.0.0/0
 0.0.0.0/0            tcp dpt:10022
5        0     0 IN_FTP     tcp  --  *      *       0.0.0.0/0
 0.0.0.0/0            tcp dpt:21

Chain IPST_ALL (1 references)
num   pkts bytes target     prot opt in     out     source
 destination
1        0     0 NFLOG      all  --  *      *       0.0.0.0/0
 0.0.0.0/0            limit: avg 5/sec burst 5 nflog-prefix
"IPSET-All:" nflog-group 32
2        0     0 SET        all  --  *      *       0.0.0.0/0
 0.0.0.0/0            add-set BLOCKED_DYNAMIC_IPV4 src exist
3        0     0 DROP       all  --  *      *       0.0.0.0/0
 0.0.0.0/0

Chain LD_C_ALL (4 references)
num   pkts bytes target     prot opt in     out     source
 destination
1        0     0 NFLOG      all  --  *      *       0.0.0.0/0
 0.0.0.0/0            limit: avg 5/sec burst 5 nflog-prefix
"Connlimit-All:" nflog-group 32
2        0     0 DROP       all  --  *      *       0.0.0.0/0
 0.0.0.0/0

Chain LD_R_ALL (4 references)
num   pkts bytes target     prot opt in     out     source
 destination
1        0     0 NFLOG      all  --  *      *       0.0.0.0/0
 0.0.0.0/0            limit: avg 5/sec burst 5 nflog-prefix
"Ratelimit-All:" nflog-group 32
2        0     0 DROP       all  --  *      *       0.0.0.0/0
 0.0.0.0/0

Chain LD_SCAN (1 references)
num   pkts bytes target     prot opt in     out     source
 destination
1        0     0 NFLOG      all  --  *      *       0.0.0.0/0
 0.0.0.0/0            limit: avg 15/min burst 1 nflog-prefix
"Portscan:" nflog-group 33
2        0     0 SET        all  --  *      *       0.0.0.0/0
 0.0.0.0/0            add-set BLOCKED_DYNAMIC_PORTSCAN_IPV4 src exist
3        0     0 DROP       all  --  *      *       0.0.0.0/0
 0.0.0.0/0


-----------------------------------------------------------------------------------------------
IPV4 TABLE RAW (STATELESS PRE-CONNTRACK)
-----------------------------------------------------------------------------------------------
Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
num   pkts bytes target     prot opt in     out     source
 destination
1      862 55342 INBOUND    all  --  wan    *       0.0.0.0/0
 0.0.0.0/0
2      989  132K ACCEPT     tcp  --  *      *       0.0.0.0/0
 0.0.0.0/0
3        1   167 ACCEPT     udp  --  *      *       0.0.0.0/0
 0.0.0.0/0
4        0     0 ACCEPT     icmp --  *      *       0.0.0.0/0
 0.0.0.0/0
5        2    72 DROP       all  --  *      *       0.0.0.0/0
 0.0.0.0/0

Chain OUTPUT (policy ACCEPT 664 packets, 253K bytes)
num   pkts bytes target     prot opt in     out     source
 destination

Chain INBOUND (1 references)
num   pkts bytes target     prot opt in     out     source
 destination
1        0     0 DROP       all  --  *      *       0.0.0.0/0
 0.0.0.0/0            match-set BLOCKED_MERGED_IPV4 src
2        0     0 DROP       all  --  *      *       0.0.0.0/0
 0.0.0.0/0            match-set BLOCKED_DYNAMIC_PORTSCAN_IPV4 src
3      861 55175 IN_TCP     tcp  --  *      *       0.0.0.0/0
 0.0.0.0/0

Chain IN_TCP (1 references)
num   pkts bytes target     prot opt in     out     source
 destination
1        0     0 DROP       tcp  --  *      *       0.0.0.0/0
 0.0.0.0/0            tcp flags:0x3F/0x29
2        0     0 DROP       tcp  --  *      *       0.0.0.0/0
 0.0.0.0/0            tcp flags:0x3F/0x00
3        0     0 DROP       tcp  --  *      *       0.0.0.0/0
 0.0.0.0/0            tcp flags:0x11/0x01
4        0     0 DROP       tcp  --  *      *       0.0.0.0/0
 0.0.0.0/0            tcp flags:0x05/0x05
5        0     0 DROP       tcp  --  *      *       0.0.0.0/0
 0.0.0.0/0            tcp flags:0x30/0x20
6        0     0 CT         tcp  --  *      *       0.0.0.0/0
 0.0.0.0/0            tcp dpt:21 CT helper ftp
