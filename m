From: "Dave Beach" <drbeach@rogers.com>
Subject: Networking question
Date: Sat, 24 Dec 2005 13:34:05 -0500
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4wwL6DwAQAAAAdIdG2rUYq0C89CEWuAaQWwEAAAAA@rogers.com>
References: <E1EqDrd-00062I-00@smtp0.herald.ox.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E1EqDrd-00062I-00@smtp0.herald.ox.ac.uk>
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

 
This is undoubtedly off-topic in oh-so-many ways; I'd be quite happy to be
redirected to another, more appropriate mailing list should someone be so
kind as to suggest one.

Internal, home, private network, WinXP boxen and a Squid proxy, connecting
through an iptables box to my router and cable modem. Everything works
peachy.

While trying to poke bittorrent holes through my iptables setup (see? Some
vague evidence of relevance), I encountered problems and decided to take the
proxy out of the picture. VERY much to my surprise, when I reconfigured IE
to not use the proxy (and configured iptables to allow for a direct
connection), I see no HTTP traffic whatsoever leaving the XP box destined
for the firewall. In fact, no TCP traffic either (all traffic analysis done
with ethereal on the XP box). I can ping to/from the XP box, and see THAT
via ethereal.

I am considerably confused by this. My presumption was that IE would just
happily send HTTP traffic directly to the firewall, but this is NOT the
behaviour I'm seeing.

I know it's Christmas Eve day, and I was out a bit late last night, but
there's clearly something VERY obvious I'm missing.


