From: "Nauman Malik" <naumanm@khi.wol.net.pk>
Subject: Connection Limit
Date: Wed, 24 Sep 2003 15:11:57 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309241511570875.15D98FA9@smtp.khi.wol.net.pk>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=====_10643983176334=_"
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

--=====_10643983176334=_
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I have added module for conn-limit through iptables. But when I run this=
 command, I got error of No Chain/target/match . Is the following command=
 correct or am I missing something?



# /sbin/iptables -A INPUT -p tcp --syn --dport http -m iplimit=
 --iplimit-above 4 -j REJECT
iptables: No chain/target/match by that name


Thanx.


--=====_10643983176334=_
Content-Type: text/html; charset="us-ascii"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content="text/html; charset=iso-8859-1" http-equiv=Content-Type>
<META content="MSHTML 5.00.3700.6699" name=GENERATOR></HEAD>
<BODY bgColor=#ffffff style="FONT-FAMILY: Arial" text=#000000>
<DIV><FONT size=2>Hi,</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT size=2>I have added module for conn-limit through iptables. But when 
I run this command, I got error of No Chain/target/match . Is the following 
command correct or am I missing something?</FONT></DIV>
<DIV><FONT size=2></FONT>&nbsp;</DIV>
<DIV><FONT size=2></FONT>&nbsp;</DIV>
<DIV><FONT size=2></FONT>&nbsp;</DIV>
<DIV><FONT size=2># /sbin/iptables -A INPUT -p tcp --syn --dport http -m iplimit 
--iplimit-above 4 -j REJECT<BR>iptables: No chain/target/match by that 
name</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanx.</DIV></BODY></HTML>


--=====_10643983176334=_--


