From: "andy" <anci@centrin.net.id>
Subject: kernel compile error after patch-o-matic 20040401
Date: Fri, 2 Apr 2004 14:05:56 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000301c41880$f1f7dcd0$1500a8c0@itasam>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0004_01C418BB.9E56B4D0"
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



------=_NextPart_000_0004_01C418BB.9E56B4D0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

I'm using 2.4.25
Here is the err msg :
 
ipt_connlimit.c: In function `init':
ipt_connlimit.c:219: error: `ip_conntrack_module' undeclared (first use
in this function)
ipt_connlimit.c:219: error: (Each undeclared identifier is reported only
once
ipt_connlimit.c:219: error: for each function it appears in.)
ipt_connlimit.c:220: warning: value computed is not used
ipt_connlimit.c: In function `fini':
ipt_connlimit.c:227: error: `ip_conntrack_module' undeclared (first use
in this function)
ipt_connlimit.c:228: warning: value computed is not used
make[2]: *** [ipt_connlimit.o] Error 1
make[2]: Leaving directory `/usr/src/linux-2.4.25/net/ipv4/netfilter'
make[1]: *** [_modsubdir_ipv4/netfilter] Error 2
make[1]: Leaving directory `/usr/src/linux-2.4.25/net'
make: *** [_mod_net] Error 2

Any clue ?
Thanks
Andy
 
 

------=_NextPart_000_0004_01C418BB.9E56B4D0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<TITLE>Message</TITLE>

<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D375325906-02042004>I'm =
using=20
2.4.25</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D375325906-02042004>Here =
is the&nbsp;err=20
msg :</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D375325906-02042004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>ipt_connlimit.c: In function=20
`init':<BR>ipt_connlimit.c:219: error: `ip_conntrack_module' undeclared =
(first=20
use in this function)<BR>ipt_connlimit.c:219: error: (Each undeclared =
identifier=20
is reported only once<BR>ipt_connlimit.c:219: error: for each function =
it=20
appears in.)<BR>ipt_connlimit.c:220: warning: value computed is not=20
used<BR>ipt_connlimit.c: In function `fini':<BR>ipt_connlimit.c:227: =
error:=20
`ip_conntrack_module' undeclared (first use in this=20
function)<BR>ipt_connlimit.c:228: warning: value computed is not=20
used<BR>make[2]: *** [ipt_connlimit.o] Error 1<BR>make[2]: Leaving =
directory=20
`/usr/src/linux-2.4.25/net/ipv4/netfilter'<BR>make[1]: ***=20
[_modsubdir_ipv4/netfilter] Error 2<BR>make[1]: Leaving directory=20
`/usr/src/linux-2.4.25/net'<BR>make: *** [_mod_net] Error =
2<BR></FONT></DIV>
<DIV><FONT><SPAN class=3D375325906-02042004><FONT face=3DArial =
size=3D2>Any clue=20
?</FONT></SPAN></FONT></DIV>
<DIV><FONT><SPAN class=3D375325906-02042004><FONT face=3DArial=20
size=3D2>Thanks</FONT></SPAN></FONT></DIV>
<DIV><FONT><SPAN class=3D375325906-02042004><FONT face=3DArial=20
size=3D2>Andy</FONT></SPAN></DIV></FONT>
<DIV align=3Dleft><SPAN=20
style=3D"FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Trebuchet =
MS'"><SPAN=20
style=3D"FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Trebuchet =
MS'"><SPAN=20
style=3D"FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Trebuchet =
MS'"></SPAN></SPAN></SPAN></DIV>
<DIV align=3Dleft><SPAN=20
style=3D"FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Trebuchet =
MS'"><FONT=20
face=3DArial size=3D2><SPAN=20
style=3D"FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Trebuchet =
MS'"></SPAN></FONT></SPAN></DIV>
<DIV align=3Dleft><SPAN=20
style=3D"FONT-SIZE: 12pt; COLOR: black; FONT-FAMILY: 'Trebuchet =
MS'"><FONT=20
face=3DArial size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0004_01C418BB.9E56B4D0--


