From: "HCLFM" <hclfm@pricol.co.in>
Subject: DNAT problem
Date: Tue, 19 Nov 2002 13:37:43 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000701c28fa2$bcbef3e0$0402a8c0@ftp.pricol.co.in>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0004_01C28FD0.D66DBA00"
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

This is a multi-part message in MIME format.

------=_NextPart_000_0004_01C28FD0.D66DBA00
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset="iso-8859-1"

Hi,=20

I have Redhat Linux 7.1 Kernel version 2.4.2-2.=20
with iptables v1.2.7 .=20

This nat module is loaded with ip_tables module=20
iptable_nat 16160 0 (autoclean) [ipt_MASQUERADE]=20

I'm trying to setup DNAT for port forwarding as per iptables documents . =
I have ip forwarding enabled. I want port forward from external =
interface to a internal server .=20

But the setup is not working , I have tried with all possible styles of =
PREROUTING chain.=20
When I connect to external IP address with the particular port , I get a =
"connection refused" error. But the software port forwarders work =
perfectly. I feel that the problem lies in proxy ARP support of the =
kernel.=20

Any suggestions ?=20

regards,=20
U.SivaKumar=20

------=_NextPart_000_0004_01C28FD0.D66DBA00
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset="iso-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD W3 HTML//EN">
<HTML>
<HEAD>

<META content=3Dtext/html;charset=3Diso-8859-1 =
http-equiv=3DContent-Type>
<META content=3D'"MSHTML 4.72.3612.1706"' name=3DGENERATOR>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><SPAN class=3DText>Hi, <BR><BR>I have Redhat Linux 7.1 Kernel =
version=20
2.4.2-2. <BR>with iptables v1.2.7 . <BR><BR>This nat module is loaded =
with=20
ip_tables module <BR>iptable_nat 16160 0 (autoclean) [ipt_MASQUERADE]=20
<BR><BR>I'm trying to setup DNAT for port forwarding as per iptables =
documents .=20
I have ip forwarding enabled. I want port forward from external =
interface to a=20
internal server . <BR><BR>But the setup is not working , I have tried =
with all=20
possible styles of PREROUTING chain. <BR>When I connect to external IP =
address=20
with the particular port , I get a &quot;connection refused&quot; error. =
But the=20
software port forwarders work perfectly. I feel that the problem lies in =
proxy=20
ARP support of the kernel. <BR><BR>Any suggestions ? <BR><BR>regards,=20
<BR>U.SivaKumar </SPAN></DIV></BODY></HTML>

------=_NextPart_000_0004_01C28FD0.D66DBA00--


