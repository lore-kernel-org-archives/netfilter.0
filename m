From: <hard__ware@hotmail.com>
Subject: Re: basics
Date: Mon, 28 Apr 2003 12:49:42 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law9-OE41FC1c0xJK5O000047e9@hotmail.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0013_01C30D84.A3572F70"
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
To: "lists.netfilter" <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0013_01C30D84.A3572F70
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

>1. If in my system runs only deamons that are above on the list, is =
this nessecery to
>  block unussed ports?
>2. Is it wise to block all ports above  REGISTERED PORT NUMBERS ( above
> 1000 port ), when in system runs http server that answer to client
>  from global net on this ports, and proxy server that answer to the
>  local clients on this ports ???

1.) For security reasons is better to only allow incoming (via WAN) on =
Registered Ports that are needed [ 0-1023 ]
so any ports not needed within this range either Block or Reject .

2.) Allot of services such as FTP Passive Mode Transfers require that =
you have Incoming Ports [1024-32768] about that
anyway Not Open but then not blocked or filtered either ... Thats were =
conntrack ESTABLISHED & RELATED rules come in.=20
 Established is where the conntracker has seen data already go both ways =
and if it has will do what you have set in its -j Target.
 Related takes care of the rest of the stuff that conntracker doesnt =
know how to handle, e.g, a incoming icmp packet=20
is checked to see weather it is 'Related' to another connection such as =
a ICMP message for a Host Unreachable or  something like that. It also =
takes care of other helper such as FTP Transfer data that was related to =
a Ftp Connection=20
same for IRC and DCC Transfers ...         
------=_NextPart_000_0013_01C30D84.A3572F70
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1126" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>&gt;1. If in my system runs only deamons that are above on the =
list, is=20
this nessecery to<BR>&gt;&nbsp; block unussed ports?<BR>&gt;2. Is it =
wise to=20
block all ports above&nbsp; REGISTERED PORT NUMBERS ( above<BR>&gt; 1000 =
port ),=20
when in system runs http server that answer to client<BR>&gt;&nbsp; from =
global=20
net on this ports, and proxy server that answer to the<BR>&gt;&nbsp; =
local=20
clients on this ports ???</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>1.) For security reasons is better to =
only allow=20
incoming (via WAN) on Registered Ports that are needed&nbsp;[ 0-1023=20
]</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>so any ports not needed within this=20
range&nbsp;either Block or Reject .</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>2.) Allot of services such as FTP =
Passive Mode=20
Transfers require that&nbsp;you have Incoming Ports [1024-32768] about=20
that</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>anyway&nbsp;Not Open but then not =
blocked or=20
filtered either ... Thats were conntrack&nbsp;ESTABLISHED &amp; RELATED =
rules=20
come in.&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;Established is where the =
conntracker has seen=20
data already go both ways and if it has will do what you have set =
in&nbsp;its -j=20
Target.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;Related takes care of the rest of =
the stuff=20
that conntracker doesnt know how to handle,&nbsp;e.g,&nbsp;a incoming =
icmp=20
packet&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>is checked to see weather it is =
'Related' to=20
another connection such as a ICMP message for a Host Unreachable =
or&nbsp;=20
something like that. It also takes care of other helper&nbsp;such as FTP =

Transfer data that was related to a Ftp Connection&nbsp;</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>same for IRC and DCC Transfers ...=20
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT></DIV></BODY></HTM=
L>

------=_NextPart_000_0013_01C30D84.A3572F70--

