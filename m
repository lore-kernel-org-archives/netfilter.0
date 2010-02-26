From: MontyRee <chulmin2@hotmail.com>
Subject: iptables use only one cpu core.
Date: Fri, 26 Feb 2010 04:55:29 +0000
Message-ID: <BLU149-W31E11A0A84D21AC4C9F3B7853F0@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="euc-kr"
To: netfilter@vger.kernel.org


Hi all.
=20
=20
I did NAT performance test at the iptables enabled system.=20
=20
When I send lots of queries to the iptables enabled NAT system,=20
I found that NAT system use only 1 cpu core even this system has 4 core=
s.
=20
So the (TPS)performance result was not good.=20
=20
Anyone who knows about that?=20
or is there any solution to distribute the core usage?
=20
=20
=20
Thanks.
  		 	   		 =20
_________________________________________________________________
=C0=A9=B0=C9=C0=C7 =C1=C2=C3=E6=BF=EC=B5=B9 UCC =C1=A6=C0=DB=B1=E2, =C1=
=F6=B1=DD =C8=AE=C0=CE=C7=D8=BA=B8=BC=BC=BF=E4!
http://windowslive.msn.co.kr/im/main/mainCoverDetail.asp?BbsCode=3Dbbs0=
1&Seq=3D4349
