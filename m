From: Damjan <gdamjan@mail.net.mk>
Subject: Re: off topic - hope somebody can help
Date: Fri, 11 Jun 2004 18:54:51 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040611165451.GA4079@legolas.on.net.mk>
References: <000901c44f53$44b9be80$0200000a@heretic>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <000901c44f53$44b9be80$0200000a@heretic>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org
Cc: Alexis <alexis@tpys.com.ar>

> Does anybody knows why ethernet interfaces stay's up even when i unplug=
 the
> ethernet cable?
>=20
> I have 2 isp connected to a box, with a default route pointing both of =
them one
> using a higer weight to use it as backup conection (using iproute2). Ok=
, if i
> unplug the ethernet cable of eth of isp1 , the ethernet card stays up a=
nd nobody
> can make any connection. But, if i "really" force the interface shutdow=
n of
> provider1 (doing ifdown eth1) the traffic goes instantly trough provide=
r2.
>=20
> Any idea how can i tear down an interface when i unplug the ethernet ca=
ble?

you can use netplugd, look it up on freshemat.net.

--=20
damjan | =D0=B4=D0=B0=D0=BC=D1=98=D0=B0=D0=BD
This is my jabber ID --> damjan@bagra.net.mk <-- not my mail address!!!

