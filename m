From: Bill Davidsen <davidsen@tmr.com>
Subject: Re: DNS/Router/Firewall question...
Date: Thu, 13 Mar 2003 15:15:16 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.3.96.1030313150229.32436E-100000@gatekeeper.tmr.com>
References: <5DE7560BBF09D6119ED100B0D03D8426013923@MAIL-SERVER>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5DE7560BBF09D6119ED100B0D03D8426013923@MAIL-SERVER>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Collins, Kevin" <KCollins@nesbittengineering.com>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

On Thu, 13 Mar 2003, Collins, Kevin wrote:

> Hey All,
> 
> I've got a Red Hat 8.0 box with four network cards in it.  (See Diagram
> below)  I've got BIND DNS 9.1 (updated via Red Hat's Red Hat Network)
> running on the same machine.  I want this machine to act as my primary
> internal DNS server for my Internal and WAN subnets.
> 
> When I have the machine running as a router (i.e. ip forwarding enabled, no
> firewall rules in place) everything works fine.  When I start my firewall,
> DNS slows down to a crawl.  It works, but it works so slow that it feels
> like it's not.

Sounds as if there's a DNS failover taking place. Being a facist mother
(user told me that) I would be tempted to take every DNS request from the
internal networks and redirect it to my internal DNS. However, that does
break the odd case where someone is using some bizarre remote DNS by
choice.

I would just start logging ALL DNS packets so you can take a look at them,
perhaps the solution will jump out at you. Hint: I bet you can put one LOG
rule in the FORWARD chains and catch all the packets of interest.

> I've attached my firewall script below.  It's a work in progress so comments
> are welcome.

If you have enough volume to care about efficiency I could, otherwise the
only thing I would do is explicit drop of user defined chains, since you
are being so paranoid anyway. Yes, you don't use them, but you have lots
of other overkill in there.

-- 
bill davidsen <davidsen@tmr.com>
  CTO, TMR Associates, Inc
Doing interesting things with little computers since 1979.


