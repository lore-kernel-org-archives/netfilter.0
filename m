From: Martijn Lievaart <m@rtij.nl>
Subject: Re: transparent proxy with captive page - ipt_recent?
Date: Tue, 26 Jun 2007 09:43:22 +0200
Message-ID: <4680C39A.7030902@rtij.nl>
References: <467FE1E4.2040306@sbirmc.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <467FE1E4.2040306@sbirmc.ac.uk>
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
To: Martin Whinnery <martin.whinnery@sbirmc.ac.uk>
Cc: netfilter@lists.netfilter.org

Martin Whinnery wrote:
> /sbin/iptables -t nat -A PREROUTING -p tcp --dport 80 -m recent 
> --rcheck --seconds 30 -j REDIRECT --to-ports 8080
> /sbin/iptables -t nat -A PREROUTING -p tcp --dport 80 -m recent --set 
> -j REDIRECT --to-ports 82
>
> So I thought the first rule wouldn't match first time around. Then the 
> second rule would provide the proxy instructions page, and make the 
> /proc/sys/net/ipt_recent/DEFAULT entry. This works fine.
>
> But the first rule should match on the next request. And it doesn't 
> seem to. And I don't understand.
>

I think you need to replace rcheck with update.


HTH,
M4


