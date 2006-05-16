From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: iptables and pop3 lockup
Date: Tue, 16 May 2006 12:26:30 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE582901676D7@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: Bowie Bailey <Bowie_Bailey@BUC.com>, "Netfilter List (E-mail)" <netfilter@lists.netfilter.org>

From what I am seeing below something is still batching DPT 110.  I have
seen this happen on some machines that do not have kernel modules loaded
or available.  Case in point, I have a virtual server we lease for a
project that is based on Fedora Core 2 and it has all of the modules
statically loaded.  But connection tracking does not work so adding
reject always causes a failure.

May 16 14:50:29 bnofmail kernel: FIREWALL: IN=3Deth0 OUT=3D
SRC=3D70.156.232.189 DST=3D172.16.17.169 LEN=3D52 TOS=3D0x00 PREC=3D0x00 =
TTL=3D110
ID=3D23735 DF PROTO=3DTCP SPT=3D1867 DPT=3D110 WINDOW=3D8280 RES=3D0x00 =
ACK URGP=3D0

Can you do two things; send us the output of lsmod and also the original
rules /etc/sysconfig/iptables instead of the iptables -L command. =20


> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org [mailto:netfilter-
> bounces@lists.netfilter.org] On Behalf Of Bowie Bailey
> Sent: Tuesday, May 16, 2006 12:13 PM
> To: Netfilter List (E-mail)
> Subject: RE: iptables and pop3 lockup
>=20
> It seems like iptables is losing the connection between the packets
> and the open connection.
>=20
> --
> Bowie


