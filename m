From: Toby <tobia.conforto@linux.it>
Subject: Re: Filtering in the nat table
Date: Tue, 22 Mar 2005 18:23:29 +0100
Message-ID: <20050322172329.GB347@ikkoku.ath.cx>
References: <20050322160638.GA347@ikkoku.ath.cx>
	<20050322162904.GA18464@bender.817west.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050322162904.GA18464@bender.817west.com>
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

Jason Opperisano wrote:
> On Tue, Mar 22, 2005 at 05:06:39PM +0100, Toby wrote:
> > Dear netfilter users,
> > 
> > 	I've found it handy to put filtering rules in the nat table,
> 
> do *NOT* filter in the nat table.  only --state NEW packets ever
> traverse the nat table.

That's why I put it in the nat table in the first place and it's exactly
what makes it easier and shorter.

If you look at my two examples you'll see that ESTABLISHED,RELATED are
always accepted no matter what--and frankly I don't see a reason to do
otherwise, even on production firewalls.

So the only difference I see in my two examples regard --state INVALID
packets.  Are they a security problem?  Do they ever show up?  
If that's really the only difference, I could put a --state INVALID -j
DROP in filter or mangle and keep on filtering in the nat table.

Is there any other difference?


Toby

