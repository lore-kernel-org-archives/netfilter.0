From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: (no subject)
Date: Tue, 29 Jun 2004 14:30:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406291430.38881.Antony@Soft-Solutions.co.uk>
References: <1B5A52EE434FEB48AA4803AD84BD3FC30552E5@goliath.tngnet.net>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1B5A52EE434FEB48AA4803AD84BD3FC30552E5@goliath.tngnet.net>
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

On Tuesday 29 June 2004 2:19 pm, Richard Gutery wrote:

>  I am form the Microsoft and OpenBSD world and have recently begun using
> RH7.3 for my firewall.
>
> I need to block an Internet Address.

What do you mean by "block"?

1. Stop packets from that address getting in to your firewall?
2. Stop packets from that address going through your firewall?
3. Stop packets to that address coming from your firewall?
4. Stop packets to that address going through your firewall?
5. Some combination of the above?

> I have theses two rules in my iptables file:
>
> $IPT -t filter -A INPUT  -p tcp -s 0/0 -d 64.246.26.185  --dport 80 -m
> limit --limit 2/minute -j $STOP
> $IPT -t filter -A OUTPUT -p tcp -s 64.246.26.185 -d 0/0  --dport 80 -m limit
> --limit 2/minute -j $STOP
>
> $STOP and $IPT are macro substitutions that works for everything else,
> so I know that's not the problem.

What does the $STOP macro expand to?

Also, the above rules are rate limiting rules - they will prevent packets 
flowing more quickly than you specify - that is not at all the same thing as 
blocking packets completely.

Tell us more precisely what you want to do (see above) and we can probably 
advise on how to do it.

Regards,

Antony.

-- 
"640 kilobytes (of RAM) should be enough for anybody."

 - Bill Gates

                                                     Please reply to the list;
                                                           please don't CC me.


