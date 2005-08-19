From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: Transparent proxy where source IP address remains unchanged --
	possible?
Date: Thu, 18 Aug 2005 23:16:03 -0400
Message-ID: <20050819031603.GA13857@bostoncoop.net>
References: <20050809012914.GA23108@bostoncoop.net>
	<Pine.LNX.4.61.0508110741110.28320@yvahk01.tjqt.qr>
	<20050811130700.GA15463@bostoncoop.net>
	<20050817210715.GB4473@digitalpath.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050817210715.GB4473@digitalpath.net>
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
To: Ray Van Dolson <rayvd@digitalpath.net>
Cc: netfilter@lists.netfilter.org

On Wed, Aug 17, 2005 at 02:07:15PM -0700, Ray Van Dolson wrote:
> On Thu, Aug 11, 2005 at 09:07:00AM -0400, Adam Rosi-Kessel wrote:
> > I'm relocating a web/email/ssh server from one location to another (and
> > consequently to a new IP).  Since it's going to take many hours for the
> > IP address changes to propagate across DNS, I'd like to put a proxy box
> Not really related to achieving what you're asking, but if you have access to
> the DNS records for the domains you're dealing with (and you have enough
> leeway time), wouldn't it just be simpler to change your TTL to something like
> 60 seconds so the propagation time happens much more quickly?

It's a good idea, but there's a whole bunch of domains, and I don't
control them all. I need to ask the domain owners to change the IP
addresses, and so the lag is not just the propagation time but also the
owner-change time--thus I want to forward packets for at least a while.
-- 
Adam Rosi-Kessel
http://adam.rosi-kessel.org

