From: Jason Opperisano <opie@817west.com>
Subject: Re: DNAT, Is it possible to find the original destination?
Date: Tue, 2 Nov 2004 08:39:15 -0500
Message-ID: <20041102133915.GA22009@bender.817west.com>
References: <1099323026.41865692986d5@email.ixwebhosting.com>
	<20041101161041.GA18269@bender.817west.com>
	<001d01c4c0a2$c61a3de0$2e01a8c0@minka>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <001d01c4c0a2$c61a3de0$2e01a8c0@minka>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Tue, Nov 02, 2004 at 01:11:19AM -0500, Lumberjack wrote:
> Couple follow ups.  I searched back the last two or three months and didn't 
> find any "no nos" on using /proc/net/ip_conntrack.  All I can figure is 
> that it could be a hit to read through if very large.  Not sure yet how 
> /proc fs might lock things either (if that might be an issue).  So any 
> reason for using this to be a "bad thing" please provide some sort of hint 
> if possible.

the thread that it ended up coming out in that i was thinking of:

  http://marc.theaimsgroup.com/?l=netfilter&m=109649105915501&w=2

and yes--it has to do with read locking.

> Another.  If I do something to read in the contents of 
> /proc/net/ip_conntrack and then do something to send some output to stdin 
> of iptables-restore/iptables does my app need to be GPL based?  Boarders 
> here seem rather grey.  I am not modifying any GPL code nor extending it so 
> it doesn't seem to me be something that "modifies" and thus requires to be 
> released under the GPL.

can't help ya there...

-j

--
"Here we have an ordinary square.
 Whoa! Slow down egghead!"
        --The Simpsons

