From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: RE: Newbie Question - Redirect traffic to internal Web server
Date: Thu, 17 Oct 2002 17:18:53 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000401c27622$cb705ee0$3864a8c0@discmail.com>
References: <20021017205206.HEZR27697.mta05-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021017205206.HEZR27697.mta05-svc.ntlworld.com@there>
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
To: 'Antony Stone' <Antony@Soft-Solutions.co.uk>, netfilter@lists.netfilter.org



Antony, I am not very familiar with the use of SNAT for incoming web
connections; I use DNAT for my web servers.  Is there any difference?

>=20
> On Thursday 17 October 2002 8:24 pm, Fl=E1vio Brito wrote:
>=20
> > Dear List
> >
> > I have two servers in my net,one with a valid IP. I want to=20
> redirect=20
> > all the HTTP Traffic(external -> internal) to my internal=20
> Web server=20
> > I'm trying to learn iptables, but when I test my rules,=20
> sometimes when=20
> > I try to erase them it appears not do what I want.
>=20
>=20
> >       	[FW]-eth0-> [200.179.213.245]------> Internet
> >
> > 	|eth1 ->[192.168.1.1]
> > 	| ---------------> [Web Server ] 192.168.1.33
> > 	|----------------> [LAN Hosts] [192.168.1.2 to 192.168.1.100]
> >
> > eth0-> 200.179.213.245
> > eth1-> 192.168.1.1
> >
> > Can someone help me with this rules?
> >
> > iptables -t nat -A POSTROUTING -s 192.168.1.10/24 -d any/0 -j=20
> > MASQUERADE
>=20
> Remove the "-d any/0".   It is redundant and reduces=20
> legibility.   This rule=20
> will source translate all outgoing packets from your network=20
> to the Internet=20
> to have the external address of your firewall (so that=20
> replies can come back).
>=20
> > iptables -A INPUT -p tcp -s 192.168.1.33 -d 0/0 --dport www=20
> -j ACCEPT=20
> > iptables -A OUTPUT -p tcp -s 192.168.1.33 -d 0/0 --dport=20
> www -j ACCEPT
>=20
> You should not be using the INPUT & OUTPUT chains.   These=20
> are only for=20
> packets addressed to the firewall itself, or generated on the=20
> firewall,=20
> respectively.
>=20
> Instead you should use the FORWARD chain for packets going=20
> *through* your=20
> firewall:
>=20
> iptables -A FORWARD -p tcp --dport 80 -d 192.168.1.33 -j ACCEPT
>=20
> (Note also the -d instead of -s : you want to allow packets=20
> going *to* the=20
> web server, therefore it is the destination).
>=20
> > iptables -A PREROUTING -t nat -p tcp -d 0/0 --dport www -j REDIRECT=20
> > --to-port 80
>=20
> REDIRECT is only for packets terminating on the firewall=20
> machine itself.  =20
> Try this instead:
>=20
> iptables -A PREROUTING -t nat -p tcp --dport 80 -i eth0 -j SNAT --to=20
> 192.168.1.33

for this I would:
iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -d
200.179.213.245 -j DNAT --to 192.168.1.33
along with the appropriate FORWARD rule.

I was again wondering if I was doing things wrong?  It seems that if you
SNAT, then your WEB server won't know the client's IP address that was
accessing - all accesses would appear to be coming from the firewall.




