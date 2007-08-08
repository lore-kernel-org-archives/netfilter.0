From: Tore Anderson <tore@linpro.no>
Subject: Re: Asymmetric routing and connection tracking
Date: Wed, 08 Aug 2007 09:55:25 +0200
Message-ID: <46B976ED.30902@linpro.no>
References: <46B81A0D.6090900@linpro.no>	<1186487970.28140.20.camel@localhost>
	<46B87149.20505@linpro.no> <1186494447.28140.57.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1186494447.28140.57.camel@localhost>
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
To: Thomas Jacob <jacob@internet24.de>
Cc: netfilter@lists.netfilter.org

* Thomas Jacob

> So in the scenario described, R1 wouldn't do any stateful packet 
> filtering for packets to and from the internal server network? But 
> the connections will be added to the connection tracking table of R1
> nonetheless (unless you use the NOTRACK target in raw), only not with
> an ESTABLISHED state which probably means they timeout more often
> than needed and you have more insert/remove actions over the
> connection tracking hash table, maybe that's the source of your
> problem.
> 
> You could try the NOTRACK/raw thing on the (internal-)standby-router,

  Hmm.  I was not aware of NOTRACK/raw.  This is very interesting and
 on first look it seems like exactly the thing I needed.  Thank you very
 much for the pointer!  I'll dig into it now.  :-)

Regards
-- 
Tore Anderson

