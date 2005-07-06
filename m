From: =?ISO-8859-1?Q?Llu=EDs_Batlle?= <viriketo@gmail.com>
Subject: Re: More on conntrack + NAT + mangle/nat tables
Date: Wed, 6 Jul 2005 12:20:49 +0200
Message-ID: <45219fb0050706032038dca0e8@mail.gmail.com>
References: <45219fb00507060217450a89ee@mail.gmail.com>
	<42CBADD2.8040106@mnemon.de>
Reply-To: =?ISO-8859-1?Q?Llu=EDs_Batlle?= <viriketo@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42CBADD2.8040106@mnemon.de>
Content-Disposition: inline
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

Oh, my fault. :) I mislooked at the diagram :) Everything is fine, so,
about nat + mangle tables.
So, I think conntrack NAT happens after the mangle POSTROUTING chain.
So, after routing.

Thanks :)

On 7/6/05, J=F6rg Harmuth <harmuth@mnemon.de> wrote:
> packet flow is:
>=20
> ... --> [mangle:POSTROUTING] --> [nat:POSTROUTING]
>=20
> So, all packets arrive in mangle:POSTROUTING with their source address
> unchanged. DNAT - if configured - is already applied to the packet.
>=20
> If I'm telling old stories now, forget it, but you can modify this
> script to fit your needs:
>=20
> http://iptables-tutorial.frozentux.net/scripts/rc.test-iptables.txt
>=20
> Following the log (and /proc/net/ip_conntrack) you see the packet flow
> in detail. And you see when [S|D]NAT ist applied.

