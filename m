From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Connection Teaming
Date: Mon, 30 Jun 2003 16:17:42 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030630201742.GB29474@cannon.eng.us.uu.net>
References: <091A6DF13847F44395B31658ED61C19C63A442@yellowstone.medclaim.local>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <091A6DF13847F44395B31658ED61C19C63A442@yellowstone.medclaim.local>
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
To: "Brei, Matt" <mbrei@medclaiminc.com>
Cc: netfilter@lists.netfilter.org

On Mon, Jun 30, 2003 at 04:03:31PM -0400, Brei, Matt wrote:

> Greetings,
> 
>  
> 
>             I currently have 1 cable internet connection being
> firewalled and routed by netfilter on RedHat 8.  I am thinking about
> getting another cable connection to speed things up a bit.  My question
> is, can this be done?  Is it possible to bond 2 separate cable

Yes, if they're from the same provider and if the provider accepts to
bond... But if so, why don't you get more bandwidth by upgrading your
service?

> connections on 2 modems, each in their own nic and combine the
> bandwidth?  I know this can be done on windows, a friend had a DSL and
> cable and teamed the downstream, however I would like to team the
> upstream as well.

Can you say how this could be done on windows?

AFAIK, bonding two Ethernet ports requires both ends to bond it. When
you say DSL and Cable had been bonded, it doesn't make sense, since the
upstream end points of these two access methods are definitely not on
the same box...

I know that windows can do magic sometimes, but I don't buy this one...

Ramin

> 
> Many thanks in advance
> 
> Matt

