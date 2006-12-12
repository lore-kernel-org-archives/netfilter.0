From: "rabbtux rabbtux" <rabbtux@gmail.com>
Subject: Re: ipsec NAT pass through rule(s)?
Date: Tue, 12 Dec 2006 08:39:39 -0800
Message-ID: <5cc9c8f90612120839p1d24e7cnf05ac777a8aba646@mail.gmail.com>
References: <5cc9c8f90612091547r4dd21922i8bf63d84b9c59c8@mail.gmail.com>
	<1165747742.5125.15.camel@anduril.intranet.cartel-securite.net>
	<5cc9c8f90612102233g68f9b03o88e68614d0082445@mail.gmail.com>
	<1165830405.28768.38.camel@anduril.intranet.cartel-securite.net>
	<5cc9c8f90612110950x3ec0dbd0g6497c87182edc866@mail.gmail.com>
	<1165868251.4392.18.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1165868251.4392.18.camel@anduril.intranet.cartel-securite.net>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

Thank you Cedric!  So my iptables firewall that NATs everything
already has the "vpn pass-thru" box checked?

On 12/11/06, Cedric Blancher <blancher@cartel-securite.fr> wrote:
> Le lundi 11 d=E9cembre 2006 =E0 09:50 -0800, rabbtux rabbtux a =E9crit :
> > Thanks for your patience with me :-)
>
> :P
>
> > Customer's IT people ask, "is your ipsec, or vpn pass-thru box
> > checked?" so I need to know what iptables rules that linksys/dlink
> > have behind this 'feature'.
>
> So you want to know what Linksys does when one checks IPSEC passthrough
> box ?... Well, actually, they just do nothing. They do something when
> the box is unchecked in fact.
>
> >From WRT54G source code, you'll see IPSec Passthrough being activated by
> default, i.e. when ipsec_pass=3D1 in NVRAM. Then look at firewall.c file:
>
>     /* DROP packets for IPsec pass through */
>     if (nvram_match("ipsec_pass", "0"))
>         save2file("-A FORWARD -o %s -p udp -m udp --dport %d -j %s\n"
>                 , wanface, ISAKMP_PORT, log_drop);
>
> The same goes for PPTP and L2TP. So basicly, they NAT everything, and if
> you happen to uncheck a VPN protocol passthrough checkbox, they block
> this protocol.
>
> So back to what I was saying: IPSEC with ESP only in transport mode or
> NAT-Traversal.
>
>
> --
> http://sid.rstack.org/
> PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
> >> Hi! I'm your friendly neighbourhood signature virus.
> >> Copy me to your signature file and help me spread!
>

