From: bjorn@ruberg.no (=?iso-8859-1?q?Bj=F8rn_Ruberg?=)
Subject: Re: Question related to DROP target?
Date: Mon, 25 Sep 2006 23:04:02 +0200
Message-ID: <ygf3bafvet9.fsf@donald.hjemme.ruberg.no>
References: <20060925193156.58922.qmail@web56215.mail.re3.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-reply-to: <20060925193156.58922.qmail@web56215.mail.re3.yahoo.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Elvir Kuric <omasnjak@yahoo.com> writes:

[...]

> that comes after are not implemented. I want to block
> all traffic first and theh allow specified trafic.

Then you actually need to specify it properly.

> Please I need your opinions, I read many sources and I
> understand what above rules means, but I can not
> understand why rules after does not working.

[...]

> iptables -F
> iptables -t nat -F
> iptables -t mangle -F
>=20
> iptables -X
> iptables -t nat -X
> iptables -t mangle -X
>=20
> #iptables -P INPUT DROP
> #iptables -P OUTPUT DROP
> #iptables -P FORWARD DROP

Here, you accept traffic to and from localhost. You should probably
specify the interface.

> iptables -A INPUT -s 127.0.0.1/255.0.0.0 -j ACCEPT
> iptables -A OUTPUT -d 127.0.0.1/255.0.0.0 -j ACCEPT

This one allows both new and established traffic. However, if I read
the documentation right, you allow -only- the initiating traffic
(e.g. SYN packets, if you are familiar with the TCP three-way
handshake) to your server; only the start of any
connection. E.g. completing a login will then not work.

> iptables -A INPUT -m state --state
> NEW,ESTABLISHED,RELATED -j ACCEPT

[...]

> iptables -A OUTPUT -p tcp --dport 22 -j ACCEPT

Finally, you accept all _outbound_ traffic to port 22 (SSH) on other
servers. The return traffic to your firewall will be allowed due to
your ESTABLISHED rule above.

Summarily, you allow yourself to use SSH from your firewall, and
that's about it.

You should check out the information and scripts at
http://www.linuxguruz.com/iptables/

Good luck :-)

--=20
Bj=F8rn


