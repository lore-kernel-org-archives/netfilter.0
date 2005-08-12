From: "curby ." <curby.public@gmail.com>
Subject: Re: Transparent proxy where source IP address remains unchanged --
	possible?
Date: Fri, 12 Aug 2005 12:35:57 -0600
Message-ID: <5d2f379105081211357e8d558a@mail.gmail.com>
References: <42FA1BBD.6060806@rosi-kessel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42FA1BBD.6060806@rosi-kessel.org>
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
To: Adam Rosi-Kessel <adam@rosi-kessel.org>
Cc: netfilter@lists.netfilter.org

On 8/10/05, Adam Rosi-Kessel <adam@rosi-kessel.org> wrote:
> I'm new to iptables and have perhaps a naive question.
>=20
> I am wondering if there is a way to configure a proxy such that packets
> are redirected to a new IP address, but the *source* IP address remains
> unchanged.
>=20
> To illustrate: let's say we have "userbox" 10.1.1.2, "faketarget"
> 10.1.1.3, and "realtarget" 10.1.1.4.
>=20
> Userbox initiates an ssh connection to faketarget. Faketarget routes all
> packets to realtarget.

This is classic Destination NAT, or "port forwarding" and is certainly poss=
ible.

> iptables -t nat -A PREROUTING -i eth0 -s 10.1.1.2 -d 10.1.1.3 \
>         -p tcp --dport ssh -j DNAT --to 192.168.98.4

In your hypothetical above, all three hosts were on the same subnet.=20
If in fact your realtarget is on another subnet (as it is in this
command), then all you need is DNAT and your source address/port will
be kept.  If all three hosts are on the same network, or the source
and realtarget are on the same network, then you will need a SNAT rule
as shown here:

http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-10.html

> iptables -t nat -A POSTROUTING -o eth0 -s 10.1.1.2 -d 10.1.1.3 \
>         -j SNAT --to 10.1.1.3
>=20
> Easy enough. But in this case, the connection to realtarget appears to
> come from faketarget, not userbox, the originator of the ssh connection.

Right, using the SNAT target you have mangled the packet to claim to
come from faketarget.  You shouldn't expect realtarget to see anything
different.

> This is normally what you want with local NAT.

> But what if I want the connection to realtarget to appear to come from
> userbox.  I want faketarget to be an almost invisible middleman.  I
> don't want to rewrite the source IP address, but leave it as is.  If I
> just leave off the second iptables line above, however, no packets are
> forwarded to realtarget at all.

A single line to DNAT is all that should be necessary for DNAT between
different subnets (as long as your FORWARD chain allows it).  SNAT is
definitely not required to get it to work.  If it doesn't work, likely
you have a bad setup somewhere.  HOWTO might help:

http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-6.html#ss6.2

> Is this possible?  Am I asking the wrong question?

You didn't say why you're doing this, or what else your firewall setup
has.  If it's for auditing/eavesdropping, there are certainly other
ways to do it.  If all three hosts are on the same network, the client
could simply go directly to realserver.

