From: "C. L. Martinez" <carlopmart@gmail.com>
Subject: Problems with a forward rule
Date: Fri, 11 May 2012 17:04:51 +0200
Message-ID: <CAEjQA5JVsMUizFWODGe+OT88owqbPU0=ZjtRugq6Eg8z1U3A=w@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=Mh6G9+Dq0UCiNNzHCtRuubw2Gb9gJ1I7WqkfWYOeXcY=;
        b=fMu+wK1VnraUVAXJCLmTcixHNMV3alioZhLuzxE6iCvSln7Q6PO43HoOVquhxUaM78
         tfzKgMB+oqwYF7B/XetU7Blyhjud83qVqY+LyAK9+agPttMYx53NiCtgIXcXTqCRDbTU
         DJ4GLSPEBz5X9ttA3CSQzk+UoPawuVvnHZ56QkU5qfEdYmuhPS0YZ6ir7UKHQ4ZXy/d6
         b+07+0LVOTuHjXX/amC3JJVJsED7oyVWCUtrhwhUOXei4Zmx9Rk4YgS8qvABvh3iblhk
         TgWR27c2JQMUQ6F8CIMR60oLm4iIj56/t9GHjZi/J5LtAAmG/wtFrmjqGxZvdfsv8F+O
         s0tw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

 I have setup the following rules in a centos6 gateway:

Chain INPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination
    6   300 TCPFLAGS   tcp  --  *      *       0.0.0.0/0
0.0.0.0/0
    6   300 ACCEPT     all  --  lo     *       0.0.0.0/0
0.0.0.0/0
    0     0 DROP       all  --  *      *       224.0.0.0/4
0.0.0.0/0
    0     0 DROP       all  --  *      *       0.0.0.0/0
224.0.0.0/4
    0     0 DROP       all  --  *      *       240.0.0.0/5
0.0.0.0/0
    0     0 DROP       all  --  *      *       0.0.0.0/0
10.196.129.255
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0           state RELATED,ESTABLISHED
    0     0 ACCEPT     icmp --  *      *       0.0.0.0/0
0.0.0.0/0           state NEW icmp type 8 limit: avg 1/sec burst 1
    0     0 SSH        tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp dpt:22 state NEW
    0     0 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0           LOG flags 0 level 4 prefix `IPT INPUT packet died:
'

Chain FORWARD (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0           state RELATED,ESTABLISHED
    0     0 ACCEPT     all  --  *      *       172.24.50.3
0.0.0.0/0           state NEW
    0     0 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0           LOG flags 0 level 4 prefix `IPT FORWARD packet
died: '

Chain OUTPUT (policy DROP 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source
destination
    6   300 TCPFLAGS   tcp  --  *      *       0.0.0.0/0
0.0.0.0/0
    6   300 ACCEPT     all  --  *      lo      0.0.0.0/0
0.0.0.0/0
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0           state NEW,RELATED,ESTABLISHED
    0     0 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0           LOG flags 0 level 4 prefix `IPT OUTPUT packet
died: '

Chain BADFLAGS (8 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0           LOG flags 0 level 4 prefix `IPT TCPFLAGS: '
    0     0 DROP       all  --  *      *       0.0.0.0/0
0.0.0.0/0

Chain SSH (1 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 ACCEPT     all  --  *      *       0.0.0.0/0
0.0.0.0/0           limit: avg 3/min burst 1
    0     0 LOG        all  --  *      *       0.0.0.0/0
0.0.0.0/0           LOG flags 0 level 4 prefix `IPT SSH connection too
fast: '
    0     0 DROP       all  --  *      *       0.0.0.0/0
0.0.0.0/0

Chain TCPFLAGS (2 references)
 pkts bytes target     prot opt in     out     source
destination
    0     0 LOG        tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           state INVALID LOG flags 0 level 4 prefix `IPT
INVALID: '
    0     0 DROP       tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           state INVALID
    0     0 BADFLAGS   tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp flags:!0x17/0x02 state NEW
    0     0 REJECT     tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp flags:0x12/0x12 state NEW reject-with
tcp-reset
    0     0 BADFLAGS   tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp flags:0x11/0x01
    0     0 BADFLAGS   tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp flags:0x18/0x08
    0     0 BADFLAGS   tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp flags:0x30/0x20
    0     0 BADFLAGS   tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp flags:0x05/0x05
    0     0 BADFLAGS   tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp flags:0x03/0x03
    0     0 BADFLAGS   tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp flags:0x06/0x06
    0     0 BADFLAGS   tcp  --  *      *       0.0.0.0/0
0.0.0.0/0           tcp flags:0x3F/0x00

All works ok, except when I try to restrict one host to go out via
external interface. My problem is with the following rule:

   0     0 ACCEPT     all  --  *      *       172.24.50.3
0.0.0.0/0           state NEW

If I try to restrict destination, doesn't works. For example using this rule:

iptables -A FORWARD -s 172.24.50.3 -d 1.1.1.0/24 -m state --state NEW -j ACCEPT

only works if I do:

 iptables -A FORWARD -s 172.24.50.3 -m state --state NEW -j ACCEPT

then, what am I doing wrong??
