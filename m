From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
Subject: RE: problem with 2 NAT and 2 ROUTE
Date: Tue, 24 Aug 2004 08:13:47 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D5C9032B2B09C64EA2409D6214E91AC90512BB@asimail2.alphanumeric.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
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

> I have a problem with mi linux BOX
> .
> Eth0 =3D  192.168.0.254  (RED A)
> Eth1 =3D  200.69.123.177/130  (LINK A)
> Eth2 =3D  192.168.0.100  (RED B)
> Eth3 =3D  192.168.1.1 para el PPPOE
> ppp0=3D  DynamicIP (LINK B)
> -------------------------------------------------------------------
> DEFAULT ROUTE
> 200.69.123.178 (LINKA)
> ppp0 (cdo establece el PPPOE)
> -------------------------------------------------------------------
> IPTABLES  NAT RULES
> iptables -t nat -A POSTROUTING -s 192.168.0.0/255.255.255.128 -o ppp0 =
-j MASQU
ERADE
> iptables -t nat -A POSTROUTING -s 192.168.0.128/255.255.255.128 -o =
eth1 -j MAS
QUERADE
>
> -------------------------------------------------------------------
>
> My problem is the only NAT works is the NAT with march with de default =
route..
>
> Can any one helme?

you need to add a policy route thats routes traffic from =
192.168.0.128/25 via the eth1 (ppp1, maybe?) interface.

have a look at:

http://lartc.org/howto/lartc.rpdb.html

-j

