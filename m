From: Eugene Joubert <eugenej@centratel.co.za>
Subject: RE: Incomming packets
Date: Tue, 11 Mar 2003 08:03:23 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B848917C9D07D71199C5005004D778B8017BD3@TELECOMS04>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C2E793.EC9917A0"
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
To: "'serguey.forcade@emelytours.com.do'" <serguey.forcade@emelytours.com.do>, netfilter@lists.netfilter.org

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C2E793.EC9917A0
Content-Type: text/plain

It looks like a DNS problem. I am not to sure if iptables likes host names
it cannot resolve to an IP. Maybe try an IP or put the test.host in your
/etc/hosts directory.

Hope this helps

-----Original Message-----
From: serguey.forcade@emelytours.com.do
[mailto:serguey.forcade@emelytours.com.do] 
Sent: 11 03 2003 04:22 AM
To: netfilter@lists.netfilter.org
Subject: Incomming packets


Hello:

    I'm trying to set a rule in my iptables configuration to accept
incomming connections from an specific host, (ie. iptables -A input -i eth0
-p tcp --dport 21 -s test.host -j ACCEPT ) and I keep getting the error:

iptables v1.2.6a: host/network `test.host' not found
Try `iptables -h' or 'iptables --help' for more information.

Does anyone know about it?

Thanks

------_=_NextPart_001_01C2E793.EC9917A0
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2653.12">
<TITLE>RE: Incomming packets</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2>It looks like a DNS problem. I am not to sure if =
iptables likes host names it cannot resolve to an IP. Maybe try an IP =
or put the test.host in your /etc/hosts directory.</FONT></P>

<P><FONT SIZE=3D2>Hope this helps</FONT>
</P>

<P><FONT SIZE=3D2>-----Original Message-----</FONT>
<BR><FONT SIZE=3D2>From: serguey.forcade@emelytours.com.do [<A =
HREF=3D"mailto:serguey.forcade@emelytours.com.do">mailto:serguey.forcade=
@emelytours.com.do</A>] </FONT>
<BR><FONT SIZE=3D2>Sent: 11 03 2003 04:22 AM</FONT>
<BR><FONT SIZE=3D2>To: netfilter@lists.netfilter.org</FONT>
<BR><FONT SIZE=3D2>Subject: Incomming packets</FONT>
</P>
<BR>

<P><FONT SIZE=3D2>Hello:</FONT>
</P>

<P><FONT SIZE=3D2>&nbsp;&nbsp;&nbsp; I'm trying to set a rule in my =
iptables configuration to accept incomming connections from an specific =
host, (ie. iptables -A input -i eth0 -p tcp --dport 21 -s test.host -j =
ACCEPT ) and I keep getting the error:</FONT></P>

<P><FONT SIZE=3D2>iptables v1.2.6a: host/network `test.host' not =
found</FONT>
<BR><FONT SIZE=3D2>Try `iptables -h' or 'iptables --help' for more =
information.</FONT>
</P>

<P><FONT SIZE=3D2>Does anyone know about it?</FONT>
</P>

<P><FONT SIZE=3D2>Thanks</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C2E793.EC9917A0--

