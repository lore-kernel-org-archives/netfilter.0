From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Linux forwarding Win XP hosts VERY slowly
Date: Sat, 30 Apr 2005 18:06:57 -0500
Message-ID: <42740F91.8020101@riverviewtech.net>
References: <200504301341.58023.dcinege-mlists@psychosis.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200504301341.58023.dcinege-mlists@psychosis.com>
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

> I've built an advanced rotuign appliance, and I'm having 2 outstanding 
> problems, that I'm being to think are related to the linux ip/netfilter 
> stack, choking on XP traffic (possiblity XP-SP2) hosts that are on the LAN. 
> I'm running 2.4.30 at the moment. 
> 
> The 2 problems I'm seeing:
> 
> 1) Forwarded traffic (most notably web) is VERY slow with XP clients. 
> 
> Example: Saw this last 2 nights ago: Appliance has a linksys Wifi bridge 
> attached to a NIC. Customer browses through the appliance to the Linksys 
> config page. It moves like molasses. He browse to the local Zope hosted made 
> page. Slow as hell. I unplug his machine, and plug my linux laptop into same 
> switch port. Linksys and Zope pages load adn reload instantly. Plug his 
> machine in....slow again.
> 
> 2) Zope serves user interface pages for the appliance. Zope has been locking 
> solid for no apparent reason, but only when and Windows host is attached. 
> The trick is SOME windows machine don't seem to cause a problem.
> Example: 
> I worked with a unit for 3 days using a customers XP desktop. Not a hiccup. My 
> partner came in and attached to the network and starting connect to our 
> appliance with his XP laptop. Within 15 minutes Zope was hung. 
> 
> I'm really lost. ANY ideas out there?

I don't know if this is related or not, but a couple of this come to mind.

  1)  Check to make sure that it is not a ""windowing issue, i.e. the MTU/MRU, MSS, etc.
  2)  I know that XP SP 2 changes the number of TCP/IP connections that a computer can have open at any given time.  I think the default prior to XP SP 2 was 50 or there abouts.  Now the default for XP SP 2 is 10, or so I have read.  Apparently this is a registry (?) setting that can be changed.  From what I have read is that this was / is an effort by M$ to make sure that infected systems can only infect other systems at a controlled rate.  This problem has primarily shown up on VoIP mailing lists as VoIP needs LOTS of small packets at any given time exceeding the amount that XP SP 2 will allow by default.



Grant. . . .

