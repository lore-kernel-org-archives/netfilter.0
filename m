From: "Tarun Bhalla" <tarun.bhalla@wipro.com>
Subject: Usage of netfilters..
Date: Sun, 2 Mar 2003 17:03:25 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <023c01c2e120$b243b520$8b03750a@TarunB>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPartTM-000-356610cd-9b0a-459e-aa16-b5d8ea5dd6f6"
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

------=_NextPartTM-000-356610cd-9b0a-459e-aa16-b5d8ea5dd6f6
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0239_01C2E0DD.A3B04E30"

------=_NextPart_000_0239_01C2E0DD.A3B04E30
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

hi=20

Can I capture the packets just after it has passed through
the ethernet layer. I mean I want to capture the packet before
it enters IP layer (so cant' use NF_IP_PRE_ROUTING)..=20

If yes please tell me what all hooks can be applied ??=20

cheers :)
Tarun B


------=_NextPart_000_0239_01C2E0DD.A3B04E30
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4134.600" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>hi </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Can I capture the packets just after it =
has passed=20
through</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>the ethernet layer. I mean I want to =
capture the=20
packet before</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>it enters IP layer (so cant' use=20
NF_IP_PRE_ROUTING).. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>If yes please tell me what all hooks =
can be applied=20
?? </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>cheers :)<BR>Tarun =
B<BR></FONT></DIV></BODY></HTML>

------=_NextPart_000_0239_01C2E0DD.A3B04E30--



------=_NextPartTM-000-356610cd-9b0a-459e-aa16-b5d8ea5dd6f6
Content-Type: text/plain;
	name="Wipro_Disclaimer.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="Wipro_Disclaimer.txt"

**************************Disclaimer**************************************************    
 
 Information contained in this E-MAIL being proprietary to Wipro Limited is 'privileged' 
and 'confidential' and intended for use only by the individual or entity to which it is 
addressed. You are notified that any use, copying or dissemination of the information 
contained in the E-MAIL in any manner whatsoever is strictly prohibited.

****************************************************************************************

------=_NextPartTM-000-356610cd-9b0a-459e-aa16-b5d8ea5dd6f6--


