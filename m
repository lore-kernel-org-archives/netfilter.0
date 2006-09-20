From: "Robert M. Marmorstein" <rmmarm@CS.WM.EDU>
Subject: Re: netfilter Digest, Vol 26, Issue 14
Date: Wed, 20 Sep 2006 10:26:38 -0400 (EDT)
Message-ID: <Pine.LNX.4.63.0609201023520.3481@melkor.cs.wm.edu>
References: <20060920140039.8920B11AF03@mail.cs.wm.edu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060920140039.8920B11AF03@mail.cs.wm.edu>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

> From: Rob Carlson <rcarlson@kitchenandassociates.com>
> Subject: Alternatives to --check option
> 
> Is there any way of being able to tell how iptables is handling a 
> package from a particular address short of actually sending something 
> from said address?
> 

There are several tools for penetration testing that work (nmap, etc), but 
you might also give my "passive testing tool" a try: 
http://itval.sourceforge.net.  It constructs a model of your rule set and 
answers queries about the behavior.  Unfortunately, right now, it doesn't 
understand IPSET matches, but I'll see if I can add that functionality to 
the next version for you.

Robert Marmorstein

