From: James Lay <jlay@slave-tothe-box.net>
Subject: Re: Interesting message (SOLVES (sorta))
Date: Tue, 09 Oct 2007 14:17:40 -0600
Message-ID: <C3313E04.B78E%jlay@slave-tothe-box.net>
References: <470B8B2B.6050603@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <470B8B2B.6050603@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>




On 10/9/07 8:07 AM, "Grant Taylor" <gtaylor@riverviewtech.net> wrote:

> On 10/08/07 21:44, James Lay wrote:
>> Ok this is interesting...I recompiled my iptables-1.3.8 with make
>> clean then make, and when I did a make install, I didn't see the
>> extension libipt_string being created.  I did a make distclean, then
>> forced it to the kernel dir with make KERNEL_DIR=/usr/src/linux.
>> This time I see a libipt_string.so, but running make install still
>> doesn't actually install it.  I had to manually copy it into
>> /usr/lib/iptables.  Interesting...but mission accomplished.  Thanks
>> to all for the assist :)
> 
> Good.  I'm glad that you got things working.  This sounds like an
> undocumented feature or bug, take your pick.  If it is the former, you
> may want to drop a line to the maintainer of the libipt_string match
> extension.
> 
> 
> 
> Grant. . . .
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


Sounds good...I was wondering if it was more of a Makefile issue, but I'll
send to the string folks as well :)

Thank you,
James


