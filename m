From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: How to elegantly handle two ISPs on a single box?
Date: Wed, 6 Apr 2005 21:29:22 +0200
Message-ID: <20050406192922.GC12284@torres.l21.ma.zugschlus.de>
References: <20050406171730.GA12284@torres.l21.ma.zugschlus.de>
	<561dc3260504061149310337e0@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <561dc3260504061149310337e0@mail.gmail.com>
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

On Wed, Apr 06, 2005 at 02:49:49PM -0400, Jiann-Ming Su wrote:
> On Apr 6, 2005 1:17 PM, Marc Haber <mh+netfilter@zugschlus.de> wrote:
> > Is there a more elegant way to do it? Did I miss any docs?
> 
> You should take a look at dynamic routing.  Zebra provides such service.
> 
>   http://www.zebra.org/
> 
> There's a debian package for zebra.

Having been part of zebra packaging for Debian for a very short time,
and having been in charge for the BGP and OSPF setup for a small ISP
for two years, how do you suppose that dynamic routing will solve this
problem?

Which protocol do you suggest to use? Where should the announcements
come from?

This is a migration setup, not a redundancy issue.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621 72739834
Nordisch by Nature |  How to make an American Quilt | Fax: *49 621 72739835

