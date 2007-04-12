From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: No timestamp on log entries.
Date: Thu, 12 Apr 2007 14:47:01 +0200 (MEST)
Message-ID: <Pine.LNX.4.61.0704121446320.14441@yvahk01.tjqt.qr>
References: <200704120726.46248.netfilter@arntzen.us>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200704120726.46248.netfilter@arntzen.us>
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
To: Steve <netfilter@arntzen.us>
Cc: netfilter@lists.netfilter.org


On Apr 12 2007 07:26, Steve wrote:
>
>I am running DSL with kernel 2.4.26 and iptables 1.2.6a.
>
>When I use -j Log, I see the log of blocked packets, but without a timestamp.  
>I can't seem to find out why and don't know if there is an iptables or 
>syslog/klog option to use to add the timestamp.
>
>Thanks in advance for your help,

Set /sys/modules/printk/parameters/printk_time to 1 instead
or boot with the "time" parameter.

Jan
-- 

