From: "Christian Gmeiner" <christian@visual-page.de>
Subject: Problem with connection-tracking and FTP
Date: Tue, 20 Jan 2004 17:01:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002001c3df6e$a97416e0$0600a8c0@blackbox>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001D_01C3DF77.0A7E7DB0"
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

------=_NextPart_000_001D_01C3DF77.0A7E7DB0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi everybody.

I am working on a little firewall script. Everything works just fine, =
but i dont get the ftp protocoll working.

I call this two function to get ftp working:

# =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
FTP()
{
    ebegin "Seting rules for active/passive FTP"

    # Port 21

    iptables -A INPUT     -p tcp --sport 21 -m state --state ESTABLISHED =
-j ACCEPT=20
    iptables -A OUTPUT -p tcp --dport 21 -m state --state =
NEW,ESTABLISHED -j ACCEPT=20

    # aktiv
    iptables -A INPUT     -p tcp --sport 20 -m state --state =
ESTABLISHED,RELATED -j ACCEPT=20
    iptables -A OUTPUT -p tcp --dport 20 -m state --state ESTABLISHED -j =
ACCEPT=20

    # passiv
    iptables -A INPUT     -p tcp --sport 1024: --dport 1024:  -m state =
--state ESTABLISHED -j ACCEPT=20
    iptables -A OUTPUT -p tcp --sport 1024: --dport 1024:  -m state =
--state ESTABLISHED,RELATED -j ACCEPT=20

    eend $?
}


# =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
loadmodules()
{
    ebegin "Try to load needed modules"

    /sbin/modprobe ip_tables
    /sbin/modprobe iptable_filter
    /sbin/modprobe ip_conntrack
    /sbin/modprobe ip_conntrack_ftp
    /sbin/modprobe ipt_ULOG
    eend $?
}

An here my start function
# =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
start()=20
{
    ebegin "Starting Firewall"

    loadmodules

    einfo "Setting default rules to drop"
    iptables -F
    iptables -X=20
    iptables -Z=20
    iptables -F INPUT
    iptables -F OUTPUT
    iptables -F FORWARD

    iptables -P FORWARD DROP
    iptables -P INPUT   DROP
    iptables -P OUTPUT  DROP

    acceptlocal
    portscan
    proc
    iana
    illigalpackages
    spoofing
    FTP

    # set rules
    InOutTCP
    InTCP
    OutTCP
    InOutUDP
    InUDP
    OutUDP

    # Erlaube dem Client routen durch NAT (Network Address Translation
    iptables -t nat -A POSTROUTING -o ${EXT_INT} -j MASQUERADE
    echo "1" > /proc/sys/net/ipv4/ip_forward

    eend $? "Failed to start Firewall"
}


And here are the ports i allow with the function InOut*, In*, Out*,...

# TCP in+out
#
TCP_IN_OUT=3D"ssh 10000 smtp pop3 http https"

# TCP out
#
# 5190 =3D ICQ
#
TCP_OUT=3D"5190 http https irc 25 ftp ftp-data"

# TCP in
#
TCP_IN=3D""

# UDP in+out
#
UDP_IN_OUT=3D"domain ssh 10000 pop3 ssh"

# UDP out
#
UDP_OUT=3D"https irc"

# UDP in
#
UDP_IN=3D""


Oh and here some important functions:

# =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
InOutTCP()
{
    ebegin "Allowing in and outbound TCP-traffic"

    for i in ${TCP_IN_OUT}
    do
        einfo "   <-> Seting TCP "in" and "out" rules for ${i}"

        iptables -A INPUT  -j ACCEPT -i ${EXT_INT} -p tcp --dport ${i} =
-m state --state NEW,ESTABLISHED,RELATED
        iptables -A OUTPUT -j ACCEPT -o ${EXT_INT} -p tcp --sport ${i} =
--dport 1024: -m state --state ESTABLISHED,RELATED
        iptables -A FORWARD  -j ACCEPT -i ${EXT_INT} -p tcp --dport ${i} =
-m state --state NEW,ESTABLISHED,RELATED
        iptables -A FORWARD -j ACCEPT -o ${EXT_INT} -p tcp --sport ${i} =
-m state --state ESTABLISHED,RELATED

        iptables -A OUTPUT -j ACCEPT -o ${EXT_INT} -p tcp --sport 1024: =
--dport ${i} -m state --state NEW,ESTABLISHED,RELATED
        iptables -A INPUT  -j ACCEPT -i ${EXT_INT} -p tcp --sport ${i} =
-m state --state ESTABLISHED,RELATED
        iptables -A FORWARD -j ACCEPT -o ${EXT_INT} -p tcp -s ${LAN} =
--sport 1024: --dport ${i} -m state --state NEW,ESTABLISHED,RELATED
        iptables -A FORWARD  -j ACCEPT -i ${EXT_INT} -p tcp --sport ${i} =
-d ${LAN} -m state --state ESTABLISHED,RELATED
    done

    eend $?
}

# =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=20
OutTCP()
{
    ebegin "Allowing outbound TCP-traffic"

    for i in ${TCP_OUT}
    do
        einfo "   <-> Seting TCP "out" rules for ${i}"

        iptables -A OUTPUT -j ACCEPT -o ${EXT_INT} -p tcp --sport 1024: =
--dport $i -m state --state NEW,ESTABLISHED,RELATED
        iptables -A INPUT  -j ACCEPT -i ${EXT_INT} -p tcp --sport $i -m =
state --state ESTABLISHED,RELATED
        iptables -A FORWARD -j ACCEPT -o ${EXT_INT} -p tcp -s ${LAN} =
--sport 1024: --dport $i -m state --state NEW,ESTABLISHED,RELATED
        iptables -A FORWARD  -j ACCEPT -i ${EXT_INT} -p tcp --sport $i =
-d ${LAN} -m state --state ESTABLISHED,RELATED
    done

    eend $?
}

I hope somebody can help me.

Thanks, Christian Gmeiner


------=_NextPart_000_001D_01C3DF77.0A7E7DB0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1276" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>Hi everybody.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I am working on a little firewall =
script.=20
Everything works just fine, but i dont get the ftp protocoll=20
working.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I call this two function to get ftp=20
working:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>#=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D<BR>FTP()<BR>{<BR>&nbsp;&nbsp;&nbsp; ebegin=20
"Seting rules for active/passive FTP"</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; # Port =
21</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; iptables -A=20
INPUT&nbsp;&nbsp;&nbsp;&nbsp; -p tcp --sport 21 -m state --state =
ESTABLISHED -j=20
ACCEPT <BR>&nbsp;&nbsp;&nbsp; iptables -A OUTPUT -p tcp --dport 21 -m =
state=20
--state NEW,ESTABLISHED -j ACCEPT </FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; # =
aktiv<BR>&nbsp;&nbsp;&nbsp;=20
iptables -A INPUT&nbsp;&nbsp;&nbsp;&nbsp; -p tcp --sport 20 -m state =
--state=20
ESTABLISHED,RELATED -j ACCEPT <BR>&nbsp;&nbsp;&nbsp; iptables -A OUTPUT =
-p tcp=20
--dport 20 -m state --state ESTABLISHED -j ACCEPT </FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; # =
passiv<BR>&nbsp;&nbsp;&nbsp;=20
iptables -A INPUT&nbsp;&nbsp;&nbsp;&nbsp; -p tcp --sport 1024: --dport=20
1024:&nbsp; -m state --state ESTABLISHED -j ACCEPT =
<BR>&nbsp;&nbsp;&nbsp;=20
iptables -A OUTPUT -p tcp --sport 1024: --dport 1024:&nbsp; -m state =
--state=20
ESTABLISHED,RELATED -j ACCEPT </FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; eend =
$?<BR>}</FONT></DIV>
<DIV>&nbsp;</DIV><FONT face=3DArial size=3D2>
<DIV><BR>#=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D<BR>loadmodules()<BR>{<BR>&nbsp;&nbsp;&nbsp;=20
ebegin "Try to load needed modules"</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp;&nbsp; /sbin/modprobe ip_tables<BR>&nbsp;&nbsp;&nbsp;=20
/sbin/modprobe iptable_filter<BR>&nbsp;&nbsp;&nbsp; /sbin/modprobe=20
ip_conntrack<BR>&nbsp;&nbsp;&nbsp; /sbin/modprobe=20
ip_conntrack_ftp<BR>&nbsp;&nbsp;&nbsp; /sbin/modprobe=20
ipt_ULOG<BR>&nbsp;&nbsp;&nbsp; eend $?<BR>}</DIV>
<DIV>&nbsp;</DIV>
<DIV>An here my start function</DIV>
<DIV># =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D<BR>start() <BR>{<BR>&nbsp;&nbsp;&nbsp;=20
ebegin "Starting Firewall"</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp;&nbsp; loadmodules</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp;&nbsp; einfo "Setting default rules to=20
drop"<BR>&nbsp;&nbsp;&nbsp; iptables -F<BR>&nbsp;&nbsp;&nbsp; iptables =
-X=20
<BR>&nbsp;&nbsp;&nbsp; iptables -Z <BR>&nbsp;&nbsp;&nbsp; iptables -F=20
INPUT<BR>&nbsp;&nbsp;&nbsp; iptables -F OUTPUT<BR>&nbsp;&nbsp;&nbsp; =
iptables -F=20
FORWARD</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp;&nbsp; iptables -P FORWARD DROP<BR>&nbsp;&nbsp;&nbsp; =
iptables=20
-P INPUT&nbsp;&nbsp; DROP<BR>&nbsp;&nbsp;&nbsp; iptables -P OUTPUT&nbsp; =

DROP</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp;&nbsp; acceptlocal<BR>&nbsp;&nbsp;&nbsp;=20
portscan<BR>&nbsp;&nbsp;&nbsp; proc<BR>&nbsp;&nbsp;&nbsp;=20
iana<BR>&nbsp;&nbsp;&nbsp; illigalpackages<BR>&nbsp;&nbsp;&nbsp;=20
spoofing<BR>&nbsp;&nbsp;&nbsp; FTP</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp;&nbsp; # set rules<BR>&nbsp;&nbsp;&nbsp;=20
InOutTCP<BR>&nbsp;&nbsp;&nbsp; InTCP<BR>&nbsp;&nbsp;&nbsp;=20
OutTCP<BR>&nbsp;&nbsp;&nbsp; InOutUDP<BR>&nbsp;&nbsp;&nbsp;=20
InUDP<BR>&nbsp;&nbsp;&nbsp; OutUDP</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp;&nbsp; # Erlaube dem Client routen durch NAT (Network =
Address=20
Translation<BR>&nbsp;&nbsp;&nbsp; iptables -t nat -A POSTROUTING -o =
${EXT_INT}=20
-j MASQUERADE<BR>&nbsp;&nbsp;&nbsp; echo "1" &gt;=20
/proc/sys/net/ipv4/ip_forward</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp;&nbsp; eend $? "Failed to start Firewall"<BR>}</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>And here are the ports i allow with the function InOut*, In*,=20
Out*,...</DIV>
<DIV>&nbsp;</DIV>
<DIV># TCP in+out<BR>#<BR>TCP_IN_OUT=3D"ssh 10000 smtp pop3 http =
https"</DIV>
<DIV>&nbsp;</DIV>
<DIV># TCP out<BR>#<BR># 5190 =3D ICQ<BR>#<BR>TCP_OUT=3D"5190 http https =
irc 25 ftp=20
ftp-data"</DIV>
<DIV>&nbsp;</DIV>
<DIV># TCP in<BR>#<BR>TCP_IN=3D""</DIV>
<DIV>&nbsp;</DIV>
<DIV># UDP in+out<BR>#<BR>UDP_IN_OUT=3D"domain ssh 10000 pop3 ssh"</DIV>
<DIV>&nbsp;</DIV>
<DIV># UDP out<BR>#<BR>UDP_OUT=3D"https irc"</DIV>
<DIV>&nbsp;</DIV>
<DIV># UDP in<BR>#<BR>UDP_IN=3D""</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>Oh and here some important functions:</DIV>
<DIV>&nbsp;</DIV>
<DIV>#=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D<BR>InOutTCP()<BR>{<BR>&nbsp;&nbsp;&nbsp;=20
ebegin "Allowing in and outbound TCP-traffic"</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp;&nbsp; for i in ${TCP_IN_OUT}<BR>&nbsp;&nbsp;&nbsp;=20
do<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; einfo "&nbsp;&nbsp; =
&lt;-&gt;=20
Seting TCP "in" and "out" rules for ${i}"</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iptables -A INPUT&nbsp; =
-j=20
ACCEPT -i ${EXT_INT} -p tcp --dport ${i} -m state --state=20
NEW,ESTABLISHED,RELATED<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
iptables=20
-A OUTPUT -j ACCEPT -o ${EXT_INT} -p tcp --sport ${i} --dport 1024: -m =
state=20
--state =
ESTABLISHED,RELATED<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
iptables -A FORWARD&nbsp; -j ACCEPT -i ${EXT_INT} -p tcp --dport ${i} -m =
state=20
--state =
NEW,ESTABLISHED,RELATED<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
iptables -A FORWARD -j ACCEPT -o ${EXT_INT} -p tcp --sport ${i} -m state =
--state=20
ESTABLISHED,RELATED</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iptables -A OUTPUT -j =
ACCEPT -o=20
${EXT_INT} -p tcp --sport 1024: --dport ${i} -m state --state=20
NEW,ESTABLISHED,RELATED<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
iptables=20
-A INPUT&nbsp; -j ACCEPT -i ${EXT_INT} -p tcp --sport ${i} -m state =
--state=20
ESTABLISHED,RELATED<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
iptables -A=20
FORWARD -j ACCEPT -o ${EXT_INT} -p tcp -s ${LAN} --sport 1024: --dport =
${i} -m=20
state --state=20
NEW,ESTABLISHED,RELATED<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
iptables=20
-A FORWARD&nbsp; -j ACCEPT -i ${EXT_INT} -p tcp --sport ${i} -d ${LAN} =
-m state=20
--state ESTABLISHED,RELATED<BR>&nbsp;&nbsp;&nbsp; done</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp;&nbsp; eend $?<BR>}</DIV>
<DIV>&nbsp;</DIV>
<DIV># =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=20
<BR>OutTCP()<BR>{<BR>&nbsp;&nbsp;&nbsp; ebegin "Allowing outbound=20
TCP-traffic"</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp;&nbsp; for i in ${TCP_OUT}<BR>&nbsp;&nbsp;&nbsp;=20
do<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; einfo "&nbsp;&nbsp; =
&lt;-&gt;=20
Seting TCP "out" rules for ${i}"</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iptables -A OUTPUT -j =
ACCEPT -o=20
${EXT_INT} -p tcp --sport 1024: --dport $i -m state --state=20
NEW,ESTABLISHED,RELATED<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
iptables=20
-A INPUT&nbsp; -j ACCEPT -i ${EXT_INT} -p tcp --sport $i -m state =
--state=20
ESTABLISHED,RELATED<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
iptables -A=20
FORWARD -j ACCEPT -o ${EXT_INT} -p tcp -s ${LAN} --sport 1024: --dport =
$i -m=20
state --state=20
NEW,ESTABLISHED,RELATED<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
iptables=20
-A FORWARD&nbsp; -j ACCEPT -i ${EXT_INT} -p tcp --sport $i -d ${LAN} -m =
state=20
--state ESTABLISHED,RELATED<BR>&nbsp;&nbsp;&nbsp; done</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;&nbsp;&nbsp; eend $?<BR>}</DIV>
<DIV>&nbsp;</DIV>
<DIV>I hope somebody can help me.</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks, Christian Gmeiner</DIV>
<DIV>&nbsp;</DIV>
<DIV></FONT>&nbsp;</DIV></FONT></DIV></DIV></FONT></DIV></BODY></HTML>

------=_NextPart_000_001D_01C3DF77.0A7E7DB0--



