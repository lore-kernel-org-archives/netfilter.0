From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: Re: snat
Date: Tue, 3 May 2005 15:58:52 +0200
Message-ID: <BAY22-DAV5B068BEF9AD1450DBD026B2180@phx.gbl>
References: <BAY22-DAV73016DEEEE8DDD0EFAE2FB2270@phx.gbl>
	<20050502155328.GA11431@bender.817west.com>
Return-path: <netfilter-bounces@lists.netfilter.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Jason Opperisano wrote:

> On Mon, May 02, 2005 at 05:32:42PM +0200, Marco Berizzi wrote:
> > Hello everybody.
> > I would like to better understand the SNAT target.
> > Man states:
> >
> > "You can add several --to-source option. If you specify
> > more than one source address, either via an address range
> > or multiple --to-source options, a simple round-robin  (one
> > after another in cycle) takes place between these addresses.
> >
> > I would like to know if this round-robin cycle is per packet
> > or per socket.
>
> per connection.
>
> -j

Thanks everybody.


