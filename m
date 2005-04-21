From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: logging of successful tcp connections
Date: Thu, 21 Apr 2005 14:58:34 -0500
Message-ID: <426805EA.3000901@riverviewtech.net>
References: <F97948CF897D7B46802A18845A8B9BFD471A59@us-rich-m01.global.tektronix.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <F97948CF897D7B46802A18845A8B9BFD471A59@us-rich-m01.global.tektronix.net>
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
To: christopher.f.ulherr@exgate.tek.com
Cc: netfilter@lists.netfilter.org

> I would like to know if there is a way I can log only successful tcp
> connections. I'm only interested in successful (established) connections,
> and not just syn "connection attempts". I guess what I need is a way to log
> a single packet if it caused a state transition from NEW to ESTABLISHED. It
> would also be helpful to log the packet that terminated the connection
> (state change from established). In this manner, we could easily tell what
> connections were made, and their duration (and not rely on the userland
> application to log this info).

You don't ask for any thing easy do you.  ;)

> I've looked into using the state matching, but couldn't achieve this
> specific functionality with that.

I think this is something that is beyond basic state matching as state matching is just matching on the current state of the packet / connection.  This does not have any thing to do with the prior state of the packet / connection.

> Is there some trivial way to accomplish this I am overlooking?

No, I don't think there is a ""trivial way to do this.  What initially comes to mind is to use the recent match extension for the history mechanism that is needed in this scenario.  I think you will need to so something along these lines to come even close to what you are after:

1)  Put all traffic in a NEW state in to a recent list (recent_NEW) and continue to handle it like you normally would.
2)  Put all traffic in an ESTABLISHED state in to a (different) recent list (recent_ESTABLISHED) and continue to handle it like you normally would.
3)  If traffic is ESTABLISHED that is on the recent_NEW list but not on the recent_ESTABLISHED list you know that this connection recently (as in this connection) transitioned from the NEW state to the ESTABLISHED state and thus would be added to the recent_ESTABLISHED list.  I would be tempted to jump to a new sub chain where you could log and do any other actions on the packet that you wanted to.
4)  If traffic is ESTABLISHED that is on the recent_ESTABLISHED list and has the FIN flag set in the header you know that this connection recently (as in this connection) transitioned from the ESTABLISHED state to a closing (FIN) state and thus would be added to the recent_FIN list.  I would be tempted to jump to a new sub chain where you could log and do any other actions on the packet that you wanted to.

You would also want to watch for any traffic that came in with the RST flag set as well as traffic that never goes through a FIN state.

Keep in mind that this is all theoretical and had not even been cooded out (IPTables script written) and thus should be taken as what I would try first to set something like this up.  If you would like to give me some network config that you are working with I would be happy to see if I could not come up with working examples for you to use.



Grant. . . .

