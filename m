From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: How to redirect requests
Date: Fri, 21 Nov 2003 08:56:51 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A28AD47@wardrive.citadelcomputer.com.au>
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
To: magu@afesta.net, netfilter@lists.netfilter.org

If you are DNATing an internal client to an internal server, don't =
forget to masquerade/snat the clients address otherwise the server will =
respond directly to the client which the client would then drop the =
packets as it has no connection to the real outside ip for =
www.smartlaunch.net .
Do this as if the server was outside and had to be SNATed...

Thanks,
____________________________________________
George Vieira
=20

> -----Original Message-----
> From: magu@afesta.net [mailto:magu@afesta.net]
> Sent: Wednesday, 19 November 2003 8:12 AM
> To: netfilter@lists.netfilter.org
> Subject: How to redirect requests
>=20
>=20
> Hello all.
>=20
> I'm trying to redirect all requests coming from my internal=20
> machines, that
> contain www.smartlaunch.net to an internal machine. I've already
> succesfully redirected all requests of the IP address, but=20
> haven't managed
> to redirect the domain requests. Maybe it's not at all a job=20
> for iptables,
> but I wanted some light on this, since I don't know where to start.
>=20
> any help is appreciated
> magu
> magu@afesta.net
>=20
>=20
>=20

