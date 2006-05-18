From: Menno Smits <menno@netboxblue.com>
Subject: Re: Questions re iproute2, netfilter, and locally sourced packets
Date: Thu, 18 May 2006 14:55:45 +0100
Message-ID: <446C7CE1.5080209@netboxblue.com>
References: <446576D0.2050407@aut.ac.nz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <446576D0.2050407@aut.ac.nz>
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
To: Ian Batterbee <ian.batterbee@aut.ac.nz>, Netfilter Mailing list <netfilter@lists.netfilter.org>

Ian Batterbee wrote:
> 
> 2. How can I identify to "ip rule" packets that are locally sourced ? 

I've used something like this in the past:

ip rule add iif lo lookup <some table>

That rule will match locally generated packets regardless of where they 
are going.

Hope that helps,
Menno

