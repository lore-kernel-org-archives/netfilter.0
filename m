From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Networking question
Date: Sat, 24 Dec 2005 13:53:58 -0500
Message-ID: <1135450438.2584.4.camel@localhost>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4wwL6DwAQAAAAdIdG2rUYq0C89CEWuAaQWwEAAAAA@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4wwL6DwAQAAAAdIdG2rUYq0C89CEWuAaQWwEAAAAA@rogers.com>
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
To: Dave Beach <drbeach@rogers.com>
Cc: netfilter@lists.netfilter.org

On Sat, 2005-12-24 at 13:34 -0500, Dave Beach wrote:
>  This is undoubtedly off-topic in oh-so-many ways; I'd be quite happy to be
> redirected to another, more appropriate mailing list should someone be so
> kind as to suggest one.
> 
> Internal, home, private network, WinXP boxen and a Squid proxy, connecting
> through an iptables box to my router and cable modem. Everything works
> peachy.
> 
> While trying to poke bittorrent holes through my iptables setup (see? Some
> vague evidence of relevance), I encountered problems and decided to take the
> proxy out of the picture. VERY much to my surprise, when I reconfigured IE
> to not use the proxy (and configured iptables to allow for a direct
> connection), I see no HTTP traffic whatsoever leaving the XP box destined
> for the firewall. In fact, no TCP traffic either (all traffic analysis done
> with ethereal on the XP box). I can ping to/from the XP box, and see THAT
> via ethereal.
> 
> I am considerably confused by this. My presumption was that IE would just
> happily send HTTP traffic directly to the firewall, but this is NOT the
> behaviour I'm seeing.
> 
> I know it's Christmas Eve day, and I was out a bit late last night, but
> there's clearly something VERY obvious I'm missing.
> 
> 
If the problem is on the XP station (no packets egressing), could there
be an XP personal firewall problem? - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


