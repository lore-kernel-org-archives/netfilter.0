From: Ralph Churchill <mrchucho@yahoo.com>
Subject: Re: simply confusing
Date: Thu, 23 Jan 2003 12:40:57 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030123204057.27229.qmail@web11405.mail.yahoo.com>
References: <Pine.LNX.4.51.0301232123190.7027@dns.toxicfilms.tv>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.51.0301232123190.7027@dns.toxicfilms.tv>
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
Content-Transfer-Encoding: 7bit
To: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Cc: netfilter@lists.netfilter.org

Well, I added a logging rule before that:

iptables -A INPUT --source 10.11.0.0/16 \
  -j LOG --log-level info --log-prefix "iptables "

But when ever something gets through, it isn't being
logged either... If I do "iptables -L -v", then I see
that both rules (first the LOG, then the DROP) have
the same packet count.

I can try using "-I" instead, but I'd also like to
log, so how would I do that? Am I missing something
fundamental?

RMC


--- Maciej Soltysiak <solt@dns.toxicfilms.tv> wrote:
> > iptables -A INPUT --source 192.168.0.0/16 -j DROP
> >
> > Now, shouldn't that block any and ALL traffic from
> any
> > computer on the 192.168.*.* subnet?
> well that is enough to block all packets from that
> subnet,
> however, maybe you have other rules that accept
> traffic before
> this rule.
> try -I INPUT to put it at the begining of the chain.
> 
> Regards,
> Maciej Soltysiak
> 


__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com

