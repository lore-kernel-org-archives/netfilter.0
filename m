From: "Christian Gmeiner" <christian@visual-page.de>
Subject: Fw: Problem with connection-tracking and FTP
Date: Thu, 22 Jan 2004 10:21:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003801c3e0c9$28d100a0$0600a8c0@blackbox>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0035_01C3E0D1.89E77560"
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
To: Iptables Netlist <netfilter@lists.netfilter.org>

This is a multi-part message in MIME format.

------=_NextPart_000_0035_01C3E0D1.89E77560
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


----- Original Message -----=20
From: Christian Gmeiner=20
To: markee@bandwidthco.com=20
Sent: Thursday, January 22, 2004 9:17 AM
Subject: Re: Problem with connection-tracking and FTP


Hmm... this is the output of lsmod:

x-factor root # lsmod
Module                  Size  Used by    Not tainted
ipt_MASQUERADE          1496   2  (autoclean)
ipt_state                568 130  (autoclean)
ipt_unclean             7320   2  (autoclean)
ipt_LOG                 3448   6  (autoclean)
ipt_limit                984   6  (autoclean)
ipt_ULOG                3656   1
ip_conntrack_ftp        4016   0  (unused)
iptable_filter          1740   1
ppp_deflate             3288   0  (autoclean)
zlib_inflate           18820   0  (autoclean) [ppp_deflate]
zlib_deflate           18872   0  (autoclean) [ppp_deflate]
bsd_comp                4248   0  (autoclean)
ppp_async               7008   1  (autoclean)
iptable_nat            18648   1  [ipt_MASQUERADE]
ip_conntrack           20776   3  [ipt_MASQUERADE ipt_state =
ip_conntrack_ftp iptable_nat]
ip_tables              12352  10  [ipt_MASQUERADE ipt_state ipt_unclean =
ipt_LOG ipt_limit ipt_ULOG iptable_filter iptable_nat]
8139too                15784   1
mii                     2608   0  [8139too]
3c59x                  27792   1

This seems to be ok?!

Greets, Christian

----- Original Message -----=20
  From: Mark E. Donaldson=20
  To: 'Christian Gmeiner' ; netfilter@lists.netfilter.org=20
  Sent: Thursday, January 22, 2004 3:12 AM
  Subject: RE: Problem with connection-tracking and FTP


  Yes.  That would help.  Also do an lsmod to make sure all of the =
needed modules are loaded.



-------------------------------------------------------------------------=
-----
  From: Christian Gmeiner [mailto:christian@visual-page.de]=20
  Sent: Wednesday, January 21, 2004 3:58 AM
  To: markee@bandwidthco.com; netfilter@lists.netfilter.org
  Subject: Re: Problem with connection-tracking and FTP


  Thanks... I have now used your rule set:

      # CONTROL PORT (Active & Passive Mode)
      iptables -A INPUT -i ${EXT_INT} -p tcp --source-port =
${UNPRIVPORTS} --destination-port 21 -m state --state NEW -j LOG =
--log-prefix "FTP ACCESS -> "
      iptables -A INPUT -i ${EXT_INT} -p tcp --source-port =
${UNPRIVPORTS} --destination-port 21 -m state --state NEW -j ACCEPT
  =20
      # DATA PORT (Active Mode)
      iptables -A OUTPUT -o ${EXT_INT} -p tcp --source-port 20 =
--destination-port ${UNPRIVPORTS} -m state --state NEW -j LOG  =
--log-prefix "FTP A-DATA -> "
      iptables -A OUTPUT -o ${EXT_INT} -p tcp --source-port 20 =
--destination-port ${UNPRIVPORTS} -m state --state NEW -j ACCEPT
  =20
      # DATA PORT (Passive Mode)
      iptables -A INPUT -i ${EXT_INT} -p tcp --source-port =
${UNPRIVPORTS} --destination-port ${UNPRIVPORTS} -m state --state NEW -j =
LOG --log-prefix "FTP P-DATA -> "
      iptables -A INPUT -i ${EXT_INT} -p tcp --source-port =
${UNPRIVPORTS} --destination-port ${UNPRIVPORTS} -m state --state NEW -j =
ACCEPT

  I can connect to the FTP-Server and login... but then wehen the =
directory listening should come it hangs. I have no idea, why this is =
so.
  Should i post the output of 'iptables -L -n -v --line-numbers'?

  Thanks, Christian Gmeiner

    ----- Original Message -----=20
    From: Mark E. Donaldson=20
    To: 'Christian Gmeiner' ; netfilter@lists.netfilter.org=20
    Sent: Wednesday, January 21, 2004 6:32 AM
    Subject: RE: Problem with connection-tracking and FTP


    It would appear you are assuming the FTP server will choose port =
1024 for passive mode ftp.  This is not correct, as it may choose any =
unprivileged port up to 65535.  That is one problem you are having.  =
Also, check your syntax for "passive mode".  You have made an error with =
some not needed colons (:).
    Here is a good rule set that will permit all ftp operations - active =
and passive:

    ######################
    # FTP SERVICES
    ######################
    UNPRIVPORTS=3D"1024:65535"

    # CONTROL PORT (Active & Passive Mode)
    $IPT -t filter -A TCP_RULES -i $FW_INET_IFACE -p tcp --source-port =
$UNPRIVPORTS --destination-port 21 -m state --state NEW -j LOG =
--log-level $LOG_LEVEL --log-prefix "FTP ACCESS -> "

    $IPT -t filter -A TCP_RULES -i $FW_INET_IFACE -p tcp --source-port =
$UNPRIVPORTS --destination-port 21 -m state --state NEW -j ACCEPT

    # DATA PORT (Active Mode)
    $IPT -t filter -A TCP_RULES -o $FW_INET_IFACE -p tcp --source-port =
20 --destination-port $UNPRIVPORTS -m state --state NEW -j LOG =
--log-level $LOG_LEVEL --log-prefix "FTP A-DATA -> "

    $IPT -t filter -A TCP_RULES -o $FW_INET_IFACE -p tcp --source-port =
20 --destination-port $UNPRIVPORTS -m state --state NEW -j ACCEPT

    # DATA PORT (Passive Mode)
    $IPT -t filter -A TCP_RULES -i $FW_INET_IFACE -p tcp --source-port =
$UNPRIVPORTS --destination-port $UNPRIVPORTS -m state --state NEW -j LOG =
--log-level $LOG_LEVEL --log-prefix "FTP P-DATA -> "

    $IPT -t filter -A TCP_RULES -i $FW_INET_IFACE -p tcp --source-port =
$UNPRIVPORTS --destination-port $UNPRIVPORTS -m state --state NEW -j =
ACCEPT




-------------------------------------------------------------------------=
---
    From: netfilter-admin@lists.netfilter.org =
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Christian =
Gmeiner
    Sent: Tuesday, January 20, 2004 8:01 AM
    To: netfilter@lists.netfilter.org
    Subject: Problem with connection-tracking and FTP


    Hi everybody.

    I am working on a little firewall script. Everything works just =
fine, but i dont get the ftp protocoll working.

    I call this two function to get ftp working:

    # =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
    FTP()
    {
        ebegin "Seting rules for active/passive FTP"

        # Port 21

        iptables -A INPUT     -p tcp --sport 21 -m state --state =
ESTABLISHED -j ACCEPT=20
        iptables -A OUTPUT -p tcp --dport 21 -m state --state =
NEW,ESTABLISHED -j ACCEPT=20

        # aktiv
        iptables -A INPUT     -p tcp --sport 20 -m state --state =
ESTABLISHED,RELATED -j ACCEPT=20
        iptables -A OUTPUT -p tcp --dport 20 -m state --state =
ESTABLISHED -j ACCEPT=20

        # passiv
        iptables -A INPUT     -p tcp --sport 1024: --dport 1024:  -m =
state --state ESTABLISHED -j ACCEPT=20
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

        # Erlaube dem Client routen durch NAT (Network Address =
Translation
        iptables -t nat -A POSTROUTING -o ${EXT_INT} -j MASQUERADE
        echo "1" > /proc/sys/net/ipv4/ip_forward

        eend $? "Failed to start Firewall"
    }


    And here are the ports i allow with the function InOut*, In*, =
Out*,...

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

            iptables -A INPUT  -j ACCEPT -i ${EXT_INT} -p tcp --dport =
${i} -m state --state NEW,ESTABLISHED,RELATED
            iptables -A OUTPUT -j ACCEPT -o ${EXT_INT} -p tcp --sport =
${i} --dport 1024: -m state --state ESTABLISHED,RELATED
            iptables -A FORWARD  -j ACCEPT -i ${EXT_INT} -p tcp --dport =
${i} -m state --state NEW,ESTABLISHED,RELATED
            iptables -A FORWARD -j ACCEPT -o ${EXT_INT} -p tcp --sport =
${i} -m state --state ESTABLISHED,RELATED

            iptables -A OUTPUT -j ACCEPT -o ${EXT_INT} -p tcp --sport =
1024: --dport ${i} -m state --state NEW,ESTABLISHED,RELATED
            iptables -A INPUT  -j ACCEPT -i ${EXT_INT} -p tcp --sport =
${i} -m state --state ESTABLISHED,RELATED
            iptables -A FORWARD -j ACCEPT -o ${EXT_INT} -p tcp -s ${LAN} =
--sport 1024: --dport ${i} -m state --state NEW,ESTABLISHED,RELATED
            iptables -A FORWARD  -j ACCEPT -i ${EXT_INT} -p tcp --sport =
${i} -d ${LAN} -m state --state ESTABLISHED,RELATED
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

            iptables -A OUTPUT -j ACCEPT -o ${EXT_INT} -p tcp --sport =
1024: --dport $i -m state --state NEW,ESTABLISHED,RELATED
            iptables -A INPUT  -j ACCEPT -i ${EXT_INT} -p tcp --sport $i =
-m state --state ESTABLISHED,RELATED
            iptables -A FORWARD -j ACCEPT -o ${EXT_INT} -p tcp -s ${LAN} =
--sport 1024: --dport $i -m state --state NEW,ESTABLISHED,RELATED
            iptables -A FORWARD  -j ACCEPT -i ${EXT_INT} -p tcp --sport =
$i -d ${LAN} -m state --state ESTABLISHED,RELATED
        done

        eend $?
    }

    I hope somebody can help me.

    Thanks, Christian Gmeiner


------=_NextPart_000_0035_01C3E0D1.89E77560
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
<DIV>&nbsp;</DIV>
<DIV style=3D"FONT: 10pt arial">----- Original Message -----=20
<DIV style=3D"BACKGROUND: #e4e4e4; font-color: black"><B>From:</B> <A=20
title=3Dchristian@visual-page.de =
href=3D"mailto:christian@visual-page.de">Christian=20
Gmeiner</A> </DIV>
<DIV><B>To:</B> <A title=3Dmarkee@bandwidthco.com=20
href=3D"mailto:markee@bandwidthco.com">markee@bandwidthco.com</A> </DIV>
<DIV><B>Sent:</B> Thursday, January 22, 2004 9:17 AM</DIV>
<DIV><B>Subject:</B> Re: Problem with connection-tracking and =
FTP</DIV></DIV>
<DIV><BR></DIV>
<DIV><FONT face=3DArial size=3D2>Hmm... this is the output of =
lsmod:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>x-factor root #=20
lsmod<BR>Module&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
Size&nbsp; Used by&nbsp;&nbsp;&nbsp; Not=20
tainted<BR>ipt_MASQUERADE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;=20
1496&nbsp;&nbsp; 2&nbsp;=20
(autoclean)<BR>ipt_state&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
568 130&nbsp;=20
(autoclean)<BR>ipt_unclean&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;=20
7320&nbsp;&nbsp; 2&nbsp;=20
(autoclean)<BR>ipt_LOG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
3448&nbsp;&nbsp; 6&nbsp;=20
(autoclean)<BR>ipt_limit&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
984&nbsp;&nbsp; 6&nbsp;=20
(autoclean)<BR>ipt_ULOG&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
3656&nbsp;&nbsp; =
1<BR>ip_conntrack_ftp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
4016&nbsp;&nbsp; 0&nbsp;=20
(unused)<BR>iptable_filter&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
1740&nbsp;&nbsp;=20
1<BR>ppp_deflate&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
3288&nbsp;&nbsp; 0&nbsp;=20
(autoclean)<BR>zlib_inflate&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;=20
18820&nbsp;&nbsp; 0&nbsp; (autoclean)=20
[ppp_deflate]<BR>zlib_deflate&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;=20
18872&nbsp;&nbsp; 0&nbsp; (autoclean)=20
[ppp_deflate]<BR>bsd_comp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
4248&nbsp;&nbsp; 0&nbsp;=20
(autoclean)<BR>ppp_async&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
7008&nbsp;&nbsp; 1&nbsp;=20
(autoclean)<BR>iptable_nat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
18648&nbsp;&nbsp; 1&nbsp;=20
[ipt_MASQUERADE]<BR>ip_conntrack&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
20776&nbsp;&nbsp; 3&nbsp; [ipt_MASQUERADE ipt_state ip_conntrack_ftp=20
iptable_nat]<BR>ip_tables&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
12352&nbsp; 10&nbsp; [ipt_MASQUERADE ipt_state ipt_unclean ipt_LOG =
ipt_limit=20
ipt_ULOG iptable_filter=20
iptable_nat]<BR>8139too&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
15784&nbsp;&nbsp;=20
1<BR>mii&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
2608&nbsp;&nbsp; 0&nbsp;=20
[8139too]<BR>3c59x&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
27792&nbsp;&nbsp; 1<BR></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>This seems to be ok?!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Greets, Christian</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;</DIV></FONT>
<DIV>----- Original Message ----- </DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Dmarkee@bandwidthco.com =
href=3D"mailto:markee@bandwidthco.com">Mark E.=20
  Donaldson</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A =
title=3Dchristian@visual-page.de=20
  href=3D"mailto:christian@visual-page.de">'Christian Gmeiner'</A> ; <A=20
  title=3Dnetfilter@lists.netfilter.org=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
  </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Thursday, January 22, =
2004 3:12=20
  AM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> RE: Problem with=20
  connection-tracking and FTP</DIV>
  <DIV><BR></DIV>
  <DIV dir=3Dltr align=3Dleft><SPAN class=3D031271202-22012004><FONT =
face=3DArial=20
  color=3D#0000ff size=3D2>Yes.&nbsp; That would help.&nbsp; Also do an =
lsmod to=20
  make sure all of the needed modules are =
loaded.</FONT></SPAN></DIV><BR>
  <DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr align=3Dleft>
  <HR tabIndex=3D-1>
  <FONT face=3DTahoma size=3D2><B>From:</B> Christian Gmeiner=20
  [mailto:christian@visual-page.de] <BR><B>Sent:</B> Wednesday, January =
21, 2004=20
  3:58 AM<BR><B>To:</B> <A=20
  href=3D"mailto:markee@bandwidthco.com">markee@bandwidthco.com</A>; <A=20
  =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A><BR><B>Subject:</B>=20
  Re: Problem with connection-tracking and FTP<BR></FONT><BR></DIV>
  <DIV></DIV>
  <DIV><FONT face=3DArial size=3D2>Thanks... I have now used your rule=20
  set:</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; # CONTROL PORT =
(Active &amp;=20
  Passive Mode)<BR>&nbsp;&nbsp;&nbsp; iptables -A INPUT -i ${EXT_INT} -p =
tcp=20
  --source-port ${UNPRIVPORTS} --destination-port 21 -m state --state =
NEW -j LOG=20
  --log-prefix "FTP ACCESS -&gt; "<BR>&nbsp;&nbsp;&nbsp; iptables -A =
INPUT -i=20
  ${EXT_INT} -p tcp --source-port ${UNPRIVPORTS} --destination-port 21 =
-m state=20
  --state NEW -j ACCEPT<BR>&nbsp;<BR>&nbsp;&nbsp;&nbsp; # DATA PORT =
(Active=20
  Mode)<BR>&nbsp;&nbsp;&nbsp; iptables -A OUTPUT -o ${EXT_INT} -p tcp=20
  --source-port 20 --destination-port ${UNPRIVPORTS} -m state --state =
NEW -j=20
  LOG&nbsp; --log-prefix "FTP A-DATA -&gt; "<BR>&nbsp;&nbsp;&nbsp; =
iptables -A=20
  OUTPUT -o ${EXT_INT} -p tcp --source-port 20 --destination-port =
${UNPRIVPORTS}=20
  -m state --state NEW -j ACCEPT<BR>&nbsp;<BR>&nbsp;&nbsp;&nbsp; # DATA =
PORT=20
  (Passive Mode)<BR>&nbsp;&nbsp;&nbsp; iptables -A INPUT -i ${EXT_INT} =
-p tcp=20
  --source-port ${UNPRIVPORTS} --destination-port ${UNPRIVPORTS} -m =
state=20
  --state NEW -j LOG --log-prefix "FTP P-DATA -&gt; =
"<BR>&nbsp;&nbsp;&nbsp;=20
  iptables -A INPUT -i ${EXT_INT} -p tcp --source-port ${UNPRIVPORTS}=20
  --destination-port ${UNPRIVPORTS} -m state --state NEW -j =
ACCEPT</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>I can connect to the FTP-Server and =
login... but=20
  then wehen the directory listening should come it hangs. I have no =
idea, why=20
  this is so.</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>Should i post the output =
of&nbsp;'iptables -L -n=20
  -v --line-numbers'?</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <DIV><FONT face=3DArial size=3D2>Thanks, Christian =
Gmeiner</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
  <BLOCKQUOTE dir=3Dltr=20
  style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
    <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
    <DIV=20
    style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
    <A title=3Dmarkee@bandwidthco.com =
href=3D"mailto:markee@bandwidthco.com">Mark E.=20
    Donaldson</A> </DIV>
    <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A =
title=3Dchristian@visual-page.de=20
    href=3D"mailto:christian@visual-page.de">'Christian Gmeiner'</A> ; =
<A=20
    title=3Dnetfilter@lists.netfilter.org=20
    =
href=3D"mailto:netfilter@lists.netfilter.org">netfilter@lists.netfilter.o=
rg</A>=20
    </DIV>
    <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Wednesday, January 21, =
2004 6:32=20
    AM</DIV>
    <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> RE: Problem with=20
    connection-tracking and FTP</DIV>
    <DIV><BR></DIV>
    <DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2><SPAN=20
    class=3D961412305-21012004>It would appear you are assuming the FTP =
server=20
    will choose port 1024 for passive mode ftp.&nbsp; This is not =
correct, as it=20
    may choose any unprivileged port up to 65535.&nbsp; That is one =
problem you=20
    are having.&nbsp; Also, check your syntax for "passive mode".&nbsp; =
You have=20
    made an error with some not needed colons (:).</SPAN></FONT></DIV>
    <DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2><SPAN=20
    class=3D961412305-21012004>Here is a good rule set that will permit =
all ftp=20
    operations - active and passive:</SPAN></FONT></DIV>
    <DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff=20
    size=3D2></FONT>&nbsp;</DIV>
    <DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff=20
    size=3D2>######################<BR># FTP=20
    SERVICES<BR>######################</FONT></DIV>
    <DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff=20
    size=3D2>UNPRIVPORTS=3D"1024:65535"</FONT></DIV>
    <DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff=20
    size=3D2></FONT>&nbsp;</DIV>
    <DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2># CONTROL PORT=20
    (Active &amp; Passive Mode)</DIV></FONT>
    <DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2>$IPT -t filter=20
    -A TCP_RULES -i $FW_INET_IFACE -p tcp --source-port $UNPRIVPORTS=20
    --destination-port 21 -m state --state NEW -j LOG --log-level =
$LOG_LEVEL=20
    --log-prefix "FTP ACCESS -&gt; "<BR></DIV></FONT>
    <DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2>$IPT -t filter=20
    -A TCP_RULES -i $FW_INET_IFACE -p tcp --source-port $UNPRIVPORTS=20
    --destination-port 21 -m state --state NEW -j ACCEPT</FONT></DIV>
    <DIV>&nbsp;</DIV>
    <DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2># DATA PORT=20
    (Active Mode)<BR>$IPT -t filter -A TCP_RULES -o $FW_INET_IFACE -p =
tcp=20
    --source-port 20 --destination-port $UNPRIVPORTS -m state --state =
NEW -j LOG=20
    --log-level $LOG_LEVEL --log-prefix "FTP A-DATA -&gt; =
"<BR></FONT></DIV>
    <DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2>$IPT -t filter=20
    -A TCP_RULES -o $FW_INET_IFACE -p tcp --source-port 20 =
--destination-port=20
    $UNPRIVPORTS -m state --state NEW -j ACCEPT</FONT></DIV>
    <DIV>&nbsp;</DIV>
    <DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2># DATA PORT=20
    (Passive Mode)<BR>$IPT -t filter -A TCP_RULES -i $FW_INET_IFACE -p =
tcp=20
    --source-port $UNPRIVPORTS --destination-port $UNPRIVPORTS -m state =
--state=20
    NEW -j LOG --log-level $LOG_LEVEL --log-prefix "FTP P-DATA -&gt;=20
    "<BR></FONT></DIV>
    <DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2>$IPT -t filter=20
    -A TCP_RULES -i $FW_INET_IFACE -p tcp --source-port $UNPRIVPORTS=20
    --destination-port $UNPRIVPORTS -m state --state NEW -j=20
    ACCEPT<BR></DIV></FONT><BR>
    <DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr =
align=3Dleft>
    <HR tabIndex=3D-1>
    <FONT face=3DTahoma size=3D2><B>From:</B> =
netfilter-admin@lists.netfilter.org=20
    [mailto:netfilter-admin@lists.netfilter.org] <B>On Behalf Of =
</B>Christian=20
    Gmeiner<BR><B>Sent:</B> Tuesday, January 20, 2004 8:01 =
AM<BR><B>To:</B>=20
    netfilter@lists.netfilter.org<BR><B>Subject:</B> Problem with=20
    connection-tracking and FTP<BR></FONT><BR></DIV>
    <DIV></DIV>
    <DIV><FONT face=3DArial size=3D2>
    <DIV><FONT face=3DArial size=3D2>Hi everybody.</FONT></DIV>
    <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
    <DIV><FONT face=3DArial size=3D2>I am working on a little firewall =
script.=20
    Everything works just fine, but i dont get the ftp protocoll=20
    working.</FONT></DIV>
    <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
    <DIV><FONT face=3DArial size=3D2>I call this two function to get ftp =

    working:</FONT></DIV>
    <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
    <DIV>
    <DIV><FONT face=3DArial size=3D2>
    <DIV><FONT face=3DArial size=3D2>#=20
    =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D<BR>FTP()<BR>{<BR>&nbsp;&nbsp;&nbsp;=20
    ebegin "Seting rules for active/passive FTP"</FONT></DIV>
    <DIV>&nbsp;</DIV>
    <DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; # Port =
21</FONT></DIV>
    <DIV>&nbsp;</DIV>
    <DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; iptables -A=20
    INPUT&nbsp;&nbsp;&nbsp;&nbsp; -p tcp --sport 21 -m state --state =
ESTABLISHED=20
    -j ACCEPT <BR>&nbsp;&nbsp;&nbsp; iptables -A OUTPUT -p tcp --dport =
21 -m=20
    state --state NEW,ESTABLISHED -j ACCEPT </FONT></DIV>
    <DIV>&nbsp;</DIV>
    <DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; #=20
    aktiv<BR>&nbsp;&nbsp;&nbsp; iptables -A =
INPUT&nbsp;&nbsp;&nbsp;&nbsp; -p tcp=20
    --sport 20 -m state --state ESTABLISHED,RELATED -j ACCEPT=20
    <BR>&nbsp;&nbsp;&nbsp; iptables -A OUTPUT -p tcp --dport 20 -m state =
--state=20
    ESTABLISHED -j ACCEPT </FONT></DIV>
    <DIV>&nbsp;</DIV>
    <DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; #=20
    passiv<BR>&nbsp;&nbsp;&nbsp; iptables -A =
INPUT&nbsp;&nbsp;&nbsp;&nbsp; -p=20
    tcp --sport 1024: --dport 1024:&nbsp; -m state --state ESTABLISHED =
-j ACCEPT=20
    <BR>&nbsp;&nbsp;&nbsp; iptables -A OUTPUT -p tcp --sport 1024: =
--dport=20
    1024:&nbsp; -m state --state ESTABLISHED,RELATED -j ACCEPT =
</FONT></DIV>
    <DIV>&nbsp;</DIV>
    <DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; eend =
$?<BR>}</FONT></DIV>
    <DIV>&nbsp;</DIV><FONT face=3DArial size=3D2>
    <DIV><BR>#=20
    =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D<BR>loadmodules()<BR>{<BR>&nbsp;&nbsp;&nbsp;=20
    ebegin "Try to load needed modules"</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>&nbsp;&nbsp;&nbsp; /sbin/modprobe =
ip_tables<BR>&nbsp;&nbsp;&nbsp;=20
    /sbin/modprobe iptable_filter<BR>&nbsp;&nbsp;&nbsp; /sbin/modprobe=20
    ip_conntrack<BR>&nbsp;&nbsp;&nbsp; /sbin/modprobe=20
    ip_conntrack_ftp<BR>&nbsp;&nbsp;&nbsp; /sbin/modprobe=20
    ipt_ULOG<BR>&nbsp;&nbsp;&nbsp; eend $?<BR>}</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>An here my start function</DIV>
    <DIV># =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D<BR>start()=20
    <BR>{<BR>&nbsp;&nbsp;&nbsp; ebegin "Starting Firewall"</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>&nbsp;&nbsp;&nbsp; loadmodules</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>&nbsp;&nbsp;&nbsp; einfo "Setting default rules to=20
    drop"<BR>&nbsp;&nbsp;&nbsp; iptables -F<BR>&nbsp;&nbsp;&nbsp; =
iptables -X=20
    <BR>&nbsp;&nbsp;&nbsp; iptables -Z <BR>&nbsp;&nbsp;&nbsp; iptables =
-F=20
    INPUT<BR>&nbsp;&nbsp;&nbsp; iptables -F OUTPUT<BR>&nbsp;&nbsp;&nbsp; =

    iptables -F FORWARD</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>&nbsp;&nbsp;&nbsp; iptables -P FORWARD =
DROP<BR>&nbsp;&nbsp;&nbsp;=20
    iptables -P INPUT&nbsp;&nbsp; DROP<BR>&nbsp;&nbsp;&nbsp; iptables -P =

    OUTPUT&nbsp; DROP</DIV>
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
    <DIV>&nbsp;&nbsp;&nbsp; # Erlaube dem Client routen durch NAT =
(Network=20
    Address Translation<BR>&nbsp;&nbsp;&nbsp; iptables -t nat -A =
POSTROUTING -o=20
    ${EXT_INT} -j MASQUERADE<BR>&nbsp;&nbsp;&nbsp; echo "1" &gt;=20
    /proc/sys/net/ipv4/ip_forward</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>&nbsp;&nbsp;&nbsp; eend $? "Failed to start =
Firewall"<BR>}</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>And here are the ports i allow with the function InOut*, In*,=20
    Out*,...</DIV>
    <DIV>&nbsp;</DIV>
    <DIV># TCP in+out<BR>#<BR>TCP_IN_OUT=3D"ssh 10000 smtp pop3 http =
https"</DIV>
    <DIV>&nbsp;</DIV>
    <DIV># TCP out<BR>#<BR># 5190 =3D ICQ<BR>#<BR>TCP_OUT=3D"5190 http =
https irc 25=20
    ftp ftp-data"</DIV>
    <DIV>&nbsp;</DIV>
    <DIV># TCP in<BR>#<BR>TCP_IN=3D""</DIV>
    <DIV>&nbsp;</DIV>
    <DIV># UDP in+out<BR>#<BR>UDP_IN_OUT=3D"domain ssh 10000 pop3 =
ssh"</DIV>
    <DIV>&nbsp;</DIV>
    <DIV># UDP out<BR>#<BR>UDP_OUT=3D"https irc"</DIV>
    <DIV>&nbsp;</DIV>
    <DIV># UDP in<BR>#<BR>UDP_IN=3D""</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>Oh and here some important functions:</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>#=20
    =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D<BR>InOutTCP()<BR>{<BR>&nbsp;&nbsp;&nbsp;=20
    ebegin "Allowing in and outbound TCP-traffic"</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>&nbsp;&nbsp;&nbsp; for i in ${TCP_IN_OUT}<BR>&nbsp;&nbsp;&nbsp; =

    do<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; einfo "&nbsp;&nbsp; =

    &lt;-&gt; Seting TCP "in" and "out" rules for ${i}"</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iptables -A =
INPUT&nbsp; -j=20
    ACCEPT -i ${EXT_INT} -p tcp --dport ${i} -m state --state=20
    =
NEW,ESTABLISHED,RELATED<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    iptables -A OUTPUT -j ACCEPT -o ${EXT_INT} -p tcp --sport ${i} =
--dport 1024:=20
    -m state --state=20
    ESTABLISHED,RELATED<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
iptables=20
    -A FORWARD&nbsp; -j ACCEPT -i ${EXT_INT} -p tcp --dport ${i} -m =
state=20
    --state=20
    =
NEW,ESTABLISHED,RELATED<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    iptables -A FORWARD -j ACCEPT -o ${EXT_INT} -p tcp --sport ${i} -m =
state=20
    --state ESTABLISHED,RELATED</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iptables -A OUTPUT =
-j ACCEPT=20
    -o ${EXT_INT} -p tcp --sport 1024: --dport ${i} -m state --state=20
    =
NEW,ESTABLISHED,RELATED<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    iptables -A INPUT&nbsp; -j ACCEPT -i ${EXT_INT} -p tcp --sport ${i} =
-m state=20
    --state =
ESTABLISHED,RELATED<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    iptables -A FORWARD -j ACCEPT -o ${EXT_INT} -p tcp -s ${LAN} --sport =
1024:=20
    --dport ${i} -m state --state=20
    =
NEW,ESTABLISHED,RELATED<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    iptables -A FORWARD&nbsp; -j ACCEPT -i ${EXT_INT} -p tcp --sport =
${i} -d=20
    ${LAN} -m state --state ESTABLISHED,RELATED<BR>&nbsp;&nbsp;&nbsp; =
done</DIV>
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

    &lt;-&gt; Seting TCP "out" rules for ${i}"</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; iptables -A OUTPUT =
-j ACCEPT=20
    -o ${EXT_INT} -p tcp --sport 1024: --dport $i -m state --state=20
    =
NEW,ESTABLISHED,RELATED<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    iptables -A INPUT&nbsp; -j ACCEPT -i ${EXT_INT} -p tcp --sport $i -m =
state=20
    --state =
ESTABLISHED,RELATED<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    iptables -A FORWARD -j ACCEPT -o ${EXT_INT} -p tcp -s ${LAN} --sport =
1024:=20
    --dport $i -m state --state=20
    =
NEW,ESTABLISHED,RELATED<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
    iptables -A FORWARD&nbsp; -j ACCEPT -i ${EXT_INT} -p tcp --sport $i =
-d=20
    ${LAN} -m state --state ESTABLISHED,RELATED<BR>&nbsp;&nbsp;&nbsp; =
done</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>&nbsp;&nbsp;&nbsp; eend $?<BR>}</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>I hope somebody can help me.</DIV>
    <DIV>&nbsp;</DIV>
    <DIV>Thanks, Christian Gmeiner</DIV>
    <DIV>&nbsp;</DIV>
    =
<DIV></FONT>&nbsp;</DIV></FONT></DIV></DIV></FONT></DIV></BLOCKQUOTE></BL=
OCKQUOTE></BODY></HTML>

------=_NextPart_000_0035_01C3E0D1.89E77560--



