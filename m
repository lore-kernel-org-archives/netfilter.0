From: "ihira" <ihira@rain.amath.nchu.edu.tw>
Subject: A problem of libiptc !!
Date: Wed, 9 Apr 2003 14:41:00 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000e01c2fe62$fbc50b40$7d08788c@ihira>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000B_01C2FEA6.09DA8FA0"
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
To: netfilter <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_000B_01C2FEA6.09DA8FA0
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: quoted-printable

Dear all :

I have a proble about using libiptc function "iptc_append_entry".
When use this function, we should pass an argument *ipt_enrty.
This argument include the IP header information!
But where we pass the other information like tcp port to the function =
for appending a rule to netfilter?

I hope somebody can give me an example code for adding a rule to =
netfilter !

I am sorry about my poor English and thank for everyone spending time =
and pations to read my letter!
Good luck for everyone and everyone's family 
------=_NextPart_000_000B_01C2FEA6.09DA8FA0
Content-Type: text/html;
	charset="big5"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Dbig5">
<META content=3D"MSHTML 6.00.2800.1141" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT size=3D2>Dear all :</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>I have a proble about using libiptc function=20
"iptc_append_entry".</FONT></DIV>
<DIV><FONT size=3D2>When use this function, we should pass an argument=20
*ipt_enrty.</FONT></DIV>
<DIV><FONT size=3D2>This argument include the IP header =
information!</FONT></DIV>
<DIV><FONT size=3D2>But where we pass the other information like tcp =
port to the=20
function for appending a rule to netfilter?</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>I hope somebody can give me an example code for =
adding a rule=20
to netfilter !</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV>
<DIV><FONT size=3D2>I am sorry about my poor English and thank =
for&nbsp;everyone=20
spending time and pations to read my letter!</FONT></DIV>
<DIV><FONT size=3D2>Good&nbsp;luck for&nbsp;everyone and&nbsp;everyone's =

family</FONT>&nbsp;</DIV></DIV></BODY></HTML>

------=_NextPart_000_000B_01C2FEA6.09DA8FA0--


