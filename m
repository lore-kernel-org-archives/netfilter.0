From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: conntrack records not going away?
Date: Wed, 22 Dec 2004 08:41:07 +0100
Message-ID: <1103701266.3634.3.camel@bibo.spenneberg.de>
References: <876ef97a041220111947fbeff5@mail.gmail.com>
	<1103596432.6589.8.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1103596432.6589.8.camel@hubcap.ljm.dom>
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
To: Jason Opperisano <opie@817west.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Am Di, den 21.12.2004 schrieb Jason Opperisano um 3:33:
> On Mon, 2004-12-20 at 14:19, Tobias DiPasquale wrote:
> > Hi all,
> > 
> > We have a box running 2.4.26 (from kernel.org) over here that's
> > serving as a sink for test SMTP traffic. The box sits behind a Linux
> > box that is doing ProxyARP. The weird thing is, sometimes after
> > sending tons of traffic to the sink, conntrack records hang around in
> > the ESTABLISHED state, even though the sink process (the endpoint for
> > the connections in question) has been shut down. Has anyone ever seen
> > this before? TIA :)
> 
> once a TCP connection gets to ESTABLISHED [ASSURED] state--it will not
> be removed from conntrack until it times out (after 5 days by default
> (432000 seconds)), or one side sends a FIN-ACK packet requesting that
> the connection be torn down.
> 
Or a TCP-Reset.

Cheers,

Ralf
-- 
Ralf Spenneberg <lists@spenneberg.org>


