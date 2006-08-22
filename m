From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: ipt_MARK/xt_MARK usage problem
Date: Tue, 22 Aug 2006 11:17:47 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0608221117001.18855@yvahk01.tjqt.qr>
References: <Pine.LNX.4.61.0608220815560.24532@yvahk01.tjqt.qr>
 <44EAA447.1080004@trash.net> <Pine.LNX.4.61.0608220830110.24532@yvahk01.tjqt.qr>
 <44EAA669.7050604@trash.net>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1751369AbWHVJTk@vger.kernel.org>
In-Reply-To: <44EAA669.7050604@trash.net>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Patrick McHardy <kaber@trash.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, netfilter@lists.netfilter.org

>>>>How do I get MARK back to work in -t filter -- possibly without hacking in 
>>>>xt_MARK.c?
>>>
>>>You won't, its not supposed to work in the filter table.
>> 
>> This worked in 2.6.16, where the ipt_mark_reg_v1 strucutre in xt_MARK.c did 
>> not have a .table limiter. (It also worked in practice, i.e. packets got 
>> marked like they should.) I do not see why this was changed.
>
>That is not true, all versions of the mark target starting in 2.4 had
>the same check in the checkentry function.

Oh sorry I mixed something up. It is CONNMARK which did work (and continues 
to do so) in -t filter... everything fine, sorry for the noise.



Jan Engelhardt
-- 
