From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: RE: Can iptables create alias IP for another box?
Date: Mon, 23 Dec 2002 08:46:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GOEDLKDBKHLHGAKAGFGKOELILLAA.rsterenborg@xs4all.nl>
References: <1040617491.c2706ec0andnicky@myrealbox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1040617491.c2706ec0andnicky@myrealbox.com>
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

> > Port 80 : webserver ?
> > Port 8080 : web-proxy ?
>=20
> Don't need 8080 if iptables on B can do:
>=20
>   client(tcp/80)--> boxB--> boxA--> boxB--> client

Sure.

> I'd try :
> iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -d 1.2.3.4 -p tcp --dport 80 -j ACCEPT
> iptables -t nat -A PREROUTING -d 10.5.6.7 -p tcp --dport=20
> 8080 -j DNAT --to-destination 1.2.3.4:80

Change 8080 into 80.

> A & B have one interface each, on different subnets routed to each =
other.

Well, if A can see B (and vice-versa) there hould be no problem I think.


Rob


