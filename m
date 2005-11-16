From: =?ISO-8859-15?Q?Sebasti=E3o_Ant=F4nio_Campos_=28GWA=29?=
	<sa.campos@datasulsp.com.br>
Subject: Hwo to applu this Re: pptp & NAT
Date: Wed, 16 Nov 2005 12:05:52 -0200
Message-ID: <007701c5eab6$e0451b60$0201010a@PIVT>
References: <436ADB4C.7070800@exse.net>
Reply-To: =?ISO-8859-15?Q?Sebasti=E3o_Ant=F4nio_Campos_=28GWA=29?=
	<sa.campos@datasulsp.com.br>
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
Content-Type: text/plain; format="flowed"; charset="iso-8859-1"; reply-type="response"
To: netfilter@lists.netfilter.org

Please!

Who could help me saying how to apply this patch??

https://bugzilla.netfilter.org/bugzilla/show_bug.cgi?id=3D397


Tks


----- Original Message -----=20
From: "Sebastian B=F6hm" <seb@exse.net>
To: <netfilter@lists.netfilter.org>
Sent: Friday, November 04, 2005 1:53 AM
Subject: pptp & NAT


> Hi,
>
> i finally got pptp and NAT working with the patch for bug #397=20
> <https://bugzilla.netfilter.org/bugzilla/show_bug.cgi?id=3D397>.
>
> Two questions left:
>
> - sometimes (every 10th connection attempt or so) the connections fails=20
> with "GRE: read(fd=3D5,buffer=3D8056720,len=3D8260) from network failed: =
status=20
> =3D -1 error =3D Protocol
> not available" reading in the server logs. I use windows clients with=20
> linux server. somewhere I read that I should load ip_gre on the firewall =

> or block a specific icmp packet, is that correct ? (I dont like to block =

> icmp, icmp is there for reason)
>
> - I am unable to estabish two pptp connections from one client, I can=20
> connect to one pptp server and I can connect to a second pptp server, but=
=20
> the second connection never accepts any traffic, when I stop the first=20
> connection, the second connection begins to work. Is this a bug or a know=
n=20
> missing feature ?
>
>
> Thank you very much !
>
> /sebastian
>
>=20


