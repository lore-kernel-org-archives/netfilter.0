From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Matching misc TCP header fields
Date: Thu, 14 Aug 2003 09:08:29 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.51.0308140907040.11099@dns.toxicfilms.tv>
References: <20030814182810.GA2123@linux.local> <200308140827.11478.kernelpenguin@hot.ee>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200308140827.11478.kernelpenguin@hot.ee>
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
To: Elver Loho <kernelpenguin@hot.ee>
Cc: netfilter@lists.netfilter.org

> Any quick hints on how to match misc TCP header fields such as the window
> size? This new "worm" out there that sends portscans from spoofed IP
> addresses setting window size to 55808 is pretty interesting.
Funny that you mention it, out of the blue and curiosity I once made a
tcp window match, but never told anyone as that kind of match seemed
useless.

> some interesting traffic with that window size using tcpdump. How to do the
> same using netfilter? Quick search on the manpage didn't reveal anything
> related. Same result with a quick google query.
If you are interested I will look for it on my hdd.

Regards,
Maciej


