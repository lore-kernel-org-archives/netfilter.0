From: James Lay <jlay@slave-tothe-box.net>
Subject: Re: Interesting message (SOLVES (sorta))
Date: Mon, 08 Oct 2007 20:44:26 -0600
Message-ID: <C330472A.B5E8%jlay@slave-tothe-box.net>
References: <470A47CE.8090805@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <470A47CE.8090805@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mail List - Netfilter <netfilter@vger.kernel.org>




On 10/8/07 9:07 AM, "Grant Taylor" <gtaylor@riverviewtech.net> wrote:

> On 10/07/07 21:54, James Lay wrote:
>> I've just recompiled my kernel...same kernel version, but now
>> compiled with 1.3.8.  I still get the same message.  Is there
>> something obvious that I'm missing here?  Thanks.
> 
> Did you recompile any IPTables related modules and re-install them?
> 
> Other than that, no, nothing obvious.
> 
> 
> 
> Grant. . . .
> -
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


Ok this is interesting...I recompiled my iptables-1.3.8 with make clean then
make, and when I did a make install, I didn't see the extension
libipt_string being created.  I did a make distclean, then forced it to the
kernel dir with make KERNEL_DIR=/usr/src/linux.  This time I see a
libipt_string.so, but running make install still doesn't actually install
it.  I had to manually copy it into /usr/lib/iptables.  Interesting...but
mission accomplished.  Thanks to all for the assist :)

James


