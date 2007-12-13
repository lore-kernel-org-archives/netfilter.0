From: "Jacob Lear" <jlear@brammo.com>
Subject: RE: Network Communication Issues
Date: Thu, 13 Dec 2007 09:54:03 -0800
Message-ID: <003e01c83db1$25d10460$fe02a8c0@brammo.main>
References: <000b01c83ce4$71df9fb0$fe02a8c0@brammo.main> <4760800B.7040601@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4760800B.7040601@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

 
> Can we see the actual error message rather than a sanitized one?

[root@router ~]$ ping 192.168.1.11
PING 192.168.1.11 (192.168.1.11) 56(84) bytes of data.
64 bytes from 192.168.1.11: icmp_seq=0 ttl=128 time=1.45 ms
wrong data byte #30 should be 0x1e but was 0x8
#16     10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 8 0 6 4 8 0 6 4 8 0 6 4 1e
1f 20 1d 1e 1f
#48     20 21 1e 1f 20 21 1e 1f
64 bytes from 192.168.1.11: icmp_seq=1 ttl=128 time=0.092 ms
wrong data byte #30 should be 0x1e but was 0x72
#16     10 11 12 13 14 15 16 17 18 19 1a 1b 1c 1d 72 53 9 2 72 53 9 2 72 53
9 2 1e 1f 20 1d 1e 1f
#48     20 21 1e 1f 20 21 1e 1f

> I would initially question whether or not the problem is firewall related
or if you have crossed subnet masks.

Here's the ifconfig output for the two NICs on "router":

eth1      Link encap:Ethernet  HWaddr 00:15:C5:F1:9B:13
          inet addr:192.168.2.1  Bcast:192.168.2.255  Mask:255.255.255.0
          inet6 addr: fe80::215:c5ff:fef1:9b13/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:100525429 errors:0 dropped:0 overruns:0 frame:0
          TX packets:31105444 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:124476618047 (115.9 GiB)  TX bytes:26593739981 (24.7 GiB)
          Interrupt:169 Memory:f4000000-f4011100

eth2      Link encap:Ethernet  HWaddr 00:18:F8:09:48:6D
          inet addr:192.168.1.1  Bcast:192.168.1.255  Mask:255.255.255.0
          inet6 addr: fe80::218:f8ff:fe09:486d/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:84630 errors:0 dropped:0 overruns:0 frame:0
          TX packets:77754600 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:9127453 (8.7 MiB)  TX bytes:111588916824 (103.9 GiB)
          Interrupt:193 Base address:0xcc00

The Windows servers have similar settings. Each server has two NICs -- For
example, Fileshare has the main one configured as 192.168.2.10 with a mask
of 255.255.255.0 and Gateway 192.168.2.1. The DNS and WINS are set to point
to the two domain controllers. The second adapter is configured as
192.168.1.10 with a mask of 255.255.255.0. I've left everything else blank.

> Try disconnecting your internet connection for a few minutes (for
> safety) and disabling all firewalling all together and allow just straight
routing.  If this works, you know for sure that
> there is a problem in your firewall script.
> If that does not work can we get an output of iptables-save so that we see
your entire firewall as in kernel memory?

I'll try this later tonight or tomorrow night.

Thanks,
 
Jacob Lear
IT Systems Support Engineer

