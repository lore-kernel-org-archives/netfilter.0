From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Slow performance - Trouble with IPtables rules
Date: Wed, 3 Jul 2002 20:00:23 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020703190025.HRSB16050.mta01-svc.ntlworld.com@there>
References: <3D234545.D34413B9@acabtu.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <3D234545.D34413B9@acabtu.com.mx>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.samba.org

On Wednesday 03 July 2002 7:41 pm, Karina G=F3mez Salgado wrote:

> The rules i'm using are these:
> --------------------------------
>
> $IPTABLES -P INPUT DROP
> $IPTABLES -P OUTPUT DROP
> $IPTABLES -P FORWARD DROP
>
> $IPTABLES -A INPUT -s $UNIVERSE -d $UNIVERSE -j ACCEPT -v
>
> $IPTABLES -A OUTPUT -s $UNIVERSE -d $UNIVERSE -j ACCEPT -v
>
> $IPTABLES -A FORWARD -i $EXTIF -o $INTIF -j ACCEPT -v
>
> $IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT -v

So, you're setting a default policy of DROP on INPUT, FORWARD and OUTPUT - =

very good.

Then, you're allowing absolutely everything in, from anywhere, you're=20
allowing absolutely everything out, to anywhere, you're forwarding everythi=
ng=20
from the outside to the inside, and you're forwading everything from the=20
inside to the outside.

This is not a firewall, this is a complex way to plug the Internet into you=
r=20
network.

What do you want to allow, and what do you want to block ?   These rules ar=
=20
doing nothing for you.

=20

Antony.

