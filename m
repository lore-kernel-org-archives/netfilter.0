From: Martijn Lievaart <m@rtij.nl>
Subject: Re: stop/start iptables vs. "iptables-restore"
Date: Sun, 26 Aug 2007 22:24:14 +0200
Message-ID: <46D1E16E.9070706@rtij.nl>
References: <46CE273A.50807@funkware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46CE273A.50807@funkware.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Alex Tang <altitude@funkware.com>
Cc: netfilter@lists.netfilter.org

Alex Tang wrote:
> Hi folks,
>
> We run a linux based product (RHEL4 based, kernel-2.6.9-55, and 
> iptables-1.2.11). During the running of the product, when we make 
> changes to the iptables configuration, we use the SysV-like RHEL 
> script "/etc/init.d/iptables restart", which effectively stops 
> iptables, unloads all of the iptables based kernel modules, then 
> starts iptables and all the kernel stuff.
> A colleague recently asked why we're not using "iptables-restore" 
> instead of the script which does "stop/start".  I'm looking to see if 
> you know of any reasons why we should or should not use 
> iptables-restore vs. "stop/start".  Does it matter if the number of 
> connections on the system is high?  Our product can sometimes handle 
> many millions of connections per day.

The RHEL start/stop scripts do use iptables-save and -restore. They are 
as efficient as they can be.

HTH,
M4


