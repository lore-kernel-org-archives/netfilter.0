From: Radek Kanovsky <rk@dat.cz>
Subject: iptables rules in comparable form
Date: Tue, 1 Jun 2010 10:10:53 +0200
Message-ID: <20100601081053.GA13943@q.uh.cz>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

is there some way to get iptables rules in some normalized form?
What I mean is normalized or canonical form that is convenient
for rule comparison. For example following rules are internaly
equivalent although writen differently and I not aware of any
utility that could told me that they are the same:

    iptables -A SSH -s 1.2.3.4 -p tcp --dport ssh
    iptables -A SSH -s 1.2.3.4/32 -p tcp --dport ssh
    iptables -A SSH -s w1.something.com -p tcp --dport ssh
    iptables -A SSH -s w1.something.com -p tcp --dport 22
    iptables -A SSH -s w1.something.com/32 -p tcp -m tcp --dport 22
    iptables -A SSH -s 1.2.3.4 -d 0.0.0.0/0 -p tcp -m tcp --dport 22

When I want update rules on firewall or router with thousands of rules
I want to do it incrementaly. Reloading whole iptables on small change
every ten minutes is not acceptable because it takes very long time
and resets counters defined for accounting purposes. But incremental
solution requires some comparable rule form so machine can decide
which rule already exists, which is new and which should be deleted.

I have prototype in python that does such normalization and is able
to output "patch" for existing rules according to given new rules.
Script generates -N/-X/-F/-P/-I/-D/-A rules via standard python difflib
and is pretty effective and simle (90 lines) but requires rules in
comparable form and this is the harder part of my problem (2662 lines).

I am not sure if I go right way because this concept is a bit fragile.
Iptables can have plugins not known to this script, every host can
have different /etc/services, /etc/protocols used by ipatables, there
are bugs in iptables stdout, etc. How would you solve this?

Regards

Radek Kanovsky
