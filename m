From: "Timothy Earl" <mehimx@gmail.com>
Subject: TR: Redirecting mail
Date: Fri, 8 Apr 2005 13:50:41 +0200
Message-ID: <42567013.37e18d74.4d3a.3b90@mx.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Forgot to send to list...

> -----Message d'origine-----
> De=A0: Timothy Earl [mailto:mehimx@gmail.com]
> Envoy=E9=A0: vendredi 8 avril 2005 13:48
> =C0=A0: 'Ilo Lorusso'
> Objet=A0: RE: Redirecting mail
>=20
> Hi,
>=20
> iptables v1.2.5: Unknown arg `--dports'
>=20
> changes --dports to --dport when not using multiport...
>=20
> Regards,
>=20
> Tim
> > -----Message d'origine-----
> > De=A0: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> > bounces@lists.netfilter.org] De la part de Ilo Lorusso
> > Envoy=E9=A0: vendredi 8 avril 2005 13:38
> > =C0=A0: Rob Sterenborg
> > Cc=A0: netfilter@lists.netfilter.org
> > Objet=A0: Re: Redirecting mail
> >
> > > The networks seem to be connected, so can't you just configure a
> > > smtp-forwarder in your MTA configuration ? That would be easier I
> think.
> >
> > I'd prefer just using iptables, so i can redirect when i need to..
> >
> >
> >
> > > There is no need to use multiport because you only DNAT 1 port : =
smtp.
> > > But that should not be a problem.
> > >
> > > iptables -t nat -A OUTPUT -p tcp --dports smtp \
> > > -j DNAT --to-destination 192.168.12.56
> >
> >
> > if I try it without the multiport option i get the following error..
> >
> > [root@posjia0h01 root]# iptables -t nat -A OUTPUT -p tcp --dports =
smtp -
> j
> > DNAT --to-destination 192.168.12.56
> > iptables v1.2.5: Unknown arg `--dports'
> > Try `iptables -h' or 'iptables --help' for more information.
> >
> >
> >
> > And no I dont have any rules blocking this from working as shown =
below,
> > but
> > would i need any iptables rules to make it work maybe? (like enable
> > ipforwarding and maybe a forward rule, im not sure)
> >
> >
> >
> > [root@prxsaa0z02 root]# iptables -L
> > Chain INPUT (policy ACCEPT)
> > target     prot opt source               destination
> >
> > Chain FORWARD (policy ACCEPT)
> > target     prot opt source               destination
> >
> > Chain OUTPUT (policy ACCEPT)
> > target     prot opt source               destination
> > [root@prxsaa0z02 root]# iptables -L -t nat
> > Chain PREROUTING (policy ACCEPT)
> > target     prot opt source               destination
> >
> > Chain POSTROUTING (policy ACCEPT)
> > target     prot opt source               destination
> >
> > Chain OUTPUT (policy ACCEPT)
> > target     prot opt source               destination



