From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Problems with NAT
Date: Fri, 30 May 2003 16:57:23 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6D6E@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Ray Leach <raymondl@knowledgefactory.co.za>, jhime@synchro.com.br
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

They are all visible by the 1 nic.. the linux box talks to them via the =
same router that goes to the internet, this is why he has a problem.. so =
"-o eth0" wouldn't make a difference..

I found this out when he told me this in Portugese.. ;) he he funny =
that....

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

=20

-----Original Message-----
From: Ray Leach [mailto:raymondl@knowledgefactory.co.za]
Sent: Friday, May 30, 2003 4:04 PM
To: jhime@synchro.com.br
Cc: 'Netfilter Mailing List'
Subject: RE: Problems with NAT


On Thu, 2003-05-29 at 19:15, Jose Luis Hime wrote:
> The problem is that there are LAN C, LAN D and LAN E in other 3 =
cities,
> also! So, the rule:
>=20
> -t nat -A POSTROUTING -s LAN A -d ! LAN B -j SNAT --to =
Firewall_IP_address
>=20
> would work for LAN B, but not for the other LANs.
>=20
> All LANs are connected to the same router.
>=20

What about adding '-o INET_IFACE', or do LAN C,D,E also connect via the
internet interface?

> Thanks again,
> Jose Hime
>=20
>=20
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Ray Leach
> Sent: Thursday, May 29, 2003 12:55 PM
> To: Netfilter Mailing List
> Subject: Re: Problems with NAT
>=20
>=20
> On Thu, 2003-05-29 at 17:15, Jose Luis Hime wrote:
> > Dear all:
> >=20
> > I have the following network:
> >               :
> >               :    /---------\
> > /-------\  Leased  | Router  |  Leased  /----------\
> > | LAN B |----------| without |----------| Internet |
> > \-------/  Line 1  | NAT     |  Line 2  \----------/
> >               :    \---------/
> >               :         |
> >               :         |
> >               :   /----------\
> >               :   | Firewall |      /-------\
> >               :   | Linux    |------| LAN A |
> >               :   | with NAT |      \-------/
> >               :   \----------/
> >               :
> >    CITY "B"   :     CITY "A"
> >=20
> > 1. The router, the firewall and LAN A are in city "A"
> > 2. LAN B is in another city (city "B")
> > 3. LAN A must access the internet, LAN B must not;
> > 4. Unfortunately my router does not support NAT;
> > 5. Both the router and the linux firewall have real internet IP =
addresses;
> > 6. So:
> >    - The linux firewall must NAT packets from LAN A to the internet;
> >    - The linux firewall must not NAT packets from LAN A to LAN B;
> >=20
> > I created rules in table "filter" allowing communication between LAN =
A and
> > LAN B:
> >    -t filter -A INPUT   -s LAN A -d LAN B -j ACCEPT
> >    -t filter -A INPUT   -s LAN B -d LAN A -j ACCEPT
> >    -t filter -A FORWARD -s LAN A -d LAN B -j ACCEPT
> >    -t filter -A FORWARD -s LAN B -d LAN A -j ACCEPT
> >=20
> > After that, I created one rule in table "nat" in order to allow LAN =
A
> > accessing the internet:
> >    -t nat -A POSTROUTING -s LAN A -d 0/0 -j SNAT --to =
Firewall_IP_address
> >=20
> > The problem is that LAN A is making NAT to LAN B.
> >=20
> > Is there a way to prevent the firewall from NATing from LAN A to LAN =
B? The
> > problem is that both traffics (LAN A->internet and LAN A->LAN B) are =
going
> > through the same interface...
> >=20
> Sure, change your nat rule:
>   -t nat -A POSTROUTING -s LAN A -d ! LAN B -j SNAT --to
> Firewall_IP_address
>=20
> > With ipchains, after reaching the INPUT and FORWARD rules the =
firewall
> > would stop and would not reach the NAT rules. This behavior changed =
in
> > iptables and it always check both tables (filter and nat).
> >=20
> > Thanks in advance,
> > Jose Hime
--=20
--
Raymond Leach <raymondl@knowledgefactory.co.za>
Network Support Specialist
http://www.knowledgefactory.co.za
"lynx -source http://www.rchq.co.za/raymondl.asc | gpg --import"
Key fingerprint =3D 7209 A695 9EE0 E971 A9AD  00EE 8757 EE47 F06F FB28
--

