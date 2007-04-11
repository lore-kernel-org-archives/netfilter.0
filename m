From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Time module included in the default Fedora
Date: Wed, 11 Apr 2007 19:34:53 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0704111932500.20436@yvahk01.tjqt.qr>
References: <b317600c0704110750x30861e6ft6cd0a53d415cba74@mail.gmail.com>
	<b317600c0704110752g2f9a82a1x8b18adaae15f775e@mail.gmail.com>,
	<1165438164.4846.3.camel@localhost.localdomain>
	<Pine.LNX.4.61.0704111749490.32056@yvahk01.tjqt.qr>
	<461D0DD7.7050408@trash.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <461D0DD7.7050408@trash.net>
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
To: Patrick McHardy <kaber@trash.net>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

Hi,

On Apr 11 2007 18:33, Patrick McHardy wrote:
>
>The question whether to merge the time module came up repeatedely
>at netfilter workshops, but it was always decided against it so far,
>mainly because it apparently can't deal with timezones and daylight
>saving time.

Why, let iptables, or more precisely, ipt_time.c, handle timezones,
and pass an UTC value to the kernel -- that's what it is best at
dealing with.

>IIRC Harald had strong feelings about it, I personally
>don't care much about this shortcoming as long as its documented.
>I'm not even sure its correct since the kernel has sys_tz. So if
>anyone finds out and submits a patch, I'll consider it.
>
>> Though that leaves me puzzled why connlimit has not gone in yet
>> (it all simplifies maintenance so much IMO). BTW, how about it?
>
>As I stated multiple times, the reason why its not included is that
>its horribly slow. But since I don't see any better way to do this
>and I know quite a few people are using this, I would consider this
>as well if someone sends me a patch, which has not happened so far.

So it's just that I need to pull the pomng code and make a diff out
of it, is that all? (Plus any compilation and perhaps runtime fixes,
of course.)


Jan
-- 

