From: "Mohammad Shakir" <shakirz1@hotmail.com>
Subject: Need Help
Date: Fri, 27 Sep 2002 11:08:47 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F270kuutSgcOrBLSAQV00000096@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.samba.org

<html><div style=3D'background-color:'><DIV>Dear Russell,</DIV>
<DIV>&nbsp;</DIV>
<DIV>I have this setup in ipchains and now I want to convert in iptables. p=
lz help me. <BR></DIV>
<DIV>
<DIV>/sbin/ipchains&nbsp; -F forward&nbsp;&nbsp; </DIV>
<DIV>/sbin/ipchains&nbsp; -F input&nbsp;&nbsp;&nbsp;&nbsp; </DIV>
<DIV>/sbin/ipchains&nbsp; -F output&nbsp;&nbsp;&nbsp; </DIV>
<DIV>&nbsp;</DIV></DIV>
<DIV>/sbin/ipchains&nbsp; -P forward&nbsp;&nbsp; ACCEPT<BR>/sbin/ipchains&n=
bsp; -P input&nbsp;&nbsp;&nbsp;&nbsp; ACCEPT<BR>/sbin/ipchains&nbsp; -P out=
put&nbsp;&nbsp;&nbsp; ACCEPT</DIV>
<DIV><BR>echo "1" &gt; /proc/sys/net/ipv4/ip_forward</DIV>
<DIV>&nbsp;</DIV>
<DIV># for transparent proxy<BR>/sbin/ipchains -A input -j REDIRECT 8080 -p=
 tcp -s 0.0.0.0/0 -d 0.0.0.0/0 80</DIV>
<DIV># for direct connection excluding HTTP<BR>/sbin/ipchains&nbsp; -A forw=
ard -j -p all -s 0.0.0.0/0 -d 0.0.0.0/0</DIV>
<DIV>&nbsp;</DIV>
<DIV>It was my old setup in RedHat Linux 7.0Rel.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Now I have installed new verions of RedHat Linux 7.2, with Kernel 2.4.=
7-10 and iptables version 1.2.3.</DIV>
<DIV>&nbsp;</DIV>
<DIV><BR>thanks in advance </DIV>
<DIV>&nbsp;</DIV>
<DIV>shakir <BR></DIV></div><br clear=3Dall><hr>Join the world=92s largest =
e-mail service with MSN Hotmail. <a href=3D'http://g.msn.com/1HM1ENXX/c157?=
?PI=3D31901'>Click Here</a><br></html>

