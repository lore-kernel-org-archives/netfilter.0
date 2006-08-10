From: Brent Clark <bclark@eccotours.co.za>
Subject: Re: netfilter in linux 2.6 & 2.4
Date: Thu, 10 Aug 2006 17:27:59 +0200
Message-ID: <44DB507F.2040401@eccotours.co.za>
References: <44DB484D.5080705@microembed.cn>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44DB484D.5080705@microembed.cn>
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
To: netfilter@lists.netfilter.org

Richard Cai wrote:
> Hi,
> 
> Recently I'm developing a firewall router with linux 2.4(and I can only
> use 2.4 for some reasons). But there are more resources about the linux 2.6
> netfilter. Do you think I should port the netfilter frameworke from linux
> 2.6 to linux 2.4 to have more support? :) (I think it's a bad idea).
> 
> richard

Hi

Im probally gonna get flamed for this, but I dont think this would be correct or good idea.

Heres an example, if you want to use squid on the machine on say like as a transparent proxy, you cant achieve this with the 2,4 kernel.

I queried the squid guys and the and they said squid 2.6.STABLE is compiled with epoll() support turned on by default.
The epoll() functions are supported only in kernels 2.6.x.

Also you said it yourself "But there are more resources about the linux 2.6 netfilter".

HTH

Kind Regards
Brent Clark


