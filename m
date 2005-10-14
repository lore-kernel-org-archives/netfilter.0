From: "Jorge I. Davila L." <davila@cablenet.com.ni>
Subject: Re: iptables and FTOS syntax error
Date: Fri, 14 Oct 2005 06:32:38 -0600
Message-ID: <1129293158.2603.9.camel@vyatka-39.cablenet.com.ni>
References: <434F1823.7010601@inxsoft.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <434F1823.7010601@inxsoft.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: Thomas Kuiper <tkuiper-netfilter@inxsoft.net>
Cc: netfilter@lists.netfilter.org

The past days I have a similar problem with iprange .. I was able to see
in the help the reference to iprange (like you are able to see the help
related to FTOS)

Well, the kernel *must* support FTOS.

I suggest see in your kernel to know if FTOS is supported.

This implies download the kernel source, then in the kernel source code
directory.

make menuconfig

go to Network Options -> Netfilter configuration=20

and search for that option in the kernel.

Hope this help.

Jorge.

El vie, 14-10-2005 a las 10:29 +0800, Thomas Kuiper escribi=F3:
> Hello,
>=20
> I have a bizarre problem with iptables when I'm trying to use FTOS:
>=20
> First, the following works fine using MARK:
>=20
> iptables -j MARK -A POSTROUTING -t mangle -p udp --dport 123 --set-mark 4
>=20
> But this one doesn't:
>=20
> iptables -j FTOS -A POSTROUTING -t mangle -p udp --dport 123 --set-ftos 4
>=20
> And gives the error message:
>=20
> iptables: No chain/target/match by that name
>=20
> A "iptables -j FTOS --help" shows that the FTOS extension was compiled in=
 so=20
> I'm very confused about the error message.
>=20
> -------------snip-----------&<----------------
> FTOS target options
>    --set-ftos value              Set TOS field in packet header to value
>                                  This value can be in decimal (ex: 32)
>                          or in hex (ex: 0x20)
> -------------snap----------->&----------------
>=20
> Any help greatly appreciated,
>=20
> Thomas
--=20
Jorge Isaac Davila Lopez


