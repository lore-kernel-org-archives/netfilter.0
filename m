From: "Juliano Murlick" <jmurlick@sicredi.com.br>
Subject: source mac address
Date: Thu, 31 Jul 2003 17:02:32 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAArnhC4pMfykCnPZlPMhHrI8KAAAAQAAAA9QxKLSpdOESQ12+Zk6/CxgEAAAAA@sicredi.com.br>
Reply-To: <jmurlick@sicredi.com.br>
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
To: netfilter@lists.netfilter.org

How can i log the source mac address ? I'm logging every dropped packet,
my log is like it :=20

Jul 15 08:51:26 fwwan kernel: IPT: INPUT DROPPED IN=3Deth0 OUT=3D
MAC=3D00:00:00:00:00:00:00:00:8827:42:00:08:00 SRC=3DIP1 DST=3DIP2 =
LEN=3D60
TOS=3D0x00 PREC=3D0x00 TTL=3D63 ID=3D52070 DF PROTO=3DTCP SPT=3D43812 =
DPT=3D25
WINDOW=3D5840 RES=3D0x00 SYN URGP=3D0

that mac is a destin address, i wanna log the source, is it possible ?

Thanks in advance,
Att,
Juliano Murlick

=20

=20

=20

=20
=20

ATs,
Juliano Murlick
SICREDI Servi=E7os - Tecnologia
jmurlick@sicredi.com.br
<mailto:jmurlick@sicredi.com.br(51> (51) 3358-4977 / (51) 9951-3888

=20


---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.504 / Virus Database: 302 - Release Date: 24/7/2003




