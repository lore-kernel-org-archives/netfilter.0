From: Sagara Wijetunga <sagaralists@yahoo.com>
Subject: Re: SIP connection tracking
Date: Tue, 9 May 2006 02:38:10 -0700 (PDT)
Message-ID: <20060509093810.51861.qmail@web34208.mail.mud.yahoo.com>
References: <62884.193.173.147.3.1147164787.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <62884.193.173.147.3.1147164787.squirrel@webmail.sterenborg.info>
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
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

--- Rob Sterenborg <rob@sterenborg.info> wrote:

> On Tue, May 9, 2006 07:37, Sagara Wijetunga wrote:
> > Hi all
> >
> > I'm trying to prioritize the out going SIP related
> > traffic from my desktop computer.
> >
> > I tried:
> >
> > iptables -t mangle -A POSTROUTING -m helper
> --helper \
> > sip -m state --state ESTABLISHED,RELATED \
> > -j ...
> >
> > It simply doesn't detect SIP related traffic!
> 
> Perhaps only NEW traffic passes the mangle table,
> just like the nat table.. If
> that is the case, ESTABLISHED and RELATED packets
> are (probably) treated the
> same way as the NEW packet.
> But, I'm not sure about this.. Did you test that ?
> 

iptables -t mangle -A POSTROUTING \
-p udp --dport 5060 \
-j <mark packets>


Tcpdump shows entire SIP communication is marked up to
the last ACK packet.

This shows packets related to an ESTABLISHED
connection goes thru the mangle table. 

Iptables man page doesn't say any restriction.

Regards
Sagara

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

