From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: iptables help..
Date: Mon, 13 Oct 2003 13:04:05 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C4A0@wardrive.citadelcomputer.com.au>
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
To: jerome@gmanmi.tv, Ralf Spenneberg <lists@spenneberg.org>
Cc: Netfilter <netfilter@lists.netfilter.org>

> > FORWARD -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT
You have it accepting packets before it gets LOGged.. Put the LOG line =
above all others..
> > -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> > -A FORWARD -p tcp -j LOG --log-prefix "FORWARD packets:"

Also, if your DNATing to a local webserver on the same network, it won't =
work without a SNAT as per jeromes suggestion as you have to make it =
look like the firewall is MAQUERADing your lan to an outside address BUT =
it's really inside, so your webserver will see all packets as the =
firewall and not local hosts...

Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

Phone   : +61 2 9955 2644
HelpDesk: +61 2 9955 2698
=20

> -----Original Message-----
> From: JM [mailto:jerome@gmanmi.tv]
> Sent: Monday, 13 October 2003 1:12 PM
> To: Ralf Spenneberg
> Cc: Netfilter
> Subject: Re: iptables help..
>=20
>=20
> hi,
>=20
> i added LOGging on server_A
>=20
> log all INPUT and FORWARD to messages log file... and for=20
> some reason nothing=20
> is comming up...
>=20
> [ having nightmares on this.. : (  ]
>=20
> TIA
>=20
>=20

