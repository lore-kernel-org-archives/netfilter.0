From: Rendy V <RendyV@atd.magnus.co.id>
Subject: secure ftp with SSL
Date: Fri, 13 Sep 2002 10:09:59 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <754E53EEA7D3D31194E50050DAB99F6E70543C@thor.id.magnus.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C25AD3.10A902CA"
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

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C25AD3.10A902CA
Content-Type: text/plain;
	charset="iso-8859-1"

Hi All,
I have a strange problem, the problem is like this : 
I have an application that use secure ftp and for that reason I have opened
up the command port (990) with state NEW and allowed data port (20000:20049)
with state ESTABLISHED, RELATED on the firewall. It fails when it try to use
data port, for authentication it working just fine. Please see the log on
the below. 
If I open data port 2000:20049 with state NEW it working normally but I
don't want to make a big hole on my firewall. I suspect that the iptables
connection tracking cannot track the relation between command port and data
port because it is encrypted using SSL. Is it true or is there something I
miss here?? What should I do now?? 

Thank u 

Rendy

STATUS:>  	Getting listing ""...
STATUS:>  	Connecting to ftp server xx.xx.xx.xx:990 (ip =
xx.xx.xx.xx)...
STATUS:>  	Socket connected. Waiting for welcome message...
STATUS:>  	Enter Serial Number
STATUS:>  	Connected. Exchanging encryption keys...
STATUS:>  	SSL encrypted session established.
		220 Serv-U FTP Server v3.0 for WinSock ready...
STATUS:>  	Connected. Authenticating...
COMMAND:>	USER ftpadmin
		331 User name okay, need password.
COMMAND:>	PASS *****
		230 User logged in, proceed.
STATUS:>  	Login successful.
COMMAND:>	PWD
		257 "/" is current directory.
STATUS:>  	Home directory: /
COMMAND:>	FEAT
		500 'FEAT': command not understood.
STATUS:>  	This site doesn't support the 'features' command.
COMMAND:>	REST 100
		350 Restarting at 100 - send STORE or RETRIEVE to initiate
transfer.
STATUS:>  	This site can resume broken downloads.
COMMAND:>	TYPE A
		200 Type set to A.
COMMAND:>	REST 0
		350 Restarting at 0 - send STORE or RETRIEVE to initiate
transfer.
COMMAND:>	PBSZ 0
		500 'PBSZ': command not understood.
COMMAND:>	PROT P
		500 'PROT': command not understood.
COMMAND:>	PASV
		227 Entering Passive Mode (xx,xx,xx,xx,xx,xx)
COMMAND:>	LIST
STATUS:>  	Connecting ftp data socket xx.xx.xx.xx:20028...
ERROR:>   	Can't connect to remote server. Socket error = #10060.
ERROR:>   	Failed to establish data socket.


------_=_NextPart_001_01C25AD3.10A902CA
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
5.5.2650.12">
<TITLE>secure ftp with SSL</TITLE>
</HEAD>
<BODY>

<P><FONT SIZE=3D2 FACE=3D"Arial">Hi All,</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">I have a strange problem, the problem =
is like this : </FONT>
<BR><FONT SIZE=3D2 FACE=3D"Arial">I have an application that use secure =
ftp and for that reason I have opened up the command port (990) with =
state NEW and allowed data port (20000:20049) with state ESTABLISHED, =
RELATED on the firewall. It fails when it try to use data port, for =
authentication it working just fine. Please see the log on the below. =
</FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">If I open data port 2000:20049 with =
state NEW it working normally but I don't want to make a big hole on my =
firewall. I suspect that the iptables connection tracking cannot track =
the relation between command port and data port because it is encrypted =
using SSL. Is it true or is there something I miss here?? What should I =
do now?? </FONT></P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Thank u </FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Arial">Rendy</FONT>
</P>

<P><FONT SIZE=3D2 FACE=3D"Courier New">STATUS:&gt;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Getting listing &quot;&quot;...</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">STATUS:&gt;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Connecting to ftp server xx.xx.xx.xx:990 =
(ip =3D xx.xx.xx.xx)...</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">STATUS:&gt;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Socket connected. Waiting for welcome =
message...</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">STATUS:&gt;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enter Serial Number</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">STATUS:&gt;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Connected. Exchanging encryption =
keys...</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">STATUS:&gt;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SSL encrypted session =
established.</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Courier New">220 Serv-U FTP Server v3.0 for WinSock =
ready...</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">STATUS:&gt;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Connected. Authenticating...</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier =
New">COMMAND:&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; USER =
ftpadmin</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Courier New">331 User name okay, need password.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier =
New">COMMAND:&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PASS *****</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Courier New">230 User logged in, proceed.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">STATUS:&gt;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Login successful.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier =
New">COMMAND:&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PWD</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Courier New">257 &quot;/&quot; is current directory.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">STATUS:&gt;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Home directory: /</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier =
New">COMMAND:&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; FEAT</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Courier New">500 'FEAT': command not understood.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">STATUS:&gt;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This site doesn't support the 'features' =
command.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier =
New">COMMAND:&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REST 100</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Courier New">350 Restarting at 100 - send STORE or RETRIEVE to =
initiate transfer.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">STATUS:&gt;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; This site can resume broken =
downloads.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier =
New">COMMAND:&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TYPE A</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Courier New">200 Type set to A.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier =
New">COMMAND:&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; REST 0</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Courier New">350 Restarting at 0 - send STORE or RETRIEVE to =
initiate transfer.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier =
New">COMMAND:&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PBSZ 0</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Courier New">500 'PBSZ': command not understood.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier =
New">COMMAND:&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PROT P</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Courier New">500 'PROT': command not understood.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier =
New">COMMAND:&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; PASV</FONT>
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <FONT SIZE=3D2 =
FACE=3D"Courier New">227 Entering Passive Mode =
(xx,xx,xx,xx,xx,xx)</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier =
New">COMMAND:&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LIST</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">STATUS:&gt;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Connecting ftp data socket =
xx.xx.xx.xx:20028...</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">ERROR:&gt;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Can't connect to remote server. Socket =
error =3D #10060.</FONT>
<BR><FONT SIZE=3D2 FACE=3D"Courier New">ERROR:&gt;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Failed to establish data socket.</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C25AD3.10A902CA--

