From: Emilio Casbas <ecasbas@unav.es>
Subject: Re: log websites visited
Date: Fri, 01 Oct 2004 15:21:53 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <415D59F1.60804@unav.es>
References: <415D5063.4020707@datalux-spain.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <415D5063.4020707@datalux-spain.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vicent Gozalbes <vgozalbes@datalux-spain.com>
Cc: netfilter@lists.netfilter.org

Vicent Gozalbes wrote:

> Hello to all, I'm new in this list.
> I have an iptables firewall running in a Debian system in my Office.
> I would like to view all websites visited (IPs or name) for my workers.
> it's possible with iptables without using a proxy-cache, isn't it?
>
Iptables works on layer 3 and 4 of the OSI network model,
this mean it operates on the IP and TCP/UDP level, it doesn' t
designed to work in a application layer, for this purpose is used
the proxy server.
http://www.squid-cache.org is a good option.

Thanks
Emilio C.


