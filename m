From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT Host down and ICMP host unreachable
Date: Fri, 2 Jan 2004 13:25:09 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401021325.09089.Antony@Soft-Solutions.co.uk>
References: <20031223063726.83624.qmail@web13421.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031223063726.83624.qmail@web13421.mail.yahoo.com>
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

On Tuesday 23 December 2003 6:37 am, JC wrote:

> Hello Everybody,
>
> I apologize if you've seen something like this but
> searching on something similar to the subject line
> above has turned up nill.
>
> Scenario
>
> HostA ------> FW/NAT -----(port translation) --->
> HOSTB
> (10.10.1.1)
> (192.168.7.1)
>
> Rules:
> iptables -A PREROUTING -t nat -p tcp --dport 80 -j
> DNAT --to 192.168.7.1:80
> iptables -A FORWARD -p tcp -d 192.168.7.1 --dport 80
> -j ACCEPT
>
> So everything works, but when HostB goes down for
> maintence or from a DOS or whatevever FW/NAT will send
> an ICMP host unreachable with the natted address to
> HostA.
>
> I suppose I'm correct in perceiving that this behavior
> is normal, so I'll have to ask how do some of you
> people go about dealing with situations such as these?

I don't understand the question.

If host B is down, then "host unreachable" is quite correct.

What behaviour would you expect, and what problem do you have with what 
happens at present?

Antony.

-- 
If the human brain were so simple that we could understand it,
we'd be so simple that we couldn't.

                                                     Please reply to the list;
                                                           please don't CC me.


