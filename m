From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: How to make a computer invisible
Date: Sun, 30 Nov 2003 13:31:41 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1070217100.2884.9.camel@grendel>
References: <20031130181240.GD6930@zeus.tpfm.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031130181240.GD6930@zeus.tpfm.de>
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
To: Thomas Preissler <tomjohn@gmx.de>
Cc: netfilter-user Mailinglist <netfilter@lists.netfilter.org>

On Sun, 2003-11-30 at 13:12, Thomas Preissler wrote:
>
> how do I really make a computer totally invisibly as it would be
> when it does not exist?

Leave the power switch in the "off" position. ;-)

> It is clear, that the simplest solution is to DROP all incoming
> packets,

Actually, dropping packets is a clear indication that you do in fact
have a firewall protecting one or more systems. Its the only condition
which will cause ICMP error packets to not be returned consistently. 

You would be better off rejecting with host unreachables. then your
firewall looks like a simple router, and the host in question looks like
it is powered down.

HTH,
C



