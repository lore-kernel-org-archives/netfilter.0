From: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Subject: Re: Re: Route traffic per protocol - it is possible?
Date: Wed, 8 Jun 2005 09:42:33 +0200
Message-ID: <fad9d4840506080042f23c5d5@mail.gmail.com>
References: <40811.200.125.13.172.1118176181.squirrel@webmail.prolinux.net.uy>
	<20050608073247.27396.qmail@web54302.mail.yahoo.com>
Reply-To: Kenneth Kalmer <kenneth.kalmer@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050608073247.27396.qmail@web54302.mail.yahoo.com>
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
To: Scott <gneamob@yahoo.com>
Cc: netfilter@lists.netfilter.org

Apologies Scott, and the list...

I only realise now that I left out a crucial part of the command, what
a silly mistake... goes to show that you have to test before
posting...

Try one of these two:

iptables -t mangle -A PREROUTING -p tcp --dport 22 -j ROUTE --oif ppp1
- or -
iptables -t mangle -A PREROUTING -p tcp --dport 22 -j ROUTE --gw 1.1.1.1

I added "-p tcp" since SSH runs on SSH to destination port 22...

Test and let me know, I can't test this now since my whole network is
changed around for another project...

On 6/8/05, Scott <gneamob@yahoo.com> wrote:
> It doesn't, at least not with 1.2.11, here is the
> error:
>=20
> iptables v1.2.11: Unknown arg `--dport'
> Try `iptables -h' or 'iptables --help' for more
> information.
>=20
> tested with a 2.6.11 kernel.
>=20
> --- Gustavo Castro Puig <gcastro@gcp.com.uy> wrote:
>=20
> > Kenneth:
> >
> >   It's almost sure to work... but I don't have one
> > of the latest version
> > of iptables (which includes this feature), so I
> > can't make it that
> > way... :-(
> >   Anyway, I should update my netfilter...
> >   I'll check it!
> >   Thank you, Keneth, and if anybody have any other
> > way to do this, will be
> > appreciated too!
> >
> > Cheers,
> >      G.Castro P.
> >
> > > On 6/7/05, Gustavo Castro Puig
> > <gcastro@gcp.com.uy> wrote:
> > >> Hi, list!
> > >>
> > >>   I've got an issue to resolve and I want to know
> > if it's possible to do
> > >> it with netfilter/iproute2. I've been googling
> > for some time, but I
> > >> couldn't find the way to do this (may be I'm not
> > searching the correct
> > >> way), so any help from you will be *VERY*
> > appreciated.
> > >>   I have a firewall with two links, on direct to
> > Internet and another
> > >> (to
> > >> internet too) through another firewall. All
> > traffic is now going to
> > >> Internet through the other firewall, but I want
> > to know if it's possible
> > >> to send some traffic (not all) through the direct
> > link to Internet. I
> > >> don't want to redirect all traffic coming from
> > some IPs, intead, I want
> > >> to redirect only SSH traffic (for example) from
> > the box through the
> > >> direct link and all other traffic to the other
> > firewall. Something like
> > >> a "per-protocol routing policy". I've been trying
> > with iproute2 and
> > >> iptables, marking packets and routing them with
> > two routing tables, but
> > >> it didn't work.
> > >
> > > I'm not an expert, nor have I done this myself.
> > But from replies by
> > > members of the list and some reading up over the
> > months I'd recommend
> > > using the ROUTE target.
> > >
> > > <man iptables>
> > >    ROUTE
> > >        This is used to explicitly override the
> > core network stack's
> > > routing decision.  mangle table.
> > >
> > >        --oif ifname
> > >               Route the packet through ifname
> > network interface
> > >
> > >        --iif ifname
> > >               Change the packet's incoming
> > interface to ifname
> > >
> > >        --gw IP_address
> > >               Route the packet via this gateway
> > >
> > >        --continue
> > >               Behave like a non-terminating target
> > and continue
> > > traversing the rules.  Not valid in combination
> > with --iif
> > > </man>
> > >
> > > So, let's say ppp0 and ppp1 are your links, and
> > everything defaults to
> > > ppp0. You want ssh to go over ppp1, try one of
> > these:
> > >
> > > iptables -t mangle -A PREROUTING --dport 22 -j
> > ROUTE --oif ppp1
> > > - or -
> > > iptables -t mangle -A PREROUTING --dport 22 -j
> > ROUTE --gw 1.1.1.1
> > >
> > > In the above example, 1.1.1.1 is the gateway IP of
> > ppp1.
> > >
> > > To the other members, can the above be combined in
> > one shot? Providing
> > > both the interface and the gateway IP?
> > >
> > > HTH, I haven't tried this myself...
> > >
> > >>   The firewall have two nic, one (eth0) with an
> > address 192.168.0.15 and
> > >> the other (eth1) with the public address.
> > >>   This is what I've done:
> > >>
> > >>
> >
> ------------------------------------------------------------------------
> > >> ip route flush table NEW
> > >> ip route add 192.168.0.0/24 dev eth0 table NEW
> > >> ip route add default via XXX.XXX.XXX.XXX table
> > NEW dev eth1
> > >>
> > >> iptables -t nat -A POSTROUTING -o eth1 -j
> > MASQUERADE
> > >>
> > >> ip rule add fwmark 1 table NEW
> > >>
> > >> ip rule add from XXX.XXX.XXX.XXX table NEW
> > >>
> > >> iptables -t mangle -A OUTPUT -p tcp --dport 22 -j
> > MARK --set-mark 1
> > >>
> >
> ------------------------------------------------------------------------
> > >>   None of this lines generate errors.
> > >>   May be this is not possible, but if it is, how
> > could be done?
> > >>   Thanks in advance!
> > >>
> > >> Cheers,
> > >>      G.Castro P.
> > > --
> > >
> > > Kenneth Kalmer
> > > kenneth.kalmer@gmail.com
> > > http://opensourcery.blogspot.com
> > >
> >
> >
>=20
>=20
> __________________________________________________
> Do You Yahoo!?
> Tired of spam?  Yahoo! Mail has the best spam protection around
> http://mail.yahoo.com
>=20
>=20


--=20

Kenneth Kalmer
kenneth.kalmer@gmail.com
http://opensourcery.blogspot.com

