From: "Martijn Lievaart" <m@rtij.nl>
Subject: Re: question about opening a port
Date: Fri, 4 Aug 2006 14:44:03 +0200 (CEST)
Message-ID: <41126.9117649228$1154695477@news.gmane.org>
References: <44CE57BC.8010601@speakeasy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44CE57BC.8010601@speakeasy.net>
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
To: Peter Horst <phorst@speakeasy.net>
Cc: netfilter@lists.netfilter.org

<citaat van="Peter Horst">
> Hello - if someone has a second, I could really use some help. I'm
> trying to open a port (in addition to the ones already open) in order to
> allow DNS traffic (port 53), both UDP and TCP.  Does the following
> iptables script look right for this purpose?
>
> Thanks very much.
>
> Chain RH-Firewall-1-INPUT (2 references)
> num  target     prot opt source               destination
> 1    ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0
> 2    ACCEPT     icmp --  0.0.0.0/0            0.0.0.0/0           icmp
> type 255

Better post the output of iptables-save, this output has not enough
information.

M4


