From: "Gonzalo Parra" <gparra@cyclelogic.com>
Subject: RE: How to invert more than one destination network?
Date: Mon, 1 Mar 2004 12:17:42 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00a101c3ffa8$b9e07730$c800a8c0@cyclelogic.com>
References: <1078157259.1626.20.camel@pepelui.baicom>
Reply-To: <gparra@cyclelogic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1078157259.1626.20.camel@pepelui.baicom>
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
To: 'Alexis' <alexis@attla.net.ar>
Cc: 'Netfilter' <netfilter@lists.netfilter.org>

Is it that simple?

I had the thought that that would make IPTABLES to masquerade =
everithing...

I mean: first rule will say MASQUERADE everything but 192.168.20.0/26 =
and
the seccond one will say MASQUERADE everything but 192.168.40.0/26 so =
every
IP (even those inside those networks) will always find a rule to go
MAQUERADED...

-----Original Message-----
From: Alexis [mailto:alexis@attla.net.ar]=20
Sent: Lunes, 01 de Marzo de 2004 12:08 p.m.
To: gparra@cyclelogic.com
Cc: Netfilter
Subject: Re: How to invert more than one destination network?


add a new line with the second network :)


On Mon, 2004-03-01 at 12:58, Gonzalo Parra wrote:
> Hi
> =20
> I have MASQUERADE in a box as a gateway using IPTABLES and I am using=20
> that box also for VPN... so for it to work I cant masquerade thaffic=20
> that goes to the other side of the VPN...
> =20
> This works for me:
> =20
> IPTABLES -t nat -A POSTROUTING -o $EXTIF -d \! 192.168.20.0/26 -j=20
> MASQUERADE
> =20
> but now I have another network at the other side of the VPN=20
> (192.168.40.0/26), so how can I invert two networks in the -d???
> =20
> Thanks,
> =20
> Gonzalo Parra
> Network Administrator
> Tel: +58 (212) 265-5330
> Cel: +58 (414) 240-4054
> Caracas, VE
> ..................................... =20
>=20
> =20
--=20
Tus problemas no se pueden resolver en el mismo
nivel mental que ten=EDas cuando los creaste.=20
		Albert Einstein


