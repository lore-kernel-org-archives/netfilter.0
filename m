From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Different routes for different src addresses
Date: Wed, 07 Jul 2004 10:38:41 -0400
Sender: linux-net-owner@vger.kernel.org
Message-ID: <1089211121.21756.6.camel@localhost>
References: <20040707120502.GA23120@nihil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-net-owner@vger.kernel.org>
In-Reply-To: <20040707120502.GA23120@nihil>
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alpt <alpt@freaknet.org>
Cc: netfilter@lists.netfilter.org, linux-net@vger.kernel.org

On Wed, 2004-07-07 at 08:05, Alpt wrote:
> Hi all,
> is it possible to create a route for a single src address?
> For example these are some routes I'd like to use: 
> 
> 1) "All the pkts coming from hostA with dst=hostX are routed to eth1".
> 2) "All the pkts coming from hostB with dst=hostT are routed to eth0"
> /*Normal routes start here*/
> 3) "All the pkts (that are not pkts of type 1) and 2)) with dst=hostX
> are routed to eth3"
> 4) "All the pkts (that are not pkts of type 1) and 2)) with dst=hostU
> are routed to eth2"
> 5) And so on...
> 
> 
> I mean _routing_, not natting. If I nat the pkts their destination will
> change and I need to keep it intact.
> 
> In the FIB routing table I can only specify the target address, but I've 
> noticed that the kernel's cache matches the source field. But when I try
> to modify it I get: "Modifying `inet' routing cache not supported".
> So, Is it possible to modify the krnl's cache from the user space with
> some magic ioctl?
> 
> Is there a solution for this problem? Can netfilter do something for
> this?
> 
> And, what's the best method to modify the FIB from user space? The ioctl
> or the rtnetlink?
> 
> Thank you (^_^)
> I live waiting your wise reply
I have not digested your question fully but my initial reaction is that
it can be done with iproute2.  If you are unfamiliar with it, look for a
file named ip-cref.ps in your distribution.  In RedHat, it is typically
under /usr/share/doc/iproute-2.4.7/ - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com
---
If you are interested in helping to develop a GPL enterprise class
VPN/Firewall/Security device management console, please visit
http://iscs.sourceforge.net 

