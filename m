From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Filter a TCP stream based on a text appearing in the initial IP
 packet of the stream
Date: Thu, 10 May 2007 16:15:06 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0705101611360.32349@yvahk01.tjqt.qr>
References: <22b256140705100551q3a67e680nb184c23f4966cb1d@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <22b256140705100551q3a67e680nb184c23f4966cb1d@mail.gmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Michael Ransburg <michael.ransburg@gmail.com>
Cc: netfilter@lists.netfilter.org


On May 10 2007 14:51, Michael Ransburg wrote:
>     of the stream
>
> Hi all,
>
> let's say someone is downloading a website using http/tcp/ip. This
> website is very large, i.e., there will be many IP packets in this TCP
> stream. I know that there is a certain phrase at the top of the
> website, let's say "foobar", which will therefore be part of the first
> IP packet of this TCP stream.

The first return packet is not guaranteed to carry the first byte of the HTML
page. If the HTTP header is "big enough" and the MTU is "small enough",
then it is likely that the packet is split before foobar.

Also see http://l7-filter.sourceforge.net/FAQ#usage

> I know that I can use the string match mechanism to match this first
> IP packet and drop it.
>
> However, is it also possibe to drop _all_ IP packets belonging to this
> TCP stream (i.e., also the reminder of the website) _if_ the first
> packet includes the phrase "foobar"?
>
> So what I want to say in a rule is:
> If the first (or simply "a") IP packet of a TCP stream contains a
> given phrase, then please filter (match) all IP packets which belong
> to this TCP stream.
>
> Can this be done using iptables / netfilter?

-m string --string foobar -j CONNMARK --set-mark 1
-m connmark --mark 1 -j DROP/REJECT/whatever.


	Jan
-- 

