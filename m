From: "Slansky Lukas" <Lukas.Slansky@upce.cz>
Subject: PostgreSQL x iptables
Date: Wed, 6 May 2009 11:13:23 +0200
Message-ID: <7F27BA389269BB47A79525510325A35F6F9253@se02.upce.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,
we're using PG and Application Server (JBoss) on separate CentOS servers
with Cisco PIX in between. On DB side is iptable with following relevant
rules:

1. -A RH-Firewall-1-INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
2. -A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp -s
aaa.bbb.ccc.ddd --dport 5432 -j ACCEPT
3. -A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited

I was wondering when these rules are not OK for our environment. It
seems that rules 1 and 2 sometimes (probably for complicated queries)
pass packets and therefore these packets are rejected by rule 3. Such
connection is then in some weird state, doesn't communicate (obviously -
packets are dropped) and psql (or JBoss) connection is blocking for a
long time (at least few hours).

Everything seems to be OK when I have changed rule 2 to  "-A
RH-Firewall-1-INPUT -m tcp -p tcp -s aaa.bbb.ccc.ddd --dport 5432 -j
ACCEPT".

I'm really confused - what other states are possible for iptables except
ESTABLISHED, RELATED or NEW? In iptables manpage is only INVALID, but
why is this state emerging?

Any idea?

Lukas
