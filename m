From: =?ISO-8859-1?Q?Bj=F6rn_Schmidt?= <bj-schmidt@uni-paderborn.de>
Subject: Re: state: INVALID
Date: Sun, 21 Nov 2004 00:33:39 +0100
Message-ID: <419FD453.5080904@uni-paderborn.de>
References: <419E75B1.3030406@uni-paderborn.de>
	<1100990773.3501.9.camel@hubcap.ljm.dom>
	<419FD149.50308@uni-paderborn.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <419FD149.50308@uni-paderborn.de>
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
To: opie@817west.com, netfilter@lists.netfilter.org

Bj=F6rn Schmidt wrote:
> Here is a(n older) packet that is _falsely_ classified as INVALID=20
> (should be
> ESTABLISHED). I changed the IP-adress and hostname in the meantime:
>=20
> Oct 29 13:51:05 skyron ILLEGAL_PACKET IN=3D OUT=3Deth0 MAC=3D SRC=3D192.1=
68.1.1
> DST=3D192.168.1.2 LEN=3D60 TOS=3D00 PREC=3D0x00 TTL=3D64 ID=3D0 DF PROTO=
=3DTCP SPT=3D22
> DPT=3D33085 SEQ=3D1048000056 ACK=3D1050690244 WINDOW=3D5792 ACK SYN URGP=
=3D0

Here is one of the "false" INVALID-state packets of today, i tried to conne=
ct
from a workstation (192.168.1.2) to the server via ssh:

Nov 21 00:26:53 gigabyte INT_ILLEGAL_PACKET IN=3D OUT=3Deth0 MAC=3D SRC=3D1=
92.168.1.2
DST=3D192.168.1.1 LEN=3D52 TOS=3D00 PREC=3D0x00 TTL=3D64 ID=3D16033 DF PROT=
O=3DTCP SPT=3D32921
DPT=3D22 SEQ=3D340786628 ACK=3D3785725711 WINDOW=3D1460 ACK URGP=3D0

--=20
Greetings
Bjoern Schmidt


