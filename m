From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: TWO ROUTING
Date: Thu, 20 Nov 2003 11:42:18 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031120164218.GA21892@cannon.eng.us.uu.net>
References: <E1AMU5R-0001oJ-Io@vishnu.netfilter.org> <3FBCC194.1080008@Loudoun-Fairfax.com> <200311201340.hAKDeN722163@onyx.rockstone.co.uk> <3FBCD315.3020902@Loudoun-Fairfax.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <3FBCD315.3020902@Loudoun-Fairfax.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Cc: netfilter@lists.netfilter.org

On Thu, Nov 20, 2003 at 09:43:33AM -0500, Jeffrey Laramie wrote:

> >I think he's simply asking whether Linux can use two default routes on one 
> >machine at the same time.
> > 
> >
> 
> Oh, I see. I don't think that's possible at the routing level.

Yes, it is. Take a look at "Linux Advanced Routing & Traffic Control".

But one thing which is most of the time mistaken is that you can only
affect the outbound packets with your local routing strategy. The inbound
packets are at the mercy of your ISP(s). In order to make sure that your
strategy is respected by your ISP(s) you need to somehow communicate that
strategy with them, either call them up and make them commit to it or set
up some kind of routing protocol with them. Both options are rearly
accepted by your ISP(s) as a residential user ;-)

Ramin

