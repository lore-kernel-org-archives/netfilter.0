From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: Overruns ?
Date: Thu, 19 Feb 2004 13:43:34 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077216213.1984.48.camel@ca.gts.nexusmgmt.com>
References: <20040219083222.7e4dc5a3@mgalepc.utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040219083222.7e4dc5a3@mgalepc.utilitran.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Michael Gale <michael.gale@utilitran.com>
Cc: netfilter@lists.netfilter.org

On Thu, 2004-02-19 at 10:32, Michael Gale wrote:
> Hello,
> 
> 	Not sure if this is the place to ask but when I do a ifconfig I see some
> overruns. I have tried google and man ifconfig but can not find what a "overrun"
> is.
> 
> eth0      Link encap:Ethernet  HWaddr 00:E0:81:25:A6:92  
>           inet addr:10.10.10.173  Bcast:10.10.10.255  Mask:255.255.255.0
>           UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
>           RX packets:9639161 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:9598780 errors:0 dropped:0 overruns:21 carrier:0
>           collisions:0 txqueuelen:100 
>           RX bytes:2726609687 (2600.2 Mb)  TX bytes:1986194437 (1894.1 Mb)
>           Interrupt:10 Base address:0xb000 
Perhaps someone else can answer more authoritatively than I but I have
always assumed that it means the physical interface picked up a packet
addressed to it but had no buffer into which it could put the packet. 
In other words, the system ran out of memory dedicated to packet
buffering.

One can either increase the number of buffers allocated to buffering
packets or identify the source of the bottleneck.  On a standalone
system, it might be the processor. In the case of a packet passing
device, increase the bandwidth on the egress.

I do not know where one configures the number of cache buffers in Linux
but that would be a handy trick to know.  I'm sure someone does know it
off the top of their head.  Next person . . . 
-- 
Open Source Development Corporation
Financially Sustainable open source development
http://www.opensourcedevelopmentcorp.com


