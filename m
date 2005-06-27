From: Francesco Ciocchetti <primero@fastwebnet.it>
Subject: Re: -m physdev
Date: Mon, 27 Jun 2005 07:47:15 +0200
Message-ID: <42BF92E3.7090700@fastwebnet.it>
References: <20050626091840.93E932FE5F@smtp.263.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050626091840.93E932FE5F@smtp.263.net>
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
Content-Type: text/plain; charset="iso-2022-jp"
To: bend chen <boy2eye@263.net>
Cc: netfilter <netfilter@lists.netfilter.org>

bend chen wrote:

>hi,netfilter
>
>	  who can give me some examples from "iptables -m physdev"?
>
>thanks your help=20
>
>=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1=A1
> =20
>
You need it to check the INPUT and OUTPUT Pyshical Interface for a
BRIDGE you want to filter with Iptables.

I mean, if you have an eth0 and eth1 bridged in a br0 interface all the
packets coming and exiting to and from the bridge will result with
IN-INTERFACE and OUT-INTERFACE as br0. If you need to filter the packets
based on incoming and outcoming interfaces you need to use -m physdev

iptables -A FORWARD -m physdev --physdev-in eth0 -j ACCEPT


bye
P.

