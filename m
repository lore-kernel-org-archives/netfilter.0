From: KOVACS Krisztian <hidden@balabit.hu>
Subject: Re: how to use sk_buff in netfilter
Date: Thu, 27 Oct 2005 10:55:10 +0200
Message-ID: <200510271055.10152@nienna>
References: <00d501c5dac7$22306070$060ae29f@javaboy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <00d501c5dac7$22306070$060ae29f@javaboy>
Content-Disposition: inline
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


  Hi,

On Thursday 27 October 2005 09.22, jywang wrote:
>     i want to make some change on ip packet in NF_IP_PRE_ROUTING
> hook. but i don't know what is the exactly means of each piece in
> struct sk_buff.

  http://vger.kernel.org/~davem/skb.html is a pretty good description of 
the skbs.

-- 
 Regards,
  Krisztian Kovacs

