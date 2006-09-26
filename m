From: <computational_complex-netfilter@yahoo.it>
Subject: Re: Question related to DROP target?
Date: Tue, 26 Sep 2006 12:36:46 +0200 (CEST)
Message-ID: <20060926103646.70894.qmail@web86912.mail.ukl.yahoo.com>
References: <20060925193156.58922.qmail@web56215.mail.re3.yahoo.com>
Reply-To: computational_complex-netfilter@yahoo.it
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060925193156.58922.qmail@web56215.mail.re3.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

--- Elvir Kuric <omasnjak@yahoo.com> ha scritto: 

> When I started it blocked my all connections, and I
> realised that ( <#iptables -P INPUT DROP
> #iptables -P OUTPUT DROP
> #iptables -P FORWARD DROP ) blocking everything.So I
> put in comment. 

It's correct ! With these comamands you say to your
linux box: 

BY DEFAULT every packet that comes in the box has to
be dropped (iptables -P INPUT DROP)

BY DEFAULT every packet that wants to go out from the
box has to be dropped (iptables -P OUTPUT DROP)

BY DEFAULT every packet that wants to be forwarded
from the box has to be dropped (iptables -P FORWARD
DROP)

> I am confused because this rule is
> at
> beggining of firewal and I do not understand why
> rules
> that comes after are not implemented.

No, them are implemented too.

> I want to
> block
> all traffic first 

you do it with rules described above...


> iptables -F
this command deletes all rules from default table.

> iptables -t nat -F
this command deletes all rules from nat table.


> iptables -t mangle -F
this command deletes all rules from mangle table.

> iptables -X
Delete the optional user-defined chains on default
table.

> iptables -t nat -X
> iptables -t mangle -X

do the same for other tables.
 
> #iptables -P INPUT DROP
> #iptables -P OUTPUT DROP
> #iptables -P FORWARD DROP
Uncomment these! otherwise firewall isn't useful.


> iptables -A INPUT -s 127.0.0.1/255.0.0.0 -j ACCEPT
> iptables -A OUTPUT -d 127.0.0.1/255.0.0.0 -j ACCEPT
Accept everything from/to loopback interface.
This enable connection (every packet) from the box to
the box using tcp.
 
> iptables -A INPUT -m state --state
> NEW,ESTABLISHED,RELATED -j ACCEPT
Accept packets that come in from already established
connection
 
> iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
Do you need masquerading? Are you configuring personal
firewall or a network gateway for other computers?
If yes you need to enable ip forwarding too! And you
need rules that specify whose connections forward...
Otherwise delete this rule.

> #iptables -t nat -A POSTROUTING -o eth1 -j SNAT
> --to-source ip_adresa
What do you want to do with this???

> iptables -A OUTPUT -p tcp --dport 22 -j ACCEPT
Well, you can connect to ssh server... then?
you need other rules to specify other connections.
for example:

iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT

for web connections...

What do you want to do exactly?
Have you read iptables man page?

Bye

Valerio

