From: Frank Gruellich <frank@der-frank.org>
Subject: Re: how many rules can be added?
Date: Thu, 16 Sep 2004 23:26:31 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040916212631.GR12986@der-frank.org>
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
To: netfilter@lists.netfilter.org

* Alaadin <alaadin@alaadin.org> 16. Sep 04:
> Hello,

Hi,

> how many ip tables rules can i add ?

<URL:http://lists.netfilter.org/pipermail/netfilter/2004-March/050891.html>

> i added already 40
> if i added untill 100 or 500 rule
> would this make problems ?

No.

> would this make the system lag ?
> would this make the system hang

Depends on your system: is it something with 8MHz and 4MBs of RAM?  I
have a router (P2, 133MHz, 24MB).  In daily work it has about 200 rules
and a throughput of ~160KB/s.  Adding 6000 "-s $RANDOMIP -d $RANDOMIP -j
LOG"'s resulted in a throughput of ~100KB/s and a nice system load.

> or its unlimited?

No.  HTH,
 regards, Frank.
-- 
Sigmentation fault

