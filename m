From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: ACK,RST getting dropped in the firewall.
Date: Thu, 24 Jun 2004 11:48:45 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088092124.2029.28.camel@grendel>
References: <GHEILNONPACCGBGKBEKKKEAMCHAA.manikandan@manikandan.org>
	 <200406241144.10450.Antony@Soft-Solutions.co.uk>
	 <1088084177.2029.8.camel@grendel>
	 <200406241454.28088.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406241454.28088.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

On Thu, 2004-06-24 at 09:54, Antony Stone wrote:
>
> > > No harm done though, because the first one has done the job.
> >
> > Actually not quite true as both sides will enter a fin-wait state (RFC
> > 793 page 20) till the second FIN/ACK-ACK exchange takes place.
> 
> Depends what you mean by "done the job".   I meant the phrase in the sense of 
> "no more data is going to pass across the connection".

I *think* this may be the point of confusion. A FIN/ACK only means that
the _sender_ is done transmitting data, To quote from 793:

"The user who CLOSEs may continue to RECEIVE until he is told that the
other side has CLOSED also.  Thus, a program could initiate several
SENDs followed by a CLOSE, and then continue to RECEIVE until signaled
that a RECEIVE failed because the other side has CLOSED."

So just because one side of the connection issues a FIN/ACK, it does not
mean the session is over. The other side of the session may have a lot
more data to transmit so the session can stay active for some additional
period of time. Here in lies out problem. Netfilter is reacting to the
first FIN/ACK and killing off the session before the other end finishes
communicating and issues it's own FIN/ACK. 

The problem *appears to be* (based on my limited testing) in how the
timer is implemented. In an ESTABLISHED state there is a 5 day timer
that gets reset when ever a new packet crosses the firewall. The FIN/ACK
timer seems to be an absolute timer that kicks off at the first FIN/ACK
and continues to count down regardless of whether the session is still
active or not. If it acted more like the ESTABLISHED timer, this problem
would go away.

I can understand wanting a low timer to conserve resources. At the same
time however its killing legitimate RFC compliant sessions. :(

HTH,
Chris





