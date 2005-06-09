From: Matin Tamizi <mtamizi@gmail.com>
Subject: Re: Iptables and snort inline
Date: Thu, 9 Jun 2005 12:24:20 -0400
Message-ID: <f68a41605060909246f18cb28@mail.gmail.com>
References: <DIIE.000001ED000023D1@smtp.aressi.fr>
Reply-To: Matin Tamizi <mtamizi@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <DIIE.000001ED000023D1@smtp.aressi.fr>
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
Content-Type: text/plain; charset="us-ascii"
To: "lmarcilly@aressi.fr" <lmarcilly@aressi.fr>
Cc: netfilter@lists.netfilter.org

Why are you queueing OUTPUT traffic?

-Matin

On 6/9/05, lmarcilly@aressi.fr <lmarcilly@aressi.fr> wrote:
> Hi all!
>=20
> I try to use iptables with snort_inline on a bridging firewall. Here is m=
y testing configuration :
>=20
> ------         ----------
> | PC |---------| Bridge |--------- LAN
> ------         ----------
> 192.168.1.99      192.168.1.185      192.168.1.0/24
>=20
> My iptables rules are :
>=20
> iptables -A INPUT -j QUEUE
> ipatbles -A OUTPUT -j QUEUE
> iptables -A FORWARD -j QUEUE
>=20
> and snort_inline is initialized correctly.
>=20
> My problem is : when i put snort_inline down, i can't reach the LAN from =
my PC. I think it's normal but i want that when snort inline is down, the L=
AN is always reachable from my PC.
>=20
> Is this possible only by changing rules ? Or does it exist a patch to app=
ly to iptables ?
>=20
> Thanks in advance and excuse me for my poor english!
>=20
> L. M.
>=20
>=20
>=20
>=20
>

