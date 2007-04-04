From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Debian 2.6.8/bridge/iptables/passive ftp
Date: Wed, 4 Apr 2007 12:29:33 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0704041228550.22282@yvahk01.tjqt.qr>
References: <361462969@web.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <361462969@web.de>
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
To: spaminator@web.de
Cc: netfilter@lists.netfilter.org


On Apr 4 2007 12:18, spaminator@web.de wrote:
>
>Rebooting the bridge box left me again with an unloaded ip_conntrack_ftp. So I
>made an entry in /etc/modules which caters for the module to be loaded on
>(re)boot. Strange thing that, because other modules related to iptables are
>being loaded automatically, although they are not compiled into the kernel
>too. Are there other "surprise"-modules that have to be loaded via
>/etc/modules?

ip_nat_*
ip_conntrack_*

* = irc, nat, h323, etc. look into your /lib/modules dir.


Jan
-- 

