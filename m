From: Luis legar Garcia <legar1@dnrpa.gov.ar>
Subject: Re: comments about lokkit default script (Faheem Mitha)
Date: Sat, 13 Sep 2003 10:01:49 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030913100149.1ee765e9.legar1@dnrpa.gov.ar>
References: <20030913042735.30230.73736.Mailman@netfilter-sponsored-by.noris.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030913042735.30230.73736.Mailman@netfilter-sponsored-by.noris.net>
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
To: Faheem Mitha <faheem@email.unc.edu>
Cc: netfilter@lists.netfilter.org

Dear Faheem,

As longh as I understand the rule:

iptables -A RH-Lokkit-0-50-INPUT -p tcp -m tcp --syn -j REJECT

it will reject ALL except INVALID, even 'Established' and 'Related' connections, 
which you should allways allow.
To avoid this I'd put just before it something like

iptables -A RH-Lokkit-0-50-INPUT -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT

and maybe the same rule but for UDP packets.
bye,
legar, from Argentina

> 
> On Fri, 2003-09-12 at 00:11, Faheem Mitha wrote:
> > Dear People,
> > 
[....]
> > in /etc/rc*, where the chain is defined (/in /etc/default/lokkit) by
> > 
> > #!/bin/sh
> > PATH=/sbin:$PATH
> > iptables -N RH-Lokkit-0-50-INPUT
> > iptables -F RH-Lokkit-0-50-INPUT
> > iptables -A RH-Lokkit-0-50-INPUT -i lo -j ACCEPT
> > iptables -A RH-Lokkit-0-50-INPUT -p udp -m udp -s 207.69.188.185
> > --sport 53 -d 0/0 -j ACCEPT
> > iptables -A RH-Lokkit-0-50-INPUT -p udp -m udp -s 207.69.188.186
> > --sport 53 -d 0/0 -j ACCEPT
> > iptables -A RH-Lokkit-0-50-INPUT -p udp -m udp -s 207.69.188.187
> > --sport 53 -d 0/0 -j ACCEPT
> > iptables -A RH-Lokkit-0-50-INPUT -p tcp -m tcp --syn -j REJECT
> > iptables -A RH-Lokkit-0-50-INPUT -p udp -m udp -j REJECT
> > 
[.....]
> > 
> > Thanks in advance for any reply.
> >                                                     Faheem.
> -- 

