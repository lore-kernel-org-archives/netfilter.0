From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Help debugging iptables firewall....
Date: Tue, 25 Jan 2005 10:31:24 -0800
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F019920@pxtvjoexd01.pxt.primeexalia.com>
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
To: Greg Cope <gregcope@gmail.com>, netfilter@lists.netfilter.org

My Oracle guy said that you need to open up either the high ports
(1024+) for communication or set Oracle to use a shared port.  He
mentioned that it works kind of like FTP in that the client established
a connection and then the server will open another reserve port back to
the client for the continued connection.  He said setting the share_port
setting (which he didn't know of the top of his head -- damn him) should
solve the problem.

Hope that helps.

Gary


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Greg Cope
Sent: Tuesday, January 25, 2005 10:18 AM
To: netfilter@lists.netfilter.org
Subject: Re: Help debugging iptables firewall....

Removing my original rule I get logged:


Jan 25 18:13:19 gateway kernel: Oracle 1521 [tcp] before: IN=3Deth1
OUT=3Deth2 SRC=3D192.168.254.3 DST=3D192.168.0.5 LEN=3D60 TOS=3D0x00 =
PREC=3D0x00
TTL=3D63 ID=3D29681 DF PROTO=3DTCP SPT=3D32941 DPT=3D1521 WINDOW=3D5840 =
RES=3D0x00
SYN URGP=3D0

Jan 25 18:13:19 gateway kernel: Oracle 1521 [tcp] after: IN=3Deth1
OUT=3Deth2 SRC=3D192.168.254.3 DST=3D192.168.0.5 LEN=3D60 TOS=3D0x00 =
PREC=3D0x00
TTL=3D63 ID=3D29681 DF PROTO=3DTCP SPT=3D32941 DPT=3D1521 WINDOW=3D5840 =
RES=3D0x00
SYN URGP=3D0
Jan 25 18:13:19 gateway kernel: FORWARD DENY: IN=3Deth1 OUT=3Deth2
SRC=3D192.168.254.3 DST=3D192.168.0.5 LEN=3D60 TOS=3D0x00 PREC=3D0x00 =
TTL=3D63
ID=3D29681 DF PROTO=3DTCP SPT=3D32941 DPT=3D1521 WINDOW=3D5840 =
RES=3D0x00 SYN
URGP=3D0

Greg




On Tue, 25 Jan 2005 10:09:43 -0800, Gary W. Smith <gary@primeexalia.com>
wrote:
> Crap, I had a typo.  It should have been -i, not -o for the lan
> interface
>=20
> $IPTABLES -A FORWARD -o $DMZ_IFACE -i $LAN_IFACE -j ACCEPT
>=20
> Try that and let us know.
>=20
> Gary Wayne Smith
>=20
>=20
> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Greg Cope
> Sent: Tuesday, January 25, 2005 9:59 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: Help debugging iptables firewall....
>=20
> I think we are getting there:
>=20
> The one you suggested gives an error:
>=20
> Starting firewall: ^[[Aiptables v1.2.9: multiple -o flags not allowed
>=20
> Looking at tcpdump on a few machines it looks like the packets are
> getting through - but nothing gets sent:
>=20
> 17:57:18.168655 ex.e-dba.net.32931 > trotter.e-dba.net.1521: S
> 965495617:965495617(0) win 5840 <mss 1460,sackOK,timestamp 2026024
> 0,nop,wscale 0> (DF) [tos 0x10]
>=20
> And then nothing else - sadly I am not a tcpdump expert.....
>=20
> Any clues?  I am at a loss as to why this was working and now it does
> not.....
>=20
> Greg
>=20
>


