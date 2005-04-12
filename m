From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: msn and yahoo messenger voice chat
Date: Tue, 12 Apr 2005 16:27:51 +0200
Message-ID: <425BDAE7.9060303@lopsch.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Wennie V. Lagmay schrieb:
> Hi all,
>=20
> Below are the config I tested and results:
>=20
> 1. IPTABLES -A POSTROUTING -s 192.169.10.0/255.255.255.0 -j SNAT --to-s=
ource
> xxx.xxx.85.113-xxx.xxx.85.115
> 2. IPTABLES -A POSTROUTING -s 192.169.10.0/255.255.255.0 -d
> xxx.xxx.85.113 -j MASQUERADE
> 3. IPTABLES -A POSTROUTING -s 192.169.10.0/255.255.255.0 -j MASQUERADE
>=20
> config 1, everything is working fine except  msn and yahoo messenger vo=
ice
> chat.
> config 2, everything is working fine except  msn and yahoo messenger vo=
ice
> chat.
> config 3, everything is working fine including msn and yahoo messenger =
voice
> chat, the only problem is that this configuration is not fitted to our
> setup. Can anybody have an idea on using config 1 and 2 with msn and ya=
hoo
> messenger voice chat enable? or do you have any solution enabling simil=
ar to
> config 1 with all features enable?
>=20
> Thank you very much,
>=20
> Wennie
>=20

Is there something else you use? I tried MSN voice chat behind my router
also using MASQUERADE but it doens=B4t work because MSN sends src IP
within the payload and therefor NAT fails.


