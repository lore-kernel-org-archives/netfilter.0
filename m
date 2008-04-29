From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Dynamically adding rules - are connection tracking states maintained?
Date: Wed, 30 Apr 2008 01:37:02 +0200
Message-ID: <4817B11E.9010803@plouf.fr.eu.org>
References: <832773.11379.qm@web57302.mail.re1.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <832773.11379.qm@web57302.mail.re1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

noa levy a =E9crit :
> I still don't understand one thing though: Let's say I delete a rule
> that allows SSH traffic. There are probably many entries in the
> conntrack table for SSH sessions. Will these sessions continue to be
> allowed in, even though I have just deleted the rule that allowed SSH
> (and my default policy is DROP)?=20

You are asking the wrong question. Iptables is a packet filter, it does=
=20
not filter "sessions" (or connections). As already said, the conntrack=20
table is not affected by rule deletion/insertion. So whether packets=20
belonging to existing connections are allowed or not depends on the new=
=20
ruleset. If the new ruleset says to ACCEPT packets in the ESTABLISHED=20
state, then established connections are still allowed.
