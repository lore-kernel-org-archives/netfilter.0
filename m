From: Rendy V <RendyV@atd.magnus.co.id>
Subject: RE: secure ftp with SSL
Date: Mon, 16 Sep 2002 11:21:18 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <754E53EEA7D3D31194E50050DAB99F6E705442@thor.id.magnus.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C25D38.855DF7F8"
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
To: "'netfilter@lists.samba.org'" <netfilter@lists.samba.org>
Cc: 'Roy Sigurd Karlsbakk' <roy@karlsbakk.net>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C25D38.855DF7F8
Content-Type: text/plain;
	charset="iso-8859-1"

roy,
yes, i have loaded ip_conntrack_ftp.
Is there any better idea because if i change it i have to change all my
application..

regards,
rendy


On Friday 13 September 2002 05:09, Rendy V wrote:
> Hi All,
> I have a strange problem, the problem is like this :
> I have an application that use secure ftp and for that reason I have
opened
> up the command port (990) with state NEW and allowed data port
> (20000:20049) with state ESTABLISHED, RELATED on the firewall. It fails
> when it try to use data port, for authentication it working just fine.
> Please see the log on the below.
> If I open data port 2000:20049 with state NEW it working normally but I
> don't want to make a big hole on my firewall. I suspect that the iptables
> connection tracking cannot track the relation between command port and
data
> port because it is encrypted using SSL. Is it true or is there something I
> miss here?? What should I do now??

first - have you loaded ip_conntrack_ftp? 

second - I'm not sure the ip_conntrack_ftp module can understand encrypted 
traffic. Try using sftp from openssh instead. That only uses 22/tcp.

roy


------_=_NextPart_001_01C25D38.855DF7F8
Content-Type: text/html;
	charset="iso-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">
<META NAME="Generator" CONTENT="MS Exchange Server version 5.5.2650.12">
<TITLE>RE: secure ftp with SSL</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=2>roy,</FONT>
<BR><FONT SIZE=2>yes, i have loaded ip_conntrack_ftp.</FONT>
<BR><FONT SIZE=2>Is there any better idea because if i change it i have to change all my application..</FONT>
</P>

<P><FONT SIZE=2>regards,</FONT>
<BR><FONT SIZE=2>rendy</FONT>
</P>
<BR>

<P><FONT SIZE=2>On Friday 13 September 2002 05:09, Rendy V wrote:</FONT>
<BR><FONT SIZE=2>&gt; Hi All,</FONT>
<BR><FONT SIZE=2>&gt; I have a strange problem, the problem is like this :</FONT>
<BR><FONT SIZE=2>&gt; I have an application that use secure ftp and for that reason I have opened</FONT>
<BR><FONT SIZE=2>&gt; up the command port (990) with state NEW and allowed data port</FONT>
<BR><FONT SIZE=2>&gt; (20000:20049) with state ESTABLISHED, RELATED on the firewall. It fails</FONT>
<BR><FONT SIZE=2>&gt; when it try to use data port, for authentication it working just fine.</FONT>
<BR><FONT SIZE=2>&gt; Please see the log on the below.</FONT>
<BR><FONT SIZE=2>&gt; If I open data port 2000:20049 with state NEW it working normally but I</FONT>
<BR><FONT SIZE=2>&gt; don't want to make a big hole on my firewall. I suspect that the iptables</FONT>
<BR><FONT SIZE=2>&gt; connection tracking cannot track the relation between command port and data</FONT>
<BR><FONT SIZE=2>&gt; port because it is encrypted using SSL. Is it true or is there something I</FONT>
<BR><FONT SIZE=2>&gt; miss here?? What should I do now??</FONT>
</P>

<P><FONT SIZE=2>first - have you loaded ip_conntrack_ftp? </FONT>
</P>

<P><FONT SIZE=2>second - I'm not sure the ip_conntrack_ftp module can understand encrypted </FONT>
<BR><FONT SIZE=2>traffic. Try using sftp from openssh instead. That only uses 22/tcp.</FONT>
</P>

<P><FONT SIZE=2>roy</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C25D38.855DF7F8--

