From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: --to-destination of DNAT issue -- or my misinterpretation?
Date: Thu, 14 Sep 2006 16:01:49 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0609141601340.25864@yvahk01.tjqt.qr>
References: <c6c65ec80609131835l7d586b6r29e8226a93db7bab@mail.gmail.com>
	<c6c65ec80609131838x35b95470m42a61c6d6f27ec9f@mail.gmail.com>
	<c6c65ec80609140546w1089a228j6031fa049e4bd5d6@mail.gmail.com>
	<Pine.LNX.4.61.0609141525570.25864@yvahk01.tjqt.qr>
	<45096024.1050204@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45096024.1050204@plouf.fr.eu.org>
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

>> > It seems I can't specify several --to-destination (like the man page
>> > tells), and iptables doesn't spit any errors.
>> > 
>> > Am I doing something wrong?
>> 
>> Only one --to-destination is supported.
>
> This restriction was first introduced in kernel 2.6.11. Previous 2.6 kernels,
> as well as 2.4 kernels, should support multiple ranges.
>
> ChangeLog-2.6.11 :
> " [PATCH] Remove NAT to multiple ranges
> The NAT code has the concept of multiple ranges: you can say "map this
> connection onto IP 192.168.1.2 - 192.168.1.4, 192.168.1.7 ports
> 1024-65535, and 192.168.1.10".  I implemented this because we could.
>
> But it's not actually *used* by many (any?) people, and you can
> approximate this by a random match (from patch-o-matic) if you really
> want to.  It adds complexity to the code."
>
> changes-iptables-1.3.4.txt :
> " Print error message when multiple "--to" DNAT/SNAT args are used
> with kernel >= 2.6.10"
>                     ^^
> There seems to be a little mistake here, should be 2.6.11 according to Linux
> changelog.

That iptables(1) manpage got it right:

              Later Kernels (>= 2.6.11-rc1) don't have the ability to  NAT  to
              multiple ranges anymore.

>
>
>

Jan Engelhardt
-- 

