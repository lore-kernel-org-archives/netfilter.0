From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Marks set in PREROUTING got lost
Date: Thu, 28 Sep 2006 10:29:59 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0609281029430.21498@yvahk01.tjqt.qr>
References: <451B0E63.3010806@gmx.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <451B0E63.3010806@gmx.de>
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
To: Clemens <clemens.schaefer@gmx.de>
Cc: netfilter@lists.netfilter.org

>Hi everyone,
>
>after experimenting with setting marks (--set-mark) in the

What marks, per-packet marks or per-connection marks?

>PREROUTING chain in the mangle table, I found out, that those marks
>were not accessible/matchable in PREROUTING nat table. I was able to
>see the marks in chain FORWARD mangle table though :-(
>
>Is this behavior supposed to be like that?
>
>Thank you for your help!
>
>Greets, Clemens
>
>

Jan Engelhardt
-- 

