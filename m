From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Redirecting traffic from a non-existent IP
Date: Mon, 05 Jun 2006 13:44:37 +0200
Message-ID: <44841925.6000200@plouf.fr.eu.org>
References: <44841524.1070505@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44841524.1070505@gmx.de>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Julian Hagenauer a =E9crit :
> Hi,
> i am running Linux 2.6.11.12-xen0 (binary distribution).
> I want to route all Traffic destined to 192.168.1.5 to 192.168.1.3.
> 192.168.1.5 is a non-existent IP/host, 192.168.1.3 is a Xen-VM running=20
> on localhost, so 192.168.1.5 should act as a kind of alias for=20
> 192.168.1.3 and be accessible from localhost.
[...]
> iptables -t nat -A PREROUTING -d $MAP_FROM -j DNAT --to $MAP_TO
> echo "Aktuelle Nat-Regeln:"
> iptables -t nat -L
>=20
> But ping 192.168.1.5 or ssh 192.168.1.5 still does not work.
> I have no clue what's wrong.

I guess the problem is ARP. If nothing replies to the ARP requests for=20
192.168.1.5 sent by th host which want to send a packet to this address,=20
then IP packets for this destination aren't even sent (that should=20
produce Host Unreachable error messages).

Possible workarounds :
- set up some ARP daemon on the network that will reply for 192.168.1.3
- set a static ARP entry in the senders' ARP table (heavy)
- set a static route to 192.168.1.5 with gateway 192.168.1.3 (I know,=20
that's ugly)
- maybe it is possible to use arptables on the NAT box to make it reply=20
to the ARP requests (I don't know anything about this)

I guess IP aliasing is not an option.

