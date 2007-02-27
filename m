From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Re: "distributed router" question
Date: Tue, 27 Feb 2007 10:51:39 -0600
Message-ID: <es1nis$15m$1@sea.gmane.org>
References: <erqqgn$omf$1@sea.gmane.org>
	<539.336764677678$1172388665@news.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <539.336764677678$1172388665@news.gmane.org>
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

Alec Matusis wrote:
> Thanks Robert.
> 
> My requirement is to have a transparent proxy in some sense: the TCP packets
> should be proxied by box A to a server on box B, and back from B to the
> client (via A I guess). The server on box B should see the original IP
> address of the client. When I do SNAT on A, the original IP becomes
> invisible for box B.

You just need to ensure that packets from B to the client get routed via
box A.  That is a routing issue, not a netfilter problem.  Depending on
what other traffic is going to/from box B, the solution could be as simple
as making box A the gateway for the default route out of box B.  If B
is handling other traffic that does not go through A, then you'll
probably need to use the advanced routing features of iproute2 to
selectively route the packets.  There's a rather extensive "Linux Advanced
Routing & Traffic Control HOWTO" available from http://lartc.org .

-- 
Bob Nichols         Yes, "NOSPAM" is really part of my email address.


