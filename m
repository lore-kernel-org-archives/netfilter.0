From: "Sylvain BERTRAND" <jowy@2001-space-odyssey.net>
Subject: transparent IRC proxy: doesnt work
Date: Thu, 23 Oct 2003 17:03:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001901c39976$d2d57120$6500a8c0@SYFLO>
References: <9FEBBE3B5C27D311B0B90050041E59B00439EFBD@ziggy.prideindustries.com>
Reply-To: "Sylvain BERTRAND" <jowy@2001-space-odyssey.net>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0016_01C39987.964B2E50"
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

------=_NextPart_000_0016_01C39987.964B2E50
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

My apologiesHi everyone,

I have a router/firewall on a public /24. I installed tircproxy in order =
to have a transparent proxy (to filter DCC send requests).
Here are the lines related to IRC in my rc.firewall:

${IPTABLES} -t nat -A PREROUTING -s ${INTERNAL_LAN} -p tcp --dport =
6660:6669 -j REDIRECT --to-port 7666
${IPTABLES} -t nat -A PREROUTING -s ${INTERNAL_LAN} -p udp --dport =
6660:6669 -j REDIRECT --to-port 7666

and here's the command I use to launch the proxy:

tircproxy -s 7666 -b ${MY_IP} -S -K -R -I

There are several strange things:
- many connexions between my internal lan and external servers on port =
6667 still exist... they shouldnt since I redirected the 6667 trafic?
- many connexions between my router on ports >1024 and.... my router's =
port 7666! I was expecting local machines to connect on 7666, but not =
the router itself?

IRC seems to be working for clients, but I think it does through direct =
connexions...=20
Can anyone help me about that?


Sylvain
------=_NextPart_000_0016_01C39987.964B2E50
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE>My apologies</TITLE>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1264" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi everyone,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have a router/firewall on a public =
/24. I=20
installed tircproxy in order to have a transparent proxy (to filter DCC =
send=20
requests).</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Here are the lines related to IRC in my =

rc.firewall:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>${IPTABLES} -t nat -A PREROUTING -s =
${INTERNAL_LAN}=20
-p tcp --dport 6660:6669 -j REDIRECT --to-port 7666<BR>${IPTABLES} -t =
nat -A=20
PREROUTING -s ${INTERNAL_LAN} -p udp --dport 6660:6669 -j REDIRECT =
--to-port=20
7666</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>and here's the command I use to launch =
the=20
proxy:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>tircproxy -s 7666 -b ${MY_IP} -S -K -R=20
-I</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>There are several strange =
things:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>- many connexions between my internal =
lan and=20
external servers on port 6667 still exist... they shouldnt since I =
redirected=20
the 6667 trafic?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>- many connexions between my router on =
ports=20
&gt;1024 and.... my router's port 7666! I was expecting local machines =
to=20
connect on 7666, but not the router itself?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>IRC seems to be working for clients, =
but I think=20
it&nbsp;does through direct connexions... </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Can anyone help me about =
that?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Sylvain</FONT></DIV></BODY></HTML>

------=_NextPart_000_0016_01C39987.964B2E50--



