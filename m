From: "Matthew Donofrio" <mdonof2@pride.hofstra.edu>
Subject: How exactly does RELATED work in Connection Tracking?
Date: Mon, 21 Oct 2002 22:48:31 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000801c2798e$a7dcfd70$09c809c0@PENT4>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0005_01C27953.FAFDD1E0"
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

------=_NextPart_000_0005_01C27953.FAFDD1E0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi everyone.  Before I ask my question, I just want to alert everyone =
that I am newbie to Linux and the netfilter architecture.  OK, that =
being said, here's my question.  I'm trying to determine how exactly an =
incoming packet is determined to be RELATED to an existing connection in =
Connection Tracking.  For instance, how exactly does a TCP connection =
know that the packet is starting a new connection and this should be =
deemed RELATED?  What fields (for lack of a better word) are compared to =
come to this conclusion?  Thanks in advance.

-Matt

------=_NextPart_000_0005_01C27953.FAFDD1E0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2719.2200" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi everyone.&nbsp; Before I ask my =
question, I just=20
want to alert everyone that I am&nbsp;newbie&nbsp;to Linux and the =
netfilter=20
architecture.&nbsp; OK, that being said, here's my question.&nbsp; I'm =
trying to=20
determine how exactly an incoming packet is determined to be RELATED to =
an=20
existing connection in Connection Tracking.&nbsp;&nbsp;For instance, how =
exactly=20
does a TCP connection know that the packet&nbsp;is&nbsp;starting a=20
new&nbsp;connection and this should be deemed RELATED?&nbsp; What fields =
(for=20
lack of a better word) are compared to come to this conclusion?&nbsp; =
Thanks in=20
advance.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>-Matt</FONT></DIV></BODY></HTML>

------=_NextPart_000_0005_01C27953.FAFDD1E0--


