From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: two subnets...
Date: Wed, 01 Aug 2007 20:11:39 -0500
Message-ID: <46B12F4B.10603@riverviewtech.net>
References: <46ADBDF0.3020200@mp.pl>	<46AF4FC7.1000500@riverviewtech.net>	<46AF8D63.8080900@interia.pl>	<46AF9694.1060709@riverviewtech.net>	<46AFBA57.3040702@mailinator.com>	<46B0E9B3.6050008@interia.pl>	<46B0F7B1.7040805@riverviewtech.net>
	<46B10CCE.9040507@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46B10CCE.9040507@interia.pl>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 8/1/2007 5:44 PM, Pawel Zawora wrote:
> Stupid  question:  Is  it possible to filter packet based on src or 
> dst IP? or using TCP state (contrack, port, flags)

Yes, you can filter based on port.  To do connection state filtering I 
think you will need to use IPTables.  With the Bridged IP/ARP Netfilter 
code you can use all of IPTables features on layer 2 in the bridge and 
not have to worry about crossing subnets.

> Yes, It it so complex

Indeed, probably too complex.

> I have one "big" subnet (assume 1.1.1.0/24) now I want remove 3 
> machines (1.1.1.98 - 100) to separete "small" subnet  "small" subnet: 
> It is enough to change subnet size to  /29 and define new default gw 
> router - I need to create 1 additional routing  table that will send 
> data to my smal subnet based on dst address "big" subnet - I have to 
> told *each* machine: send packet to GW even 1.1.1.98... seems be in 
> local network.

Again, I'm a bit confused as to whether or not you want the machines you 
are moving to a different network to be able to communicate with the 
machines that are staying on the big network or not.  Let me ask it a 
different way, what is your reasoning / motivation for moving the 
machines in question to a different network?

> Similarly thinks are done in DR (in this case I dont need to create 
> extra routing rules ) But probably I cannot use DR mechanism  in my 
> situation...

Again, will you please try to explain more of your situation (if you 
can) as to what you have now and what you are wanting to achieve and why 
you are going that route.  In other words, what is your original problem 
/ desire?

> After this I can create any iptables rules on the router..........

Yes.  The bridge is as much a real interface as any ppp interface, so 
you can do just about any thing you want to with it.

> Thank you for explanation

You are welcome.

> Probably bridging is easiest way to solve my problem....

Probably.  Though I can not say for sure with out knowing more about 
your situation.  I keep asking, because bridging is a very good solution 
in a lot of situations, but what you do with it is how you tune the 
bridging setup to your environment.

> Does snort work correctly on brigde server?

I see no reason why it would not.  I have successfully ran any and all 
utilities against a bridge interface with out a problem.  TCPDump, DHCP, 
any web server / dns server / mail server, just about any thing.  The 
only draw back that I see with using a bridge for Snort is that you 
can't physically cut the transmit line so you have to use the no arp 
methods to stop arp replies.

> What is the best way to trace and log tcp connections  in that 
> scenario?

Probably the same thing that you are doing now.  TCPDump, Snort should 
work, libpcap, you name it.

> Thank you

You are welcome.



Grant. . . .

P.S.  If you would be more comfortable discussing details off of news 
group just drop me a line.

