From: cerise-netfilter@l.armory.com
Subject: connrate
Date: Mon, 21 Aug 2006 15:01:37 -0700
Message-ID: <20060821220137.GB26225@boogeyman>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hi!

I've been playing around with iptables in conjunction with tc to shape traffic.
It's been working great with the exception of an interesting problem.

I've divided my traffic into three queues going by the TOS on packets.  I set
them with iptables based on ports and split them into interactive traffic,
less important traffic, and bulk traffic (which has a bandwidth limit via htb).

The problem in question is with ssh and scp.  Both forms of traffic go to port
22.  I want to preserve the interactivity of ssh and throw scp traffic into the
bulk traffic queue.

Lacking any immediately obvious way of figuring out which is which, I disabled
scp on sshd and started a second instance which allows scp and I mark traffic
to the second one as bulk.

What I'd really like to do though is keep scp open on port 22 to spare my users
a curveball.  So I was thinking of using connrate to mark traffic > 25k/s or
so.  This'll capture some ssh traffic, but when the session calms down, it'll
go back into the interactive queue.

The problem is that connrate didn't install when I emerged it on my gentoo.  I
snagged my own copy and hacked the Makefile to include connrate in the 
OPTIONALS and it would really like to compile, but a header file in the vanilla
2.6.15.1 kernel source isn't there: linux/netfilter_ipv4/ipt_connrate.h

I'm not really sure what I can do to solve the problem.  I can't find a 
reference to the header via google.

So, I'm looking for one of two things.  Either a way to get connrate capability
or a more elegant solution to my scp/ssh problem.  8)

-Phil/CERisE

