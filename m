From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Someone is using too much bandwidth???
Date: Tue, 21 Nov 2006 12:25:17 -0600
Message-ID: <4563448D.7000401@riverviewtech.net>
References: <380-2200611221172226406@zamnet.zm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <380-2200611221172226406@zamnet.zm>
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

lubasi wrote:
> How can i interprate the #tail -f /var/logs/messages to determin
> which machine is doing kazaa or any other P2P???consuming the
> bandwidth.

By default /var/log/messages will not record any thing about traffic that is
passing through the system.  You can add IPTables rules that will cause
matched packets to be logged via Syslog which you can then see in
/var/log/messages.

However to get a better idea of what traffic is running on your network,
consider TCPDump or a GUI front end like Etherial.  This will give you a
real time report of what traffic is flowing in to / out of / through your
system (presuming you sniff the correct interface).  You can tell from this,
which computer is consuming more bandwidth than it should based on the
frequency of the source / destination IP showing up in TCPDump's output.

You could add rules to IPTables that match specific IPs in question and
watch the hit counters to see which system(s) are incrementing their
counters at an exceptional rate.  One (or more) system(s) should jump out at
you as being the culprit(s).

> And how do i block these popular P2P???

First you need to find out more about the type of P2P traffic that you are
experiencing so that you can more accurately filter it out / rate limit it.
  I will say that you may have better luck with rate limiting.  If you
completely block a users access to something they will find a different
method to get to what they want to get to.  If your users switch to
something else you then have to learn about that too.  Where as if you let
your users use one system but control the amount of bandwidth consumed and /
or the priority you may not play the above game nearly as often.

My family has a saying, "Give 20% to get 80% of what you want.".



Grant. . . .


