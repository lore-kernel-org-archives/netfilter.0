From: Jason Opperisano <opie@817west.com>
Subject: Re: Filtering in the nat table
Date: Tue, 22 Mar 2005 18:18:25 -0500
Message-ID: <1111533505.4513.0.camel@hubcap.ljm.dom>
References: <20050322160638.GA347@ikkoku.ath.cx>
	<20050322162904.GA18464@bender.817west.com>
	<20050322172329.GB347@ikkoku.ath.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <20050322172329.GB347@ikkoku.ath.cx>
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
To: netfilter@lists.netfilter.org

On Tue, 2005-03-22 at 12:23, Toby wrote:
> That's why I put it in the nat table in the first place and it's exactly
> what makes it easier and shorter.
> 
> If you look at my two examples you'll see that ESTABLISHED,RELATED are
> always accepted no matter what--and frankly I don't see a reason to do
> otherwise, even on production firewalls.
> 
> So the only difference I see in my two examples regard --state INVALID
> packets.  Are they a security problem?  Do they ever show up?  
> If that's really the only difference, I could put a --state INVALID -j
> DROP in filter or mangle and keep on filtering in the nat table.
> 
> Is there any other difference?

yeah--don't filter in nat.

-j

--
"I'm a well-wisher, in that I don't wish you any specific harm."
	--The Simpsons


