From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: Can iptables create alias IP for another box?
Date: Sun, 22 Dec 2002 13:24:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GOEDLKDBKHLHGAKAGFGKGELFLLAA.rsterenborg@xs4all.nl>
References: <1040514666.5163ee60andnicky@myrealbox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1040514666.5163ee60andnicky@myrealbox.com>
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
To: netfilter@lists.netfilter.org

> Behind our firewall which NATs everything, I have a server=20
> (A) with one IP 1.2.3.4 that needs to be reachable also=20
> thru a second IP like 10.5.6.7.  The application won't=20
> support adding an alias IP.
>=20
> If I give the second IP to box B's eth0, can iptables make=20
> box B emulate an alias IP for box A?  It only has to work=20
> for port 80 traffic but be nice if it did more.

Port 80 : webserver ?
Port 8080 : web-proxy ?

> I was trying to do something like this on box B (from=20
> error-prone memory, with B's address 10.5.6.7):
>=20
> > iptables -t nat -A PREROUTING -d 10.5.6.7 -p tcp --dport=20
> 8080 -j DNAT --to 1.2.3.4:80
>=20
> > iptables -t nat -A POSTROUTING -d 1.2.3.4 -p tcp --dport=20
> 80 -j SNAT --to 10.5.6.7

Do you have a default FORWARD policy of DROP ?
If so, you also need a FORWARD ACCEPT rule.

I'd try :
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A FORWARD -d 1.2.3.4 -p tcp --dport 80 -j ACCEPT
iptables -t nat -A PREROUTING -d 10.5.6.7 -p tcp --dport 8080 -j DNAT =
--to-destination 1.2.3.4:80

I don't know what you are trying to do with your second rule.
If it's meant as a reverse rule of the first, then you maybe better use =
RELATED,ESTABLISHED.

But if you want to SNAT 1.2.3.4 to (public ?) 10.5.6.7 :
iptables -A FORWARD -s 1.2.3.4 -j ACCEPT
iptables -t nat -A POSTROUTING -s 1.2.3.4 -j SNAT --to-source 10.5.6.7


Rob


