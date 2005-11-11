From: Payal Rathod <payal-iptables@scriptkitchen.com>
Subject: Re: DNAT query
Date: Fri, 11 Nov 2005 11:11:11 -0500
Message-ID: <20051111161111.GA31652@tranquility.scriptkitchen.com>
References: <20051111103020.GB18203@tranquility.scriptkitchen.com>
	<437478FE.8000804@mnemon.de>
	<20051111114120.GA22915@tranquility.scriptkitchen.com>
	<43748C7D.7060206@mnemon.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <43748C7D.7060206@mnemon.de>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Fri, Nov 11, 2005 at 01:20:13PM +0100, J?rg Harmuth wrote:
> It depends. But as Robs solution works for you, it looks like you only
> need to redirect/forward connections (roughly: PREROUTING -> FORWARD ->
> POSTROUTING). You only need nat/OUTPUT for packets, generated on the
> firewall itself (roughly: local process -> OUTPUT -> POSTROUTING). If
[...]

I am sorry but you lost me here. Can you give the complete ruleset which 
I need now. I always thought I needed PREROUTING as well as OUTPUT.
Thanks in advance.
With warm regards,
-Payal

