From: "Marius Mertens" <marius.mertens@gmx.de>
Subject: Re: SSH Brute force attacks - Script version 1.0
Date: Mon, 27 Jun 2005 10:18:11 +0200
Message-ID: <000c01c57af0$c58cb5c0$4206a8c0@loki>
References: <5d2f379105062511588033857@mail.gmail.com>
	<002e01c579e1$4d326d00$4206a8c0@loki>
	<Pine.LNX.4.61.0506262243380.15156@yvahk01.tjqt.qr>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi everybody,

On Sunday, June 26, 2005 10:46 PM,
Jan Engelhardt wrote:

> On another note; I was criticized for using
>
>  -m limit --limit 2/minute -p tcp --dport 22
>
> which was too perceived as too restrictive by some (or just one).

Well, if it is too restrictive can only be said by knowing your environment,
but I certainly agree that it is a very restrictive setting to allow not
more than 2 connections per minute no matter what their source is. If your
system is accessible from the internet, it would allow a way too easy DOS,
and I assume that is exactly the reason why you want to exchange the line
;-)

> Anyway, I've looked closer into the manpage of dstlimit and
> I would be glad to exchange my lines with
>
>  -m dstlimit --dstlimit 2/minute --dstlimit-mode srcip-dstip
>  -p tcp --dport 22
>
> Comments please :)

This seems to do virtually the same, what the version with -m recent does,
so I think it should do the trick for you, especially if you successfully
used -m limit before and had no trouble with it. I have never used -m
dstlimit before, but there are two comments that came into my mind:
If you are afraid of somebody trying to DOS you, the recent match with the
added TTL check might be an even better choice.
Second is that while reading the manpage, I was a bit surprised when I saw
the default of 10 seconds for --dstlimit-htable-expire. You should test if
you don't have to increase that value to not end up with a rule that allows
one connection attempt every 10 seconds.
When implemented correctly to allow state NEW packets at the given rate and
DROP or REJECT them if they exceed their limits both recent and dstlimit
should do well, so it's probably just a matter of taste then ;-) I can only
say that I'm using the version with recent match like the "NetFilter
MailList SSH_Brute_Force Chain version 1.0" Grant posted, and it works
perfectly well for me. But I can't see a reason that dstlimit would not
work, so maybe you just want to try and test it ;-)

HTH,

Marius


