From: Stefan Mayr <stefan@mayr-stefan.de>
Subject: Re: Using DNAT and SNAT to do a local redirection does not work
 (want to do what rinetd does with iptables)
Date: Sat, 09 Jun 2007 21:25:51 +0200
Message-ID: <466AFEBF.6000609@mayr-stefan.de>
References: <46686B01.6080605@mayr-stefan.de>
	<4668A01A.9060304@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4668A01A.9060304@riverviewtech.net>
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

Grant Taylor wrote:
> On 6/7/2007 3:30 PM, Stefan Mayr wrote:
> 
> If you are using the loop back interface, this will not work.

An answer I often read but nobody says what's wrong with loopback. I
thought it depended on the rules of the scenarios (obviously too much
thinking involved here).

> 
> You are using the loop back interface. Loop back is a very special
> network interface.  If I recall correctly, it will only allow its self
> to talk to it.  Thus you can not NAT traffic in to the loop back
> interface.  The kernel will block this.  I think this is why you are
> seeing the RST packets.

I really have to thank you for this enlightenment.

> Try using a dummy network interface, or an ethernet interface that is
> not connected to any thing.

I used dummy0 and now my iptables ruleset works.

> You could also probably bind the address to the main ethernet interface
> and use ARPTables to prevent each node from responding to ARP request by
> preventing it from ever seeing the ARP request.  The ARP issue (as I'm
> sure you are aware) is why you usually use other interfaces.

That is why I used the loopback-device and my /etc/sysctl.conf contains
the following lines:
net.ipv4.conf.all.arp_ignore = 1
net.ipv4.conf.all.arp_announce = 2

So arp-requests/announces are always answered/sent from the right interface.

Now the lesson is learned, setup is up and running.

Thanks,

	Stefan







