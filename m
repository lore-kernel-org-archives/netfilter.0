From: "Shawn Wright" <swright@sls.bc.ca>
Subject: Performance problems 2.4.x kernel
Date: Wed, 01 Dec 2004 21:34:25 -0800
Message-ID: <41AE38E1.6107.ABD312CB@localhost>
Reply-To: swright@sls.bc.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

I'm not sure what information is most relevant, so I will try to 
describe our problem, and the conditions that produce it:

Linux firewall for approx 500 clients, 10Mb internet connection, 
most traffic from squid proxy inside firewall, routed through to 
internet. (not NATed, although some NAT is used for other 
hosts).
Several weeks ago, web response slowed down, with frequent 
delays on initial connections to sites, occasional timeouts. In 
each case, repeat visits were usually quick. DNS issues ruled 
out after checking. Assumed problem was overloaded squid 
proxy. Replaced with dual load balanced proxies, no help. 
Bypassed proxy for testing, and used NAT only, still had 
problems. 
Finally, replaced firewall with a different box, experienced 
lockups with 2 SMP boxes using 2.4.22-37mdk kernel. 
Switched to UP kernel and lockups went away, performance 
improved, on new firewall box.

So now we have a new firewall box as follows that runs well:
P3/667, 768Mb
Mandrake 9.2, 2.4.22-37-mdk kernel
Shorewall 2.0.10 with iptables 1.2.8
Intel E100B using EEPro100 driver, 10FD mode
DLink DFE500TX using Tulip driver, 100FD mode
Peak load is 98% use of 10Mb line, typical avg 30%
Peak ip_conntrack count ~3-4000
CPU load <10% peak

Original box was then reconfigured to match above as closely 
as possible, except:
PPro 200, 256Mb

Immediately, intermittent web delays were evident after 
browsing sites at random. Speedtests still gave 1000kB/s+ 
speeds from test site, same as with "good" firewall above, so 
throughput is not a problem once connection is established.

I tried this in /etc/modules.conf, after reading an article on 
hashsize vs ip_conntrack entries on dedicated firewalls:
options ip_conntrack hashsize=65536
It made no difference.

Tried e100 driver instead of eepro100. No difference.
Tried 2x tulip cards, no difference.
Tried vanilla 2.4.28 kernel, 2 tulip cards, latest iptables, still no 
difference.

CPU load while loading the connection to 1000kB/s+ was 
never over 15% system, usually around 5-6% for the PPro200 
CPU. The load can be very light (<10% util on link) when 
problems occur, so load doesn't seem to be a factor.

I'd appreciate any advice on what to look into further to get to 
the bottom of this. 

Thanks.
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
Shawn Wright, I.T. Manager
Shawnigan Lake School
http://www.sls.bc.ca
swright@sls.bc.ca



