From: Jason Opperisano <opie@817west.com>
Subject: Re: match ??
Date: Tue, 2 Nov 2004 08:52:29 -0500
Message-ID: <20041102135229.GA22024@bender.817west.com>
References: <41870BBA.4070305@eccotours.biz>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <41870BBA.4070305@eccotours.biz>
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

On Tue, Nov 02, 2004 at 06:23:22AM +0200, Brent Clark wrote:
> Hi
> 
> Could anyone please explain to me the lamens terms for --match -limit.
> I dont understand whats it for, or where  you use it.
> 
> Kind Regards
> Brent Clark

the limit match limits the rate at which a rule will match.

the rule will match the average number events per time period specified
by "--limit", but may match up to "--limit-burst" number of events
initially, and for every "--limit" time period that passes without
a match.

it is most commonly used in rules to (a) throttle the volume of logging
that can take place and (b) protect from SYN floods.

-j

--
"It is better to remain silent and thought a fool, than open your
 mouth and remove all doubt."
        --The Simpsons

