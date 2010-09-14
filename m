From: Data Shock <datashock@hotmail.com>
Subject: Is a match-all rule with jump to empty chain processed?
Date: Tue, 14 Sep 2010 11:14:47 -0400
Message-ID: <BLU124-W223DA5F1742B40AD5E2ABBA3780@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org


I have an optimization question regarding iptables:=A0 Will a rule that=
 matches all packets and jumps to a defined but empty table be processe=
d? And if so, how much overhead is involved with jumping to an empty ta=
ble?

=46or example, assume that I am starting with a totally empty set of ru=
les.=A0 Then I add these rules:

-t filter -N empty_chain
-t filter -A INPUT -j empty_chain


I tested this myself and used "iptables -t filter -L -n -v" and could s=
ee that the number of packets and bytes were increasing on the "INPUT -=
j empty_chain" rule, so I assume that means it is being processed.=A0 T=
he empty_chain chain has no rules, so there was no packet/data informat=
ion.=A0 What kind of overhead is involved here? Is there any optimizati=
on performed internally when a chain is known to be empty?


Some of you may be curious why in the world I would want to do this.=A0=
 Here is the (way simplified) scenario:

I have a process that manages the iptables rules.=A0 It generates a fil=
e that can be loaded with iptables-restore.=A0 Under normal circumstanc=
es, this process is the authority for iptables rules.=A0 But, there may=
 be some situations where a cron job needs to add a temporary override.=
=A0 I had originally planned to have an empty chain named "overrides" a=
long with a corresponding rule at the top of the filter/INPUT chain tha=
t would jump to the overrides chain. All other regular rules would foll=
ow the "overrides" jump rule. *Please ignore any security issues you mi=
ght imagine for now. I'm over simplifying the situation for this exampl=
e.

When an override is required, like "allow all UDP destined for port 123=
4", the cron job could run a simple "iptables -t filter -A overrides -p=
 udp -m udp --dport 1234 -j ACCEPT".=A0 When the override was no longer=
 needed, it could simply flush the overrides chain.


Under normal operation the overrides chain would be empty.=A0 I hate to=
 spend overhead processing the "match all jump to overrides" rule.=A0 I=
 know the optimal way is really to add and remove the "-j overrides" ru=
le as needed, but the simplicity of the cron job working with just the =
overrides chain is appealing.


So, does anyone with knowledge of the inner workings have an idea about=
 overhead and possible optimization?
 		 	   		  