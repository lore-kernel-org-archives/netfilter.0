From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: [PATCH] flow statistic match
Date: Wed, 18 Sep 2002 22:41:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020918214152.SWHP295.mta06-svc.ntlworld.com@there>
References: <Pine.LNX.4.44L.0209172337160.10390-102000@hunger.screamingdaemon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44L.0209172337160.10390-102000@hunger.screamingdaemon.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wednesday 18 September 2002 7:44 am, Jay Schulist wrote:

> Hello Harald,
> Here is a new match which adds per tuple packet and byte statistics along
> with allowing the user to match on the number of bytes and packets for a
> flow.
>
> Iptables userspace patch is against a clean iptables-1.2.7a
> Kernel patch is against a clean linux-2.4.19
>
> # cat /proc/net/ip_conntrack
> tcp      6 432000 ESTABLISHED src=192.168.1.3 dst=192.168.1.100 sport=22
> dport=3368 pkts=39 bytes=4024 src=192.168.1.100 dst=192.168.1.3 sport=3368
> dport=22 pkts=47 bytes=3512 use=1
>
> flow v1.2.7a options:
>    --lt-packet  num             Match on less than 'num' packet.
>    --lt-byte    num             Match on less than 'num' byte.
>    --gt-packet num              Match on greater than or equal 'num' packet.
>    --gt-byte   num              Match on greater than or equal 'num' byte.

Consistency with other languages would suggest that --gt- means "greater 
than".   If you want "greater than or equal" use --ge-

Antony.

-- 

You can spend the whole of your life trying to be popular,
but at the end of the day the size of the crowd at your funeral
will be largely dictated by the weather.

 - Frank Skinner

