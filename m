From: Frank Gruellich <frank@home.manuelm.org>
Subject: netfilter meets iproute in distributed routers
Date: Tue, 10 Feb 2004 22:02:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040210210203.GZ17644@home.manuelm.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hello,

I am trying to do some weird routing.  This is my (simplified[1]) setup:

                    ,---.
                    | S |
                    `-+-'
                      | .1.0/24
      ,---. .3.0/24 ,-+-.
 0/0--+ A +---------+ B +--0/0
      `---'         `---'

Well, we moved to the new IPv2 last year... just kiddin, all nets are
subnets of 192.168.0.0/16.  Box A and B masq the internal nets to their
IP# given from the (different) ISPs.  S has .1.1 and runs several
services reachable via B and, by default, uses B as its gateway to 0/0.

Sometimes somebody connects to box A on a specific port $P, which I DNAT
to S.  (Every connect to box B to this port will be refused.)  The
problem arises, when I try to catch the answer to route it to A.  I
thought about using -j MARK of -t mangle and a special routing table (as
described in the LARTC, chapter 11).

Okay, let's say I would use

 # iptables -t mangle -A PREROUTING -p tcp -s 192.168.1.1 \
 > --sport $P --dport 1024:65535 -m state --state RELATED,ESTABLISHED \
 > -j MARK --set-mark 1

on box B.  Replys to the connect will match, get the mark and will be
routed the right way to box A.  Now let's assume, S itself opens a
connection to the net.  It happens it uses $P as local port[2].  The
first packet would be -m state --state NEW and will not match the above
rule.  But any further will and will be routed a completely different
way[3].  If I omit the -m state every connections opened by S from $P
will be marked and routed via B (that would be acceptable, but is
somehow ugly).

Cool thing would be, if a packet is matched by the rule any subsequent
packets would match, too.  The -j DNAT works this way, AFAIK, but I
found nothing next to the -j MARK in the docs[4].  Then, similar to the
shown rule, I could accept all new connections and mark any remaining.
More cool thing would be, if I could use the conntrack of box A in a
rule on box B... well lets stay realistic.

Any hints, how I could do the trick?

Thanks in advance and sorry for my poor english,
 regards, Frank.
===footnotes===
[1] The whole setup can be found at
<URL:http://manuelm.clug.de/~frank/network/topologie.png> (48KB).  Box A
is loki + hydra, box B is morpheus.
[2] Is this possible when a service runs at this port?
[3] Would this work?
[4]
<URL:http://iptables-tutorial.frozentux.net/iptables-tutorial.html#TABLE.MARKMATCH>
-- 
Sigmentation fault

