From: "Leonardo Rodrigues Magalh?es" <leolistas@solutti.com.br>
Subject: Re: how can I improve the throughput of linux firewall that use the netfilter + iptable
Date: Fri, 24 Oct 2003 11:33:01 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000d01c39a3b$bb997450$8b00000a@casa>
References: <6257303.1067001733624.JavaMail.postfix@mx17.mail.sohu.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: zhaohui_scu@sohu.com, netfilter@lists.netfilter.org


    Number os PCs is not the most important information. We need you to give
us some more data about the firewall you're pretending to build, like:

1) internet connection speed (256k DSL, 1.5 T1, more?? )
2) complexity of your rules (simple rules, very complex rules)
3) any other information you can share with us .....


    But I can guarantee you that netfilter can get you VERY good throughput
**IF** you think before making the rules. We've seen lots of people
complaining about bad throughputs but almost all the times the problem is
related to their rules, build in a not-smart way, and not related to
iptables/netfilter itself.

    Question: what's smartbits ????? I've never heard about it .....


    Sincerily,
    Leonardo Rodrigues

----- Original Message ----- 
From: <zhaohui_scu@sohu.com>
To: <netfilter@lists.netfilter.org>
Sent: Friday, October 24, 2003 10:22 AM
Subject: how can I improve the throughput of linux firewall that use the
netfilter + iptable


>
> I want to use the netfilter+iptables for my company's local_net.
>
> but I have read the following words on some webpage
> "we use linux as our router. i just tested the performance of the router
with smartbits, and i found that the throughput of 64byte .and the result is
not good"
>
> we have not the smartbits
>
> but we want to use "iptables + netfilter + a normal pc with two eth " for
our company
> there are about 1,000 PCs in the local_net
>
> what can I do to improve it


