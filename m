From: Martijn Lievaart <m@rtij.nl>
Subject: Re: linux-2.6.21 iptables and NAT
Date: Sun, 24 Jun 2007 14:51:43 +0200
Message-ID: <467E68DF.8000500@rtij.nl>
References: <20070607144254.857d60f3cb0f91334d2d3f4f7d335ff9.26b3e9b4ca.wbe@email.secureserver.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070607144254.857d60f3cb0f91334d2d3f4f7d335ff9.26b3e9b4ca.wbe@email.secureserver.net>
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
To: John Zavgren <john@zavgren.com>
Cc: netfilter@lists.netfilter.org

John Zavgren wrote:
> I'm trying to build NAT functionality into the 2.6.21 kernel but it
> seems to have been stripped out.
>
> The default 2.6.15 kernel that comes with Fedora Core 5 contains the
> following parameter setting:
> CONFIG_IP_NF_NAT=m
>
> I cannot activate such a "rule" in 2.6.21. The complete list of options
> is:
>   

(snip)

Try CONFIG_NF_NAT

HTH,
M4


