From: Damon Gray <dgray@internap.com>
Subject: Re: When do the rule apply?
Date: Wed, 15 Jun 2005 16:11:41 -0400 (EDT)
Message-ID: <Pine.LNX.4.62.0506151609130.29935@dgray-test.acs.internap.com>
References: <393114f905061513012ac2216a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <393114f905061513012ac2216a@mail.gmail.com>
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
To: Alexander Salmin <security.member@gmail.com>
Cc: netfilter@lists.netfilter.org


In Example1, rule #2 will never be hit. So Example2 is probably what you 
want if you want to except only port 80 to this machine and deny all 
others.

-Damon-

On Wed, 15 Jun 2005, Alexander Salmin wrote:

> Hi, I guess this question is just a silly one for experts, but I can't
> find the answer anywhere so I'm asking you guys.
>
> In what order do the assigned rules apply in this script?
>
> # Example1
> iptables -A INPUT -j DROP # rule #1
> iptables -A INPUT --dport 80 -j ACCEPT # rule #2
>
> #Example2
> iptables -A INPUT --dport 80 -j ACCEPT # rule1
> iptables -A INPUT -j DROP # rule2
>
> Will the both examples produce the same result?
> Or will rule2 in example 2 make rule1 in example2 vanish because it's
> telling the system to drop all?
>
>
>

