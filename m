From: "Rakotomandimby (R12y) Mihamina" <mihamina@mail.rktmb.org>
Subject: Re: I cant flush rules
Date: Mon, 07 Mar 2005 12:43:51 +0100
Message-ID: <1110195831.8886.40.camel@debian>
References: <1110138094.6856.65.camel@debian>  <422C37EB.6090305@mnemon.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <422C37EB.6090305@mnemon.de>
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

On Mon, 2005-03-07 at 12:15 +0100, J=F6rg Harmuth wrote:

> Hi,

Hi

> your port 8000 - and all others - can be accessed, because you allowed
> it. First:
>=20
> iptables -A INPUT -s 195.140.140.100 -j ACCEPT

I need to allow that machine.

> you accept all connections from this box: Second:
>=20
> iptables -A INPUT -p tcp --syn -m limit --limit 5/s -j ACCEPT
> you allow 5 connections per second from everywhere, including the
> internet. This is the second rule and as ACCEPT is a terminating
> target, chain traversing stops right here. So your services are all
> available to the whole world.


Oooooooh yes! that was my mistake.

> You can remove the second rule or do it more specifically, e.g. with
> interfaces or ports like this:

I choose to remove it.
> In the last rule you should specify addresses, that may connect to
> port 8000. You can also combine it like this:


> iptables -A INPUT -p tcp -i ethn --dport 8000 -s SOME_ADDRESS -m limit

No. It's an Icecast server behind (Web Radio, broadcasting music). All
the world needs to acces from that port.

It really helped. Thank you.
--=20
ASPO Infog=E9rance       http://aspo.rktmb.org/activites/infogerance
Unofficial FAQ fcolc   http://faq.fcolc.eu.org/
LUG sur Orl=E9ans et alentours (France).
T=E9l : 02 34 08 26 04 / 06 33 26 13 14


