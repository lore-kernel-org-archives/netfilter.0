From: Alexis <alexis@attla.net.ar>
Subject: Re: Strange entries in /var/log/messages
Date: Mon, 01 Mar 2004 09:29:44 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078144183.1709.6.camel@pepelui.baicom>
References: <1078144018.13370.20.camel@raylinux.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1078144018.13370.20.camel@raylinux.internal>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="macroman"
To: Ray Leach <raymondl@knowledgefactory.co.za>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

because a more specific static route?



On Mon, 2004-03-01 at 09:26, Ray Leach wrote:
> Hi All
>=20
> Can anyone explain why a machine on 10.0.0.10/24 would try and
> communicate with another machine 10.0.0.4/24 via a router?
> Mar  1 14:19:37 firefly kernel: DROP FORWARD INTERNAL: IN=3Deth2 OUT=3Det=
h2
> SRC=3D10.0.0.10 DST=3D10.0.0.4 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D127 =
ID=3D17562 DF
> PROTO=3DTCP SPT=3D4601 DPT=3D159 WINDOW=3D64240 RES=3D0x00 SYN URGP=3D0
> Mar  1 14:19:37 firefly kernel: DROP FORWARD INTERNAL: IN=3Deth2 OUT=3Det=
h2
> SRC=3D10.0.0.10 DST=3D10.0.0.4 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D127 =
ID=3D17563 DF
> PROTO=3DTCP SPT=3D4602 DPT=3D158 WINDOW=3D64240 RES=3D0x00 SYN URGP=3D0
> Mar  1 14:19:40 firefly kernel: DROP FORWARD INTERNAL: IN=3Deth2 OUT=3Det=
h2
> SRC=3D10.0.0.10 DST=3D10.0.0.4 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D127 =
ID=3D17593 DF
> PROTO=3DTCP SPT=3D4601 DPT=3D159 WINDOW=3D64240 RES=3D0x00 SYN URGP=3D0
>=20
> What is this? Port 158 and 159 apparently belong to
> BackupExec/NetBackup. 10.0.0.10 is our backup server, but why does it
> try and talk to 10.0.0.4 via the default router?
--=20
Tus problemas no se pueden resolver en el mismo
nivel mental que ten=C3=ADas cuando los creaste.=20
		Albert Einstein


