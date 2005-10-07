From: Henrik Nordstrom <hno@marasystems.com>
Subject: Re: Iptables Forward Limit
Date: Fri, 7 Oct 2005 20:32:16 +0200 (CEST)
Message-ID: <Pine.LNX.4.61.0510072030310.17798@filer.marasystems.com>
References: <43454E5D.80802@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43454E5D.80802@hotmail.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: ZeuS SN <zeus_securenet@hotmail.com>
Cc: netfilter@lists.netfilter.org

On Thu, 6 Oct 2005, ZeuS SN wrote:

>   There is any limit of rules that can be added to the forward table ? I can 
> add 2048 rules, 10000000 rules ?

There is two limits:

  - Memory usage. The more rules, the more memory is used for the rules. 
With too many rules you run out of memory.

  - Speed. iptables with it's linear lookup is not very efficient at 
handling large rulesets. But nf-hipac is a good alternative in such 
situations. <url:http://www.hipac.org/>

Regards
Henrik

