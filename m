From: "George Peverill" <gpeverill@ns.sympatico.ca>
Subject: I have to become a bandwidth Nazi , Netfilter useable.
Date: Sat, 1 Mar 2003 09:57:43 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000201c2dffa$8ad18480$0c05a8c0@Sherby>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0003_01C2DFD9.03BFE480"
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

------=_NextPart_000_0003_01C2DFD9.03BFE480
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

 
I am running a small network (about 10-12 machines) with a linux gateway
machine providing http/ssh/vpn(pptp)/firewalling/NAT
Recently we've had someone that loves to hog bandwidth a tad (ie:
downloading movies at 150-200k/s) while we slave away
with the remaining 50k/s or so of bandwidth.  I was wondering and I
think its possible) if I could remedy this without resorting
to compilicated QoS / CBQ crap.  Basically is it possible to write a
rule that'd say drop 25% or maybe 50% of all packets going to his
machine from the gateway? (nasty yes agreed)
 
-internal interface is eth0 (192.168.0.x)
-external interface is eth1
 
Is it possible to do it based on his IP (which is known lets say
192.168.0.55 for example sake) or his MAC address which is known.
 
Any help would be greatly appreciated.  I dunno how this can be done but
im sure someone might be able to figure it out , would have to be done
in the PREROUTING where SNAT is done wouldnt it ? 
 
 

------=_NextPart_000_0003_01C2DFD9.03BFE480
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<TITLE>Message</TITLE>

<META content=3D"MSHTML 6.00.2800.1141" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><SPAN class=3D848304813-01032003><FONT face=3DArial size=3D2>I am =
running a small=20
network (about 10-12 machines) with a linux gateway machine providing=20
http/ssh/vpn(pptp)/firewalling/NAT</FONT></SPAN></DIV>
<DIV><SPAN class=3D848304813-01032003><FONT face=3DArial =
size=3D2>Recently we've had=20
someone that loves to hog bandwidth a tad (ie: downloading movies at =
150-200k/s)=20
while we slave away</FONT></SPAN></DIV>
<DIV><SPAN class=3D848304813-01032003><FONT face=3DArial size=3D2>with =
the remaining=20
50k/s or so of bandwidth.&nbsp; I was wondering and I think its =
possible) if I=20
could remedy this without resorting</FONT></SPAN></DIV>
<DIV><SPAN class=3D848304813-01032003><FONT face=3DArial size=3D2>to =
compilicated QoS=20
/ CBQ crap.&nbsp; Basically is it possible to write a rule that'd say =
drop 25%=20
or maybe 50% of all packets going to his machine from the gateway? =
(nasty yes=20
agreed)</FONT></SPAN></DIV>
<DIV><SPAN class=3D848304813-01032003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D848304813-01032003><FONT face=3DArial =
size=3D2>-internal interface=20
is eth0 (192.168.0.x)</FONT></SPAN></DIV>
<DIV><SPAN class=3D848304813-01032003><FONT face=3DArial =
size=3D2>-external interface=20
is eth1</FONT></SPAN></DIV>
<DIV><SPAN class=3D848304813-01032003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D848304813-01032003><FONT face=3DArial size=3D2>Is it =
possible to do=20
it based on his IP (which is known lets say 192.168.0.55 for example =
sake) or=20
his MAC address which is known.</FONT></SPAN></DIV>
<DIV><SPAN class=3D848304813-01032003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D848304813-01032003><FONT face=3DArial size=3D2>Any =
help would be=20
greatly appreciated.&nbsp; I dunno how this can be done but im sure =
someone=20
might be able to figure it out , would have to be done in the PREROUTING =
where=20
SNAT is done wouldnt it ? </FONT></SPAN></DIV>
<DIV><SPAN class=3D848304813-01032003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D848304813-01032003><FONT face=3DArial=20
size=3D2></FONT></SPAN>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0003_01C2DFD9.03BFE480--



