From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: changing rules at a defined time
Date: Wed, 24 Dec 2003 11:01:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1072260076.787.53.camel@elendil.intranet.cartel-securite.net>
References: <20031224092936.GB27890@staticky.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031224092936.GB27890@staticky.com>
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
To: Payal Rathod <payal-netfilter@staticky.com>
Cc: Netfilter ML <netfilter@lists.netfilter.org>

Le mer 24/12/2003 =E0 10:29, Payal Rathod a =E9crit :
> - till 16:00 p.m. all ips can just use ftp but ips 192.168.0.1
>   and 192.168.0.100 can do anything
> - after 4:00 afternoon all can do anything till 5:00 after which again
>   the above [1st rules] are to be applied.
[...]
> [For step 1]: - Policy ACCEPT for FORWARD
> iptables -A FORWARD -s 192.168.0.1 -p tcp -j ACCEPT
> iptables -A FORWARD -s 192.168.0.100 -p tcp -j ACCEPT
> iptables -A FORWARD -s 192.168.0.0/32 -p tcp --dport 21 -j ACCEPT
> iptables -A FORWARD -s 0/0 -p tcp -j DROP
> [For step 2]: - Policy ACCEPT for FORWARD
> iptables -A FORWARD -p tcp -j ACCEPT
[...]
> 1> Do the above steps look ok? I will refine them further. Right now ar=
e
> they workable.

They won't work as you don't deal with returning packets. You should try
to use states that can improve your ruleset, particularly when dealing
with FTP.
You really should set FORWARD policy to DROP then get rid of your
iptables -A FORWARD -s 0/0 -p tcp -j DROP rule. What if someone wants to
do something else than TCP ? Such as UDP, ICMP, GRE or anything else ?

[For step 1]: - Policy DROP for FORWARD
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state NEW -s 192.168.0.1 -p tcp -j ACCEPT
iptables -A FORWARD -m state --state NEW -s 192.168.0.100 -p tcp \
		-j ACCEPT
iptables -A FORWARD -m state --state NEW -s 192.168.0.0/32 -p tcp \
		--dport 21 -j ACCEPT

[For step 2]: - Policy DROP for FORWARD
iptables -A FORWARD -m state --state NEW -s 192.168.0.0/32 -p tcp \
		-j ACCEPT

> 2> If I want to change the rules at 16:00 what is the best way to chang=
e
> them? I was thing of flushing with iptables -F and iptables -F -t nat
> and then running the second step.
> Similary at 17:00 do the same kind of flushes and run 1st step from a
> file? Is this approach ok or is there anything better?

I would use a full flushing script that issues :

	iptables -F
	iptables -t nat -F
	iptables -t mangle -F
	iptables -X
	iptables -t nat -X
	iptables -t mangle -X

After that, I would generate two ruleset files using iptables-save for
each case. Then, after flushing, you iptables-restore the appropriate
ruleset.

Have you tried Fabrice Marie patch-o-matic time match that allows you to
match time for a given rule ?

http://www.netfilter.org/documentation/pomlist/pom-base.html#time

You would have a single ruleset of this kind (if I understood what you
needed) :

Policy DROP for FORWARD
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state NEW -s 192.168.0.1 -p tcp -j ACCEPT
iptables -A FORWARD -m state --state NEW -s 192.168.0.100 -p tcp \
		-j ACCEPT
iptables -A FORWARD -m state --state NEW -s 192.168.0.0/32 -p tcp \
		--dport 21 -j ACCEPT
iptables -A FORWARD -m state --state NEW -m time --starttime 16:00 \
		--stoptime 17:00 -s 192.168.0.0/32 -p tcp -j ACCEPT

You can even match days using --day option if you need to, e.g. allowing
access only to working days.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

