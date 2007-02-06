From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: ip_conntrack hashsize problem
Date: Tue, 6 Feb 2007 18:11:38 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0702061810530.30216@yvahk01.tjqt.qr>
References: <45C89FD5.4020508@volia.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45C89FD5.4020508@volia.net>
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
To: Sergey Alexanov <freak@volia.net>
Cc: netfilter@lists.netfilter.org


On Feb 6 2007 17:33, Sergey Alexanov wrote:
> can anybody suggest me in the following issue:
>
> # grep ip_conntrack /etc/modprobe.conf
> options ip_conntrack hashsize=2097152
>
> #  modprobe ip_conntrack
> #  lsmod | grep ip_conntrack
> ip_conntrack           53924  0
>
> # cat /proc/sys/net/ipv4/netfilter/ip_conntrack_max
> 16777216
> # cat /proc/sys/net/ipv4/netfilter/ip_conntrack_buckets
> 2097152
>
> looking fine..
>
> but if i try to insert above 16000 rules with connection tracking i getting an
> error:

"number of rules" is completely different to "ip_conntrack_max".



Jan
-- 

