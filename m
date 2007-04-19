From: Lars =?UTF-8?Q?T=C3=A4uber?= <taeuber@bbaw.de>
Subject: Problem resolved!
Date: Thu, 19 Apr 2007 13:10:56 +0200
Message-ID: <20070419131056.8ba9bbcc.taeuber@bbaw.de>
References: <20070418151941.c689b07c.taeuber@bbaw.de>
	<web-69045730@bk1.webmaillogin.com>
	<20070419083348.364c873e.taeuber@bbaw.de>
	<20070419112338.a3f379bb.taeuber@bbaw.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070419112338.a3f379bb.taeuber@bbaw.de>
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
Content-Type: text/plain; charset="utf-8"
To: netfilter@lists.netfilter.org

Jorge was very right.

The routing tables where not ballanced.
The gateway has had a route to the 194.95.188.0/26 network and so the req=
uests for a tcp connection into this network have never been seen by the =
firewall. That's why the answers are invalid.

Sorry for this disturbance. But sometimes it helps to simply talk about p=
roblems.

Thanks.
Lars

Am Thu, 19 Apr 2007 11:23:38 +0200 schrieb Lars T=C3=A4uber <taeuber@bbaw=
.de>:

> Hi!
>=20
> To enhance the problem:
>=20
> The ICMP redirects are also blocked as invalid:
>=20
> kernel: RULE -1 -- DENY IN=3D OUT=3Deth2 SRC=3D194.95.188.7 DST=3D194.9=
5.188.37 LEN=3D76 TOS=3D0x00 PREC=3D0xC0 TTL=3D64 ID=3D18322 PROTO=3DICMP=
 TYPE=3D5 CODE=3D1 GATEWAY=3D194.95.188.25 [SRC=3D194.95.188.37 DST=3D194=
.95.188.245 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D0 DF PROTO=3DTC=
P SPT=3D80 DPT=3D1246 WINDOW=3D5840 RES=3D0x00 ACK SYN URGP=3D0 ]=20
>=20
> What is invalid with this?
>=20
> Here again the rules that match (first rules of firewall script):
>  $IPTABLES -N drop_invalid
>  $IPTABLES -A OUTPUT   -m state --state INVALID  -j drop_invalid
>  $IPTABLES -A INPUT    -m state --state INVALID  -j drop_invalid
>  $IPTABLES -A FORWARD  -m state --state INVALID  -j drop_invalid
>  $IPTABLES -A drop_invalid  -j LOG  --log-level debug --log-prefix "RUL=
E -1 -- DENY "
>  $IPTABLES -A drop_invalid  -j DROP
>=20
> I think it could have something to do with the ACK and SYN flags. It se=
ems to me the kernel doesn't recognise this packet as part of an establis=
hed connection.
> Anyone with an explaination here or someone that shows me my nescience?
>=20
> Thanks
> Lars
>=20


--=20
                            Informationstechnologie
Berlin-Brandenburgische Akademie der Wissenschaften
J=C3=A4gerstrasse 22-23                     10117 Berlin
Tel.: +49 30 20370-352           http://www.bbaw.de

