From: =?ISO-8859-1?Q?J=F6rg_Harmuth?= <harmuth@mnemon.de>
Subject: Re: More on conntrack + NAT + mangle/nat tables
Date: Wed, 06 Jul 2005 12:09:22 +0200
Message-ID: <42CBADD2.8040106@mnemon.de>
References: <45219fb00507060217450a89ee@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45219fb00507060217450a89ee@mail.gmail.com>
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

Llu=EDs Batlle schrieb:
> I already understood that a packet enters chains in the 'nat' table
> only if it is the _first_ packet of a connection. In that case, we may
> do SNAT in the POSTROUTING chain of the 'nat' table.
> So, the packets arrive to the POSTROUTING chain of the 'mangle' table
> with the source IP address changed (if it's said by the rules of the
> 'nat' table).

No. According to the picture found at

http://iptables-tutorial.frozentux.net/chunkyhtml/traversingoftables.html

packet flow is:

... --> [mangle:POSTROUTING] --> [nat:POSTROUTING]

So, all packets arrive in mangle:POSTROUTING with their source address
unchanged. DNAT - if configured - is already applied to the packet.

If I'm telling old stories now, forget it, but you can modify this
script to fit your needs:

http://iptables-tutorial.frozentux.net/scripts/rc.test-iptables.txt

Following the log (and /proc/net/ip_conntrack) you see the packet flow
in detail. And you see when [S|D]NAT ist applied.

> - I'm learning about the whole netfilter/policy router these days :)
> So I write a lot about that, which sounds strange to me. I hope I'm
> not annoying to the list.

I can only speak for myself - no, you aren't :)

Have a nice time,

Joerg


