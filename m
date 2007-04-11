From: Patrick McHardy <kaber@trash.net>
Subject: Re: Time module included in the default Fedora
Date: Wed, 11 Apr 2007 18:33:27 +0200
Message-ID: <461D0DD7.7050408@trash.net>
References: <b317600c0704110750x30861e6ft6cd0a53d415cba74@mail.gmail.com>
	<b317600c0704110752g2f9a82a1x8b18adaae15f775e@mail.gmail.com>,
	<1165438164.4846.3.camel@localhost.localdomain>
	<Pine.LNX.4.61.0704111749490.32056@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0704111749490.32056@yvahk01.tjqt.qr>
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
To: Jan Engelhardt <jengelh@linux01.gwdg.de>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

Jan Engelhardt wrote:
> On Apr 11 2007 09:52, Fred Trotter wrote:
> 
>>      I was told to write here about getting the time module
>>included "upstream". I hope that someone here might be able  to
>>educate me on the process for getting these things done. I understand
>>that there are many iptables modules and that some are included by
>>default while others are not.


The question whether to merge the time module came up repeatedely
at netfilter workshops, but it was always decided against it so far,
mainly because it apparently can't deal with timezones and daylight
saving time. IIRC Harald had strong feelings about it, I personally
don't care much about this shortcoming as long as its documented.
I'm not even sure its correct since the kernel has sys_tz. So if
anyone finds out and submits a patch, I'll consider it.

> There are only a few cases why a maintainer decides against:
>   (1) it's a hack (best example: ipt_ROUTE)
>   (2) it's unmaintained (now that's strange)
>   (3) violates coding style (happens often)
>   (4) not enough interest on the users' sides (gotta change that)
> 
> Ask nicely (see [1],[2]), and maybe things get rolling (or not).
> 
> [1] http://archives.free.net.ph/message/20061206.204842.c1c8628a.en.html
> [2] http://archives.free.net.ph/message/20061207.030828.0d81b372.en.html
> 
> Though that leaves me puzzled why connlimit has not gone in yet
> (it all simplifies maintenance so much IMO). BTW, how about it?


As I stated multiple times, the reason why its not included is that
its horribly slow. But since I don't see any better way to do this
and I know quite a few people are using this, I would consider this
as well if someone sends me a patch, which has not happened so far.

>>      The problem is that the iptables userspace project documents
>>the time modules as though it is included, but at least in Fedora it
>>is not by default. They hold that they will not include it until it is
>>included "upstream", they indicated that you would be able to tell me
>>how to get it included "upstream".
> 
> 
> iptables is not the same as netfilter (= the kernel part). This is
> perhaps the biggest mystery. Why include something in iptables when
> it is not in the kernel.


It has been done in the past, but I deleted everything not included
upstream from iptables, mainly to avoid compatibilty breakage in
case we decide to merge something and the userspace API needs to
be changed (a lot of the old matches have 32/64 bit issues etc.)

