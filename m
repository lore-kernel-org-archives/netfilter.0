From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: limit extension
Date: Wed, 20 Jul 2005 17:05:52 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0507201705030.21464@yvahk01.tjqt.qr>
References: <42DD417F.4090804@rbw.goe.net> <42DE5C90.70603@rbw.goe.net>
	<20050720150118.GB15339@zion.homelinux.com>
	<42DE67D7.5040804@rbw.goe.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42DE67D7.5040804@rbw.goe.net>
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
To: Michael Schachtebeck <schachti@rbw.goe.net>
Cc: netfilter@lists.netfilter.org


>Why then save and restore the counters, if they are not used by the rules?

iptables-save done on a hourly/daily basis using cron is a nice way to find 
out statistics: how many bytes have been transferred to/from my httpd, etc.



Jan Engelhardt
-- 
| Alphagate Systems, http://alphagate.hopto.org/

