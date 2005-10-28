From: Radek Hladik <rhladik@tfc.cz>
Subject: Re: IPset_iptree with timeouts on Fedora Core 4
Date: Fri, 28 Oct 2005 02:57:16 +0200
Message-ID: <4361776C.5070706@tfc.cz>
References: <436041CF.7090009@tfc.cz>
	<Pine.LNX.4.58.0510272129210.2649@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0510272129210.2649@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

Jozsef Kadlecsik wrote:

>>Oct 27 02:42:58 radek kernel: Debug: sleeping function called from
>>invalid context at mm/slab.c:2126
>>    
>>
>
>Sigh. It seems I was capable to commit all possible stupid mistakes in
>iptree. Your fix is correct, expect a new release tomorrow.
>  
>

Thanks a lot.

>  
>
>>But iptree still had not members removed after specified timeout. I have
>>"discovered" (after reading the source code)  that the iptree set need
>>to have set the default timeout value (with --timeout option). Is this
>>true or am I doing something wrong?
>>    
>>
>
>That is a feature. Originally iptree did not support the timeout of the
>entries. In order to keep backward compatibility, the default (i.e no
>timeout) is preserved.
>  
>
I'm afraid I wrote it a little bit confusing :(
What I mean is that when I create iptree without default timeout:

ipset -N test iptree

and now I try to add member with timeout:

ipset -A test 1.2.3.4%60

but the timeout is not working and IP 1.2.3.4 stays in the iptree 
forever. According to log messages:
kernel: net/ipv4/netfilter/ip_set_iptree.c: ip_tree_gc (DBG): gc: 1 2 3 
4: expires 1 jiffies 9992264
The garbage collector is called but expires value is set to 1. I think 
that it is because of the line
ipt_set_iptree.c:141    dtree->expires[d] = map->timeout ? (timeout * HZ 
+ jiffies) : 1;
which sets expires to 1 when adding member with timeout to non-timeout 
iptree. I think it would not break backward compatibility as old 
commands do not use the ip%timeout notation.

And I've found another issue I want to ask about. Is there any 
possibility to set timeout different from default timeout via ipt_SET 
target?


Radek



