From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Help! NAT unable to routing
Date: Fri, 31 Oct 2003 15:34:58 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031031203458.GF30565@cannon.eng.us.uu.net>
References: <BEA73FB6B8F62545A5B2818724D0DF2902E7084A@u.library.Arizona.EDU>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <BEA73FB6B8F62545A5B2818724D0DF2902E7084A@u.library.Arizona.EDU>
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
Content-Transfer-Encoding: 7bit
To: "Han, Yan" <hany@u.library.arizona.edu>
Cc: netfilter@lists.netfilter.org

On Fri, Oct 31, 2003 at 12:30:10PM -0700, Han, Yan wrote:

> Are you saying the FORWARD chain should ACCEPT?
> All forward is accepted. 

I'm sorry. I had not read your first message. So you say you want to reroute
the traffic instead of 150.135.44.245 to 150.135.44.96.

Is 150.135.44.96 behind 150.135.44.245 with respect to the client? if not
you need to apply an SNAT so that the return traffic gets back to the router
in order to apply the de-DNATting.

Client --> 150.135.44.245
DNAT takes place and it becomes
Client --> 150.135.44.96
the server replies back to the client directly
150.135.44.96 --> Client
the clients TCP stack drops the packets as it has no reference to such a
socket between 150.135.44.96 and Client.

But if 150.135.44.96 is behind 150.135.44.245 with respect to the client and
your forwarding is on and the FORWARD policy is ACCEPT, then I don't know.

Ramin



