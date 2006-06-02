From: "Shane R. Spencer" <shane@tdxnet.com>
Subject: Egress port/packet filtering for Hotels/Hotspots
Date: Fri, 02 Jun 2006 10:18:49 -0800
Message-ID: <1149272329.5691.26.camel@hanshi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

OK.. I am new to the list so "yo whats hanging trip daddys".

I operate a few hotspots and am having some wonderful issues with some
very hostile customers staying at a hotel we provide wireless Internet
access for.  It is free and we have public IP's for all wireless clients
staying at the hotel, which I am starting to think was a stupid idea,
however older VPN implementations almost required it in order to keep
support requests to a minimal.

I am hoping to block all but pop/imap/smtp(filtered via
clamsmtp)/http(transparent squid)/VPN's and drop everything else.  I
found a few helpful links inlcuding this one:

http://www.enterprisenetworkingplanet.com/netsysm/article.php/2168251

At this point I just need a little advice on the do's and dont's of this
kind of situation.

Should I block all traffic ingress forwarded traffic if I don't want
folks hosting web servers during their long stay at the hotel, not to
mention p2p traffic.

Should I block all high ports 1024:65535 unless they are somehow related
to traffic, which I am unsure of how that works.

I am also using ipp2p which is working very well for p2p traffic,
however that doesn't stop a lot of worm/trojan/virus floodage from going
egress.

Shane Spencer


