From: Kurt Tragant <k.tragant@firemail.de>
Subject: strange log entries concerning mail server
Date: Thu, 13 Feb 2003 18:03:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045155808018141@lycos-europe.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_NextPart_Lycos_0181411045155808_ID"
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
To: netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--=_NextPart_Lycos_0181411045155808_ID
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello list,

I have some strange entries in my firewall log concerning our mailserver. Every
day there are numerous entries with packets coming from source ports 850-910 to
a very high destination port. An excerpt, you see below. x.y.z.[0-9]* is the
host outside, a.b.c.d is our mailserver (to protect the innocent ;-)).

Feb 13 08:29:26 localhost kernel: IN=eth0 OUT=eth1 SRC=x.y.z.83 DST=a.b.c.d
LEN=143 TOS=0x00 PREC=0x00 TTL=55 ID=8196 DF PROTO=TCP SPT=859 DPT=56926
WINDOW=24616 RES=0x00 ACK PSH FIN URGP=0
Feb 13 13:32:36 localhost kernel: IN=eth0 OUT=eth1 SRC=x.y.z.83 DST=a.b.c.d
LEN=84 TOS=0x00 PREC=0x00 TTL=55 ID=45926 DF PROTO=TCP SPT=902 DPT=57334
WINDOW=24616 RES=0x00 ACK PSH FIN URGP=0
Feb 13 13:32:45 localhost kernel: IN=eth0 OUT=eth1 SRC=x.y.z.83 DST=a.b.c.d
LEN=84 TOS=0x00 PREC=0x00 TTL=55 ID=45951 DF PROTO=TCP SPT=902 DPT=57334
WINDOW=24616 RES=0x00 ACK PSH FIN URGP=0

For an answer I thank you in advance.

Regards
Kurt Tragant

__________________________________________________________________
Arcor-DSL Flatrate - jetzt kostenlos einsteigen und bis zu 76,18 Euro sparen!
Arcor-DSL gibt es jetzt auch mit bis zu 1500 Mbit/s Downstream! http://www.angebot.arcor.net/cgi-bin/angebot.cgi?key=b13e92247022


--=_NextPart_Lycos_0181411045155808_ID--


