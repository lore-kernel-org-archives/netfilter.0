From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: HUP
Date: Thu, 17 Mar 2005 13:03:13 +0100
Message-ID: <200503171203.j2HC3ENW024507@smtp26.wxs.nl>
References: <42392CD2.2000700@eccotours.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <42392CD2.2000700@eccotours.dyndns.org>
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
To: 'iptables' <netfilter@lists.netfilter.org>

Then indeed ip_conntrack must have a faulty connection in a bucket
somewhere. You might be able to get rid of it by flushing your tables
(reloading the firewall). Or rmmod the iptables modules.

I wouldn't worry too much about it though. It's probably the M$ client
behaving badly, not sending FINs correctly, or something like that. Many M$
clients are known to not close their connections correctly. It could
ofcourse also be a network hick-up, causing the client to forcably
disconnect but never closing the connection on TCP/IP level.

A reboot or reloading of the ip_conntrack module should fix it. Again, don't
worry too much about it. Better make sure your Terminal Services are
configured with idle session time-out limits etc.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Brent Clark
Sent: 17 March 2005 08:08
To: iptables
Subject: Re: HUP

Sietse van Zanen wrote:
>  Logon to the server.
> 
> Start Terminal Services manager and kill the connection
> 
> 
> So far for stating the obvious.

Hi

Thanks for this, but I acctually had first tried this.

On logging on, I have found that with the Terminal Services manager, there
literally no connections (no even disconnected sessions ) at the present
time .

So im not sure if this is an old entry on the ip_conntrack or what, but it
is been displayed when I try

conntrack-viewer.pl and / or  netstat-nat

weird.

Thanks
Kind Regards

Brent Clark



