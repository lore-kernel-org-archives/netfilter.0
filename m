From: Vects <netfilter@vects.com>
Subject: iptables/ipset caused packet drops on interfaces
Date: Tue, 14 Jul 2009 12:04:40 +0300
Message-ID: <1247562280.5215.97.camel@vects1.nivki.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello there,
I'm using iptables/ipsets on busy linux firewall, this firewall handles
300-400 Mb/s during the working hours, time to time I see significant
traffic drop and ksoftirqd/1 uses 100% cpu, in this situation I do
stop/start iptables, after that network traffic and ksoftirqd returned
to be normal.
First I thought this is a problem with network card driver, changing the
driver didn't help, then I found that it depends from the number of
ipsets in iptables. 

I'm using iptables 1.4.4 and ipset 3.0, I tested it on centos with
original kernel and custom compiled 2.6.31, the same result.

There's an output of ifconfig 

eth0      Link encap:Ethernet  HWaddr 00:19:BB:2D:98:D4  
          inet addr:x.x.x.x  Bcast:x.x.x.x  Mask:255.255.255.248
          inet6 addr: fe80::219:bbff:fe2d:98d4/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:34773084524 errors:0 dropped:19709680 overruns:0 frame:0
          TX packets:26672945752 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:3000 
          RX bytes:34484441962468 (31.3 TiB)  TX bytes:7277712977419 (6.6 TiB)
          Interrupt:185 Memory:f8000000-f8012800 


What else I can do in order to solve that problem? I'll appreciate any
input.

Thanks, Serge.





