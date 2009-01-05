From: =?iso-8859-15?Q?Roland_H=E4der?= <r.haeder@web.de>
Subject: Re: Bastille/netfilter with Linux 2.6.28 blocks connections
Date: Mon, 05 Jan 2009 17:37:54 +0100
Message-ID: <665067273@web.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Cc: netfilter@vger.kernel.org

> Not right that "both" have the default gw to 192.168.1.1 Only the
> clients on 192.168.1.0/24 have to. The router (the server where you a=
re
> writing the iptables rules) need another gw!
Yes, I have your mentioned setup here: clients have 192.168.1.1 as gate=
way and 192.168.1.1 has the PPP partner as its gateway.

> Try
> IP -F -t nat
> IP -F FORWARD
> IP -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> IP -A FORWARD -i eth1 -m state --state NEW -j LOG --log-prefix "NEW F=
W"
> IP -A FORWARD -i eth1 -j ACCEPT
> IP -A POSTROUTING -o eth0 -m state --state NEW -j LOG --log-prefix "N=
EW POR"
> IP -A POSTROUTING -o eth0 -j MASQUERADE
I suppose I should not replace my _whole_ ruleset but a small part? Els=
e these rules will be a little less secure.

And currently my firewall got attacked on port 110 which is (sadly!) re=
achable on all NICs.

So where should I add/replace your rules?

> For this into the above iptables.list there are no rules!
> IP -A PREROUTING -i eth0 -p tcp --dport 30017 -j DNAT --to-destinatio=
n=20
> 192.168.1.17
>=20
> and add the forward one
I have a similar one already and as I said, it worked before like a sha=
rm. :)

So the "bug" must be someone else. Okay, I put all in /etc/Bastille in =
a ZIP and try it from a fresh installation. Then I put my custom firewa=
ll.d back in place step-by-step.

If that is still failing I try yours but shut down a lot processes on m=
y box. I hate that my box got hacked by some script-kiddie or spammer .=
=2E.. :(

I will add "netstat -lnp" soon!

> I don't know about this....
Okay, never mind. :)

> Michele
Roland
__________________________________________________________________
Deutschlands gr=F6=DFte Online-Videothek schenkt Ihnen 12.000 Videos!*
http://entertainment.web.de/de/entertainment/maxdome/index.html

