From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: UnhandledForward
Date: Thu, 16 Oct 2003 11:45:28 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF52E3741@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Czezz <czezz@o2.pl>, netfilter@lists.netfilter.org

Seems to be for a game called soldat (http://www.soldat.prv.pl/)
Reference: =
http://www.udpsoft.com/forum/printpage.cgi?forum=3D1&topic=3D840


-----Original Message-----
From: Czezz [mailto:czezz@o2.pl]=20
Sent: Thursday, October 16, 2003 11:41 AM
To: netfilter@lists.netfilter.org
Subject: UnhandledForward

Hello everyone,

here is my question:
I added this  line to my rc.firewall

   iptables -A FORWARD -i eth1 -j LOG --log-prefix
"IPT:UnhandledForward:"

to check why I cant connect to some server...and in syslog it received
me this:
   Oct 16 19:05:59 slack kernel: IPT:UnhandledForward:IN=3Deth1 =
OUT=3Dppp0
SRC=3D192.168.1.251 DST=3D62.111.129.3 LEN=3D36 TOS=3D0x00 PREC=3D0x00 =
TTL=3D127
ID=3D17885 PROTO=3DUDP SPT=3D23083 DPT=3D13073 LEN=3D16
   Oct 16 19:07:44 slack kernel: IPT:UnhandledForward:IN=3Deth1 =
OUT=3Dppp0
SRC=3D192.168.1.251 DST=3D62.111.129.3 LEN=3D36 TOS=3D0x00 PREC=3D0x00 =
TTL=3D127
ID=3D18107 PROTO=3DUDP SPT=3D23083 DPT=3D13073 LEN=3D16
   Oct 16 19:10:27 slack kernel: IPT:UnhandledForward:IN=3Deth1 =
OUT=3Dppp0
SRC=3D192.168.1.251 DST=3D62.111.129.3 LEN=3D36 TOS=3D0x00 PREC=3D0x00 =
TTL=3D127
ID=3D18888 PROTO=3DUDP SPT=3D23083 DPT=3D13073 LEN=3D16
   Oct 16 19:11:08 slack kernel: IPT:UnhandledForward:IN=3Deth1 =
OUT=3Dppp0
SRC=3D192.168.1.251 DST=3D62.111.129.3 LEN=3D36 TOS=3D0x00 PREC=3D0x00 =
TTL=3D127
ID=3D19078 PROTO=3DUDP SPT=3D23083 DPT=3D13073 LEN=3D16

Does anyone can help my to analize this lines above and maybe give my
some hint?
  =20
 --
Best regards,



