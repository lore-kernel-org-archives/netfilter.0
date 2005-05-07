From: Felipe Kellermann <stdfk@terra.com.br>
Subject: Re: CT: Something like max-src-conn
Date: Sat, 7 May 2005 16:54:34 -0300 (BRST)
Message-ID: <Pine.LNX.4.61.0505071648060.10176@nyvra.alien.bet>
References: <Pine.BSO.4.62.0505060046560.30552@bepuvq.alien.bet>
	<20050506045907.GA26053@bender.817west.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050506045907.GA26053@bender.817west.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

On Fri, 6 May 2005 12:59am  -0400, Jason Opperisano wrote:

> > The `max-src-conn' semantics: ``max-src-nodes <number>''.
> > >From the man page: "Limits the maximum number of source addresses which 
> > can simultaneously have state table entries".
> 
> connlimit?

Even though connlimit can limit the number of connections per IP address 
or address range, it can not limit the number of nodes that are able to 
simultaneously have entries in the conntrack, which is what max-src-nodes 
does.

-- 
Felipe Kellermann

