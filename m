From: Jon Tim <lcguy229@yahoo.com>
Subject: Re: Bridge Transparent Proxy
Date: Tue, 22 May 2007 22:56:55 -0700 (PDT)
Message-ID: <390179.89889.qm@web38509.mail.mud.yahoo.com>
References: <465314F4.1060007@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <465314F4.1060007@plouf.fr.eu.org>
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

Hello,

Many thanks for all reply to my Bridge Transparent
Proxy post.

But, please let me know more how to enable "netfilter
Bridge Support" in kernel. Can I add a linke
CONFIG_BRIDGE_NETFILTER=3Dy" in /etc/sysctl.conf ??

And, in the second iptables command what is physdev
and physdev-in?? Does this mean physdev=3D eth0 and
physdev-in =3D eth1??

Sorry for my quetion. I am newbie in iptables and
don't understand very well?

My another qutesion is, do I need to use NAT command
in iptables? As I have all public address and why I
have to use NAT to redirect?

Jon.



--- Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
wrote:

> Hello,
>=20
> Robert LeBlanc a =E9crit :
> > You will need to look at ebtables. Bridging will
> bypass iptables.
>=20
> Bridged IPv4 packets traverse the iptables chains if
> the kernel was=20
> compiled with Netfilter bridge support
> (CONFIG_BRIDGE_NETFILTER=3Dy). It=20
> allows finer filtering than ebtables, for instance
> accepting only=20
> outgoing HTTP/HTTPS connections and related ICMP
> messages in both=20
> directions thanks to connection tracking, e.g. :
>=20
> iptables -A FORWARD -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -m physdev --physdev-in eth1 -m
> state --state NEW \
>    -p tcp -m multiport --dports 80,443 -j ACCEPT
>=20
>=20



      =20
___________________________________________________________________________=
_________Luggage? GPS? Comic books?=20
Check out fitting gifts for grads at Yahoo! Search
http://search.yahoo.com/search?fr=3Doni_on_mail&p=3Dgraduation+gifts&cs=3Dbz

