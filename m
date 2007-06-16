From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Bonding & Bridging.
Date: Fri, 15 Jun 2007 20:14:29 -0500
Message-ID: <46733975.90301@riverviewtech.net>
References: <e53321d30706151514u5882efaapaf153a91537bd253@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e53321d30706151514u5882efaapaf153a91537bd253@mail.gmail.com>
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
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 6/15/2007 5:14 PM, semi linux wrote:
> Can you bond two Ethernet ports together and then bridge that bond to
> a third interface?

You should be able to do this.

> It would look something like this...
> 
> A       B       C
> |       |       |
> +-bond0-+       |
>     |           |
>     +----br0----+

> Any problems with doing this?

So long as you don't run in to bandwidth limitations, there should not 
be any problems.  I.e. two bonded 100 BaseT connections going in to one 
100 BaseT connection.  Or at least no more bandwidth than the single 
connection can handle.

I don't recall how bonding alters frames, if at all.  I don't think that 
it does, but just be aware that if it does, you may end up with 
different MTUs on your single segment verses your bonded segment.



Grant. . . .

