From: Paulo Ricardo Bruck <pauloric@contato.com.br>
Subject: Re: delay
Date: Fri, 31 Oct 2003 19:13:44 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067634823.1430.40.camel@pauloric.intranet>
References: <1067626591.1451.21.camel@pauloric.intranet>
	 <20031031191507.GC30565@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031031191507.GC30565@cannon.eng.us.uu.net>
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

Em Sex, 2003-10-31 =E0s 17:15, Ramin Dousti escreveu:
> On Fri, Oct 31, 2003 at 04:56:33PM -0200, Paulo Ricardo Bruck wrote:
>=20
> > Hi guys
> >=20
> > Just a question. I have a firewall w/ 3 NIC as below:
> >=20
> > 			Internet ADSL
> > 			|
> > 			|eth1 200.200.200.44/26
> > 		_________________________=09
> > 		|	Firewall	|	DMZ
> > 		| iptables 1.2.8	|_eth2 192.168.1.1/24______EMail
> > 		|_______________________|			192.168.1.3=09
> > 			|
> > 			| eth0 10.0.0.1/24
> > 			LAN
> >=20
> >=20
> > Firewall : Debian 2.4.22 + iptables 1.2.8
> >=20
> >=20
> > route:
> > 200.200.200.0/26 dev eth1  proto kernel  scope link  src 200.200.200.44
> > 10.0.0.0/24 dev eth0  proto kernel  scope link  src 10.0.0.1
> > 192.168.1.0/24 dev eth2  proto kernel  scope link  src 192.168.1.1
> > default via 200.200.200.1 dev eth1
> >=20
> > rules:
> >=20
> > a) iptables -A PREROUTING -d 200.200.200.1 -p tcp -m multiport --dports
> > smtp,pop3,imap2,webcache -j DNAT --to-destination 192.168.1.3
> >=20
> > b) iptables -A POSTROUTING -o eth1 -j SNAT --to-source 200.200.200.1
> >=20
> > c) iptables -A POSTROUTING -o eth2 -j SNAT --to-source 192.168.1.1
> >=20
> >=20
> > What happens:
> >=20
> > - all desktops ( M$windows) access webmail and email w/ no problems, bu=
t
> > if I insert rule c) above it causes a delay when any desktop hit
> > get/post e-mail in Outlook and it takes +- 40 seconds to "connenct".
>=20
> Let me not ask you why you have rule (c).=20
c) I insert because we have in DMZ a IIS and as far as I known I could
protect it putting PREROUTING rules.... who knows??? If someone invade
IIS at least I'll be protecting LAN changing their IP ....80)


> But in general a long delay
> is most of the time related to a faulty or non-existent reverse DNS.
> But in case of SMTP it also might have something to do with ident
> being dropped...
maybe it can help:=20
 iptables -N AUTH
iptables -A FORWARD -d $LAN -p tcp --dport 113 -j AUTH
iptables -A FORWARD -d $REDEDMZ -p tcp  --dport 113 -j AUTH
iptables -A AUTH  -j REJECT -p tcp --reject-with tcp-reset

As you can see I'm rejecting ident.... Is that the problem ??



>=20
> Ramin
>=20
> >=20
> > I know that must be a silly misconfiguration of something but after 1
> > week searching the problem I can't imagine what's wrong.
> >=20
> > Can anybody help me please
> >=20
> > Thanks in advance
> >=20
> >=20
> >=20
> >=20
> >=20



