From: Roberto Nibali <ratz@tac.ch>
Subject: Re: Neighbour table overflow
Date: Thu, 28 Nov 2002 17:40:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DE646EC.60503@tac.ch>
References: <1038321617.13707.28.camel@ben.mis.tnsi.com> <35211.200.60.189.231.1038335981.squirrel@www.netfids.com> <20021126183823.GD31207@telegraafnet.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ard van Breemen <ard@telegraafnet.nl>
Cc: netfilter@lists.netfilter.org

> (From this point on I am just guessing and trying to understand
> the source code:)
> If I am correct, it will mark entries to be freed, so that they
> wont be used anymore. So to be able to use a specific destination
> again, it needs to make a new entry in the neighbour table. So
> instead of cleaning up the tables, your neighbour (arp) table
> will be filled fast if you see more new source ip's than that old
> neighbour entries are discarded by having their usage counts down
> to 0.

If you haven't already, please take a look at net/core/neighbour.c:neigh_alloc()

          unsigned long now = jiffies;
          if (tbl->entries > tbl->gc_thresh3 ||
              (tbl->entries > tbl->gc_thresh2 &&
               now - tbl->last_flush > 5*HZ)) {
                  if (neigh_forced_gc(tbl) == 0 &&
                      tbl->entries > tbl->gc_thresh3)
                          return NULL;
          }

It's pretty straightforward and should give you everything you need.

> If somebody else knows the true truth about how it exactly works,
> please tell me. I will make notes of it for the lartc so it can
> be a FAQ.

I might write some documents about this because I recently had
someone on the LVS project with the same problems. However, if someone
from the LARTC guys writes it before I do, I won't be disappointed either.

Cheers,
Roberto Nibali, ratz
-- 
echo '[q]sa[ln0=aln256%Pln256/snlbx]sb3135071790101768542287578439snlbxq' | dc


