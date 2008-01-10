From: "Jovanny Saravia" <jovanny.saravia@gmail.com>
Subject: Avoiding drops in GigaEthernet Interfaces
Date: Thu, 10 Jan 2008 09:16:27 -0500
Message-ID: <2eaa5dfd0801100616k2d30a150tb8f1d9f8ff8cbbc8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
        bh=TAYBT4GF3oEzZFBQMDqN2dzu3T2O9By9XVwvlFXKMhQ=;
        b=UNQdSIeRtvK6IP2f+el82NjXMfFlfmPqORAQlfuMPQWeT27MWv8mPWbgJVfIWeq/KHBLoFF++yTWngsvA5dDuL50chSJMOj3iE62VOaKHR4sz8nSKJnkXuFA+04c8SU1rK7iboTKkmzxnM4RgBnzsyGspQa8pGbmEETJ3o/uxbg=
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi to all in the list,

I am having a problem for more than 2 weeks, and I hope I can found
the solution here

Scenario:

Actually I have a linux box connected to a Cisco SW 4507, they are
connected through 2 Giga interfaces using 8021Q. One of the interfaces
receive the traffic (inbound eth1 with 2 subinterfaces) and then
forward to the other interface (outbound eth0 with 1 subinterface).

Behind of the SW there is a Cisco router connected and establishing a
BGP connection with the linux box using quagga -> bgpd. As there are 2
connections then exists 2 neighbors in this BGP connection. Also the
linux box has netfilter installed, and for some networks apply NAT
rules. These are the features for the linux

- Fedora Core release 6 (Zod)
- 2 Intel(R) Xeon(R) CPU 2.33GHz
- 4 Gigas in Memory
- 2.6.22.9-61.fc6 x86_64
Problem:

Normally the traffic is between 40M to 300M every day. The problem
starts when the traffic raise more than 200M, then I start to see
drops in the interfaces in RX, the TX has no problems (although in low
traffic sometimes apeears some litte drops in RX). I am measuring
every minute for both interfaces in RX, and for example yesterday I
saw the following number of packets drops in the interfaces:

--------------------------------------------
2008-01-09 11:01:33: eth0 3
2008-01-09 11:02:33: eth0 160
2008-01-09 11:03:33: eth0 1520
2008-01-09 11:04:33: eth0 147
2008-01-09 11:05:33: eth0 50
2008-01-09 11:06:33: eth0 92
2008-01-09 11:07:33: eth0 81
2008-01-09 11:08:33: eth0 101
2008-01-09 11:09:33: eth0 260
2008-01-09 11:10:33: eth0 5850
2008-01-09 11:11:33: eth0 401
2008-01-09 11:12:33: eth0 275
2008-01-09 11:13:33: eth0 2966
2008-01-09 11:14:34: eth0 4601
2008-01-09 11:15:34: eth0 201
--------------------------------------------
2008-01-09 11:01:33: eth1 12
2008-01-09 11:02:33: eth1 47
2008-01-09 11:03:33: eth1 1943
2008-01-09 11:04:33: eth1 91
2008-01-09 11:05:33: eth1 1
2008-01-09 11:06:33: eth1 6
2008-01-09 11:07:33: eth1 46
2008-01-09 11:08:33: eth1 40
2008-01-09 11:09:33: eth1 27
2008-01-09 11:10:33: eth1 116
2008-01-09 11:11:33: eth1 251
2008-01-09 11:12:33: eth1 129
2008-01-09 11:13:33: eth1 1291
2008-01-09 11:14:34: eth1 61
2008-01-09 11:15:34: eth1 103
--------------------------------------------
Normally the system could work with this drops, but sometimes the BGP
connection is lost because the keepalives are not received in the
linux box. Altough I increased the timers to 30 90 in BGP, sometimes
this BGP connection is lost again.

I would like to avoid this drops, I tried to increase backlog
parameters in the kernel and the number of drops are decreased a
little, however the drops appears when the traffic increase during the
day, even in low traffic appears few times some drop packet. In the
cisco SW 4507 any drops neither errors appears so I discarded every
physical problem.

These are the kernel parameters that I changed:

net.core.wmem_max = 67108864
net.core.rmem_max = 67108864
net.ipv4.tcp_wmem = 4096 65536 67108864
net.ipv4.tcp_rmem = 4096 87380 67108864
net.netfilter.nf_conntrack_max = 2048000
net.core.netdev_max_backlog = 4096000
net.ipv4.tcp_max_syn_backlog = 4096000
txqueuelen:10000 in both interfaces eth0 and eth1
After of this I downloaded conntrack package to see if maybe the drops
could be there because netfilter, and I see this message:

nfnl_listen: recvmsg overrun: No buffer space available

For that reason I changed from 67108864 to 134217728 in the kernel
parameter and the drops remains. I am writing this post, hoping
someone here give me some lights to avoid these drops.

So if someone here knows what I need to do in order to avoid these
drops, please let me know

Any help will be so much appreciated

-- 
Jovanny Saravia
Solutions Manager
e-solutions Ltda
jovanny.saravia@gmail.com
+57-310-7676163
