From: "Roberto Campos" <roberto@meuprovedor.com.br>
Subject: Internet Servers - DNAT/SNAT
Date: Sun, 9 Jun 2002 13:13:01 -0300
Sender: netfilter-admin@lists.samba.org
Message-ID: <001f01c20fd0$8aa72820$fb00a8c0@escritoriomundial.com.br>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0020_01C20FB7.6559F020"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_0020_01C20FB7.6559F020
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

 

I'm dealing with nat for the last 3 years but I have never tried to
SNAT/DNAT.

 

Now I do have to. I'm working on a new setup to our network and I need
some help here.

 

This is our setup:

 

                              200.200.200.200/29 (internet) 

                                              | 

                                Linux Box runnig RH 7.1

                                              |

                            192.168.0.0/24 (Internal network) ---------

 
|           ---------  DNS/SMTP/HTTP/POP Servers

 
switch ----|


 
--------  All the other machines on internal lan

 

I don't now if this is clear for you all, but this is what I need:

 

I do have a internal server that is our main server and we want it to be
behind the firewall using restricted addresses

We are using SNAT/DNAT to translate the ports 25, 110, 80, 443 and 53
(UDP and TCP) to the internal IP of the server.

Some problems are occurring:

 

DNS is not being translated correctly and therefore a lot in been
dropped because SMTP is refusing to send emails (obviously) and etc.

 

Does anyone has a few rules that can be used to do this that can be
shared with us.

 

This would be really nice.

 

Thanks in advance.

 

Roberto Campos

_______________________________________________________________

Meu  Provedor Tecnologias e Informatica ltda.

Rua Camerino, 128 Gr. 302 - Centro

Rio de Janeiro - RJ - CEP 20080-010

Tel.: 21 - 25181011     Fax: 21 - 25181911

 


------=_NextPart_000_0020_01C20FB7.6559F020
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">


<meta name=3DGenerator content=3D"Microsoft Word 10 (filtered)">

<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:purple;
	text-decoration:underline;}
span.EstiloDeEmail17
	{font-family:Arial;
	color:windowtext;}
@page Section1
	{size:612.0pt 792.0pt;
	margin:70.85pt 3.0cm 70.85pt 3.0cm;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DPT-BR link=3Dblue vlink=3Dpurple>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>Hi,</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>I&#8217;m dealing with nat for the last 3 =
years but I
have never tried to SNAT/DNAT.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>Now I do have to. I&#8217;m working on a new =
setup to
our network and I need some help here.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>This is our setup:</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
200.200.200.200/29 (internet) </span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;
| </span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;Linux Box runnig RH 7.1</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;|</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
192.168.0.0/24 (Internal network) ---------</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
---------&nbsp;
DNS/SMTP/HTTP/POP Servers</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;switch
----|&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-=
-------&nbsp;
All the other machines on internal lan</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>I don&#8217;t now if this is clear for you =
all, but
this is what I need:</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>I do have a internal server that is our main =
server
and we want it to be behind the firewall using restricted =
addresses</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>We are using SNAT/DNAT to translate the ports =
25,
110, 80, 443 and 53 (UDP and TCP) to the internal IP of the =
server.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>Some problems are occurring:</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>DNS is not being translated correctly and =
therefore a
lot in been dropped because SMTP is refusing to send emails (obviously) =
and etc&#8230;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>Does anyone has a few rules that can be used =
to do
this that can be shared with us.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>This would be really nice.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>Thanks in advance.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DArial><span lang=3DEN-US =
style=3D'font-size:
10.0pt;font-family:Arial'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'>Roberto Campos</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'>_____________________________________________________=
__________</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'>Meu&nbsp; Provedor Tecnologias e Informatica =
ltda.</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'>Rua Camerino, 128 Gr. 302 - Centro</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'>Rio de Janeiro - RJ - CEP =
20080-010</span></font></p>

<p class=3DMsoNormal><font size=3D2 face=3DTahoma><span =
style=3D'font-size:10.0pt;
font-family:Tahoma'>Tel.: 21 -&nbsp;25181011&nbsp;&nbsp;&nbsp; =
&nbsp;Fax: 21 -
25181911</span></font></p>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span =
style=3D'font-size:
12.0pt'>&nbsp;</span></font></p>

</div>

</body>

</html>

------=_NextPart_000_0020_01C20FB7.6559F020--



