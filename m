From: "Juliano Murlick" <jmurlick@sicredi.com.br>
Subject: REDIRECT
Date: Thu, 7 Aug 2003 16:22:38 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAArnhC4pMfykCnPZlPMhHrI8KAAAAQAAAALkWVxjffGUSqPxdjIXVxHAEAAAAA@sicredi.com.br>
Reply-To: <jmurlick@sicredi.com.br>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0089_01C35D00.1E4F4300"
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

------=_NextPart_000_0089_01C35D00.1E4F4300
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello All,
I wanna rediect all conections from 192.168.1.0/24 network to a 10.0.0.2
server on 80 port for a 172.65.15.11 server, also on  80 port,  for =
that, i
did some things:=20
=20
1 - All rules/iptables is on route 1;
2 - The route 2 don't filter any packet, just route, i can ping from a
client machine (192.168.1.25) to the both server and connect to a 80 =
port on
both server, and then, i don't have any problem of routing. When a read =
the
rules i can't connect any more on server 10.0.0.2, just direct to a =
server
172.16.15.11;
3 - My rules on iptables are:
=20
    iptables -A FORWARD -p tcp -s 192.168.1.0/24 --sport 1024:65535 -d
10.0.0.2--dport 80 -j ACCEPT
    iptables -A FORWARD -p tcp -s 192.168.1.0/24 --sport 1024:65535 -d
172.16.15.11--dport 80 -j ACCEPT
    iptables -t nat -A PREROUTING -p tcp --sport 1024:65535 -d 10.0.0.2
--dport 80 -j DNAT --to 172.16.15.11:80

=20
=20
                                                         (Server 1)
                                                        +----------+
      (Client)           ( Linux - Router 1)       |----| 10.0.0.2 |
 +---------------+    +-----------------------+    |    +----------+
 | 192.168.1.25  |----|192.168.1.1 / 10.0.0.1 |----|                     =

 +---------------+    +-----------------------+    |          (Route 2)
(Server 2)
                                                   |
+----------------------+    +--------------+
                                                   |----|10.0.0.3 /
172.16.15.1|----| 172.16.15.11 |
=20
+----------------------+    +--------------+
=20
=20
But it doesn't working ... anyone has any idea ???=20
=20
Thanks in advance!
=20
Att,
Juliano Murlick
=20

------=_NextPart_000_0089_01C35D00.1E4F4300
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">


<META content=3D"MSHTML 6.00.2800.1170" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3D"Courier New" size=3D2><SPAN =
class=3D687483316-07082003>Hello=20
All,</SPAN></FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2><SPAN =
class=3D687483316-07082003>I wanna=20
rediect all conections from 192.168.1.0/24&nbsp;network to=20
a&nbsp;10.0.0.2&nbsp;server on&nbsp;80 port for a&nbsp;172.65.15.11 =
server, also=20
on &nbsp;80 port,&nbsp; for that, i did&nbsp;some=20
things:&nbsp;</SPAN></FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2><SPAN=20
class=3D687483316-07082003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2><SPAN =
class=3D687483316-07082003>1 - All=20
rules/iptables is on route 1;</SPAN></FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2><SPAN =
class=3D687483316-07082003>2 - The=20
route 2 don't filter any packet, just route, i can ping from a client =
machine=20
(192.168.1.25) to the both server and connect to a 80 port on both =
server, and=20
then, i don't&nbsp;have any problem of routing. When a read the rules i =
can't=20
connect any more on server 10.0.0.2, just direct to a server=20
172.16.15.11;</SPAN></FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2><SPAN =
class=3D687483316-07082003>3 - My rules=20
on iptables are:</SPAN></FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2><SPAN=20
class=3D687483316-07082003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2><SPAN =
class=3D687483316-07082003><SPAN=20
class=3D687483316-07082003>&nbsp;&nbsp;&nbsp;&nbsp;iptables -A FORWARD =
-p tcp -s=20
192.168.1.0/24 --sport 1024:65535 -d 10.0.0.2--dport&nbsp;80 -j=20
ACCEPT</SPAN></SPAN></FONT></DIV>
<DIV><FONT size=3D2><SPAN class=3D687483316-07082003><FONT=20
face=3D"Courier New">&nbsp;&nbsp;&nbsp;&nbsp;iptables -A FORWARD -p tcp =
-s=20
192.168.1.0/24 --sport 1024:65535 -d 172.16.15.11--dport&nbsp;80 -j=20
ACCEPT<BR>&nbsp;&nbsp;&nbsp; iptables -t nat -A PREROUTING -p tcp =
--sport=20
1024:65535 -d 10.0.0.2 --dport&nbsp;80 -j DNAT --to=20
172.16.15.11:80<BR></FONT></DIV></SPAN></FONT>
<DIV><FONT face=3D"Courier New" size=3D2><SPAN=20
class=3D687483316-07082003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2><SPAN=20
class=3D687483316-07082003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2><FONT face=3D"Courier New"><SPAN=20
class=3D687483316-07082003>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
</SPAN>(Server 1)</FONT></FONT></DIV>
<DIV><SPAN class=3D687540614-07082003><FONT face=3D"Courier New" =
size=3D2>&nbsp;<SPAN=20
class=3D687540614-07082003>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;</SPAN>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
+----------+</FONT></SPAN></DIV>
<DIV><SPAN class=3D687540614-07082003><FONT size=3D2><FONT =
face=3D"Courier New"><SPAN=20
class=3D687540614-07082003><SPAN class=3D687540614-07082003>&nbsp;&nbsp; =

&nbsp;&nbsp;&nbsp;(Client)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPA=
N>&nbsp;&nbsp;&nbsp;&nbsp;(<SPAN=20
class=3D687483316-07082003> Linux - </SPAN>Router=20
1)&nbsp;</SPAN>&nbsp;&nbsp;&nbsp;<SPAN=20
class=3D687483316-07082003>&nbsp;</SPAN>&nbsp; |----| 10.0.0.2=20
|</FONT></FONT></SPAN></DIV>
<DIV><SPAN class=3D687540614-07082003><FONT face=3D"Courier New"><FONT =
size=3D2><SPAN=20
class=3D687540614-07082003><SPAN class=3D687540614-07082003><SPAN=20
class=3D687483316-07082003>&nbsp;</SPAN>+--------------<SPAN=20
class=3D687483316-07082003>-</SPAN>+</SPAN>&nbsp;&nbsp;&nbsp;&nbsp;+</SPA=
N>-----------------------+&nbsp;&nbsp;&nbsp;=20
|&nbsp;&nbsp;&nbsp;<SPAN class=3D687483316-07082003>=20
</SPAN>+----------+</FONT></FONT></SPAN></DIV>
<DIV><SPAN class=3D687540614-07082003><FONT face=3D"Courier New"><FONT =
size=3D2><SPAN=20
class=3D687540614-07082003><SPAN=20
class=3D687540614-07082003>&nbsp;|&nbsp;192.168.1.25<SPAN=20
class=3D687483316-07082003>&nbsp;&nbsp;</SPAN>|----</SPAN>|192.168.1.1</S=
PAN>&nbsp;/&nbsp;10.0.0.1&nbsp;|----|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
</FONT></FONT></SPAN></DIV>
<DIV><SPAN class=3D687540614-07082003><FONT face=3D"Courier New"><FONT =
size=3D2><SPAN=20
class=3D687540614-07082003><SPAN=20
class=3D687483316-07082003>&nbsp;</SPAN>+---------------+&nbsp;<SPAN=20
class=3D687540614-07082003>&nbsp;&nbsp;</SPAN>=20
</SPAN>+-----------------------+&nbsp;&nbsp;&nbsp;=20
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<SPAN=20
class=3D687483316-07082003>&nbsp;&nbsp; </SPAN>(Route=20
2)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
(Server 2)</FONT></FONT></SPAN></DIV>
<DIV><FONT face=3D"Courier New"><FONT size=3D2><SPAN=20
class=3D687540614-07082003>&nbsp;&nbsp;&nbsp;<SPAN=20
class=3D687540614-07082003>&nbsp;&nbsp;&nbsp;<SPAN=20
class=3D687540614-07082003>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;</SPAN>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
</SPAN>&nbsp;<SPAN=20
class=3D687483316-07082003> </SPAN>|&nbsp;<SPAN =
class=3D687483316-07082003>&nbsp;=20
</SPAN>&nbsp;+--------<SPAN=20
class=3D687483316-07082003>-</SPAN>-------------+&nbsp;&nbsp;&nbsp;=20
+--------------<SPAN=20
class=3D687483316-07082003>+</SPAN></SPAN></FONT></FONT></DIV>
<DIV><FONT><SPAN class=3D687540614-07082003><FONT face=3D"Courier =
New"><FONT=20
size=3D2><SPAN class=3D687540614-07082003>&nbsp;<SPAN =
class=3D687483316-07082003>=20
</SPAN>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<=
/SPAN>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<SPAN=20
class=3D687483316-07082003>&nbsp;&nbsp;&nbsp;&nbsp; =
</SPAN>|----|10.0.0.3&nbsp;/=20
172.16.15.1<SPAN class=3D687483316-07082003>|</SPAN>----|<SPAN=20
class=3D687483316-07082003> </SPAN>172.16.15.11<SPAN =
class=3D687483316-07082003>=20
</SPAN>|</FONT></FONT></SPAN></FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2><SPAN=20
class=3D687540614-07082003>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<SPAN=20
class=3D687540614-07082003>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;</SPAN>&nbsp;<SPAN=20
class=3D687540614-07082003>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<SPAN=20
class=3D687483316-07082003>&nbsp;</SPAN></SPAN>&nbsp;&nbsp;<SPAN=20
class=3D687483316-07082003> </SPAN>&nbsp;+------<SPAN=20
class=3D687483316-07082003>-</SPAN>---------------+&nbsp;&nbsp;&nbsp;=20
+--------------+</SPAN></FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2><SPAN =
class=3D687483316-07082003>But it=20
doesn't working ... anyone has any idea ??? </SPAN></FONT></DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><SPAN class=3D687483316-07082003><FONT face=3D"Courier New" =
size=3D2>Thanks in=20
advance!</FONT></SPAN></DIV>
<DIV><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3D"Courier New" size=3D2>A<SPAN=20
class=3D687483316-07082003>tt</SPAN>,<BR>Juliano Murlick</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0089_01C35D00.1E4F4300--


