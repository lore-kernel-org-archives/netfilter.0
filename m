From: Vects <netfilter@vects.com>
Subject: Re: iptables/ipset caused packet drops on interfaces
Date: Tue, 14 Jul 2009 13:26:55 +0300
Message-ID: <1247567215.5215.122.camel@vects1.nivki.net>
References: <1247562280.5215.97.camel@vects1.nivki.net>
	 <alpine.DEB.2.00.0907141116030.32574@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0907141116030.32574@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org

On Tue, 2009-07-14 at 11:19 +0200, Jozsef Kadlecsik wrote:
> On Tue, 14 Jul 2009, Vects wrote:
> 
> > I'm using iptables/ipsets on busy linux firewall, this firewall handles
> > 300-400 Mb/s during the working hours, time to time I see significant
> > traffic drop and ksoftirqd/1 uses 100% cpu, in this situation I do
> > stop/start iptables, after that network traffic and ksoftirqd returned
> > to be normal.
> > First I thought this is a problem with network card driver, changing the
> > driver didn't help, then I found that it depends from the number of
> > ipsets in iptables. 
> 
> How did you verify that? What kind of sets do you use?
I set up similar test environment, generated traffic by iperf, set up
iptables/ipset rules with all accept, started to get drops, removed few
rules until it got back to normal. 
Another day I did the same sort of tests with some commercial traffic
generator tool and got the same result.
Mostly I'm using iphash ipsets with few nethash type, the biggest ipset
has 4000 IPs

>  
> > I'm using iptables 1.4.4 and ipset 3.0, I tested it on centos with
> > original kernel and custom compiled 2.6.31, the same result.
> > 
> > There's an output of ifconfig 
> > 
> > eth0      Link encap:Ethernet  HWaddr 00:19:BB:2D:98:D4  
> >           inet addr:x.x.x.x  Bcast:x.x.x.x  Mask:255.255.255.248
> >           inet6 addr: fe80::219:bbff:fe2d:98d4/64 Scope:Link
> >           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
> >           RX packets:34773084524 errors:0 dropped:19709680 overruns:0 frame:0
> >           TX packets:26672945752 errors:0 dropped:0 overruns:0 carrier:0
> >           collisions:0 txqueuelen:3000 
> >           RX bytes:34484441962468 (31.3 TiB)  TX bytes:7277712977419 (6.6 TiB)
> >           Interrupt:185 Memory:f8000000-f8012800 
> 
> It'd be good to know the type of the network card and any settings to 
> tune the driver or the stack.
This is HP ProLiant DL360 G5, there are two Broadcom NetXtreme II
Gigabit Ethernet Driver bnx2 v1.8.5b (Feb 9, 2009).

I set up max rx ring 

Ring parameters for eth1/eth0:
Pre-set maximums:
RX:             4080
RX Mini:        0
RX Jumbo:       16320
TX:             255
Current hardware settings:
RX:             4080
RX Mini:        0
RX Jumbo:       0
TX:             255

txqueuelen increased to 3000

net.ipv4.netfilter.ip_conntrack_max=14316556

Thanks, Serge.
> 
> Best regards,
> Jozsef
> -
> E-mail  : kadlec@blackhole.kfki.hu, kadlec@mail.kfki.hu
> PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
> Address : KFKI Research Institute for Particle and Nuclear Physics
>           H-1525 Budapest 114, POB. 49, Hungary

