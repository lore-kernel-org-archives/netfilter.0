From: "Henning Sprang" <henning.sprang@gmail.com>
Subject: Re: missing module for tcp-flags match?
Date: Fri, 22 Sep 2006 15:55:03 +0200
Message-ID: <5bb00b3f0609220655n7a888c4bt4d1ed714f5193545@mail.gmail.com>
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
Sorry for having posted this message twice. I did't see it coming back
through the list, and realized I sent it from the wrong address. I
then sent it again from the address whic is actually subscribed.
Now that I wondered why even the second mail didn't come back to me, I
looked in the list archive and saw that the mail actually came through
the list, even twice. I wonder why I didn't get a copy, because all
other lists I know send copies of mails also to the sender himself -
is the netfilter list different in this?

But for the topic itself: unfortunately, I got no reply at all, I
assume because you are annoxed by the double post, or because the
question was unclear. As I explained the first problem, I try to ask
the question in a different way:

When tyring to set up the rule:

iptables -A INPUT --protocol tcp --tcp-flags ALL SYN,ACK -j DROP

I only get the error:

iptables: No chain/target/match by that name

When I remove the tcp-flags part, the rules is accepted. I assume to
be missing a kernel module for tcp-flags match, but have no idea which
module this could be. Which Kernel module is required for getting
tcp-flags matches?

Henning

