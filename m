From: "Shawn Wright" <swright@sls.bc.ca>
Subject: RE: Using old CPU for 100s of clients
Date: Fri, 03 Dec 2004 13:57:10 -0800
Message-ID: <41B070B6.23668.B47D46A8@localhost>
References: <7C9884991ADAE0479C14F10C858BCDF591E3A1@alderaan.smgtec.com>
Reply-To: swright@sls.bc.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <7C9884991ADAE0479C14F10C858BCDF591E3A1@alderaan.smgtec.com>
Content-description: Mail message body
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
Content-Type: text/plain; charset="us-ascii"
To: Daniel Chemko <dchemko@smgtec.com>, netfilter@lists.netfilter.org

On 3 Dec 2004 at 12:22, Daniel Chemko wrote:

> The Speed problems may not be isolated to your CPU. You'll want to make
> sure your conntrack table isn't getting full, and that conntracks are
> safely getting expired from your system. Are you using a custom kernel,
> or a stock distro one?

Thanks for the reply. I didn't give many details because I've already beat 
this to death on the Shorewall list before coming here (I know, I should 
have started here). It is a custom kernel, as all of the recent stock kernels 
will not boot on this machine - APIC must be disabled (it's an old DEC 
Prioris). I have tried 2.4.22, two different Mandrake releases, along with a 
plain 2.4.28 from kernel.org. It is possible that I've messed up somehow, 
so I plan on taking a stock 2.4.22-37mdk kernel that currently runs well on 
a P3/667, and compile it, making no change except for CPU support and 
APIC. This might help isolate the problem.

> Just for fun, could you forward me the following:
> 
> # cat /proc/loadavg
Load average *never* goes above 0.3, currently all zeros...
I don't believe the system CPU% factors into the loadavg though?

> # free
             total       used       free     shared    buffers     cached
Mem:        223208     219472       3736          0          0     127028
-/+ buffers/cache:      92444     130764
Swap:       409616          0     409616

> # iostat 20 2 (sysstat package is nice for accounting)
don't have this installed, although I plan to... 

> # top (grab the CPU lines, over time is best)
top will show up to ~13% system CPU% during a load test when I pass 
1000kB/s + across the 10Mb link. Otherwise, it is rarely over 5% system.

> # cat /proc/slabinfo
I've looked at this also - our peak conntrack count is around 4000, max is 
set to 16K. I've also tried it at 64K, and set the hashsize upon load of 
ip_conntrack module to 64K, just for fun, made no difference.

> # cat /proc/net/ip_conntrack | wc -l
Usually around 1500, but I have seen 4000 peak. 

> # hdparm /dev/<your disk(s)>
This is from the "bad" machine. All machines use a 3940 PCI SCSI with 
aic7xxx driver, and one or more Seagate Cheetah 10K 9Gb drives.

/dev/sda:
 readonly     =  0 (off)
 geometry     = 1106/255/63, sectors = 17783240, start = 0

> # cat /proc/sys/net/ipv4/netfilter/ip_conntrack_max
Tried 16k and 64k...

> # netstat -i
This is from current live firewall (the good one). The bad one has been 
rebooted since the last time I tried it live, so no data.
Kernel Interface table
Iface     MTU Met   RX-OK RX-ERR RX-DRP RX-OVR   TX-OK TX-ERR TX-DRP TX-OVR Flg
eth0       1500   058662850      1      0      074520718      3      0      0 BMRU
eth1       1500   074674696      0      0      057280898      0      0      0 BMRU
lo        16436   0   89156      0      0      0   89156      0      0      0 LRU

> # mii-tool
I've used this exhaustively to check the NICs are setup right. The outside 
NIC goes to a Cat1900 forced 10FD, and they are notoriously bad at 
playing nice with NICs. No errors though as you can see above on eth1.
The inside link is 100Mb FD to a Cat 3500, and again no errors. Current 
NICs are one Intel E100B (eepro100 driver), and a Dlink DFE500TX (tulip 
driver). I have tried all combinations of e100/eepro100/tulip with half a 
dozen different NICs, no change in symptoms.

I should mention that we can reproduce the problem within a few minutes 
of hitting random web sites, waiting for one to "hang". We've eliminated 
our DNS and proxy as sources of the problem - it occurs when bypassing 
proxy and NATing through firewall. Have tried 3 different DNS servers, 
squid reports avg DNS times of < 100ms. We're talking up to 20sec 
delays before getting data from a website, even timeouts. A second visit 
to same site, different pages, is quick. To duplicate we need to hit random 
sites, but can do so within a few minutes, even when network load is low.

> wow.. there are a lot of areas to look into.. Anyways, hope to find
> something.

So do I...
 
> Good ol' BC boy!

Nice to hear from someone nearby! :-)

Thanks!
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
Shawn Wright, I.T. Manager
Shawnigan Lake School
http://www.sls.bc.ca
swright@sls.bc.ca



