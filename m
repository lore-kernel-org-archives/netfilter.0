From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: ports on PREROUTING
Date: Tue, 8 Jun 2004 19:47:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040608174757.CF27FF3E@sterenborg.info>
References: <20040608164522.46882.qmail@web50207.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040608164522.46882.qmail@web50207.mail.yahoo.com>
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

> I use the follow rules=20
>=20
> iptables -P FORWARD DROP
>=20
>=20
> but when i use PREROUTING for port 3389, the machines=20
> external, don=B4t knew connect for the host.
>=20
>=20
> How can i accept connections in PREROUTING port.

I don't know exactly what it is you want to do, but could it be =
something
like this ?

iptables -A FORWARD -p tcp --dport 3389 -j ACCEPT


Gr,
Rob


