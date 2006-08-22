From: Patrick McHardy <kaber@trash.net>
Subject: Re: ipt_MARK/xt_MARK usage problem
Date: Tue, 22 Aug 2006 08:38:33 +0200
Message-ID: <44EAA669.7050604@trash.net>
References: <Pine.LNX.4.61.0608220815560.24532@yvahk01.tjqt.qr>
	<44EAA447.1080004@trash.net>
	<Pine.LNX.4.61.0608220830110.24532@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0608220830110.24532@yvahk01.tjqt.qr>
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
Cc: netfilter@lists.netfilter.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Jan Engelhardt wrote:
>>>How do I get MARK back to work in -t filter -- possibly without hacking in 
>>>xt_MARK.c?
>>
>>You won't, its not supposed to work in the filter table.
> 
> 
> This worked in 2.6.16, where the ipt_mark_reg_v1 strucutre in xt_MARK.c did 
> not have a .table limiter. (It also worked in practice, i.e. packets got 
> marked like they should.) I do not see why this was changed.


That is not true, all versions of the mark target starting in 2.4 had
the same check in the checkentry function.

