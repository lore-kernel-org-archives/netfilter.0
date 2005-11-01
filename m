From: "Martijn Lievaart" <m@rtij.nl>
Subject: Re: libipq: problems changing destination port
Date: Tue, 1 Nov 2005 16:11:29 +0100 (CET)
Message-ID: <42471.217.166.60.19.1130857889.squirrel@ma.rtij.nl>
References: <20051031192724.16806.qmail@web52802.mail.yahoo.com>
	<Pine.LNX.4.61.0511010117560.17023@filer.marasystems.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0511010117560.17023@filer.marasystems.com>
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
To: netfilter@lists.netfilter.org

Henrik Nordstrom zei:
> But if you really want to do the port translation in userspace, then
> packets in both directions MUST be sent to QUEUE in iptables and the
> userspace would need to figure out what to do with the traffic. And you
> also MUST make sure that ip_conntrack is not activated (loaded) on the
> server.

And you SHOULD translate all ICMP errors pertaining to this connection.

M4



