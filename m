From: Jason Opperisano <opie@817west.com>
Subject: Re: ARP traffic on a large-ish network
Date: Thu, 17 Mar 2005 10:24:38 -0500
Message-ID: <1111073077.19251.12.camel@hubcap.ljm.dom>
References: <42B3C34A03A8FC4BB0A80082CE8993F31C1C25@onstopnt.onestop.com>
	<423939F6.3070108@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <423939F6.3070108@riverviewtech.net>
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

On Thu, 2005-03-17 at 03:04, Grant Taylor wrote:
> You *might* try inserting a Linux router in the network between your Cisco and all your clients.  The main things this router would do is run the ARPDaemon which implements a LARGE ARP cache in user space.  Thus hopefully you could configure it to hold most if not all of your client's MAC addresses in it's internal tables thus reducing the need to ARP.  The Linux kernel's internal ARP cache maxs out at around 256 entries.  I don't know if this would work at all as all references to ARP Daemon I've seen are early 2.4 but support for it is still suppose to be in the kernel.  I just looked and it is included in 2.6.11 under "Networking Options".  Let me know if you try this and what you find out as I've got a network with about 2048 potential hosts on it that I'm considering using this on.

VLAN it and route it before that "potential" becomes "reality."

line-wrapping your messages would be a nice touch as well.

-j

--
"If I had known there were loose women in Las Vegas, I would never
 have let you go."
	--The Simpsons


