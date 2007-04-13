From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: Re: Problem compiling nth match
Date: Fri, 13 Apr 2007 12:54:12 +0200
Message-ID: <BAY103-DAV738F38B47E55B94E982AFB25D0@phx.gbl>
References: <35D33283-D6A0-407D-AE3E-F03A3D364B70@musictrace.de>
Return-path: <netfilter-bounces@lists.netfilter.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Neubauer Christian <neu@musictrace.de>
Cc: netfilter@lists.netfilter.org

Neubauer Christian wrote:
> I am trying to get nth running. I have downloaded a fresh kernel
> 2.6.18, iptables-1.3.7 and latest patch-o-matic.
>
> It looks to me that nth is not anymore a patch, but is included in
> the regular iptables distri. Is that correct ?

exactly: you don't need POM anymore, just 2.6.18 +
iptables 1.3.7: it is called statistic match.



