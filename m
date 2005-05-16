From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: okay, I admit confusion here;
Date: Mon, 16 May 2005 15:55:23 -0500
Message-ID: <428908BB.20802@riverviewtech.net>
References: <427B93EE.3030905@eccotours.dyndns.org>	<427C4EA3.5090501@riverviewtech.net>	<4281FC1A.8090000@eccotours.dyndns.org>	<42824D1E.7040508@riverviewtech.net>	<42825732.8010206@verisignlabs.com>	<428259CE.3080708@riverviewtech.net>	<42825D48.2060003@verisignlabs.com>	<20050511203452.GA13902@bender.817west.com>	<Pine.LNX.4.60.0505131725190.2601@darkstar.sysinfo.com>	<20050513215540.GA22122@bender.817west.com>
	<Pine.LNX.4.60.0505161332480.15128@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.60.0505161332480.15128@darkstar.sysinfo.com>
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
To: netfilter@lists.netfilter.org

> - From what I have seen of the bridging abilities and ebtables this gets 
> ugly as we are reduced to layer 2 filtering and have a lack of control 
> of the higher level protocols, which is basically useless here.

This is not quite the case.  Bridging has a unique ability to be set up to only bridge specific traffic.  Take a look at my reply (https://lists.netfilter.org/pipermail/netfilter/2005-May/060531.html) to the "Bridging selected MACs" thread.  The EBTables portion of the kernel is firewalling / filtering on layer 2 which has a special table called broute with a special chain called BROUTING which is used to have the kernel decide if it is going to bridge (ACCEPT) traffic (in the the bridging code) or if it is going route (DROP) traffic (up in to the routing code).  With this you could easily have a bridging router.  I think if you take a look at the afore mentioned thread you will see that this can fairly easily be done.  If you do want some help with it please start a new thread (this for some reason showed up as a reply to the SSH brute force thread) and I'll be glad to offer any and all
  help that I can.



Grant. . . .

