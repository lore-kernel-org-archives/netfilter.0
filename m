From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: how to block 10000's of addresses?
Date: Sun, 13 Oct 2002 09:47:56 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210130946230.16584-100000@localhost.localdomain>
References: <20021013080034.B15824@hamal.ipal.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021013080034.B15824@hamal.ipal.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Sun, 13 Oct 2002, Phil Howard wrote:

> On Sun, Oct 13, 2002 at 01:10:23PM +0100, Antony Stone wrote:
> 
> | On Sunday 13 October 2002 12:50 pm, Phil Howard wrote:
> | 
> | > I would like to know how best to block 10000's of addresses using
> | > netfilter.  Clearly I do not want to be placing 10000's of individual
> | > filter table entries in.
> | 
> | Sounds like an incompatible set of requirements.   If you want to block 10000 
> | addresses (and assuming they don't fit into contiguous network ranges) then 
> | you need 10000 rules to be able to specify what you want to block.
> 
> They in fact are 10000+ different netblocks.

can you perhaps explain just a bit of the rationale for what
you're doing?  it's not often that one has to block that many
independent, non-related IP addresses.  just curious.  i mean, 
if it were just for filtering SPAM, you could use other tools.

rday


