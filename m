From: Fatih TURKMEN <fatihturkmen99@yahoo.com>
Subject: Re: ssh connection is not allowed in NAT, SUSE 9.2
Date: Thu, 21 Jul 2005 05:41:06 -0700 (PDT)
Message-ID: <20050721124106.35016.qmail@web50201.mail.yahoo.com>
References: <42DCC29E.5000603@mnemon.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42DCC29E.5000603@mnemon.de>
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

Thank you guys for your replies. I got the problem. It
was because of the second network interface. Somehow
second NIC is not working (functioning) and when I try
to up it, it  stays down.
Now the question is what can be happening with second
NIC?

Thanks in advance.

Fatih TURKMEN
=20
--- J=F6rg Harmuth <harmuth@mnemon.de> wrote:

> Fatih TURKMEN schrieb:
> > Hi everybody,
> > I am trying to create small NAT network on SUSE
> 9.2
> > computers.I don't know what is missing in my
> iptables
> > policy but I have added three rules for SNAT:
> >=20
> > 1) iptables -t nat -A POSTROUTING -o eth0 -j
> > MASQUERADE
> > 2) iptables -A FORWARD -i eth0 -o eth1 -m state
> > --state RELATEd,ESTABLISHED -j ACCEPT
> > 3) iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
> >=20
> > I stopped firewalls on local computers, and
> installed
> > ssh server/client on all computers.I can ssh to
> local
> > machines from locals.But I can't ssh to nat
> > server.Also I can only ping one computer from NAT
> > Server.
> > When I try to ssh to local clients from NAT server
> I
> > got either  "No route to host" or "Connection
> refused"
> > although I stopped firewalls on locals and set the
> NAT
> > server as the default gateway for local clients.
>=20
> Would you mind to provide the full ruleset of your
> nat box ? Preferably
> the output of iptables-save ? A description of your
> network layout could
> be helpfull too (networks, NICs,...). As there is
> "No route to host" the
> routing table could give some enlightment. There are
> at least two
> interfaces, so - is ip-forwarding enabled ? What
> does
>=20
> netstat -tulpn | grep ':22'
>=20
> give on the respective boxes ? When trying to
> connect via SSH to no
> avail, what does
>=20
> tcpdump -ni <respective_inerface>
>=20
> give (try reducing other traffic) ? Questions over
> questions :)
>=20
> Have a nice time,
>=20
> Joerg
>=20
>=20
>=20


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around=20
http://mail.yahoo.com=20

