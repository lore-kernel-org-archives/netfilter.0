From: "Refayet Ullah" <shanto@pradeshta.net>
Subject: IPtables dropping packets for Valid Rule
Date: Mon, 21 Aug 2006 16:04:37 +0600 (BDT)
Message-ID: <53011.202.56.4.82.1156154677.squirrel@www.pradeshta.net>
Reply-To: shanto@pradeshta.net
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
Content-Type: text/plain; charset="windows-1252"
To: netfilter@lists.netfilter.org

Hi All:

We are using iptables-1.2.11-3.1.RHEL4 on CentOS 4.0. The firewall is use=
d
between two departments and forwards GSM application traffic (Prepaid
Recharging etc.). As there are too many rules, we are using FWBUILDER as
the GUI. The firewall is dropping packets for a valid rule. But
surprisingly, the packet drop is not regular. Most of the packets are
getting forwarded and some are dropped. At certain time, the packet drop
is increased a lot. Generally, the drop incident increases between 0700 =96
0800 hrs and 2330 =96 0030 hrs.

But, for traffic, that is an off-peak duration and firewall is also not
running any cron or other scheduled job. The logs are below:

Aug 20 12:19:54 sec-fw01 kernel: PASSED IN=3Deth2 OUT=3Dbond0 SRC=3D10.10=
.20.20
DST=3D192.168.20.20 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=3D62 ID=3D8587 DF=
 PROTO=3DTCP
SPT=3D49793 DPT=3D10010 SEQ=3D2962957157 ACK=3D0 WINDOW=3D49640 RES=3D0x0=
0 SYN URGP=3D0
OPT (020405B401010402)


Aug 20 12:19:42 sec-fw01 kernel: DROPPED  IN=3Deth2 OUT=3Dbond0
SRC=3D10.10.20.20 DST=3D192.168.20.20 LEN=3D48 TOS=3D0x00 PREC=3D0x00 TTL=
=3D62 ID=3D8486
DF PROTO=3DTCP
SPT=3D49995 DPT=3D10010 SEQ=3D3014985752 ACK=3D0 WINDOW=3D49640 RES=3D0x0=
0 SYN URGP=3D0
OPT (020405B401010402)

First one is the forwarded case and second one is the dropped case. The
Drop rule is the Default rule added at the bottom of all rules.

Anyone please advise.

Best Regards,
Refayet


