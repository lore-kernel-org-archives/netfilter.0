From: "Piszcz, Justin" <jpiszcz@servervault.com>
Subject: RE: Strange broadcasts
Date: Mon, 18 Apr 2005 12:40:17 -0400
Message-ID: <F8B974E70BDE1745ABB27AF04788FA0025B9B4@mail1.dulles.sv.int>
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
To: Lukasz Hejnak <sziftgroup@wp.pl>, netfilter@lists.netfilter.org

Looks like netbios/windows sharing traffic to me.
Turn your other PC's off and/or disable NetBIOS / filesharing and see if
it persists.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Lukasz
Hejnak
Sent: Monday, April 18, 2005 12:23 PM
To: netfilter@lists.netfilter.org
Subject: Strange broadcasts

Hi
I've started receiving some strange broadcast information on my firewall
it starts in the logs around ten days ago and looks like this:

INPUT:IN=3Deth0 OUT=3D MAC=3D SRC=3D192.168.10.1 DST=3D192.168.10.255 =
LEN=3D240
TOS=3D0x00=20
PREC=3D0x00 TTL=3D64 ID=3D0 DF PROTO=3DUDP SPT=3D138 DPT=3D138 LEN=3D220 =

INPUT:IN=3Deth0 OUT=3D MAC=3D SRC=3D192.168.10.1 DST=3D192.168.10.255 =
LEN=3D234
TOS=3D0x00=20
PREC=3D0x00 TTL=3D64 ID=3D0 DF PROTO=3DUDP SPT=3D138 DPT=3D138 LEN=3D214 =


INPUT:IN=3Deth1 OUT=3D MAC=3D SRC=3D$MYEXTIP DST=3D$MYEXTNET.255 =
LEN=3D240 TOS=3D0x00=20
PREC=3D0x00 TTL=3D64 ID=3D0 DF PROTO=3DUDP SPT=3D138 DPT=3D138 LEN=3D220 =

INPUT:IN=3Deth1 OUT=3D MAC=3D SRC=3D$MYEXTIP DST=3D$MYEXTNET.255 =
LEN=3D234 TOS=3D0x00=20
PREC=3D0x00 TTL=3D64 ID=3D0 DF PROTO=3DUDP SPT=3D138 DPT=3D138 LEN=3D214 =


INPUT:IN=3Deth2 OUT=3D MAC=3D SRC=3D192.168.11.1 DST=3D192.168.11.255 =
LEN=3D240
TOS=3D0x00=20
PREC=3D0x00 TTL=3D64 ID=3D0 DF PROTO=3DUDP SPT=3D138 DPT=3D138 LEN=3D220 =

INPUT:IN=3Deth2 OUT=3D MAC=3D SRC=3D192.168.11.1 DST=3D192.168.11.255 =
LEN=3D234
TOS=3D0x00=20
PREC=3D0x00 TTL=3D64 ID=3D0 DF PROTO=3DUDP SPT=3D138 DPT=3D138 LEN=3D214 =


a few first occurences had SPT and DPT 137, and now it looks like the
above
happens about every 12 minutes, and I can't seem to see what's causing
this
the server is running only apache and exim
the eth1 is the internet, eth{0,2} are just two connections to two PCs
I've
got at home (had a spare nic and no cash for a hub ;)

anybody had a similar case?

--=20
with regards
Lukasz Hejnak
szift@wp.pl


