From: "Anthony R. Vallario" <avallario@tecmasters.com>
Subject: IPTABLES Difficulties
Date: Sun, 17 Aug 2003 18:06:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <008c01c36514$239b7dd0$0400a8c0@whynot>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0089_01C364EA.3AAB3710"
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

------=_NextPart_000_0089_01C364EA.3AAB3710
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

To whom it may concern;
            I have an iptables NAT box setup on Redhat 9.0. I recently =
added a box behind the firewall that will act as a web server. I didn't =
want to do a DMZ as money is tight. I used the following rules to get =
all outside requests on port 80 to the web server inside:

-A PREROUTING -p tcp -i eth0 -d $publicip --dport 80 -j DNAT =
--to-destination $internalip
-A PREROUTING -p tcp -i eth0 -d $publicip --dport 443 -j DNAT =
--to-destination $internalip

My only problem is when somebody behind the firewall wants to access =
this webserver, it doesn't work. I don't want to have to type in the =
internal ip. I don't want to install an internal dns server. I would =
like my workstations to be able to type in the FQDN for the webserver =
and it actually work. If NAT works, why doesn't it go out the firewall =
and turn right back around and go to the webserver?

Anthony R. Vallario    
------=_NextPart_000_0089_01C364EA.3AAB3710
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1170" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>To whom it may concern;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; I have an iptables NAT box setup on Redhat 9.0. I =
recently=20
added a box behind the firewall that will act as a web server. I didn't =
want to=20
do a DMZ as money is tight. I used the following rules to get all =
outside=20
requests on port 80 to the web server inside:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>-A PREROUTING -p tcp -i eth0 -d =
$publicip --dport=20
80 -j DNAT --to-destination $internalip<BR>-A PREROUTING -p tcp -i eth0 =
-d=20
$publicip --dport 443 -j DNAT --to-destination $internalip</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>My only problem is when somebody behind =
the=20
firewall wants to access this webserver, it doesn't work. I don't want =
to have=20
to type in the internal ip. I don't want to install an internal dns =
server. I=20
would like my workstations to be able to type in the FQDN for the =
webserver and=20
it actually work. If NAT works, why doesn't it go out the firewall and =
turn=20
right back around and go to the webserver?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Anthony R. Vallario&nbsp;&nbsp;&nbsp;=20
</DIV></FONT></FONT></DIV></BODY></HTML>

------=_NextPart_000_0089_01C364EA.3AAB3710--



