From: Martijn Klingens <mklingens@ism.nl>
Subject: Re: failover with iptables?
Date: Wed, 11 Sep 2002 15:11:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209111511.55096.mklingens@ism.nl>
References: <200209111410.14005.roy@karlsbakk.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200209111410.14005.roy@karlsbakk.net>
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
To: Netfilter mailinglist <netfilter@lists.netfilter.org>

On Wednesday 11 September 2002 14:10, Roy Sigurd Karlsbakk wrote:
> hi
>
> I currently have two identical servers I want to use in parallel with an
> iptables gate in front of them, so if one chrashes, iptables just sorts out
> and redirects to the other.
>
> but
>
> is it possible to make the below (as stolen from various cisco sketches)
> with iptables?
>
> If iptab_1 fails, iptab_2 should take over ip and (perhaps) mac address of
> iptab_1.
>
> ps: I don't think I need connection tracking.

With this last line included the answer is "yes". Otherwise it's clearly a 
"no", or at least nothing more than a "partial".

You can failover any linux machine with Heartbeat (www.linuxvirtualserver.org) 
and create your own custom resource script to failover (the firewall). 
Failover is by no means stateful though using this technique, so any 
currently tracked connection will not reach the failover node properly.

Harald Welte hopes to start working on stateful failover early next year, but 
that's a long way from now, especially since it likely also needs to mature a 
bit before going into production...

Martijn


