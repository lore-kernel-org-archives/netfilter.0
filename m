From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: "-m state -state NEW" or "--tcp-flags ALL SYN" for tcp?
Date: Thu, 30 Oct 2003 08:51:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067500316.893.13.camel@elendil.intranet.cartel-securite.net>
References: <20031029203922.3d8f47cf.netfilter@schuetter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031029203922.3d8f47cf.netfilter@schuetter.org>
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
To: =?ISO-8859-1?Q?J=F6rg_Sch=FCtter?= <netfilter@schuetter.org>
Cc: netfilter@lists.netfilter.org

Le mer 29/10/2003 =E0 20:39, J=F6rg Sch=FCtter a =E9crit :
> Is it better to use "-m state -state NEW" or to use "--tcp-flags ALL
> SYN" for tcp packets. There are also the lines
> iptables -A INPUT/FORWARD -m state --state INVALID -j DROP
> iptables -A INPUT/FORWARD/OUTPUT -m state --state ESTABLISHED,RELATED -=
j ACCEPT
> in the firewall script.

It is better to use both at the same time. Note you have --syn alias
that a bit less restrictive than ALL SYN as it implies SYN,RST,ACK SYN,
but is OK according to RFC.

NEW state for conntrack does not mean SYN packet for TCP. It means that
received TCP packet cannot be associated to an existing conntrack entry.
Therefore, if you get ACK scanned, thoses packets will be flagged as NEW
ones by conntrack. I agree the fact that for TCP, a NEW has to be a SYN
one. That's why you want to enforce both NEW and SYN. I'm used to write
rules like this (let's say for FORWARD chain) :

	iptables -A FORWARD -m state --state INVALID -j DROP
	iptables -A FORWARD -m state --state ESTABLISHED,RELATED \
		-j ACCEPT
	iptables -A FORWARD -m state --state NEW -p tcp -d $FTP_SERVER \
		--dport 21 --syn -j ACCEPT

> A tcp packet without a SYN flag can never be in state NEW (according to
> my tests). Instead iptables discovers this packet as garbage and flags
> it with INVALID.

I do think you should perform some additional tests, because an ACK
packet can get flaged as NEW. In fact, in regard to TCP flags, an
INVALID state means that flags set used is not allowed by RFC. This
means, as an example that SYN-FIN is OK, but an Xmas or a Null set will
get INVALID.

If you're really paranoid, you can also enforce that TCP packets flagged
as ESTABLISHED should not be SYN ones :

	iptables -A FORWARD -m state --state ESTABLISHED -p tcp \
		! --syn -j ACCEPT

And that RELATED one should be SYN ones :

	iptables -A FORWARD -m state --state RELATED -p tcp --syn \
		-j ACCEPT

And eventually drop SYN packets that would be flagged as ESTABLISHED and
RELATED, NEW that would not be SYN ones :

	iptables -I FORWARD 2 -m state --state ESTABLISHED -p tcp \
		--syn -j DROP
	iptables -I FORWARD 3 -m state --state NEW,RELATED -p tcp \
		! --syn -j DROP

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

