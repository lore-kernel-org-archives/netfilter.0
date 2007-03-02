From: "Martijn Lievaart" <m@rtij.nl>
Subject: Re: iptables, DNAT, and SMTP
Date: Fri, 2 Mar 2007 16:40:43 +0100 (CET)
Message-ID: <28509.2801125304$1172850146@news.gmane.org>
References: <1832A25C-5FC3-4F24-B55A-C6069A71CD5D@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1832A25C-5FC3-4F24-B55A-C6069A71CD5D@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Brandon Seaver <brandon.seaver@gmail.com>
Cc: netfilter@lists.netfilter.org

<citaat van="Brandon Seaver">
> Hello,
>
> I've been reading for a couple days now and my mind has gone numb.
>
> I'm hoping to get some help from the community, and I'm sure I'm just
> overlooking something simple. My goal is to forward smtp traffic
> destined for one machine to another based on source.
>
> I have done this: echo 1 > /proc/sys/net/ipv4/ip_forward
>
> I've enabled the loading of iptable_nat in the iptables config file.
>
> This is the base of what I'm using in my /etc/sysconfig/iptables
> file. Any direction on what I'm missing would be greatly appreciated.
>

(rules snipped)

Looks fine. Does return traffic go through the same machine? Otherwise it
is never de-DNATted and you would need something like an rinetd solution.

HTH,
M4


