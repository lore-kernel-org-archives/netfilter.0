From: Chaman Rana <chaman@newwavecomputing.com>
Subject: Problem while connecting to internal FTP server behind firewall from
 external client.
Date: Fri, 13 Aug 2004 14:11:28 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF42F6A95C.5880B2A4-ON65256EEF.002F51C0-65256EEF.00307DB8@newwavecomputing.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=_alternative 00307DA565256EEF_="
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

This is a multipart message in MIME format.
--=_alternative 00307DA565256EEF_=
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable

HI,

I am running FTP server in Windows 2003 and is perfectly working fine with =

other windows and Linux clients within the internal LAN. But I am not able =

to connect to this Server from external client(Linux).=20
Let me describe about my network. I am running Linux firewall on gateway=20
server. Windows FTP server is one of the internal LAN host. I have done=20
nating to access the FTP server from external client. I am getting "227=20
entering passive mode" and after a while it times out. But I am able to=20
see the directory and cd the desired directory. I am including=20
configuration. I would be very thankful if anybody can help me.
Thanks in advance!!!!!!!!!!

root@abc root]# ftp 61.35.215.23
Connected to 61.35.215.23 (61.35.215.23).
220-Microsoft FTP Service
220 This is New Wave Test site
Name (61.35.215.23:root): administrator
331 Password required for administrator.
Password:
230-You are welcome to this site if ur authorized else just get out of=20
this place
230 User administrator logged in.
Remote system type is Windows=5FNT.
ftp> cd cham
250 CWD command successful.
ftp> dir
227 Entering Passive Mode (192,168,1,98,10,58).
receive aborted
waiting for remote to finish abort
ftp> pwd
257 "/cham" is current directory.
ftp> cd ..
250 CWD command successful.
ftp> cd Sun=5FSolaris
250 CWD command successful.
ftp> pwd
257 "/Sun=5FSolaris" is current directory.
ftp> dir
227 Entering Passive Mode (192,168,1,98,10,5).
ftp: connect: Connection timed out



receive aborted
waiting for remote to finish abort
425 Can't open data connection.
500 '=F2ABOR': command not understood
ftp> ls
200 PORT command successful.
150 Opening ASCII mode data connection for /bin/ls.
ftp: connect: Connection timed out


FIREWALL RULE=20

#!/bin/sh

#Initializing variables

EXTDEV=3Deth2
EXTIP=3D"61.35.215.23"
EXTBASE=3D"61.35.215.1"
EXTBCAST=3D"61.35.215.255"
EXTGATE=3D"61.35.215.1"
INTNET=3D"61.35.215.0/24"

INTDEV=3Deth0
INTIP=3D"192.168.1.58"
INTBASE=3D"192.168.1.0"
INTBCAST=3D"192.168.1.255"
INTNET=3D"192.168.1.0/24"

IPT=3D/sbin/iptables
LOGOPT=3D"--log-level=3D3 -m limit --limit 3/minute --limit-burst 3"
SYNOPT=3D"-m limit --limit 5/second --limit-burst 10"

#Clearing all the existing firewall rules
if [ ! -x $IPTABLES ]
then
die "Firewall: Can't execute $IPTABLES"
fi
$IPT -P INPUT DROP # Set default policy to drop
$IPT -P OUTPUT DROP # Set default policy to DROP
$IPT -P FORWARD DROP # Set default policy to drop
$IPT -F #Flush all chains
$IPT -X #delete all chains

for table in filter nat mangle
do
$IPT -t $table -F #Delete the table's rule
$IPT -t $table -X #Delete the table's chains
$IPT -t $table -Z #Delete the table's counters
done

$IPT -t nat -A PREROUTING -i eth2 -p tcp -d 61.35.215.23 --dport 21 -j=20
DNAT --to-destination 192.168.1.98
$IPT -A FORWARD -j ACCEPT
$IPT -A INPUT -j ACCEPT
$IPT -A INPUT -p tcp --syn -d 192.168.1.98 --dport 21 -j ACCEPT
$IPT -A OUTPUT -j ACCEPT

Regards,
Cham=20




Thanking You,

Warm Regards,
Chaman Rana

"Don't limit your challenges - challenge your limits"

--=_alternative 00307DA565256EEF_=
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable


<table width=3D100% align=3Dcenter>
<tr valign=3Dtop>
<td width=3D100% bgcolor=3Dwhite>
<table width=3D100%>
<tr>
<td width=3D100% bgcolor=3Dwhite><font size=3D2>HI,</font>
<table width=3D100% align=3Dcenter>
<tr>
<td width=3D100% bgcolor=3Dwhite>
<table width=3D100%>
<tr valign=3Dtop>
<td width=3D100% bgcolor=3D#cfd9ff><font size=3D2 face=3D"Verdana">I am run=
ning
FTP server in Windows 2003 and is perfectly working fine with other windows
and Linux clients within the internal LAN. But I am not able to connect
to this Server from external client(Linux). <br>
Let me describe about my network. I am running Linux firewall on gateway
server. Windows FTP server is one of the internal LAN host. I have done
nating to access the FTP server from external client. I am getting &quot;227
entering passive mode&quot; and after a while it times out. But I am able
to see the directory and cd the desired directory. I am including configura=
tion.
I would be very thankful if anybody can help me.<br>
Thanks in advance!!!!!!!!!!<br>
<br>
root@abc root]# ftp 61.35.215.23<br>
Connected to 61.35.215.23 (61.35.215.23).<br>
220-Microsoft FTP Service<br>
220 This is New Wave Test site<br>
Name (61.35.215.23:root): administrator<br>
331 Password required for administrator.<br>
Password:<br>
230-You are welcome to this site if ur authorized else just get out of
this place<br>
230 User administrator logged in.<br>
Remote system type is Windows=5FNT.<br>
ftp&gt; cd cham<br>
250 CWD command successful.<br>
ftp&gt; dir<br>
227 Entering Passive Mode (192,168,1,98,10,58).<br>
receive aborted<br>
waiting for remote to finish abort<br>
ftp&gt; pwd<br>
257 &quot;/cham&quot; is current directory.<br>
ftp&gt; cd ..<br>
250 CWD command successful.<br>
ftp&gt; cd Sun=5FSolaris<br>
250 CWD command successful.<br>
ftp&gt; pwd<br>
257 &quot;/Sun=5FSolaris&quot; is current directory.<br>
ftp&gt; dir<br>
227 Entering Passive Mode (192,168,1,98,10,5).<br>
ftp: connect: Connection timed out<br>
<br>
<br>
<br>
receive aborted<br>
waiting for remote to finish abort<br>
425 Can't open data connection.<br>
500 '=F2ABOR': command not understood<br>
ftp&gt; ls<br>
200 PORT command successful.<br>
150 Opening ASCII mode data connection for /bin/ls.<br>
ftp: connect: Connection timed out<br>
<br>
<b><br>
FIREWALL RULE</b> <br>
<br>
#!/bin/sh<br>
<br>
#Initializing variables<br>
<br>
EXTDEV=3Deth2<br>
EXTIP=3D&quot;61.35.215.23&quot;<br>
EXTBASE=3D&quot;61.35.215.1&quot;<br>
EXTBCAST=3D&quot;61.35.215.255&quot;<br>
EXTGATE=3D&quot;61.35.215.1&quot;<br>
INTNET=3D&quot;61.35.215.0/24&quot;<br>
<br>
INTDEV=3Deth0<br>
INTIP=3D&quot;192.168.1.58&quot;<br>
INTBASE=3D&quot;192.168.1.0&quot;<br>
INTBCAST=3D&quot;192.168.1.255&quot;<br>
INTNET=3D&quot;192.168.1.0/24&quot;<br>
<br>
IPT=3D/sbin/iptables<br>
LOGOPT=3D&quot;--log-level=3D3 -m limit --limit 3/minute --limit-burst 3&qu=
ot;<br>
SYNOPT=3D&quot;-m limit --limit 5/second --limit-burst 10&quot;<br>
<br>
#Clearing all the existing firewall rules<br>
if [ ! -x $IPTABLES ]<br>
then<br>
die &quot;Firewall: Can't execute $IPTABLES&quot;<br>
fi<br>
$IPT -P INPUT DROP # Set default policy to drop<br>
$IPT -P OUTPUT DROP # Set default policy to DROP<br>
$IPT -P FORWARD DROP # Set default policy to drop<br>
$IPT -F #Flush all chains<br>
$IPT -X #delete all chains<br>
<br>
for table in filter nat mangle<br>
do<br>
$IPT -t $table -F #Delete the table's rule<br>
$IPT -t $table -X #Delete the table's chains<br>
$IPT -t $table -Z #Delete the table's counters<br>
done<br>
<br>
$IPT -t nat -A PREROUTING -i eth2 -p tcp -d 61.35.215.23 --dport 21 -j
DNAT --to-destination 192.168.1.98<br>
$IPT -A FORWARD -j ACCEPT<br>
$IPT -A INPUT -j ACCEPT<br>
$IPT -A INPUT -p tcp --syn -d 192.168.1.98 --dport 21 -j ACCEPT<br>
$IPT -A OUTPUT -j ACCEPT<br>
<br>
Regards,<br>
Cham</font><font size=3D3> </font></table>
<br></table>
<br></table>
<br></table>
<br>
<br><font size=3D2 face=3D"sans-serif">Thanking You,<br>
<br>
Warm Regards,<br>
Chaman Rana<br>
<br>
&quot;Don't limit your challenges - challenge your limits&quot;<br>
</font>
--=_alternative 00307DA565256EEF_=--

