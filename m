From: Alexis <alexis@attla.net.ar>
Subject: Re: How to invert more than one destination network?
Date: Mon, 01 Mar 2004 13:07:39 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078157259.1626.20.camel@pepelui.baicom>
References: <009901c3ffa6$0cdd0050$c800a8c0@cyclelogic.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <009901c3ffa6$0cdd0050$c800a8c0@cyclelogic.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="macroman"
To: gparra@cyclelogic.com
Cc: Netfilter <netfilter@lists.netfilter.org>

add a new line with the second network :)


On Mon, 2004-03-01 at 12:58, Gonzalo Parra wrote:
> Hi
> =20
> I have MASQUERADE in a box as a gateway using IPTABLES and I am using
> that box also for VPN... so for it to work I cant masquerade thaffic
> that goes to the other side of the VPN...
> =20
> This works for me:
> =20
> IPTABLES -t nat -A POSTROUTING -o $EXTIF -d \! 192.168.20.0/26 -j
> MASQUERADE
> =20
> but now I have another network at the other side of the VPN
> (192.168.40.0/26), so how can I invert two networks in the -d???
> =20
> Thanks,
> =20
> Gonzalo Parra =20
> Network Administrator
> Tel: +58 (212) 265-5330
> Cel: +58 (414) 240-4054
> Caracas, VE
> ..................................... =20
>=20
> =20
--=20
Tus problemas no se pueden resolver en el mismo
nivel mental que ten=C3=ADas cuando los creaste.=20
		Albert Einstein


