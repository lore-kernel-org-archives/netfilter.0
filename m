From: Carl Michal <michal@physics.ubc.ca>
Subject: Re: ssh connections stalling
Date: Thu, 22 Oct 2009 13:36:04 -0700 (PDT)
Message-ID: <alpine.LNX.2.00.0910221327250.21366@spider.phas.ubc.ca>
References: <alpine.LNX.2.00.0910221138180.21365@spider.phas.ubc.ca> <200910222224.15040.karl@hiramoto.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <200910222224.15040.karl@hiramoto.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Karl Hiramoto <karl@hiramoto.org>
Cc: netfilter@vger.kernel.org

>
> Send your configuration,  as root or using sudo do:
>
> iptables -L -vn
> iptables -L -vn -t mangle
> iptables -L -vn -t nat
>
> --
> Karl Hiramoto
>

as configured by firehol:

iptables -L -vn 
Chain INPUT (policy DROP 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source               destination
     0     0 ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
    42  5534 in_world   all  --  *      *       0.0.0.0/0            0.0.0.0/0
     0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           state RELATED
     0     0 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0           limit: avg 1/sec burst 5 LOG flags 0 level 4 prefix  `'IN-unknown:''
     0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain FORWARD (policy DROP 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source 
destination
     0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           state RELATED
     0     0 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0           limit: avg 1/sec burst 5 LOG flags 0 level 4 prefix  `'PASS-unknown:''
     0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain OUTPUT (policy DROP 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source               destination
     0     0 ACCEPT     all  --  *      lo      0.0.0.0/0            0.0.0.0/0
     4   350 out_world  all  --  *      *       0.0.0.0/0            0.0.0.0/0
     0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           state RELATED
     0     0 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0           limit: avg 1/sec burst 5 LOG flags 0 level 4 prefix `'OUT-unknown:''
     0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain in_world (1 references)
  pkts bytes target     prot opt in     out     source               destination
    42  5534 in_world_all_c1  all  --  *      *       0.0.0.0/0            0.0.0.0/0
    40  5168 in_world_irc_c2  all  --  *      *       0.0.0.0/0            0.0.0.0/0
    40  5168 in_world_ftp_c3  all  --  *      *       0.0.0.0/0            0.0.0.0/0
    40  5168 in_world_ssh_s4  all  --  *      *       0.0.0.0/0            0.0.0.0/0
    40  5168 in_world_icmp_s5  all  --  *      *       0.0.0.0/0            0.0.0.0/0
     0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           state RELATED
    36  4773 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0           limit: avg 1/sec burst 5 LOG flags 0 level 4 prefix `''IN-world':''
    40  5168 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain in_world_all_c1 (1 references)
  pkts bytes target     prot opt in     out     source               destination
     2   366 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           state ESTABLISHED

Chain in_world_ftp_c3 (1 references)
  pkts bytes target     prot opt in     out     source               destination
     0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp spt:21 dpts:32768:61000 state ESTABLISHED
     0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp spt:20 dpts:32768:61000 state RELATED,ESTABLISHED
     0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp spts:1024:65535 dpts:32768:61000 state ESTABLISHED

Chain in_world_icmp_s5 (1 references)
  pkts bytes target     prot opt in     out     source               destination
     0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0           state NEW,ESTABLISHED

Chain in_world_irc_c2 (1 references)
  pkts bytes target     prot opt in     out     source               destination
     0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0 
0.0.0.0/0           tcp spt:6667 dpts:32768:61000 state ESTABLISHED

Chain in_world_ssh_s4 (1 references)
  pkts bytes target     prot opt in     out     source               destination
     0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp spts:1024:65535 dpt:22 state NEW,ESTABLISHED

Chain out_world (1 references)
  pkts bytes target     prot opt in     out     source               destination
     4   350 out_world_all_c1  all  --  *      *       0.0.0.0/0            0.0.0.0/0
     0     0 out_world_irc_c2  all  --  *      *       0.0.0.0/0            0.0.0.0/0
     0     0 out_world_ftp_c3  all  --  *      *       0.0.0.0/0            0.0.0.0/0
     0     0 out_world_ssh_s4  all  --  *      *       0.0.0.0/0            0.0.0.0/0
     0     0 out_world_icmp_s5  all  --  *      *       0.0.0.0/0            0.0.0.0/0
     0     0 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           state RELATED
     0     0 LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0           limit: avg 1/sec burst 5 LOG flags 0 level 4 prefix `''OUT-world':''
     0     0 DROP       all  --  *      *       0.0.0.0/0            0.0.0.0/0

Chain out_world_all_c1 (1 references)
  pkts bytes target     prot opt in     out     source               destination
     4   350 ACCEPT     all  --  *      *       0.0.0.0/0            0.0.0.0/0           state NEW,ESTABLISHED

Chain out_world_ftp_c3 (1 references)
  pkts bytes target     prot opt in     out     source               destination
     0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp spts:32768:61000 dpt:21 state NEW,ESTABLISHED
     0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp spts:32768:61000 dpt:20 state ESTABLISHED
     0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp spts:32768:61000 dpts:1024:65535 state RELATED,ESTABLISHED

Chain out_world_icmp_s5 (1 references)
  pkts bytes target     prot opt in     out     source               destination
     0     0 ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0           state ESTABLISHED

Chain out_world_irc_c2 (1 references)
  pkts bytes target     prot opt in     out     source               destination
     0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp spts:32768:61000 dpt:6667 state NEW,ESTABLISHED

Chain out_world_ssh_s4 (1 references)
  pkts bytes target     prot opt in     out     source               destination
     0     0 ACCEPT     tcp  --  *      *       0.0.0.0/0            0.0.0.0/0           tcp spt:22 dpts:1024:65535 state ESTABLISHED


iptables -L -vn -t mangle

Chain PREROUTING (policy ACCEPT 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source               destination

Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source               destination

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source               destination

Chain OUTPUT (policy ACCEPT 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source               destination

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source               destination

iptables -L -vn -t nat:

Chain PREROUTING (policy ACCEPT 789 packets, 138K bytes)
  pkts bytes target     prot opt in     out     source               destination

Chain POSTROUTING (policy ACCEPT 1 packets, 62 bytes)
  pkts bytes target     prot opt in     out     source               destination

Chain OUTPUT (policy ACCEPT 1 packets, 62 bytes)
  pkts bytes target     prot opt in     out     source               destination


