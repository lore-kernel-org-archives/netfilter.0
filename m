From: Raphael Jacquot <raphael.jacquot@imag.fr>
Subject: Re: Linux forwarding Win XP hosts VERY slowly
Date: Mon, 02 May 2005 09:07:07 +0200
Message-ID: <4275D19B.7030409@imag.fr>
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
Content-Type: text/plain; charset="us-ascii"
To: dcinege-mlists@psychosis.com
Cc: netfilter@lists.netfilter.org

Dave Cinege wrote:
> I've built an advanced rotuign appliance, and I'm having 2 outstanding 
> problems, that I'm being to think are related to the linux ip/netfilter 
> stack, choking on XP traffic (possiblity XP-SP2) hosts that are on the LAN. 
> I'm running 2.4.30 at the moment. 
> 
> The 2 problems I'm seeing:
> 
> 1) Forwarded traffic (most notably web) is VERY slow with XP clients. 

have you tried with a proper web browser, such as firefox ? IE is known
as not respecting the RFC for TCP and sending the HTTP request as data
in the first "SYN" packet (which is only recognised by IIS, of course)
so as to 'make' IE appear faster than it really is..

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
> 

guess it's one more example of how badly Windows' TCP/IP stack is broken
is so many ways...

