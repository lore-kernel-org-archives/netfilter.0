From: Matin Tamizi <mtamizi@gmail.com>
Subject: Re: Stateless NAT
Date: Thu, 9 Jun 2005 09:43:18 -0400
Message-ID: <f68a416050609064333bebd9f@mail.gmail.com>
References: <OF7FD36B55.0277057F-ONC125701A.00258ADF-C125701A.00262725@team4.de>
	<9D532201-8173-474B-8281-1FA274AFC243@cuseeme.de>
Reply-To: Matin Tamizi <mtamizi@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9D532201-8173-474B-8281-1FA274AFC243@cuseeme.de>
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
To: NetFilter <netfilter@lists.netfilter.org>

Why can't we create a new target module to support stateless NAT for
NetFilter like the following link suggests?
https://lists.netfilter.org/pipermail/netfilter/2005-February/058950.html

I tried writing a target module, but I'm a bit baffled by how the
target modules work.  The existing target modules don't seem to have
any source to modify the packets.   If this is possible then the
NETMAP module should already do the job.  Assuming the NETMAP target
module does what its description states.

We should also be able to write a stateless NAT program using libipq.=20
Even FreeBSD uses a user space program for NAT by using the divert
socket api.  However, I don't how to define any order in the programs
grabbing packets from the QUEUE.  In FreeBSD, instead of queueing the
packet is rerouted to an internal "divert" port which can be binded to
using the standard socket API, but divert socket are more expensive
than the NetFilter QUEUE solution.

I've found another solution to my problem without having to use NAT,
but it would have been nice if I could have used NAT since my solution
is rather contrived.

-Matin

On 6/8/05, codewarrior@cuseeme.de <codewarrior@cuseeme.de> wrote:
>=20
> On Jun 8, 2005, at 8:56 AM, Guenter.Sprakties@team4.de wrote:
> >> You don't use netfilter. You use iproute2.
> >>
> >> http://linux-ip.net/html/nat-stateless.html
> > First your right, iproute2 is the best tool managing simple 1:1 NAT.
> > Second, is doesn't work because some guys decided to remove the
> > necessary
> > code out of the kernel.
> > So you HAVE to use netfolter, and I tell you:
> > First again, it didn't work. Second, no one of the guys out there
> > helps
> > you. I tried to get help, but nothing happend.
> > I think, natting is against their religion or something like this.
> > Take an old kernel and use iproute2, the most genial tool in all
> > the net
> > stuff.
>=20
>=20
> hello guenter,
>=20
> thanks you for your answer , so i heard that it is
> not possible to run iproute2 under osx right ?
>=20
> i got a script from my ISP
> http://www.xaranet.de/dl/xaranet-tunnel.sh
>=20
> but you need iproute2  so there is no way  ?
>=20
>=20
> regards
>=20
> marc
>=20
>=20
> ********************************************************
> opencuseeme /  peer2peer multiparty conferencing
> ********************************************************
> Marc Manthey
> D - 50672 Cologne
> West Europe
> office: 0049.221.355.80.32
> mobile: 0049.177.341.54.81
> www.let.de
> www.applehelpers.com
> aim://macfreak2004
> macfreak@jabber.org
>=20
>=20
>=20
>=20
>=20
>

