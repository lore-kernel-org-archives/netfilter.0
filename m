From: Jason Opperisano <opie@817west.com>
Subject: Re: No Internet Connection
Date: Fri, 10 Sep 2004 12:56:51 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094835410.1900.151.camel@wolfpack.ljm.dom>
References: <20040910144901.42036.qmail@web50204.mail.yahoo.com>
	<4141D921.8020100@pbl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4141D921.8020100@pbl.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Fri, 2004-09-10 at 12:41, Aleksandar Milivojevic wrote:
> > $IPTABLES -N tcp_invalidos
> > 
> > $IPTABLES -A tcp_invalidos -p tcp --tcp-flags SYN,ACK
> > SYN,ACK \
> > -m state --state NEW -j REJECT --reject-with tcp-reset
> > $IPTABLES -A tcp_invalidos -p tcp ! --syn -m state
> > --state NEW -j LOG \
> > --log-prefix "Novo nao SYN:"
> > $IPTABLES -A tcp_invalidos -p tcp ! --syn -m state
> > --state NEW -j DROP
> 
> Here's the place where you made an error.  When you reach end of 
> "tcp_invalidos" chain, default policy for INPUT/OUTPUT/FORWARD chains 
> will be applied (which is DROP).  Which means, all packets will be 
> dropped by the firewall.

i don't know that i agree with this statement.  when a packet reaches
the end of custom chain "tcp_invalidos" and has not matched any rules in
that chain--it should return to the calling chain where it left off;
i.e.

        iptables -P INPUT DROP
        iptables -A INPUT -j badstuff
        iptables -A INPUT -j goodstuff
        iptables -A INPUT -j LOG
        
a packet not matching any rule in "badstuff" will return to INPUT, and
then jump to "goodstuff"...  if the packet doesn't match any rule in
"goodstuff" it will return to INPUT, get logged, and *then* get dropped,
as it has hit the end of the INPUT chain and not matched any rules. 
only then does the POLICY of the chain get enforced.

-j

=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~
We don't smoke and we don't chew, and we don't go with girls that do. --
Walter Summers
=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~=~


