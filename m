From: "Ranjeet Shetye" <ranjeet.shetye@zultys.com>
Subject: Does IPTables have a 1:1 port-forwarding capability for a DNAT port-range ?
Date: Thu, 12 Dec 2002 16:24:48 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c2a23e$0be22fc0$0100a8c0@zultys.com>
Mime-Version: 1.0
Content-Type: multipart/related;
	boundary="----=_NextPart_000_0001_01C2A1FA.FDC1FD00"
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

------=_NextPart_000_0001_01C2A1FA.FDC1FD00
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0002_01C2A1FA.FDC50A40"


------=_NextPart_001_0002_01C2A1FA.FDC50A40
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

 
DNAT:
 
Is it possible to have a SINGLE (DNAT?) rule that will let me do 1:1
port-forwarding over a range of ports while doing Destination NAT.
 
e.g. Any incoming connections to 64.1.0.20:100-101 need to be mapped to
172.16.0.100:200-201 for the TCP protocol.
 
such that a connection to port 101 will ALWAYS map to port 201 and a
connection to port 100 will ALWAYS map to port 200.
 
Under current DNAT port range scenario, the connection goes to the
lowest port that is free e.g. a port 101 connection will be DNATt'ed to
port 200 if port 200 is free.
 
The reason for wanting a 1:1 rule is for X windows and other fat port
ranges. Dont want hundreds of rules in there if one can do the job. Can
IPTables do it ? If so how ? If not, I guess I'll have to get in touch
with the developers for tips on a good starting point.
 
Thanks in advance,
Ranjeet Shetye



------=_NextPart_001_0002_01C2A1FA.FDC50A40
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<TITLE>Message</TITLE>

<STYLE><!-- body { font-family: Arial, Helvetica; font-size: 10pt; =
color: #993300; margin-top: 25px; margin-left: 15px; } --></STYLE>

<META content=3D"MSHTML 5.00.3502.5390" name=3DGENERATOR></HEAD>
<BODY background=3Dcid:271211700@13122002-235A>
<DIV align=3Dleft><FONT color=3D#000000></FONT>&nbsp;</DIV>
<DIV align=3Dleft><FONT color=3D#000000>DNAT:</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV align=3Dleft><FONT color=3D#000000>Is it possible to have a SINGLE =
(DNAT?) rule=20
that will let me do 1:1 port-forwarding over a range of ports while =
doing=20
Destination NAT.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV align=3Dleft><FONT color=3D#000000>e.g. Any incoming connections to =

64.1.0.20:100-101 need to be mapped to 172.16.0.100:200-201 for the TCP=20
protocol.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV align=3Dleft><FONT color=3D#000000>such that a connection to port =
101 will=20
ALWAYS map to port 201 and a connection to port 100 will ALWAYS map to =
port=20
200.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV align=3Dleft><FONT color=3D#000000>Under current DNAT port range =
scenario, the=20
connection goes to the lowest port that is free e.g. a port 101 =
connection will=20
be DNATt'ed to port 200 if port 200 is free<SPAN=20
class=3D271211700-13122002>.</SPAN></FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV align=3Dleft><FONT color=3D#000000>The reason for wanting a 1:1 =
rule is for X=20
windows and other fat port ranges. Dont want hundreds of rules in there =
if one=20
can do the job.<SPAN class=3D271211700-13122002> Can IPTables do it ? If =
so how ?=20
If not, I guess I'll have to get in touch with the developers for tips =
on a good=20
starting point.</SPAN></FONT></DIV>
<DIV align=3Dleft><FONT color=3D#000000><SPAN=20
class=3D271211700-13122002></SPAN></FONT>&nbsp;</DIV>
<DIV align=3Dleft><FONT color=3D#000000><SPAN =
class=3D271211700-13122002>Thanks in=20
advance,</SPAN></FONT></DIV>
<DIV align=3Dleft>Ranjeet Shetye</DIV><BR>
<DIV align=3Dleft></DIV>
<P></P><SPAN id=3D_AthCaret></SPAN>
<P></P></BODY></HTML>

------=_NextPart_001_0002_01C2A1FA.FDC50A40--

------=_NextPart_000_0001_01C2A1FA.FDC1FD00
Content-Type: image/jpeg;
	name="Leaves Bkgrd.jpg"
Content-Transfer-Encoding: base64
Content-ID: <271211700@13122002-235A>

/9j/4AAQSkZJRgABAgEASABIAAD/7QZAUGhvdG9zaG9wIDMuMAA4QklNA+0AAAAAABAASAAAAAEA
AQBIAAAAAQABOEJJTQPzAAAAAAAIAAAAAAAAAAA4QklNBAoAAAAAAAEAADhCSU0nEAAAAAAACgAB
AAAAAAAAAAI4QklNA/UAAAAAAEgAL2ZmAAEAbGZmAAYAAAAAAAEAL2ZmAAEAoZmaAAYAAAAAAAEA
MgAAAAEAWgAAAAYAAAAAAAEANQAAAAEALQAAAAYAAAAAAAE4QklNA/gAAAAAAHAAAP//////////
//////////////////8D6AAAAAD/////////////////////////////A+gAAAAA////////////
/////////////////wPoAAAAAP////////////////////////////8D6AAAOEJJTQQIAAAAAAAQ
AAAAAQAAAkAAAAJAAAAAADhCSU0ECQAAAAAEzwAAAAEAAACAAAAAgAAAAYAAAMAAAAAEswAYAAH/
2P/gABBKRklGAAECAQBIAEgAAP/+ACdGaWxlIHdyaXR0ZW4gYnkgQWRvYmUgUGhvdG9zaG9wqCA0
LjAA/+4ADkFkb2JlAGSAAAAAAf/bAIQADAgICAkIDAkJDBELCgsRFQ8MDA8VGBMTFRMTGBEMDAwM
DAwRDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAENCwsNDg0QDg4QFA4ODhQUDg4ODhQRDAwM
DAwREQwMDAwMDBEMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwM/8AAEQgAgACAAwEiAAIRAQMR
Af/dAAQACP/EAT8AAAEFAQEBAQEBAAAAAAAAAAMAAQIEBQYHCAkKCwEAAQUBAQEBAQEAAAAAAAAA
AQACAwQFBgcICQoLEAABBAEDAgQCBQcGCAUDDDMBAAIRAwQhEjEFQVFhEyJxgTIGFJGhsUIjJBVS
wWIzNHKC0UMHJZJT8OHxY3M1FqKygyZEk1RkRcKjdDYX0lXiZfKzhMPTdePzRieUpIW0lcTU5PSl
tcXV5fVWZnaGlqa2xtbm9jdHV2d3h5ent8fX5/cRAAICAQIEBAMEBQYHBwYFNQEAAhEDITESBEFR
YXEiEwUygZEUobFCI8FS0fAzJGLhcoKSQ1MVY3M08SUGFqKygwcmNcLSRJNUoxdkRVU2dGXi8rOE
w9N14/NGlKSFtJXE1OT0pbXF1eX1VmZ2hpamtsbW5vYnN0dXZ3eHl6e3x//aAAwDAQACEQMRAD8A
6/v5hJJLhPYlA/glwklMpKVolP3pp7p++iSldvNKR3+SRS8klK+SU+CRSSUrv5JSOEo7pT2SUpKN
EpMeJSJSUr4pJdkvjykp/9Dr+QkJIShKQT8E9iUEvJJLVJStfmkPw8UvglOsH70lK+PCUd0hwl8U
lK8kvhwEvNL4JKUSkEtOEklKjxS0S58vNIpKUlB+SUa6duUoSU//0evTd0/YjhL569k9iUUkktJ8
0lKSBKR5S5SUrRLVIeSY68d0lL9vimGif+KXkkpWiXhHzS4S1RUoifIJaBKdPJL4oKV5/elOmiXw
SnXQpKf/0uv14SOqQ8PuSPMp7EpLulKRn5JKUkPvT88pu89+ySlJQAl/rCRjg/JJS3h+Cf8AIkkf
E/gkpXKQ8kvuSmPJJStO6RSS/KkpXhPdJKfH5JJKf//T69LjQpf6yl+RPYlf6hLzSB/3JdklK8+3
glz/ABKSUapKVPilx/sSB8PklISUqNP70vxCRSSUrRJKI80vNJSu6RS5S0+SSlJcaH70pCUJKf/U
6/4JDwS+CXKexK+KRMJaz8Eo7JKV3SidTwkkQkpRPyS7pSEklK5SS8+6SSla8pJtDpx5J0lLaJz/
ALwl240SJhJSo1+HZL8qXmlqR8UlP//V67wP4JylH3pTrHfunsSkuPNL8vZLySUrlJNyU6SlJdpS
Snx7d0lK158UvMfclyNO6XCSlHRIJfxSSUpIpJQkpQ1SS1kSkkp//9br5180pHZKUpjT8U9iVyUu
2iXxCWqSldvBJLTsUuP4pKV2SA/2Jo08E6SlTokEuNEklKmEkw5TwOUlK8kkvwKRSUqfx4TpkuNB
80lP/9kAOEJJTQQGAAAAAAAHAAMBAQABAQD//gAnRmlsZSB3cml0dGVuIGJ5IEFkb2JlIFBob3Rv
c2hvcKggNC4wAP/uACFBZG9iZQBkAAAAAAEDABADAgMGAAAAAAAAAAAAAAAA/9sAhAAKBwcHCAcK
CAgKDwoICg8SDQoKDRIUEBASEBAUEQwMDAwMDBEMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwM
AQsMDBUTFSIYGCIUDg4OFBQODg4OFBEMDAwMDBERDAwMDAwMEQwMDAwMDAwMDAwMDAwMDAwMDAwM
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

------=_NextPart_000_0001_01C2A1FA.FDC1FD00--



