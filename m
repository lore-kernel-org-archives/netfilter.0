From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Fw: I think iptables is not alowing me to connect
Date: Sat, 21 Sep 2002 18:49:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020921174936.JRUS13996.mta05-svc.ntlworld.com@there>
References: <000901c26194$5c7068c0$2101a8c0@aerowillys>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000901c26194$5c7068c0$2101a8c0@aerowillys>
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
To: netfilter@lists.netfilter.org

On Saturday 21 September 2002 6:28 pm, AndreLSM wrote:

> > > > Sorry I was not very clear,
> > > >
> > > > Actualy I removed all iptables rules with:
> > > > iptables -F
> > > > iptables -X
> > > > iptables -Z
> > >
> > > Have you removed your nat rules (eg SNAT in the POSTROUTING chain) as
> > > well ?
>
> Since a changed all rules and had set the policy to ACCEPT for input,
> output and forward I did not know I had to make any changes to SNAT.
> My rule was:
> iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to eth1

Well first of all this rule looks wrong to me.   You shouold have an IP=20
address after the --to, not an interface name.   If you want the address to=
=20
be detected automatically you should be using the MASQUERADE target instead=
=20
of the SNAT target:

iptables -A POSTROUTING -t nat -o eth1 -j MASQUERADE

You should be aware that the command iptables -F will only flush the rules =

from the default 'filter' tables - it will not flush any rules you may have=
=20
in your nat or mangle tables.

To find out whether you still have any rules operating on your system, type:

iptables -L -n -v -t filter
iptables -L -n -v -t nat
iptables -L -n -v -t mangle

(That last one may result in an error saying the 'mangle' table is not=20
recognised if you did compile kernel support for it.   Don't worry about=20
that.)

To really flush all the rules from your system you should do:

iptables -F
iptables -F -t nat
and if you have compiled support for the mangle table
iptables -F -t mangle

> > > > eth1: connection to the adsl modem. I know that this device can
> > > > not be initialized on the booting process
> > >
> > > What do you mean by this last comment ?
>
>  This last comment I read in the pppoe readme, the device  that connects =
to
>  the modem can=B4t be configured during boot time.

Okay, so what do you get in response to the command

ifconfig

on your system ?

> > > > and I thought that maybe iptables was initializing it, but I removed
> > > > all rules and stopped running the rc.firewall file. This one has
> > > > dynamic ip.

iptables does not initialise interfaces.   Nor does it create a dial-up=20
connection (if that is what you are using ?)

iptables is simply a filtering mechanism to block packets which would=20
otherwise be allowed through, or to change packets which are already going =

through.

If you cannot connect to your ISP when you haveno netfilter rules in place =

then netfilter is not the problem.

Antony.

--=20

All matter in the Universe can be placed into one of two categories:

1. things which need to be fixed
2. things which will need to be fixed once you've had a few minutes to play=
=20
with them

