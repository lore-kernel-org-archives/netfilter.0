From: Boryan Yotov <yotov@prosyst.com>
Subject: Re: Which modules are reuqired for masquerading?
Date: Wed, 04 Jan 2006 17:26:52 +0100
Message-ID: <43BBF74C.3000406@prosyst.com>
References: <194f62550601040748q3b2ee549r@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <194f62550601040748q3b2ee549r@mail.gmail.com>
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

Clemens Eisserer wrote:
> Hello,
> 
> I would like to use my Nokia770 interet-tablet as wireless router but
> iptables says that table "nat" does not exist and I need to insmod or
> update kernel.
> 
> So I think to load the modules is definitivly the easier way, but
> which modules are required for netfilter to be able to do
> masquerading/nat?
> 
> Thank you in advance, lg Clemens
> 
> 
> 

At least:

1. ip_conntrack
2. iptable_nat
3. ipt_MASQUERADE (optional: Only when you really want to use the 
MASQUERADE target)

