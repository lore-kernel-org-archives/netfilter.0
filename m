From: "Gustavo Castro Puig" <gcastro@gcp.com.uy>
Subject: Re: Re: Route traffic per protocol - it is possible?
Date: Wed, 8 Jun 2005 14:06:49 -0300 (UYT)
Message-ID: <41351.200.40.212.129.1118250409.squirrel@webmail.prolinux.net.uy>
References: <40811.200.125.13.172.1118176181.squirrel@webmail.prolinux.net.uy>
	<20050608073247.27396.qmail@web54302.mail.yahoo.com>
	<fad9d4840506080042f23c5d5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <fad9d4840506080042f23c5d5@mail.gmail.com>
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

Kenneth:

  I've seen the error before typing it and tested it with the " -p tcp "
option. It didn't work...
  It must be something with the kernel/netfilter version.
  Still looking for a solution less aggressive than an upgrade...

> Apologies Scott, and the list...
>
> I only realise now that I left out a crucial part of the command, what
> a silly mistake... goes to show that you have to test before
> posting...
>
> Try one of these two:
>
> iptables -t mangle -A PREROUTING -p tcp --dport 22 -j ROUTE --oif ppp1
> - or -
> iptables -t mangle -A PREROUTING -p tcp --dport 22 -j ROUTE --gw 1.1.1.1
>
> I added "-p tcp" since SSH runs on SSH to destination port 22...
>
> Test and let me know, I can't test this now since my whole network is
> changed around for another project...
>
> On 6/8/05, Scott <gneamob@yahoo.com> wrote:
>> It doesn't, at least not with 1.2.11, here is the
>> error:
>>
>> iptables v1.2.11: Unknown arg `--dport'
>> Try `iptables -h' or 'iptables --help' for more
>> information.
>>
>> tested with a 2.6.11 kernel.
>>
>> --- Gustavo Castro Puig <gcastro@gcp.com.uy> wrote:
>>
>> > Kenneth:
>> >
>> >   It's almost sure to work... but I don't have one
>> > of the latest version
>> > of iptables (which includes this feature), so I
>> > can't make it that
>> > way... :-(
>> >   Anyway, I should update my netfilter...
>> >   I'll check it!
>> >   Thank you, Keneth, and if anybody have any other
>> > way to do this, will be
>> > appreciated too!
>> >
>> > Cheers,
>> >      G.Castro P.
>> >
>> > > On 6/7/05, Gustavo Castro Puig
>> > <gcastro@gcp.com.uy> wrote:
>> > >> Hi, list!
>> > >>
>> > >>   I've got an issue to resolve and I want to know
>> > if it's possible to do
>> > >> it with netfilter/iproute2. I've been googling
>> > for some time, but I
>> > >> couldn't find the way to do this (may be I'm not
>> > searching the correct
>> > >> way), so any help from you will be *VERY*
>> > appreciated.
>> > >>   I have a firewall with two links, on direct to
>> > Internet and another
>> > >> (to
>> > >> internet too) through another firewall. All
>> > traffic is now going to
>> > >> Internet through the other firewall, but I want
>> > to know if it's possible
>> > >> to send some traffic (not all) through the direct
>> > link to Internet. I
>> > >> don't want to redirect all traffic coming from
>> > some IPs, intead, I want
>> > >> to redirect only SSH traffic (for example) from
>> > the box through the
>> > >> direct link and all other traffic to the other
>> > firewall. Something like
>> > >> a "per-protocol routing policy". I've been trying
>> > with iproute2 and
>> > >> iptables, marking packets and routing them with
>> > two routing tables, but
>> > >> it didn't work.
>> > >
>> > > I'm not an expert, nor have I done this myself.
>> > But from replies by
>> > > members of the list and some reading up over the
>> > months I'd recommend
>> > > using the ROUTE target.
>> > >
>> > > <man iptables>
>> > >    ROUTE
>> > >        This is used to explicitly override the
>> > core network stack's
>> > > routing decision.  mangle table.
>> > >
>> > >        --oif ifname
>> > >               Route the packet through ifname
>> > network interface
>> > >
>> > >        --iif ifname
>> > >               Change the packet's incoming
>> > interface to ifname
>> > >
>> > >        --gw IP_address
>> > >               Route the packet via this gateway
>> > >
>> > >        --continue
>> > >               Behave like a non-terminating target
>> > and continue
>> > > traversing the rules.  Not valid in combination
>> > with --iif
>> > > </man>
>> > >
>> > > So, let's say ppp0 and ppp1 are your links, and
>> > everything defaults to
>> > > ppp0. You want ssh to go over ppp1, try one of
>> > these:
>> > >
>> > > iptables -t mangle -A PREROUTING --dport 22 -j
>> > ROUTE --oif ppp1
>> > > - or -
>> > > iptables -t mangle -A PREROUTING --dport 22 -j
>> > ROUTE --gw 1.1.1.1
>> > >
>> > > In the above example, 1.1.1.1 is the gateway IP of
>> > ppp1.
>> > >
>> > > To the other members, can the above be combined in
>> > one shot? Providing
>> > > both the interface and the gateway IP?
>> > >
>> > > HTH, I haven't tried this myself...
>> > >
>> > >>   The firewall have two nic, one (eth0) with an
>> > address 192.168.0.15 and
>> > >> the other (eth1) with the public address.
>> > >>   This is what I've done:
>> > >>
>> > >>
>> >
>> ------------------------------------------------------------------------
>> > >> ip route flush table NEW
>> > >> ip route add 192.168.0.0/24 dev eth0 table NEW
>> > >> ip route add default via XXX.XXX.XXX.XXX table
>> > NEW dev eth1
>> > >>
>> > >> iptables -t nat -A POSTROUTING -o eth1 -j
>> > MASQUERADE
>> > >>
>> > >> ip rule add fwmark 1 table NEW
>> > >>
>> > >> ip rule add from XXX.XXX.XXX.XXX table NEW
>> > >>
>> > >> iptables -t mangle -A OUTPUT -p tcp --dport 22 -j
>> > MARK --set-mark 1
>> > >>
>> >
>> ------------------------------------------------------------------------
>> > >>   None of this lines generate errors.
>> > >>   May be this is not possible, but if it is, how
>> > could be done?
>> > >>   Thanks in advance!
>> > >>
>> > >> Cheers,
>> > >>      G.Castro P.
>> > > --
>> > >
>> > > Kenneth Kalmer
>> > > kenneth.kalmer@gmail.com
>> > > http://opensourcery.blogspot.com
>> > >
>> >
>> >
>>
>>
>> __________________________________________________
>> Do You Yahoo!?
>> Tired of spam?  Yahoo! Mail has the best spam protection around
>> http://mail.yahoo.com
>>
>>
>
>
> --
>
> Kenneth Kalmer
> kenneth.kalmer@gmail.com
> http://opensourcery.blogspot.com
>


Saludos,
     Gustavo Castro Puig.
     E-Mail: gcastro@gcp.com.uy
     G.C.P. Software - Inform=E1tica Inteligente.
     Web: http://www.gcp.com.uy

LPI Level-1 Certified (https://www.lpi.org/es/verify.html
LPID:LPI000042304 Verification Code: hp6re8w5qg )
-----BEGIN GEEK CODE BLOCK-----
Version: 3.12
GCS/CM/IT/ED dx s-:- a? C(+++)$ UL++++*$ P+ L++++(++)$ E--- W+++$ N+ o?
K- w O M V-- PS PE++(-) Y-(+) PGP+ t(++) 5+ X++ R tv+ b++(++++) DI+++
D++ G++ e++ h--- r y+++
------END GEEK CODE BLOCK------
Registered Linux User #69342


