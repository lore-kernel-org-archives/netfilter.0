From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: skip other iptables marking if packet is already marked
Date: Mon, 31 May 2004 10:16:35 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1085991395.26732.12.camel@anduril.intranet.cartel-securite.net>
References: <020701c446e0$44e95ee0$0100a8c0@newlife>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <020701c446e0$44e95ee0$0100a8c0@newlife>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Ming-Ching Tiew <mingching.tiew@redtone.com>
Cc: netfilter@lists.netfilter.org

Le lun 31/05/2004 =E0 09:24, Ming-Ching Tiew a =E9crit :
> I have many iptables setmark commands, but as soon
> as there is one match, I would like to skip all the rest.
> How to do this.
> -------not-working-not-mark-zero-is-not-accepted---------
> iptables -t mangle -A PREROUTING ..... -j MARK --set-mark .....
> iptables -t mangle -A PREROUTING -m MARK ! --mark 0 -j ACCEPT
> iptables -t mangle -A PREROUTING ..... -j MARK --set-mark .....
> iptables -t mangle -A PREROUTING -m MARK ! --mark 0 -j ACCEPT
> iptables -t mangle -A PREROUTING ..... -j MARK --set-mark .....
> --------------------end-----------------------------------

Why don't you just match the mark the packet has been given ?

iptables -t mangle -A PREROUTING ..... -j MARK --set-mark 1
iptables -t mangle -A PREROUTING -m MARK --mark 1 -j ACCEPT
iptables -t mangle -A PREROUTING ..... -j MARK --set-mark 2
iptables -t mangle -A PREROUTING -m MARK --mark 2 -j ACCEPT
[...]

I think your ruleset does not work because a packet without a mark will
match your non-zero mark rule. I mean that no mark is different than 0,
so all packets will match the first "-m mark ! --mark 0" rule.

iptables -t mangle -A PREROUTING -j MARK --set-mark 0
iptables -t mangle -A PREROUTING ..... -j MARK --set-mark .....
iptables -t mangle -A PREROUTING -m MARK ! --mark 0 -j ACCEPT
iptables -t mangle -A PREROUTING ..... -j MARK --set-mark .....
iptables -t mangle -A PREROUTING -m MARK ! --mark 0 -j ACCEPT
[...]

> Since it is not working, I change it to :-
> Assuming I have AND-ed all the mark together to obtain the MASK,
[...]
> Wonder if it will work ?=20

Well, it should work.

> My next question is should I use -j ACCEPT or -j RETURN ?

RETURN should not be use within builtin chains. Moreover, both have the
same effect if used in builtin chain.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

