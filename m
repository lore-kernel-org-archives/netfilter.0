From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: (no subject)
Date: Tue, 29 Jun 2004 15:08:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406291508.45532.Antony@Soft-Solutions.co.uk>
References: <1B5A52EE434FEB48AA4803AD84BD3FC37945@goliath.tngnet.net>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1B5A52EE434FEB48AA4803AD84BD3FC37945@goliath.tngnet.net>
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

On Tuesday 29 June 2004 2:49 pm, Richard Gutery wrote:

> Stop macro:
> $IPT -N LD
> $IPT -A LD -j LOG
> $IPT -A LD -j DROP

That has me really confused.   I was expecting you to say that $STOP expanded 
to the word DROP, or some other valid target for the -j option on the 
netfilter command line.

> $STOP=LD (LD = Log and Drop)

I don;t quite see how you can use this after -j on an iptables rule, 
however...

> $IPT = /sbin/iptables
>
> I need to totally block all packets to and from this address 64.246.26.185.
> So BLOCK means BLOCK.
>
> We OpenBSD users usually mean blocking as dropping the silly thing on the
> floor. No ifs, ands or buts. Just gone...

Oh, I understood what you meant by "block" - I wasn't sure which packets you 
wanted to block, though, since it wasn't clear whether we were talking about 
source or destination addresses, and forwarding through the firewall or going 
to/from it directly.

> As for the limiting, I simply copied a rule that was already in a
> firestarter script. So if I need to change the rule, I would be more than
> willing. Am I to assume that this is a bad rule?

Well, it certainly won't BLOCK (using your definition above) - it will rate 
limit - which means that some packets will still come through.

I suggest the following:

iptables -I INPUT -s 64.246.26.185 -j DROP
iptables -I OUTPUT -d 64.246.26.185 -j DROP
iptables -I FORWARD -s 64.246.26.185 -j DROP
iptables -I FORWARD -d 64.246.26.185 -j DROP

Regards,

Antony.

-- 
In Heaven, the police are British, the chefs are Italian, the beer is Belgian, 
the mechanics are German, the lovers are French, the entertainment is 
American, and everything is organised by the Swiss.

In Hell, the police are German, the chefs are British, the beer is American, 
the mechanics are French, the lovers are Swiss, the entertainment is Belgian, 
and everything is organised by the Italians.

                                                     Please reply to the list;
                                                           please don't CC me.


