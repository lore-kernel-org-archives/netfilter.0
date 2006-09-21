From: "Henning Sprang" <henning.sprang@gmail.com>
Subject: missing module for tcp-flags match?
Date: Thu, 21 Sep 2006 09:13:18 +0200
Message-ID: <5bb00b3f0609210013l48233308o43e750b426cb504b@mail.gmail.com>
References: <5bb00b3f0609201654w100cdc33vf8fa674477ed1274@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5bb00b3f0609201654w100cdc33vf8fa674477ed1274@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,
I am having trouble to add a rule as simple as

iptables -A INPUT --protocol tcp --tcp-flags ALL SYN,ACK -j DROP

I only get  the error:

iptables: No chain/target/match by that name

This happens while I am playing with an embedded box (linksys NSLU). I realized
before that some other rules did fail because some kernel modules
where missing and I found out which and then installed them.

But with this rule I have, after searching for a long time now,
absolutely no idea which kernel module can be missing to give me the
match tcp-flags. No howtos or tutorials nor google or the Kernel
sources gives any
hint on that.
The only kernel module that seems to have something to
do with tcp-flags at all is TCPMSS, but that doesn't look like helping
with general analysis of
tcp flags.

Any ideas?

Henning

