From: "Cedric Blancher" <blancher@cartel-securite.fr>
Subject: Re: Strange MAC address
Date: Mon, 19 May 2003 21:11:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003c01c31e3a$84901f40$0e0aa8c0@Nussele>
References: <Pine.OSF.3.91.1030518215213.1714B-100000@delta.ntu.ac.sg>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: LI GUOJIE <p1436630@delta.ntu.ac.sg>
Cc: netfilter@lists.netfilter.org

----- Original Message -----=20
From: "LI GUOJIE" <p1436630@delta.ntu.ac.sg>
To: <netfilter@lists.netfilter.org>
Sent: Sunday, May 18, 2003 3:59 PM
Subject: Strange MAC address


> I am trying to use '-m mac' for match. Client machine mac is:
> 00:00:E4:95:6B:48 . However, i saw the following log on the server:
> (using log-ip-options)
> IPTABLES INPUT ILLEGAL: IN=3Deth0 OUT=3D
> MAC=3D00:a0:cc:28:56:c4:00:09:b6:13:9a:7c:08:00 SRC=3D155.66.220.73
> DST=3D173.23.214.22 LEN=3D88 TOS=3D0x00 PREC=3D0x00 TTL=3D124 ID=3D4708 D=
F PROTO=3DTCP
> SPT=3D1292 DPT=3D22 WINDOW=3D64164 RES=3D0x00 ACK PSH URGP=3D0
> The MAC display in log is really strange(the length is much longer), can
any
> one explain?

What is logged is not MAC _address_, but the whole ethernet _header_ (MAC
layer). Thus, you can read it as follows :

    DST MAC : 00:a0:cc:28:56:c4
    SRC MAC : 00:09:b6:13:9a:7c
    PROTO : 08:00 (IP)

My 0.02?

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curit=
=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE



