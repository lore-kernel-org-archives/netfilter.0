From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: Logging to separate file
Date: Fri, 12 Dec 2003 20:08:10 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312130408.hBD480NC016495@server5.bandwidthco.com>
References: <20031209204523.29020.qmail@web40406.mail.yahoo.com>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0045_01C3C0EB.AA5105B0"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031209204523.29020.qmail@web40406.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: 'jon west' <lwsivad@yahoo.com>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------=_NextPart_000_0045_01C3C0EB.AA5105B0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

This should work:
# syslog.conf:
kern.=debug   /var/log/iptables
 
# IPTables Configuration:
 ... -j LOG --log-level debug
 
This is the exact configuration I use and it works fine.  You are
remembering to restart the syslog daemon after changes, correct?  
kill -HUP syslogd.pid or /etc/init.d/syslog restart

  _____  

From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of jon west
Sent: Tuesday, December 09, 2003 12:45 PM
To: netfilter@lists.netfilter.org
Subject: Logging to separate file


I'm trying to get logging working, again.  It was logging to
/var/log/messages and I tried to move it to /var/log/iptables.  Now I can't
get it to log to either.
 
Redhat 9 on Intel box
sysconfig.conf:
(first or last line, didn't work either way)
kern.=debug   /var/log/iptables
 
IPTables Configuration:
 ... -j LOG --log-level debug
 
I also tried:
syslog.conf
*.=debug  /var/log/iptables
 
IPTables configuration:
... -j LOG --log-level debug
 
I also tried to delete all the things I added to syslog.conf then set the
IPTables configuration to just "-j LOG" but it doesn't work either.
 
When I do an /sbin/iptables -L -vn, it says the packets are logged (then
dropped on the next line) but I cannot get it to write to any files.
 
Any help?
 
syslog.conf (right now):
kern.=debug  /var/log/iptables
*.info;mail.none;authpriv.none;cron.none;local6.none  /var/log/messages
authpriv.*  /var/log/secure
mail.*  /var/log/maillog
cron.*  /var/log/cron
*.emerg  *
uucp,news.crit  /var/log/spooler
local7.*  /var/log/boot.log
local6.*  /var/log/dhcp.log
 
Thanks.


  _____  

Do you Yahoo!?
New
<http://pa.yahoo.com/*http://us.rd.yahoo.com/evt=21260/*http://photos.yahoo.
com> Yahoo! Photos - easier uploading and sharing

------=_NextPart_000_0045_01C3C0EB.AA5105B0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2800.1264" name=3DGENERATOR></HEAD>
<BODY>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D050470404-13122003><FONT =
face=3DArial=20
color=3D#0000ff size=3D2>This should work:</FONT></SPAN></DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D050470404-13122003>
<DIV><SPAN class=3D050470404-13122003># </SPAN>sys<SPAN=20
class=3D050470404-13122003>log</SPAN>.conf:<BR>kern.=3Ddebug&nbsp;&nbsp; =

/var/log/iptables</DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D050470404-13122003># </SPAN>IPTables=20
Configuration:<BR>&nbsp;... -j LOG --log-level debug</DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=3D050470404-13122003><FONT face=3DArial color=3D#0000ff =
size=3D2>This=20
is the exact configuration I use and it works fine.&nbsp; You are =
remembering to=20
restart the syslog daemon after changes, correct?&nbsp; =
</FONT></SPAN></DIV>
<DIV><SPAN class=3D050470404-13122003><FONT face=3DArial color=3D#0000ff =
size=3D2>kill=20
-HUP syslogd.pid or /etc/init.d/syslog=20
restart</FONT></SPAN></DIV></SPAN></DIV><BR>
<DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr align=3Dleft>
<HR tabIndex=3D-1>
<FONT face=3DTahoma size=3D2><B>From:</B> =
netfilter-admin@lists.netfilter.org=20
[mailto:netfilter-admin@lists.netfilter.org] <B>On Behalf Of </B>jon=20
west<BR><B>Sent:</B> Tuesday, December 09, 2003 12:45 PM<BR><B>To:</B>=20
netfilter@lists.netfilter.org<BR><B>Subject:</B> Logging to separate=20
file<BR></FONT><BR></DIV>
<DIV></DIV>
<DIV>I'm trying to get logging working, again.&nbsp; It was logging to=20
/var/log/messages and I tried to move it to /var/log/iptables.&nbsp; Now =
I can't=20
get it to log to either.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Redhat 9 on Intel box</DIV>
<DIV>sysconfig.conf:<BR>(first or last line, didn't work either=20
way)<BR>kern.=3Ddebug&nbsp;&nbsp; /var/log/iptables</DIV>
<DIV>&nbsp;</DIV>
<DIV>IPTables Configuration:<BR>&nbsp;... -j LOG --log-level debug</DIV>
<DIV>&nbsp;</DIV>
<DIV>I also tried:<BR>syslog.conf<BR>*.=3Ddebug&nbsp; =
/var/log/iptables</DIV>
<DIV>&nbsp;</DIV>
<DIV>IPTables configuration:<BR>... -j LOG --log-level debug</DIV>
<DIV>&nbsp;</DIV>
<DIV>I also tried to delete all the things I added to syslog.conf then =
set the=20
IPTables configuration to just "-j LOG" but it doesn't work =
either.</DIV>
<DIV>&nbsp;</DIV>
<DIV>When I do an /sbin/iptables -L -vn, it says the packets are logged =
(then=20
dropped on the next line) but I cannot get it to write to any =
files.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Any help?</DIV>
<DIV>&nbsp;</DIV>
<DIV>syslog.conf (right now):<BR>kern.=3Ddebug&nbsp;=20
/var/log/iptables<BR>*.info;mail.none;authpriv.none;cron.none;local6.none=
&nbsp;=20
/var/log/messages<BR>authpriv.*&nbsp; /var/log/secure<BR>mail.*&nbsp;=20
/var/log/maillog<BR>cron.*&nbsp; /var/log/cron<BR>*.emerg&nbsp;=20
*<BR>uucp,news.crit&nbsp; /var/log/spooler<BR>local7.*&nbsp;=20
/var/log/boot.log<BR>local6.*&nbsp; /var/log/dhcp.log</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks.</DIV>
<P>
<HR SIZE=3D1>
Do you Yahoo!?<BR><A=20
href=3D"http://pa.yahoo.com/*http://us.rd.yahoo.com/evt=3D21260/*http://p=
hotos.yahoo.com">New=20
Yahoo! Photos - easier uploading and sharing</A></BODY></HTML>

------=_NextPart_000_0045_01C3C0EB.AA5105B0--



