From: Jonathan Humphrey <jhumphrey@codemasters.com>
Subject: Today's Brain Teaser.
Date: Wed, 12 Mar 2003 08:35:34 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4D613EBFB75BD6118A5B00508BEEC62C0111CBBF@JESS>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_000_01C2E872.594E8D92"
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

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_000_01C2E872.594E8D92
Content-Type: multipart/alternative; boundary="----_=_NextPart_001_01C2E872.594E8D92"


------_=_NextPart_001_01C2E872.594E8D92
Content-Type: text/plain; charset="iso-8859-1"

I've been struggling with this one for some time, i am currently at the end
of my teather so if anyone has any great ideas about why this happens let me
know.
 
Basically, i have a linux server that has three interfaces;
 
    eth1          aaa.aaa.aaa.202        External Facing network
    eth0          bbb.bbb.bbb.254        Internal protected network
    eth1:0       aaa.aaa.aaa.197        External IP Address for FTPServer
 
I have a device that sits on xxx.xxx.xxx.5 that cannot get to any service on
aaa.aaa.aaa.197, however every other ip address i have tried can.  I suspect
that if i release the real ip address of aaa.aaa.aaa.197 then everyone
reading this list could too.
 
And it's on the .5 address, if i try from xxx.xxx.xxx.15 i can connect.
 
Nothing is being show as dropped in the logs either.    
 
Thanks,
 
Jonathan Humphrey
 


**********************************************************************
This email and any files transmitted with it are confidential and
intended solely for the use of the individual or entity to whom they
are addressed. If you have received this email in error please notify
the system manager.

This footnote also confirms that this email message has been swept by
MIMEsweeper for the presence of computer viruses.

**********************************************************************


------_=_NextPart_001_01C2E872.594E8D92
Content-Type: text/html; charset="iso-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">


<META content="MSHTML 6.00.2800.1041" name=GENERATOR></HEAD>
<BODY>
<DIV><FONT face=Arial size=2><SPAN class=093242808-12032003>I've been struggling 
with this one for some time, i am currently at the end of my teather so if 
anyone has any great ideas about why this happens let me 
know.</SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN 
class=093242808-12032003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2><SPAN class=093242808-12032003>Basically, i have a 
linux server that has three interfaces;</SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN 
class=093242808-12032003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2><SPAN class=093242808-12032003>&nbsp;&nbsp;&nbsp; 
eth1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
aaa.aaa.aaa.202&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; External Facing 
network</SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN class=093242808-12032003>&nbsp;&nbsp;&nbsp; 
eth0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
bbb.bbb.bbb.254&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Internal protected 
network</SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN class=093242808-12032003>&nbsp;&nbsp;&nbsp; 
eth1:0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
aaa.aaa.aaa.197&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; External IP Address 
for FTPServer</SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN 
class=093242808-12032003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2><SPAN class=093242808-12032003>I have a device that 
sits on xxx.xxx.xxx.5 that cannot get to any service on aaa.aaa.aaa.197, however 
every other ip address i have tried can.&nbsp; I suspect that if i release the 
real ip address of aaa.aaa.aaa.197 then everyone reading this list could 
too.</SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN 
class=093242808-12032003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2><SPAN class=093242808-12032003>And it's on the .5 
address, if i try from&nbsp;xxx.xxx.xxx.15 i can connect.</SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2><SPAN 
class=093242808-12032003></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2><SPAN class=093242808-12032003>Nothing is being 
show as dropped in the logs either.&nbsp;&nbsp;&nbsp; </SPAN></FONT></DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>Thanks,</FONT></DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV>
<DIV><FONT face=Arial size=2>Jonathan Humphrey</FONT></DIV>
<DIV><FONT face=Arial size=2></FONT>&nbsp;</DIV><CODE><FONT SIZE=3><BR>
<BR>
**********************************************************************<BR>
This email and any files transmitted with it are confidential and<BR>
intended solely for the use of the individual or entity to whom they<BR>
are addressed. If you have received this email in error please notify<BR>
the system manager.<BR>
<BR>
This footnote also confirms that this email message has been swept by<BR>
MIMEsweeper for the presence of computer viruses.<BR>
<BR>
**********************************************************************<BR>
</FONT></CODE>
</BODY></HTML>

------_=_NextPart_001_01C2E872.594E8D92--

------_=_NextPart_000_01C2E872.594E8D92
Content-Type: application/octet-stream;
	name="public_2_5"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="public_2_5"

#!/bin/sh=0A=
#=0A=
=0A=
# Scripts Settings=0A=
VERBOSE=3D1		# Allows for Debug Checking=0A=
=0A=
########################################################################=
####=0A=
# Assignments=0A=
[ $VERBOSE -gt 0 ] && echo "Assignments"=0A=
########################################################################=
####=0A=
=0A=
# Change these assignments to conform to your network architecture=0A=
# Weed unneeded variables=0A=
=0A=
EXTDEV=3Deth1=0A=
EXTIP=3D"aaa.aaa.aaa.202"=0A=
EXTBASE=3D"aaa.aaa.aaa.192"=0A=
EXTBCAST=3D"aaa.aaa.aaa.240"=0A=
EXTGATE=3D"aaa.aaa.aaa.193"=0A=
=0A=
# FTPSERVER's External IP Address=0A=
EXTIP_FTPSERVER=3D"aaa.aaa.aaa.197"=0A=
=0A=
# Trusted Network Info=0A=
=0A=
INTDEV=3Deth0=0A=
INTIP=3D"bbb.bbb.bbb.254"=0A=
INTBASE=3D"bbb.bbb.bbb.0"=0A=
INTBCAST=3D"bbb.bbb.bbb.255"=0A=
INTNET=3D"bbb.bbb.bbb.0/24"=0A=
=0A=
# IP addresses of hosts and networks authorized to ping firewall=0A=
PING=3D"xxx.xxx.xxx.0/24 $INTNET 127.0.0.1"=0A=
=0A=
# IP addresses of hosts and networks allowed to SSH into firewall=0A=
SSH=3D"xxx.xxx.xxx.5 bbb.bbb.bbb.200"=0A=
=0A=
# IP addresses of hosts and networks allowed to FTP into firewall=0A=
FTP=3D"xxx.xxx.xxx.5"=0A=
=0A=
# IP addresses of hosts and networks allowed to use firewall as SMTP =
relay=0A=
SMTP=3D"xxx.xxx.xxx.5"=0A=
=0A=
# IP addresses of hosts on protected network allowed all port access=0A=
PORTALL=3D"bbb.bbb.bbb.200"=0A=
=0A=
# IP addresses of hosts on protected network allowed port 21 access =
(ftp)=0A=
PORT21=3D""=0A=
=0A=
# IP addresses of hosts on protected network  allowed port 22 access =
(ssh)=0A=
PORT22=3D""=0A=
=0A=
# IP addresses of hosts on protected network  allowed port 25 access =
(smtp)=0A=
PORT25=3D""=0A=
=0A=
# IP addresses of hosts on protected network  allowed port 53 access =
(domain)=0A=
PORT53=3D""=0A=
=0A=
# IP addresses of hosts on protected network  allowed port 80 access =
(http)=0A=
PORT80=3D""=0A=
=0A=
# IP addresses of hosts on protected network  allowed port 443 access =
(https)=0A=
PORT443=3D""=0A=
=0A=
# IP addresses of hosts and networks not to be communicated with.=0A=
SHUN=3D""=0A=
=0A=
# The following assignments should not generally need to be changed=0A=
=0A=
BADIP=3D"$EXTBASE $EXTBCAST $INTBASE $INTBCAST 0.0.0.0/8 10.0.0.0/8 =
127.0.0.0/8 169.254.0.0/16 172.16.0.0/12 192.0.2.0/24 224.0.0.0/4 =
240.0.0.0/5 255.255.255.255"=0A=
=0A=
IPT=3D/sbin/iptables=0A=
=0A=
LOGOPT=3D"--log-level=3Dinfo -m limit --limit 3/minute --limit-burst =
3"=0A=
=0A=
SYNOPT=3D"-m limit --limit 5/second --limit-burst 10"=0A=
=0A=
########################################################################=
####=0A=
# Server Specifc Setings=0A=
########################################################################=
####=0A=
=0A=
# FTPSERVER - External Development FTP Site=0A=
=0A=
FTPSERVEREXT=3D"$EXTIP_FTPSERVER"=0A=
FTPSERVERINT=3D"bbb.bbb.bbb.200"=0A=
=0A=
# Shophie should be allowed to FTP access in from any Host=0A=
# and VNC traffice from codie's address only=0A=
=0A=
FTPSERVERFTP=3D"Yes"=0A=
=0A=
FTPSERVERVNC=3D"RESTRICTED"=0A=
FTPSERVERVNCSRV=3D"xxx.xxx.xxx.5 xxx.xxx.xxx.15"=0A=
=0A=
########################################################################=
####=0A=
# Clear the existing firewall rules=0A=
[ $VERBOSE -gt 0 ] && echo "Clear the existing firewall rules"=0A=
########################################################################=
####=0A=
=0A=
if [ ! -x $IPTABLES ]=0A=
then=0A=
	die "firewall : can't execute $IPTABLES"=0A=
fi=0A=
=0A=
$IPT -P INPUT DROP		#	Set default policy to DROP=0A=
$IPT -P OUTPUT DROP		#	Set default policy to DROP=0A=
$IPT -P FORWARD DROP		#	Set default policy to DROP=0A=
$IPT -F				#	Flush all chains=0A=
$IPT -X				#	Delete all chains=0A=
=0A=
for table in filter nat mangle=0A=
do=0A=
	$IPT -t $table -F	#	Delete the table's rules=0A=
	$IPT -t $table -X	#	Delete the table's chains=0A=
	$IPT -t $table -Z	#	Zero the table's counters=0A=
done=0A=
=0A=
########################################################################=
####=0A=
# Bad TCP Flags=0A=
[ $VERBOSE -gt 0 ] && echo "Bad TCP Flags"=0A=
########################################################################=
####=0A=
=0A=
$IPT -N BADFLAGS=0A=
$IPT -A BADFLAGS -j LOG --log-prefix "IPT BADFLAGS: " $LOGOPT=0A=
$IPT -A BADFLAGS -j DROP=0A=
=0A=
########################################################################=
####=0A=
# TCP Flag Validation=0A=
[ $VERBOSE -gt 0 ] && echo "TCP Flag Validation"=0A=
########################################################################=
####=0A=
=0A=
$IPT -N TCP_FLAGS=0A=
$IPT -A TCP_FLAGS -p tcp --tcp-flags ACK,FIN FIN		-j BADFLAGS=0A=
$IPT -A TCP_FLAGS -p tcp --tcp-flags ACK,PSH PSH		-j BADFLAGS=0A=
$IPT -A TCP_FLAGS -p tcp --tcp-flags ACK,URG URG		-j BADFLAGS=0A=
$IPT -A TCP_FLAGS -p tcp --tcp-flags FIN,RST FIN,RST		-j BADFLAGS=0A=
$IPT -A TCP_FLAGS -p tcp --tcp-flags SYN,FIN SYN,FIN		-j BADFLAGS=0A=
$IPT -A TCP_FLAGS -p tcp --tcp-flags SYN,RST SYN,RST		-j BADFLAGS=0A=
$IPT -A TCP_FLAGS -p tcp --tcp-flags ALL ALL			-j BADFLAGS=0A=
$IPT -A TCP_FLAGS -p tcp --tcp-flags ALL NONE			-j BADFLAGS=0A=
$IPT -A TCP_FLAGS -p tcp --tcp-flags ALL FIN,PSH,URG		-j BADFLAGS=0A=
$IPT -A TCP_FLAGS -p tcp --tcp-flags ALL SYN,FIN,PSH,URG	-j BADFLAGS=0A=
$IPT -A TCP_FLAGS -p tcp --tcp-flags ALL SYN,RST,ACK,FIN,URG	-j =
BADFLAGS=0A=
=0A=
########################################################################=
####=0A=
# SYN Flood Protection=0A=
[ $VERBOSE -gt 0 ] && echo "SYN Flood Protection"=0A=
########################################################################=
####=0A=
=0A=
$IPT -N SYN_FLOOD=0A=
$IPT -A SYN_FLOOD	-p   tcp	--syn $SYNOPT		-j RETURN=0A=
$IPT -A SYN_FLOOD	-p ! tcp				-j RETURN=0A=
$IPT -A SYN_FLOOD	-p   tcp	! --syn			-j RETURN=0A=
$IPT -A SYN_FLOOD -j LOG --log-prefix "IPT SYN_FLOOD: " $LOGOPT=0A=
$IPT -A SYN_FLOOD -j DROP=0A=
=0A=
########################################################################=
####=0A=
# Bad IP Chain=0A=
[ $VERBOSE -gt 0 ] && echo "Bad IP Chain"=0A=
########################################################################=
####=0A=
=0A=
$IPT -N BAD_IP=0A=
$IPT -A BAD_IP -j LOG --log-prefix "IPT BAD-IP: " $LOGOPT=0A=
$IPT -A BAD_IP -j DROP=0A=
=0A=
########################################################################=
###=0A=
# Shunned Hosts=0A=
[ $VERBOSE -gt 0 ] && echo "Shunned Hosts"=0A=
########################################################################=
####=0A=
=0A=
$IPT -N SHUN=0A=
for ip in $SHUN; do=0A=
	$IPT -A SHUN -s $ip -j BAD_IP=0A=
	$IPT -A SHUN -d $ip -j BAD_IP=0A=
done=0A=
=0A=
########################################################################=
####=0A=
# Inbound IP Checks=0A=
[ $VERBOSE -gt 0 ] && echo "Inbound IP Checks"=0A=
########################################################################=
####=0A=
=0A=
$IPT -N IN_IP_CHECK=0A=
for sip in $BADIP; do=0A=
	$IPT -A IN_IP_CHECK -s $sip -j BAD_IP=0A=
done=0A=
=0A=
$IPT -A IN_IP_CHECK -i $EXTDEV -s $EXTIP -j BAD_IP=0A=
$IPT -A IN_IP_CHECK -i $EXTDEV -s $EXTIP_FTPSERVER -j BAD_IP=0A=
$IPT -A IN_IP_CHECK -i $EXTDEV -s $INTNET -j BAD_IP=0A=
$IPT -A IN_IP_CHECK -i $INTDEV -s $EXTIP -j BAD_IP=0A=
$IPT -A IN_IP_CHECK -i $INTDEV -s $EXTIP_FTPSERVER -j BAD_IP=0A=
=0A=
=0A=
########################################################################=
####=0A=
# Outbound IP Checks=0A=
[ $VERBOSE -gt 0 ] && echo "Outbound IP Checks"=0A=
########################################################################=
####=0A=
=0A=
$IPT -N OUT_IP_CHECK=0A=
for dip in $BADIP=0A=
do=0A=
	$IPT -A OUT_IP_CHECK -d $dip -j BAD_IP=0A=
done=0A=
=0A=
$IPT -A OUT_IP_CHECK -o $EXTDEV -s $EXTIP -j RETURN=0A=
$IPT -A OUT_IP_CHECK -o $EXTDEV -s $EXTIP_FTPSERVER -j RETURN=0A=
$IPT -A OUT_IP_CHECK -o $INTDEV -s $INTIP -j RETURN=0A=
$IPT -A OUT_IP_CHECK -j BAD_IP=0A=
=0A=
########################################################################=
####=0A=
# Inbound ICMP=0A=
[ $VERBOSE -gt 0 ] && echo "Inbound ICMP"=0A=
########################################################################=
####=0A=
=0A=
$IPT -N IN_ICMP=0A=
for sip in $PING; do=0A=
	$IPT -A IN_ICMP -p icmp --icmp-type echo-request -s $sip -j ACCEPT=0A=
	$IPT -A IN_ICMP -p icmp --icmp-type echo-reply -s $sip -j ACCEPT=0A=
done=0A=
=0A=
$IPT -A IN_ICMP -p icmp --icmp-type destination-unreachable -j =
ACCEPT=0A=
$IPT -A IN_ICMP -p icmp --icmp-type source-quench -j ACCEPT=0A=
$IPT -A IN_ICMP -p icmp --icmp-type time-exceeded -j ACCEPT=0A=
$IPT -A IN_ICMP -p icmp --icmp-type parameter-problem -j ACCEPT=0A=
$IPT -A IN_ICMP -j LOG --log-prefix "IPT In ICMP: " $LOGOPT=0A=
$IPT -A IN_ICMP -j DROP=0A=
=0A=
########################################################################=
####=0A=
# Outbound ICMP=0A=
[ $VERBOSE -gt 0 ] && echo "Outbound ICMP"=0A=
########################################################################=
####=0A=
=0A=
$IPT -N OUT_ICMP=0A=
for dip in $PING; do=0A=
	$IPT -A OUT_ICMP -p icmp --icmp-type echo-request -d $dip -j ACCEPT=0A=
	$IPT -A OUT_ICMP -p icmp --icmp-type echo-reply -d $dip -j ACCEPT=0A=
done=0A=
=0A=
# For a less courteous -- but potentially more secure -- firewall.=0A=
# replace destination-unreachable by fragmentation-needed in the=0A=
# following rule.=0A=
=0A=
$IPT -A OUT_ICMP -p icmp --icmp-type destination-unreachable -j =
ACCEPT=0A=
$IPT -A OUT_ICMP -p icmp --icmp-type source-quench -j ACCEPT=0A=
=0A=
# For a less courteous -- but potentially more secure -- firewall.=0A=
# delete the following parameter-problem rule.=0A=
=0A=
$IPT -A OUT_ICMP -p icmp --icmp-type parameter-problem -j ACCEPT=0A=
$IPT -A OUT_ICMP -j LOG --log-prefix "IPT Out ICMP: " $LOGOPT=0A=
$IPT -A OUT_ICMP -j DROP=0A=
=0A=
########################################################################=
####=0A=
# Destination NAT=0A=
[ $VERBOSE -gt 0 ] && echo "Destination NAT"=0A=
########################################################################=
####=0A=
=0A=
case $FTPSERVERFTP in=0A=
	YES|Yes|RESTRICTED|RES*|Res*|res*)=0A=
	$IPT -t nat -A PREROUTING -p tcp -d $EXTIP_FTPSERVER --dport ftp -j =
DNAT --to-destination $FTPSERVERINT=0A=
	$IPT -t nat -A PREROUTING -p tcp -d $EXTIP_FTPSERVER --dport ftp-data =
-j DNAT --to-destination $FTPSERVERINT=0A=
	;;=0A=
esac=0A=
=0A=
case $FTPSERVERVNC in=0A=
	YES|Yes|RESTRICTED|RES*|Res*|res*)=0A=
	$IPT -t nat -A PREROUTING -p tcp -d $EXTIP_FTPSERVER --dport 5900 -j =
DNAT --to-destination $FTPSERVERINT=0A=
	$IPT -t nat -A PREROUTING -p tcp -d $EXTIP_FTPSERVER --dport 5800:5899 =
-j DNAT --to-destination $FTPSERVERINT=0A=
	;;=0A=
esac=0A=
=0A=
########################################################################=
####=0A=
# Source NAT=0A=
[ $VERBOSE -gt 0 ] && echo "Source NAT"=0A=
########################################################################=
####=0A=
=0A=
$IPT -t nat -A POSTROUTING -s $FTPSERVERINT -o $EXTDEV -j SNAT =
--to-source $FTPSERVEREXT=0A=
$IPT -t nat -A POSTROUTING -s $INTNET -o $EXTDEV -j SNAT --to-source =
$EXTIP=0A=
=0A=
########################################################################=
####=0A=
# Inbound traffic to protected network=0A=
[ $VERBOSE -gt 0 ] && echo "Inbound traffic to protected network"=0A=
########################################################################=
####=0A=
=0A=
$IPT -N IN_NETWORK=0A=
$IPT -A IN_NETWORK -p icmp -j IN_ICMP=0A=
$IPT -A IN_NETWORK -p tcp -j TCP_FLAGS=0A=
$IPT -A IN_NETWORK -p tcp --syn -j SYN_FLOOD=0A=
$IPT -A IN_NETWORK -p tcp -m state --state ESTABLISHED,RELATED -j =
ACCEPT=0A=
$IPT -A IN_NETWORK -p udp -m state --state ESTABLISHED,RELATED -j =
ACCEPT=0A=
=0A=
case $FTPSERVERFTP in=0A=
	YES|Yes|Y*|y*)=0A=
	$IPT -A IN_NETWORK -p tcp --syn -d $FTPSERVERINT --dport ftp -j =
ACCEPT=0A=
	[ $VERBOSE -gt 0 ] && echo -e "\tAdding non restrictive FTPSERVER FTP =
Rules"=0A=
	;;=0A=
	RESTRICTED|RES*|Res*|res*)=0A=
	for sip in $FTPSERVERFTPSRV=0A=
	do=0A=
		$IPT -A IN_NETWORK -p tcp --syn -s $sip -d $FTPSERVERINT --dport ftp =
-j ACCEPT=0A=
		[ $VERBOSE -gt 0 ] && echo -e "\tAdding $sip restrictive FTPSERVER =
FTP Rules"=0A=
	done=0A=
	;;=0A=
esac=0A=
=0A=
case $FTPSERVERVNC in=0A=
	YES|Yes|Y*|y*)=0A=
	$IPT -A IN_NETWORK -i $EXTDEV -p tcp --syn -d $FTPSERVERINT --dport =
5900 -j ACCEPT=0A=
	$IPT -A IN_NETWORK -i $EXTDEV -p tcp --syn -d $FTPSERVERINT --dport =
5800:5899 -j ACCEPT=0A=
	[ $VERBOSE -gt 0 ] && echo -e "\tAdding non restrictive VNC rules"=0A=
	;;=0A=
	RESTRICTED|RES*|Res*|res*)=0A=
	for sip in $FTPSERVERVNCSRV=0A=
	do=0A=
		$IPT -A IN_NETWORK -i $EXTDEV -p tcp --syn -s $sip -d $FTPSERVERINT =
--dport 5900 -j ACCEPT=0A=
		$IPT -A IN_NETWORK -i $EXTDEV -p tcp --syn -s $sip -d $FTPSERVERINT =
--dport 5800:5899 -j ACCEPT=0A=
		[ $VERBOSE -gt 0 ] && echo -e "\tAdding $sip restrictive VNC =
rules"=0A=
	done=0A=
	;;=0A=
esac=0A=
=0A=
=0A=
########################################################################=
####=0A=
# Outbound traffic from protected network=0A=
[ $VERBOSE -gt 0 ] && echo "Outbound traffic from protected network"=0A=
########################################################################=
####=0A=
=0A=
$IPT -N OUT_NETWORK=0A=
$IPT -A OUT_NETWORK -p icmp -j OUT_ICMP=0A=
$IPT -A OUT_NETWORK -p tcp -j TCP_FLAGS=0A=
$IPT -A OUT_NETWORK -m state --state ESTABLISHED,RELATED -j ACCEPT=0A=
=0A=
# The following six rules enable clients running on the protected =
network=0A=
# to connect to remote servers. Add and delete rules to customize =
the=0A=
# authorized services.=0A=
=0A=
for dip in $PORTALL; do=0A=
	$IPT -A OUT_NETWORK -s $dip -m state --state NEW -j ACCEPT=0A=
done=0A=
=0A=
for dip in $PORT21; do=0A=
	$IPT -A OUT_NETWORK -s $dip -m state --state NEW -p tcp --dport 21 -j =
ACCEPT	#	ftp=0A=
done=0A=
=0A=
for dip in $PORT22; do=0A=
	$IPT -A OUT_NETWORK -s $dip -m state --state NEW -p tcp --dport 22 -j =
ACCEPT	#	ssh=0A=
done=0A=
=0A=
for dip in $PORT25; do=0A=
	$IPT -A OUT_NETWORK -s $dip -m state --state NEW -p tcp --dport 25 -j =
ACCEPT	#	smtp=0A=
done=0A=
=0A=
for dip in $PORT80; do=0A=
	$IPT -A OUT_NETWORK -s $dip -m state --state NEW -p tcp --dport 80 -j =
ACCEPT	#	http=0A=
done=0A=
=0A=
for dip in $PORT443; do=0A=
	$IPT -A OUT_NETWORK -s $dip -m state --state NEW -p tcp --dport 443 -j =
ACCEPT	#	https=0A=
done=0A=
=0A=
for dip in $PORT53; do=0A=
	$IPT -A OUT_NETWORK -s $dip -m state --state NEW -p udp --dport 53 -j =
ACCEPT	#	domain=0A=
done=0A=
=0A=
########################################################################=
####=0A=
# Inbound traffic to firewall host=0A=
[ $VERBOSE -gt 0 ] && echo "Inbound traffic to firewall host"=0A=
########################################################################=
####=0A=
=0A=
$IPT -N IN_FIREWALL=0A=
$IPT -A IN_FIREWALL -p icmp -j IN_ICMP=0A=
$IPT -A IN_FIREWALL -p tcp -j TCP_FLAGS=0A=
$IPT -A IN_FIREWALL -p tcp --syn -j SYN_FLOOD=0A=
$IPT -A IN_FIREWALL -j IN_IP_CHECK=0A=
$IPT -A IN_FIREWALL -m state --state ESTABLISHED,RELATED -j ACCEPT=0A=
$IPT -A IN_FIREWALL -m state --state ESTABLISHED,RELATED -j ACCEPT=0A=
=0A=
for sip in $SSH=0A=
do=0A=
	$IPT -A IN_FIREWALL -p tcp -s $sip --dport 22 -m state --state NEW -j =
ACCEPT=0A=
done=0A=
=0A=
for sip in $FTP=0A=
do=0A=
	$IPT -A IN_FIREWALL -p tcp -s $sip --dport 21 -m state --state NEW -j =
ACCEPT=0A=
done=0A=
=0A=
for sip in $SMTP=0A=
do=0A=
	$IPT -A IN_FIREWALL -p tcp -s $sip --dport 25 -m state --state NEW -j =
ACCEPT=0A=
done=0A=
=0A=
#=0A=
# Add additional rules authorizing traffic inbound to firewall=0A=
# host here.=0A=
#=0A=
# $IPT -A IN_FIREWALL -i $INTDEV -o $EXTDEV -j ACCEPT=0A=
=0A=
$IPT -A IN_FIREWALL -j LOG --log-prefix "IPT IN_FIREWALL: " $LOGOPT=0A=
$IPT -A IN_FIREWALL -j DROP=0A=
=0A=
########################################################################=
####=0A=
# Outbound traffic from firewall host=0A=
[ $VERBOSE -gt 0 ] && echo "Outbound traffic from firewall host"=0A=
########################################################################=
####=0A=
=0A=
$IPT -N OUT_FIREWALL=0A=
$IPT -A OUT_FIREWALL -p icmp -j OUT_ICMP=0A=
$IPT -A OUT_FIREWALL -p tcp -j TCP_FLAGS=0A=
$IPT -A OUT_FIREWALL -m state --state ESTABLISHED,RELATED -j ACCEPT=0A=
$IPT -A OUT_FIREWALL -j OUT_IP_CHECK=0A=
#=0A=
# The following six rules enable clients running on the firewall host =
to=0A=
# connect to remote servers. Add and delete rules to customize the=0A=
# authorized services .=0A=
#=0A=
$IPT -A OUT_FIREWALL -m state --state NEW -p tcp --dport 21 -j ACCEPT	#	=
ftp=0A=
$IPT -A OUT_FIREWALL -m state --state NEW -p tcp --dport 22 -j ACCEPT	#	=
ssh=0A=
$IPT -A OUT_FIREWALL -m state --state NEW -p tcp --dport 25 -j ACCEPT	#	=
smtp=0A=
# $IPT -A OUT_FIREWALL -m state --state NEW -p tcp --dport 80 -j ACCEPT	=
#	http=0A=
# $IPT -A OUT_FIREWALL -m state --state NEW -p tcp --dport 443 -j =
ACCEPT	#	https=0A=
=0A=
$IPT -A OUT_FIREWALL -m state --state NEW -p udp --dport 53 -j ACCEPT	#	=
domain=0A=
=0A=
$IPT -A OUT_FIREWALL -j LOG --log-prefix "IPT OUT_FIREWALL: " =
$LOGOPT=0A=
=0A=
########################################################################=
####=0A=
# Main Firewall Rules=0A=
[ $VERBOSE -gt 0 ] && echo "Main Firewall Rules"=0A=
########################################################################=
####=0A=
=0A=
$IPT -A FORWARD 		-j SHUN=0A=
$IPT -A FORWARD -i $EXTDEV	-j IN_NETWORK=0A=
$IPT -A FORWARD -i $INTDEV	-j OUT_NETWORK=0A=
$IPT -A FORWARD			-j LOG --log-prefix "IPT FORWARD: " $LOGOPT=0A=
$IPT -A FORWARD			-j DROP=0A=
=0A=
$IPT -A INPUT 			-j SHUN=0A=
$IPT -A INPUT -i lo		-j ACCEPT=0A=
$IPT -A INPUT			-j IN_FIREWALL=0A=
$IPT -A INPUT			-j LOG --log-prefix "IPT INPUT: " $LOGOPT=0A=
$IPT -A INPUT			-j DROP=0A=
=0A=
$IPT -A OUTPUT			-j SHUN=0A=
$IPT -A OUTPUT -o lo 		-j ACCEPT=0A=
$IPT -A OUTPUT 			-j OUT_FIREWALL=0A=
$IPT -A OUTPUT 			-j LOG --log-prefix "IPT OUTPUT: " $LOGOPT=0A=
$IPT -A OUTPUT 			-j DROP=0A=
=0A=
=0A=
=0A=
=0A=
=0A=

------_=_NextPart_000_01C2E872.594E8D92--

