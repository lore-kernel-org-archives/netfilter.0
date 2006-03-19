From: Alexandru Dragoi <alex@zoomnet.ro>
Subject: Re: ipt_owner and ICMP
Date: Sun, 19 Mar 2006 02:22:22 +0200
Message-ID: <441CA43E.1040706@zoomnet.ro>
References: <004801c64aba$9e81b170$0301a8c0@asp>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <004801c64aba$9e81b170$0301a8c0@asp>
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
To: jay@esuna.co.uk
Cc: netfilter@lists.netfilter.org

jay@esuna.co.uk wrote:

>Hi,
>
>I'm currently using the ipt_owner module to enforce stronger outgoing packet
>filtering on certain daemons. I create a custom chain with the stronger
>rules and use '-m owner' to jump packets into the chain.
>
>This works fine for UDP and TCP, but my outgoing ICMP packets never match
>the rule. I understand why incoming ICMP should fail to match, but why are
>outgoing packets missing the filter?
>
>Chain OUTPUT (policy ACCEPT)
>target     prot opt source               destination
>acctboth   all  --  anywhere             anywhere
>ACCEPT     all  --  anywhere             anywhere
>apache-output  all  --  anywhere             anywhere            OWNER UID
>match
> iptest
>
>Chain apache-output (1 references)
>target     prot opt source               destination
>DROP       icmp --  anywhere             anywhere
>
>(nothing in the acctboth chain causes a jump)
>
>Any ideas?
>
>  
>
I think this is because icmp packets are just generated and sent away by
some part of the kernel after it received a syscall from a program with
uid 0 (only root can use icmp).

