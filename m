From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: invalid address
Date: Fri, 4 Jun 2004 14:50:56 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF56793AC@alderaan.smgtec.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Luis GUSTAVO <lgpcf@yahoo.com.br>, netfilter@lists.netfilter.org

> I have one router with my linux, i=B4m using the
> following rules for masquerade and nat my conection.
>=20
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>=20
> how can i redirect ports for address ip valid to ip
> invalid, on my internal lan.

You DON'T want to open up the firewall entirely on a single host.
If you want to open a single TCP port from the internet to a single PC, =
you would have:

iptables -t nat -A PREROUTING -i eth1 -p tcp --dport <your_port_number> =
-j DNAT --to <your_internal_host>


