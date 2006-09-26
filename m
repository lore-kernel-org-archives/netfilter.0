From: Elvir Kuric <omasnjak@yahoo.com>
Subject: Re: Question related to DROP target?
Date: Tue, 26 Sep 2006 03:26:50 -0700 (PDT)
Message-ID: <20060926102650.24107.qmail@web56213.mail.re3.yahoo.com>
References: <ygf3bafvet9.fsf@donald.hjemme.ruberg.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <ygf3bafvet9.fsf@donald.hjemme.ruberg.no>
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
To: =?unknown-8bit?q?Bj=F8rn?= Ruberg <bjorn@ruberg.no>, netfilter@lists.netfilter.org

Thanks,=20

I made it :) with your suggestion.

Regards=20
--- Bj=F8rn Ruberg <bjorn@ruberg.no> wrote:

> Elvir Kuric <omasnjak@yahoo.com> writes:
>=20
> [...]
>=20
> > that comes after are not implemented. I want to
> block
> > all traffic first and theh allow specified trafic.
>=20
> Then you actually need to specify it properly.
>=20
> > Please I need your opinions, I read many sources
> and I
> > understand what above rules means, but I can not
> > understand why rules after does not working.
>=20
> [...]
>=20
> > iptables -F
> > iptables -t nat -F
> > iptables -t mangle -F
> >=20
> > iptables -X
> > iptables -t nat -X
> > iptables -t mangle -X
> >=20
> > #iptables -P INPUT DROP
> > #iptables -P OUTPUT DROP
> > #iptables -P FORWARD DROP
>=20
> Here, you accept traffic to and from localhost. You
> should probably
> specify the interface.
>=20
> > iptables -A INPUT -s 127.0.0.1/255.0.0.0 -j ACCEPT
> > iptables -A OUTPUT -d 127.0.0.1/255.0.0.0 -j
> ACCEPT
>=20
> This one allows both new and established traffic.
> However, if I read
> the documentation right, you allow -only- the
> initiating traffic
> (e.g. SYN packets, if you are familiar with the TCP
> three-way
> handshake) to your server; only the start of any
> connection. E.g. completing a login will then not
> work.
>=20
> > iptables -A INPUT -m state --state
> > NEW,ESTABLISHED,RELATED -j ACCEPT
>=20
> [...]
>=20
> > iptables -A OUTPUT -p tcp --dport 22 -j ACCEPT
>=20
> Finally, you accept all _outbound_ traffic to port
> 22 (SSH) on other
> servers. The return traffic to your firewall will be
> allowed due to
> your ESTABLISHED rule above.
>=20
> Summarily, you allow yourself to use SSH from your
> firewall, and
> that's about it.
>=20
> You should check out the information and scripts at
> http://www.linuxguruz.com/iptables/
>=20
> Good luck :-)
>=20
> --=20
> Bj=F8rn
>=20
>=20
>=20


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam
protection around=20
http://mail.yahoo.com=20

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around=20
http://mail.yahoo.com=20

