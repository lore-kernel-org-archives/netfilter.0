From: "P.Italiaander" <pc-secure@home.nl>
Subject: Re: DNAT/SNAT stuff
Date: Mon, 12 May 2003 01:27:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305120127.30416.pc-secure@home.nl>
References: <1052386761.5804.5.camel@mdew> <1052644854.17942.28.camel@charlebourg-2-81-57-105-138.fbx.proxad.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1052644854.17942.28.camel@charlebourg-2-81-57-105-138.fbx.proxad.net>
Content-Disposition: inline
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
To: netfilter <netfilter@lists.netfilter.org>

Op zondag 11 mei 2003 11:20, schreef Francois LE BOURDELLES:
> Hello ,
>
> I just posted a similar question related to the same subject :
> nating a full subnet (as described in the NAT howto) that doesn't seems
> to work !
> in fact it seems that the --to A.B.C.D/X fromat is not implemented (or
> has been removed ?)
>
> I'm waiting for a response ... from the list or the authors ....
>
> Regards.
>
> Le jeu 08/05/2003 =E0 11:39, mdew a =E9crit :
> > current setup,
> >
> > $IPTABLES -t nat -A PREROUTING -i eth0 -d 210.54.175.12 -p tcp --dport
> > 4661 -j DNAT --to 10.0.0.3
> > $IPTABLES -t nat -A PREROUTING -i eth0 -d 210.54.175.12 -p tcp --dport
> > 4662 -j DNAT --to 10.0.0.3
> > $IPTABLES -t nat -A POSTROUTING -o eth0 -s 10.0.0.3 -p tcp --sport 4661
> > -j SNAT --to 210.54.175.12
> > $IPTABLES -t nat -A POSTROUTING -o eth0 -s 10.0.0.3 -p tcp --sport 4662
> > -j SNAT --to 210.54.175.12
> > $IPTABLES -t nat -A PREROUTING -i eth0 -d 210.54.175.12 -p udp --dport
> > 4665 -j DNAT --to 10.0.0.3
> > $IPTABLES -t nat -A PREROUTING -i eth0 -d 210.54.175.12 -p udp --dport
> > 4672 -j DNAT --to 10.0.0.3
> > $IPTABLES -t nat -A POSTROUTING -o eth0 -s 10.0.0.3 -p udp --sport 4665
> > -j SNAT --to 210.54.175.12
> > $IPTABLES -t nat -A POSTROUTING -o eth0 -s 10.0.0.3 -p udp --sport 4672
> > -j SNAT --to 210.54.175.12
> >
> > i would like specify 10.0.0.x instead of 10.0.0.3, how is this done?
> >
> > and some problems i had attempting it..
> >
> > Try `iptables -h' or 'iptables --help' for more information.
> > iptables v1.2.6a: Bad IP address `10.0.0.0/24'
> > iptables v1.2.6a: host/network `10.0.0.3-10.0.0.8' not found
> > Try `iptables -h' or 'iptables --help' for more information.
> >
> > cc: please :)

I tested this rule and works fine:

$IPTABLES -t nat -A POSTROUTING -o eth0 -s 10.0.0.0/24 -p udp --sport 4665
 -j SNAT --to 210.54.175.12

Pascal

