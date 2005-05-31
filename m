From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: two router connected to the internet
Date: Tue, 31 May 2005 14:51:34 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0505311450550.32062@yvahk01.tjqt.qr>
References: <429C5AA7.3050305@oxance.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <429C5AA7.3050305@oxance.com>
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
To: rodolphe <rodolphe.averty@oxance.com>
Cc: netfilter@lists.netfilter.org


> Hello,
>
> i have two router connected to the internet and i want to send my tcp
> connection between them.

If I seen right, then there is a "multipath equal cost Round Robin" method in 
2.6.12-rc4 which does this at the routing level, so it would not require you 
to do at the netfilter level.


Jan Engelhardt
-- 

