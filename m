From: Michael Gale <michael.gale@utilitran.com>
Subject: Re: Using old CPU for 100s of clients
Date: Fri, 03 Dec 2004 18:27:49 -0700
Message-ID: <41B11295.6050304@utilitran.com>
References: <41B070B6.23668.B47D46A8@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41B070B6.23668.B47D46A8@localhost>
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
To: swright@sls.bc.ca, netfilter@lists.netfilter.org

Hello,

	Why type of NICS are you using ?

With random slowness it could be anything ... for example:

I used to work as Escalations person for a security appliance company.
We had this customer call in on a regular bases because his network
performance was crap.

 From the start our suggestion was to replace his network cards ... but
he would not listen. He was using old desktop based cards, as most
manufactures create desktop and server class nics.

Desktop based nics have mid sized receive buffers and small out going
buffers. This is because as a rule desktop PC's receive more data then
they send.

Using these nic's in a server can have serious performance impacts with
regards to network traffic. So it would not matter how many network
cards you tried ... if you are not using server class nices ... then
your network throughput would be crap.

What type of PC is a DEC Prioris ?

The performance problem could be related to the poor design and lack of
performance in the PC.

For example I have a PC with PIII 1Ghz with 384 MB of RAM running
slackware linux. I just put in a Seagate Baracuda 200GB 7200 RPM drive
so this box should be screaming. But I find it slow ... from the testing
I have done ... all I can think of is because it is a Compac NE... which
is this little PC only big enough for 1CD-rom, 1 HDD and 1 FD0 ... that
is all ... nothing else will fit in there.

If I am using the HDD and nothing else not to bad if I am copying data
from the CD-rom to the HDD the machine crawls to the point where you can
not do anything.

At work ... I have standard PC ... with a fake Pentium, older drive but
I can burn CD's, still use my fluxbox plus listen to mp'3  with XMMS --
I also use 3D desktop to switch desktops.

So as you can see ... there are so many factors. So I don't think it is
the CPU that is causing the slow down ... just everything else in the box.

Michael.	


Shawn Wright wrote:
> On 3 Dec 2004 at 12:22, Daniel Chemko wrote:
> 
> 
>>The Speed problems may not be isolated to your CPU. You'll want to make
>>sure your conntrack table isn't getting full, and that conntracks are
>>safely getting expired from your system. Are you using a custom kernel,
>>or a stock distro one?
> 
> 
> Thanks for the reply. I didn't give many details because I've already beat 
> this to death on the Shorewall list before coming here (I know, I should 
> have started here). It is a custom kernel, as all of the recent stock kernels 
> will not boot on this machine - APIC must be disabled (it's an old DEC 
> Prioris). I have tried 2.4.22, two different Mandrake releases, along with a 
> plain 2.4.28 from kernel.org. It is possible that I've messed up somehow, 
> so I plan on taking a stock 2.4.22-37mdk kernel that currently runs well on 
> a P3/667, and compile it, making no change except for CPU support and 
> APIC. This might help isolate the problem.
> 
> 
>>Just for fun, could you forward me the following:
>>
>># cat /proc/loadavg
> 
> Load average *never* goes above 0.3, currently all zeros...
> I don't believe the system CPU% factors into the loadavg though?
> 
> 
>># free
> 
>              total       used       free     shared    buffers     cached
> Mem:        223208     219472       3736          0          0     127028
> -/+ buffers/cache:      92444     130764
> Swap:       409616          0     409616
> 
> 
>># iostat 20 2 (sysstat package is nice for accounting)
> 
> don't have this installed, although I plan to... 
> 
> 
>># top (grab the CPU lines, over time is best)
> 
> top will show up to ~13% system CPU% during a load test when I pass 
> 1000kB/s + across the 10Mb link. Otherwise, it is rarely over 5% system.
> 
> 
>># cat /proc/slabinfo
> 
> I've looked at this also - our peak conntrack count is around 4000, max is 
> set to 16K. I've also tried it at 64K, and set the hashsize upon load of 
> ip_conntrack module to 64K, just for fun, made no difference.
> 
> 
>># cat /proc/net/ip_conntrack | wc -l
> 
> Usually around 1500, but I have seen 4000 peak. 
> 
> 
>># hdparm /dev/<your disk(s)>
> 
> This is from the "bad" machine. All machines use a 3940 PCI SCSI with 
> aic7xxx driver, and one or more Seagate Cheetah 10K 9Gb drives.
> 
> /dev/sda:
>  readonly     =  0 (off)
>  geometry     = 1106/255/63, sectors = 17783240, start = 0
> 
> 
>># cat /proc/sys/net/ipv4/netfilter/ip_conntrack_max
> 
> Tried 16k and 64k...
> 
> 
>># netstat -i
> 
> This is from current live firewall (the good one). The bad one has been 
> rebooted since the last time I tried it live, so no data.
> Kernel Interface table
> Iface     MTU Met   RX-OK RX-ERR RX-DRP RX-OVR   TX-OK TX-ERR TX-DRP TX-OVR Flg
> eth0       1500   058662850      1      0      074520718      3      0      0 BMRU
> eth1       1500   074674696      0      0      057280898      0      0      0 BMRU
> lo        16436   0   89156      0      0      0   89156      0      0      0 LRU
> 
> 
>># mii-tool
> 
> I've used this exhaustively to check the NICs are setup right. The outside 
> NIC goes to a Cat1900 forced 10FD, and they are notoriously bad at 
> playing nice with NICs. No errors though as you can see above on eth1.
> The inside link is 100Mb FD to a Cat 3500, and again no errors. Current 
> NICs are one Intel E100B (eepro100 driver), and a Dlink DFE500TX (tulip 
> driver). I have tried all combinations of e100/eepro100/tulip with half a 
> dozen different NICs, no change in symptoms.
> 
> I should mention that we can reproduce the problem within a few minutes 
> of hitting random web sites, waiting for one to "hang". We've eliminated 
> our DNS and proxy as sources of the problem - it occurs when bypassing 
> proxy and NATing through firewall. Have tried 3 different DNS servers, 
> squid reports avg DNS times of < 100ms. We're talking up to 20sec 
> delays before getting data from a website, even timeouts. A second visit 
> to same site, different pages, is quick. To duplicate we need to hit random 
> sites, but can do so within a few minutes, even when network load is low.
> 
> 
>>wow.. there are a lot of areas to look into.. Anyways, hope to find
>>something.
> 
> 
> So do I...
>  
> 
>>Good ol' BC boy!
> 
> 
> Nice to hear from someone nearby! :-)
> 
> Thanks!
> -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> Shawn Wright, I.T. Manager
> Shawnigan Lake School
> http://www.sls.bc.ca
> swright@sls.bc.ca
> 
> 
> 
> 
> 
> 
> 

-- 
Michael Gale
Lan Administrator
Utilitran Corp.

Linux: because a PC is a terrible thing to waste !!!


