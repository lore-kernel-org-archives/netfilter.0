From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: icmp echo reply && FORWARD chain
Date: Mon, 3 May 2004 00:03:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405030003.48725.Antony@Soft-Solutions.co.uk>
References: <006701c43051$39130ad0$68892090@grouse> <200405021642.01619.Antony@Soft-Solutions.co.uk> <009801c43096$e999e0a0$68892090@grouse>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <009801c43096$e999e0a0$68892090@grouse>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Sunday 02 May 2004 11:43 pm, Jee J.Z. wrote:

> Hi Antony,
>
> Oh, dear! I am making a lot ot mistakes. The rules are as follows:
>
> iptables -F
> iptables -F -t nat
> iptables -I FORWARD -j QUEUE
> iptables -t nat -A POSTROUTING -o eth0 -j SNAT --to global_ip
> iptables -t nat -A PREROUTING -i eth0 -j DNAT --to 192.168.0.2
>
> The problem is that it seems icmp request destined to PC2 can be caught by
> the FORWARD chain, however, the icmp reply destined to PC2 is ignored by
> the FORWARD chain.

This may seem like a strange suggestion (however, it seems you are trying to 
do something quite strange, I think...), but try putting the QUEUE target 
into the mangle table instead of the filter table (mangle tables generally 
see more packets than filter tables, because nothing 'magic' happens in the 
background, causing packets to bypass them, which is the case with filter 
tables and nat tables):

iptables -A FORWARD -t mangle -j QUEUE

Regards,

Antony.

-- 
The idea that Bill Gates appeared like a knight in shining armour to lead all 
customers out of a mire of technological chaos neatly ignores the fact that 
it was he who, by peddling second-rate technology, led them into it in the 
first place.

 - Douglas Adams in The Guardian, 25th August 1995

                                                     Please reply to the list;
                                                           please don't CC me.


