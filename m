From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Firewall IP change
Date: Mon, 2 Aug 2004 15:57:12 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408021557.12351.Antony@Soft-Solutions.co.uk>
References: <40FEE340.8090907@ctwa.com> <200408021326.52657.Antony@Soft-Solutions.co.uk> <200408021612.41826.fred99@libertysurf.fr>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200408021612.41826.fred99@libertysurf.fr>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

On Monday 02 August 2004 3:12 pm, Fr=C3=A9d=C3=A9ric Gonzatti wrote:

> Sorry, my external interface is eth2 (it's just an error when I wrote t=
he
> mail).
> Some pages takes lots of time to appear when I'm using the first line i=
n my
> script. When I'm using the second one they appear immediately.
> My DNS server is on my LAN with a private IP address 172.16.2.200.

Please show us:

1. The exact rules you are referring to (no typos, no hidden addresses, t=
he=20
exact rules as they appear in the scripts).

2. The routing table (output of "route -n") of the firewall

3. The interface configuration (output of "ifconfig") from the firewall.

Regards,

Antony.

> > On Monday 02 August 2004 1:07 pm, Fr=C3=A9d=C3=A9ric Gonzatti wrote:
> > > If I replace in my iptables script :
> > > iptables -A POSTROUTING -t nat -o eth2 -j SNAT --to my_public_IP
> > > by
> > > iptables -t nat POSTROUTING -o eth1 -j MASQUERADE
> > >
> > > ...I can access to the internet faster !
> > >
> > > Have you got any idea ?
> >
> > Which is your external interface?   eth1 or eth2?
> >
> > How are you measuring "faster"?
> >
> > Where are your DNS servers?
> >
> > Regards,
> >
> > Antony.

--=20
The words "e pluribus unum" on the Great Seal of the United States are fr=
om a=20
poem by Virgil entitled "Moretum", which is about cheese and garlic salad=
=20
dressing.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


