From: "Vanderveer, Derek" <Derek.Vanderveer@McKesson.com>
Subject: RE: FTP over NAT problem
Date: Fri, 28 May 2004 09:18:49 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <FFE4E834C1C2C04DA3EC09A7FE28FDC206A59C3E@migmsx01.alitech.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="----_=_NextPart_001_01C444CF.37C08760"
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
To: "'Piszcz, Justin Michael'" <justin.piszcz@mitretek.org>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C444CF.37C08760
Content-Type: text/plain;
 charset=iso-8859-1
Content-Transfer-Encoding: 7bit

Hey all, 

Just to confirm, this was not an iptables problem.  It was an issue with
a newer driver version for the serial card we're using to hook up many
modems to the server.  Regards,

        Derek V. 


-----Original Message----- 
From: Vanderveer, Derek 
Sent: Wednesday, May 26, 2004 6:09 PM 
To: 'Piszcz, Justin Michael'; 'netfilter@lists.netfilter.org' 
Subject: RE: FTP over NAT problem 


Hey Justin, thanks for your reply. 

At this point, we're considering pulling the server for some testing, so
as soon it's out of the production environment, I may try upgrading
iptables to the 1.2.9 version.  Further testing has revealed that it may
not be related to iptables at all, though, since using FTP from a
console window on the server suffers the same problems (I can browse and
even download in active and passive mode, but as soon as I uploaded, the
connection hangs).  As I understand it, traffic originating from the
server itself should not be NAT'ed, so conntrack may not be the problem.
Is that accurate?  Perhaps the card or breakout box used to attach 16
modems to one server is causing the problem...

To answer your questions, though, I had compiled everything as modules
so I could load just the specific ones I needed, in case some other
iptables option was causing my problem.  Obviously that's not the case,
but in the end it was useful for determining the minimum selection of
iptables modules we require.  As for kernel version, it's the same as
yours, 2.4.26.  I think at this point I need to investigate some of the
other factors here (prime target being that 16-port serial card... all
serial cards at this point in our organization have been 8-port models,
though from the same vendor).  If I find something that resolves the
problem, and it's related to iptables, I'll be sure to post the
solution.

Regards, 

    Derek V. 


-----Original Message----- 
From: Piszcz, Justin Michael [ mailto:justin.piszcz@mitretek.org
<mailto:justin.piszcz@mitretek.org> ] 
Sent: Wednesday, May 26, 2004 7:08 AM 
To: Vanderveer, Derek; netfilter@lists.netfilter.org 
Subject: RE: FTP over NAT problem 


This is very strange, have you given iptables 1.2.9 a try? 
Also, I compile everything iptables-wise into the kernel except
ftp/nat_ftp (incase you want to run an ftp/access one on a port other
than 21), then I do not need to worry about having the appropriate
module loaded. What kernel do you run btw? 2.4.26 here for my fw box.

  



From: netfilter-admin@lists.netfilter.org [
mailto:netfilter-admin@lists.netfilter.org
<mailto:netfilter-admin@lists.netfilter.org> ] On Behalf Of Vanderveer,
Derek 
Sent: Tuesday, May 25, 2004 12:42 PM 
To: 'netfilter@lists.netfilter.org' 
Subject: FTP over NAT problem 
  
Hey all, 
  
I've been fighting with this problem for over a week, and I've made no
headway.  I have a server with a bank of serial ports, all attached to
modems.  We use scripts to raise and drop lines to various customer
sites that we support.  In the past, we've had great success using
iptables to handle forwarding and NAT of LAN traffic going out over the
wire to the customer's servers.  My latest server, however, doesn't
handle FTP, PCAnywhere or RDP at all, using the same iptables commands
as the older servers.  It has a slightly newer (v1.2.6a vs. 1.2.5)
version of iptables, but otherwise isn't much different.

  
Telnet and ICMP work fine, but PCA and RDP never connect.  You can
connect to a server using FTP, and browse in Active or Passive mode
without any problems.  As soon as you try to transfer a file, however,
the transfer hangs immediately, regardless of whether you use Active or
Passive.  I've pared my iptables script down to the bare minimum that
gets me to this state after a full reboot, and here it is:

  
modprobe ip_conntrack_ftp 
modprobe ip_nat_ftp 
iptables -P FORWARD DROP 
iptables -F FORWARD 
iptables -t nat -P POSTROUTING ACCEPT 
iptables -t nat -F POSTROUTING 
iptables -t nat -A POSTROUTING -o ppp+ -j MASQUERADE 
iptables -A FORWARD -i eth0 -o ppp+ -j ACCEPT 
iptables -A FORWARD -i ppp+ -o eth0 -m state --state ESTABLISHED,RELATED
-j ACCEPT 
Distro is Debian 3.0r2, kernel is 2.4.26.  All non-experimental
netfilter kernel options are compiled as modules; except for
ip_conntrack_ftp and ip_nat_ftp, I just let the others autoload as I
issue the iptables statements above.  Can anyone shed any light on why
this is happening??  The same iptables ruleset works fine on my other
servers, and I'm stumped!

     Derek V. 


------_=_NextPart_001_01C444CF.37C08760
Content-Type: text/html;
 charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>

<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2657.73">
<TITLE>RE: FTP over NAT problem</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>Hey all,</FONT>
</P>

<P><FONT SIZE=3D2>Just to confirm, this was not an iptables =
problem.&nbsp; It was an issue with a newer driver version for the =
serial card we're using to hook up many modems to the server.&nbsp; =
Regards,</FONT></P>

<P>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2>Derek =
V.</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>-----Original Message-----</FONT>
<BR><FONT SIZE=3D2>From: Vanderveer, Derek </FONT>
<BR><FONT SIZE=3D2>Sent: Wednesday, May 26, 2004 6:09 PM</FONT>
<BR><FONT SIZE=3D2>To: 'Piszcz, Justin Michael'; =
'netfilter@lists.netfilter.org'</FONT>
<BR><FONT SIZE=3D2>Subject: RE: FTP over NAT problem</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Hey Justin, thanks for your reply.</FONT>
</P>

<P><FONT SIZE=3D2>At this point, we're considering pulling the server =
for some testing, so as soon it's out of the production environment, I =
may try upgrading iptables to the 1.2.9 version.&nbsp; Further testing =
has revealed that it may not be related to iptables at all, though, =
since using FTP from a console window on the server suffers the same =
problems (I can browse and even download in active and passive mode, =
but as soon as I uploaded, the connection hangs).&nbsp; As I understand =
it, traffic originating from the server itself should not be NAT'ed, so =
conntrack may not be the problem.&nbsp; Is that accurate?&nbsp; Perhaps =
the card or breakout box used to attach 16 modems to one server is =
causing the problem...</FONT></P>

<P><FONT SIZE=3D2>To answer your questions, though, I had compiled =
everything as modules so I could load just the specific ones I needed, =
in case some other iptables option was causing my problem.&nbsp; =
Obviously that's not the case, but in the end it was useful for =
determining the minimum selection of iptables modules we require.&nbsp; =
As for kernel version, it's the same as yours, 2.4.26.&nbsp; I think at =
this point I need to investigate some of the other factors here (prime =
target being that 16-port serial card... all serial cards at this point =
in our organization have been 8-port models, though from the same =
vendor).&nbsp; If I find something that resolves the problem, and it's =
related to iptables, I'll be sure to post the solution.</FONT></P>

<P><FONT SIZE=3D2>Regards,</FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp; Derek V.</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>-----Original Message-----</FONT>
<BR><FONT SIZE=3D2>From: Piszcz, Justin Michael [<A =
HREF=3D"mailto:justin.piszcz@mitretek.org">mailto:justin.piszcz@mitretek=
.org</A>]</FONT>
<BR><FONT SIZE=3D2>Sent: Wednesday, May 26, 2004 7:08 AM</FONT>
<BR><FONT SIZE=3D2>To: Vanderveer, Derek; =
netfilter@lists.netfilter.org</FONT>
<BR><FONT SIZE=3D2>Subject: RE: FTP over NAT problem</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>This is very strange, have you given iptables 1.2.9 a =
try?</FONT>
<BR><FONT SIZE=3D2>Also, I compile everything iptables-wise into the =
kernel except ftp/nat_ftp (incase you want to run an ftp/access one on =
a port other than 21), then I do not need to worry about having the =
appropriate module loaded. What kernel do you run btw? 2.4.26 here for =
my fw box.</FONT></P>

<P><FONT SIZE=3D2>&nbsp;</FONT>
</P>
<BR>
<BR>

<P><FONT SIZE=3D2>From: netfilter-admin@lists.netfilter.org [<A =
HREF=3D"mailto:netfilter-admin@lists.netfilter.org">mailto:netfilter-adm=
in@lists.netfilter.org</A>] On Behalf Of Vanderveer, Derek</FONT>
<BR><FONT SIZE=3D2>Sent: Tuesday, May 25, 2004 12:42 PM</FONT>
<BR><FONT SIZE=3D2>To: 'netfilter@lists.netfilter.org'</FONT>
<BR><FONT SIZE=3D2>Subject: FTP over NAT problem</FONT>
<BR><FONT SIZE=3D2>&nbsp;</FONT>
<BR><FONT SIZE=3D2>Hey all,</FONT>
<BR><FONT SIZE=3D2>&nbsp;</FONT>
<BR><FONT SIZE=3D2>I've been fighting with this problem for over a =
week, and I've made no headway.&nbsp; I have a server with a bank of =
serial ports, all attached to modems.&nbsp; We use scripts to raise and =
drop lines to various customer sites that we support.&nbsp; In the =
past, we've had great success using iptables to handle forwarding and =
NAT of LAN traffic going out over the wire to the customer's =
servers.&nbsp; My latest server, however, doesn't handle FTP, =
PCAnywhere or RDP at all, using the same iptables commands as the older =
servers.&nbsp; It has a slightly newer (v1.2.6a vs. 1.2.5) version of =
iptables, but otherwise isn't much different.</FONT></P>

<P><FONT SIZE=3D2>&nbsp;</FONT>
<BR><FONT SIZE=3D2>Telnet and ICMP work fine, but PCA and RDP never =
connect.&nbsp; You can connect to a server using FTP, and browse in =
Active or Passive mode without any problems.&nbsp; As soon as you try =
to transfer a file, however, the transfer hangs immediately, regardless =
of whether you use Active or Passive.&nbsp; I've pared my iptables =
script down to the bare minimum that gets me to this state after a full =
reboot, and here it is:</FONT></P>

<P><FONT SIZE=3D2>&nbsp;</FONT>
<BR><FONT SIZE=3D2>modprobe ip_conntrack_ftp</FONT>
<BR><FONT SIZE=3D2>modprobe ip_nat_ftp</FONT>
<BR><FONT SIZE=3D2>iptables -P FORWARD DROP</FONT>
<BR><FONT SIZE=3D2>iptables -F FORWARD</FONT>
<BR><FONT SIZE=3D2>iptables -t nat -P POSTROUTING ACCEPT</FONT>
<BR><FONT SIZE=3D2>iptables -t nat -F POSTROUTING</FONT>
<BR><FONT SIZE=3D2>iptables -t nat -A POSTROUTING -o ppp+ -j =
MASQUERADE</FONT>
<BR><FONT SIZE=3D2>iptables -A FORWARD -i eth0 -o ppp+ -j ACCEPT</FONT>
<BR><FONT SIZE=3D2>iptables -A FORWARD -i ppp+ -o eth0 -m state --state =
ESTABLISHED,RELATED -j ACCEPT</FONT>
<BR><FONT SIZE=3D2>Distro is Debian 3.0r2, kernel is 2.4.26.&nbsp; All =
non-experimental netfilter kernel options are compiled as modules; =
except for ip_conntrack_ftp and ip_nat_ftp, I just let the others =
autoload as I issue the iptables statements above.&nbsp; Can anyone =
shed any light on why this is happening??&nbsp; The same iptables =
ruleset works fine on my other servers, and I'm stumped!</FONT></P>

<P><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp;&nbsp; Derek V.</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C444CF.37C08760--


