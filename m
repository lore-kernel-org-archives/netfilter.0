From: don-temp288@isis.cs3-inc.com (Don Cohen)
Subject: Re: u32 question
Date: Sat, 19 Dec 2009 14:05:27 -0800
Message-ID: <19245.20007.976957.190984@isis.cs3-inc.com>
References: <65A33300-9897-4864-B702-3572DAAA96D1@kuketz.de>
	<19244.4533.960384.369148@isis.cs3-inc.com>
	<224D0884-3AD8-4F64-8D28-5F09D16CBFF4@kuketz.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <224D0884-3AD8-4F64-8D28-5F09D16CBFF4@kuketz.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


This example doesn't seem to work for me.
Does it work for anyone else out there?  

 $ iptables -A OUTPUT -m u32 --u32 "0>>22&0x3C@12>>26&0x3C@-3&0xFF=0:255"
  -j LOG --log-prefix "TCP with payload *** "
I've tried some examples without the @ and they seem to be working but
I don't get anything in the log when I do this:

 $ iptables -L OUTPUT -n -v
 Chain OUTPUT (policy ACCEPT 17M packets, 1045M bytes)
  pkts bytes target     prot opt in     out     source
 destination         
     0     0 LOG        all  --  *      *       0.0.0.0/0
 0.0.0.0/0           u32
 0x0>>0x16&0x3c@0xc>>0x1a&0x3c@0xfffffffd&0xff=0x0:0xff LOG flags 0
 level 4 prefix `TCP with payload *** ' 

(seems right)

 $ tcpdump -lenX -i wlan0 -c 4
 tcpdump: verbose output suppressed, use -v or -vv for full protocol
 decode
 listening on wlan0, link-type EN10MB (Ethernet), capture size 96 bytes
 13:02:48.661944 00:21:6b:40:06:7e > 00:80:c8:b9:a4:2f, ethertype IPv4
 (0x0800), length 114: 10.0.2.100.33306 > 66.166.0.98.ssh: P
 3799762522:3799762570(48) ack 1707553806 win 1067 <nop,nop,timestamp
 3419089842 694605510>
        0x0000:  4510 0064 6a44 4000 4006 80d4 0a00 0264 E..djD@.@......d
        0x0010:  42a6 0062 821a 0016 e27b c65a 65c7 340e B..b.....{.Ze.4.
        0x0020:  8018 042b 90d1 0000 0101 080a cbcb 2bb2 ...+..........+.
        0x0030:  2966 d6c6 c826 20cd 0b4c 0cf4 39cc 71e0 )f...&...L..9.q.
        0x0040:  ca4a 73c2 1058 d9e4 9cbd deec 0d10 f5f3 .Js..X..........
        0x0050:  0d32                                     .2
 13:02:48.691819 00:80:c8:b9:a4:2f > 00:21:6b:40:06:7e, ethertype IPv4
 (0x0800), length 114: 66.166.0.98.ssh > 10.0.2.100.33306: P 1:49(48)
 ack 48 win 60816 <nop,nop,timestamp 694607611 3419089842>
 ...
several more packets that ought to show up in the log

