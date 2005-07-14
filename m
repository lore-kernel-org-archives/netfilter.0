From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: OUTPUT filtering
Date: Thu, 14 Jul 2005 17:56:21 +0200
Message-ID: <42D68B25.6010305@mnemon.de>
References: <04EE7AD0450F7B498BA216312943A1A102937F25@blrse201.ap.infineon.com>	<42D4E11C.2080100@mnemon.de>	<Pine.LNX.4.61.0507131212090.14635@yvahk01.tjqt.qr>	<42D5291E.7090308@gmx.co.uk>
	<42D6589E.5090707@ufomechanic.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42D6589E.5090707@ufomechanic.net>
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

Amin Azez schrieb:
> Quite so, but output filtering can also be applied to a
> firewall/router/bridge with no user accounts.

Definitely this is true. But why would you want to apply output
filtering to a firewall,..., without any user account ? I can't see the
point in this, if we are talking about general output filtering like
having a DROP policy in OUTPUT.

Only locally generated packets go through OUTPUT and most likely you
want this traffic (proxies,...). Given that there is no config error, if
there is unwanted traffic on the box - let's say IRC - chances are best
that the box is compromized and as there is no user account, the
intruder has root priveleges. So he is perfectly able to circumvent any
filtering. So, output filtering didn't help.

Ofcourse there are good reason for single OUTPUT rules - this list
helped me to remember identd, which caused a responding delay of about
30s - but this is not generally.

May be I'm missing important views, but I can't see that output
filtering makes sense.

Have a nice time,

Joerg


