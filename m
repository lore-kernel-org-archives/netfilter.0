From: Michael Thompson <mike@thompsonmike.co.uk>
Subject: Re: Filtering on MAC Addresses
Date: Fri, 04 Feb 2005 15:04:45 +0000
Message-ID: <42038F0D.6010409@thompsonmike.co.uk>
References: <42037F7D.2070804@thompsonmike.co.uk> <42038855.8050709@mnemon.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <42038855.8050709@mnemon.de>
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

J=F6rg Harmuth wrote:

> Hmm, all I can say is that filtering based on MAC address works. Don'
> worry about the MAC iptables uses, that normal:
>=20
> 00:09:5b:1b:52:77 is the MAC of the incoming interface
> 00:10:5a:14:50:db is the MAC of the sending interface
> 08:00 is the transport protocol (IP)

Thats what I thought it was all about, however it is not matching the=20
Sending MAC address.

Feb  4 13:53:00 polaris IN=3Deth0 OUT=3D=20
MAC=3D00:09:5b:1b:52:77:00:10:5a:14:50:db:08:00 SRC=3D192.168.1.14=20
DST=3D192.168.1.1 LEN=3D92 TOS=3D0x00 PREC=3D0x00 TTL=3D128 ID=3D17305 DF=
 PROTO=3DTCP=20
SPT=3D1085 DPT=3D22 WINDOW=3D65067 RES=3D0x00 ACK PSH URGP=3D0

It gets blocked here, seemingly ignoring the rule.


>=20
> Looking at your rule I have two ideas. Seems that the rule is placed
> in a chain you created, so may be you simply forgot to call the chain
> from the INPUT (or PREROUTING or FORWARD) chain.

It is called from both the input chain and forward chains.

> Or may be there is a
> rule that the packet hits before the MAC rule. You can test if it
> works basically like so:

It is the first rule in the chain.

>=20
> iptables -I INPUT 1 -i $IFACE -m mac --mac-source 00:10:5a:14:50:db -j
> LOG --log-prefix "MAC match: "
>=20

All ready logging it all.

> or similar. Good luck.

Many thanks for your help!

Mike

