From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: how many rules can be added?
Date: Thu, 16 Sep 2004 18:48:29 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040916164829.GB23861@torres.ka0.zugschlus.de>
References: <1314.81.10.7.66.1095343827.squirrel@81.10.7.66>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1314.81.10.7.66.1095343827.squirrel@81.10.7.66>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alaadin <alaadin@alaadin.org>
Cc: netfilter@lists.netfilter.org

On Thu, Sep 16, 2004 at 05:10:27PM +0300, Alaadin wrote:
> how many ip tables rules can i add ?

As long as you have enough memory.

> i added already 40
> if i added untill 100 or 500 rule

I have once used a rule set with 8500 rules.

> would this make problems ?

maybe.

> would this make the system lag ?

maybe.

> would this make the system hang

probably not.

> how many ip tables rules can i add ? or its unlimited?

Pretty much unlimited.

Real impact on your system's performance will depend on the structure
of your rule set. If you have 6000 rules that will never match, so
that every packet has to traverse all of these rules before it is
finally accepted, you will feel a noticeable impact. If you, however,
ACCEPT established and related packets early in your rule chain, you
will most probably be fine with tens of thousands of rules.

Greetings
Marc


-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Karlsruhe, Germany |  lose things."    Winona Ryder | Fon: *49 721 966 32 15
Nordisch by Nature |  How to make an American Quilt | Fax: *49 721 966 31 29

