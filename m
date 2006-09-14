From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: --to-destination of DNAT issue -- or my misinterpretation?
Date: Thu, 14 Sep 2006 16:36:33 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0609141635590.17997@yvahk01.tjqt.qr>
References: <c6c65ec80609131835l7d586b6r29e8226a93db7bab@mail.gmail.com>
	<c6c65ec80609131838x35b95470m42a61c6d6f27ec9f@mail.gmail.com>
	<c6c65ec80609140546w1089a228j6031fa049e4bd5d6@mail.gmail.com>
	<Pine.LNX.4.61.0609141525570.25864@yvahk01.tjqt.qr>
	<45096024.1050204@plouf.fr.eu.org>
	<Pine.LNX.4.61.0609141601340.25864@yvahk01.tjqt.qr>
	<450965A8.3070804@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <450965A8.3070804@plouf.fr.eu.org>
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
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org

>> 
>> That iptables(1) manpage got it right:
>> 
>> Later Kernels (>= 2.6.11-rc1) don't have the ability to  NAT
>> to
>> multiple ranges anymore.
>
> Well, the manpage included in my iptables 1.2.11 does't contain this.

That's a ... *slightly* old iptables.

> I wonder what happens when you try to create a NAT rule with multiple 
> --to with
> iptables < 1.3.4 and Linux >= 2.6.11.

Will probably return "unknown error 4294967295" (-1).



Jan Engelhardt
-- 

