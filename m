From: Jason Opperisano <opie@817west.com>
Subject: Re: snat
Date: Mon, 2 May 2005 11:53:28 -0400
Message-ID: <20050502155328.GA11431@bender.817west.com>
References: <BAY22-DAV73016DEEEE8DDD0EFAE2FB2270@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <BAY22-DAV73016DEEEE8DDD0EFAE2FB2270@phx.gbl>
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

On Mon, May 02, 2005 at 05:32:42PM +0200, Marco Berizzi wrote:
> Hello everybody.
> I would like to better understand the SNAT target.
> Man states:
> 
> "You can add several --to-source option. If you specify
> more than one source address, either via an address range
> or multiple --to-source options, a simple round-robin  (one
> after another in cycle) takes place between these addresses.
> 
> I would like to know if this round-robin cycle is per packet
> or per socket.

per connection.

-j

--
"Peter: Don't worry Lois. I'll handle this. I read a book about
 this kind of thing once. 
 Brian: Are you sure it was in a book? Are you sure it
 wasn't...nothing?"
        --Family Guy

