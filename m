From: "Nick Vazirianis" <nv1@ozgossip.com>
Subject: port forwarding not working
Date: Thu, 15 Apr 2004 23:57:19 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <004601c422f1$9162a3c0$ce00a8c0@xppro1>
Reply-To: "Nick Vazirianis" <nv1@ozgossip.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0042_01C42345.62D57B50"
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

------=_NextPart_000_0042_01C42345.62D57B50
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_0043_01C42345.62D57B50"


------=_NextPart_001_0043_01C42345.62D57B50
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

iptables v1.2.8
Linux Fedora Core 1
Kernel 2.6.3

I am having some trouble getting port forwarding within the attached =
script.
 Please refer the line starting     # enable port forwarding for =
BitTorrent
Incoming packets to these ports are being dropped (and logged) by the
section lower down in the script, I have tried adding the enable port
 forward section in different parts of the script, but this makes no
difference.
=20
could soneone please help, I even tried adding the line=20
$IPTABLES -A INPUT -i $EXT_IF -p tcp --dport 6881:6885 -j ACCEPT
but i believe this only allows incoming into the firwall and not =
redirecting to another host

someone please help 
------=_NextPart_001_0043_01C42345.62D57B50
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1400" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2><FONT face=3D"Times New Roman" =
size=3D3>iptables=20
v1.2.8</FONT></FONT></DIV>
<DIV>Linux Fedora Core 1</DIV>
<DIV><FONT face=3DArial size=3D2>Kernel 2.6.3</FONT></DIV>
<DIV><FONT face=3DArial size=3D2><FONT face=3DArial =
size=3D2></FONT></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><FONT face=3D"Times New Roman" =
size=3D3>I am having=20
some trouble&nbsp;getting port forwarding within the attached=20
script.<BR>&nbsp;Please refer the line starting&nbsp;&nbsp;&nbsp;&nbsp; =
# enable=20
port forwarding for BitTorrent<BR>Incoming packets to these ports are =
being=20
dropped (and logged) by the<BR>section lower down in the script, I have =
tried=20
adding the enable port<BR>&nbsp;forward section in different parts of =
the=20
script, but this makes no<BR>difference.<BR>&nbsp;</FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>could soneone please help, I even tried =
adding the=20
line </FONT></DIV>
<DIV>$IPTABLES -A INPUT -i $EXT_IF -p tcp --dport 6881:6885 -j =
ACCEPT</DIV>
<DIV>but i believe this only allows incoming into the firwall and not=20
redirecting to another host</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>someone please help =
</FONT></DIV></BODY></HTML>

------=_NextPart_001_0043_01C42345.62D57B50--

------=_NextPart_000_0042_01C42345.62D57B50
Content-Type: text/plain;
	name="rc2.firewall.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="rc2.firewall.txt"

#!/bin/sh
##
## IPTables firewall script for Linux gateway machine
## connected to Telstra Bigpond Advance (Cable).
##
## This firewall script uses stateful inspection to allow packets=20
## in for connections that have already been established.=20
##
## It is possible to tighten up this script a lot more, however
## it is designed to allow most Internet services to be accessable
## from within your network while still providing a good level of
## security for your Linux server and internal network.
##=20
##
## v1.0 20/01/02 - Con Tassios
##
IPTABLES=3D"/sbin/iptables"
MODPROBE=3D"/sbin/modprobe"

# External network interface (BPA)
EXT_IF=3D"eth0"
EXT_IP=3D`/sbin/ifconfig $EXT_IF | grep inet | cut -d: -f2 | cut -d\  =
-f1`

# Internal network interface (LAN)
INT_IF=3D"eth1"
INT_NET=3D"192.168.0.0/24"

XPPRO1=3D"192.168.0.206"

ANY=3D"0.0.0.0/0"

# Filename for incoming/outgoing byte counters
ACCF=3D/var/log/TRAFFIC
LOCK=3D/tmp/TRAFFIC.lck

start() {

    $MODPROBE ip_tables
    $MODPROBE iptable_nat
    $MODPROBE ip_nat_ftp
    $MODPROBE ip_conntrack
    $MODPROBE ip_conntrack_ftp

    # Start firewall rules

    # Set to default values
    reset

    BPA_AUTH_SVR=3D`host dce-server | grep address | cut -f4 -d" "`
=20
    # Get byte counters
    getcounters

    # Set default policy
    $IPTABLES -P INPUT DROP
    $IPTABLES -P FORWARD DROP
    $IPTABLES -P OUTPUT ACCEPT

    #
    # [ TRAF ] Accounting chains
    #
    $IPTABLES -N TRAF-IN
    $IPTABLES -N TRAF-OUT

    #
    # [ INPUT ]
    #
    $IPTABLES -F INPUT

    # Byte counter for incoming traffic
    $IPTABLES -A INPUT -i $EXT_IF -j TRAF-IN -c $X1

    #  Allow BPA heartbeat packets=20
    $IPTABLES -A INPUT -s $BPA_AUTH_SVR -i $EXT_IF -p udp --dport 5050 =
-j ACCEPT

    #  Allow all packets from localhost and internal network
    $IPTABLES -A INPUT -i lo -j ACCEPT
    $IPTABLES -A INPUT -i $INT_IF -j ACCEPT

    #  Allow all packets from these hosts (example)
    #$IPTABLES -A INPUT -s 136.186.1.50 -i $EXT_IF -j ACCEPT

    # HTTP
    # allow all http/https incoming/return connections
    $IPTABLES -A INPUT -i $EXT_IF -p tcp -s 0/0 --sport 80 -m state =
--state ESTABLISHED,RELATED -j ACCEPT
    # $IPTABLES -A INPUT -i $EXT_IF -p tcp -s 0/0 --sport 443 -m state =
--state ESTABLISHED,RELATED -j ACCEPT
    $IPTABLES -A INPUT -i $EXT_IF -p tcp -d 0/0 --dport 80 -j ACCEPT
    # $IPTABLES -A INPUT -i $EXT_IF -p tcp -d 0/0 --dport 443 -j ACCEPT

    # SMTP
    $IPTABLES -A INPUT -i $EXT_IF -p tcp -s 0/0 --sport 25 -m state =
--state ESTABLISHED,RELATED -j ACCEPT
    $IPTABLES -A INPUT -i $EXT_IF -p tcp -d 0/0 --dport 25 -j ACCEPT

    # DAD
    #$IPTABLES -A INPUT -i $EXT_IF -p udp -s 144.132.126.147 -j ACCEPT
    #$IPTABLES -A INPUT -i $EXT_IF -p udp -d 144.132.126.147 -j ACCEPT
    #$IPTABLES -A INPUT -i $EXT_IF -p tcp -s 144.132.126.147 -j ACCEPT
    #$IPTABLES -A INPUT -i $EXT_IF -p tcp -d 144.132.126.147 -j ACCEPT

    #  Stateful inspection - Allow packets in from connections already =
established
    $IPTABLES -A INPUT -i $EXT_IF -m state --state ESTABLISHED,RELATED =
-j ACCEPT

    ##
    ## [ FORWARD ]
    ##

    $IPTABLES -F FORWARD
    $IPTABLES -A FORWARD -i $EXT_IF -o $INT_IF -j TRAF-IN  -c $X3
    $IPTABLES -A FORWARD -i $INT_IF -o $EXT_IF -j TRAF-OUT -c $X4
    $IPTABLES -A FORWARD -i $EXT_IF -o $INT_IF -s $ANY -d $INT_NET -m =
state --state ESTABLISHED,RELATED -j ACCEPT
    $IPTABLES -A FORWARD -i $INT_IF -d $ANY -j ACCEPT

    #$IPTABLES -A FORWARD -j LOG --log-prefix "netfilter: "

    ##
    ## [ OUTPUT ]
    ##
   =20
    # Byte counter for outgoing traffic
    $IPTABLES -A OUTPUT -o $EXT_IF -j TRAF-OUT -c $X2

    ##
    ## [ NAT ]
    ##
    $IPTABLES -F -t nat
    $IPTABLES -t nat -F POSTROUTING
    #$IPTABLES -t nat -A POSTROUTING -o $EXT_IF -s $INT_NET -j SNAT =
--to-source $EXT_IP
    #$IPTABLES -t nat -A POSTROUTING -o $EXT_IF -s $INT_NET -j =
MASQUERADE
iptables -t nat -A POSTROUTING -o eth0 -s 192.168.0/24 -j MASQUERADE=20

    # enable port forwarding for BitTorrent
    $IPTABLES -t nat -A PREROUTING -i $EXT_IF -p tcp --dport 6881 -j =
DNAT --to-destination 192.168.0.206:6881=20
    $IPTABLES -A FORWARD -s 6881 -p tcp --dport 6881 -j ACCEPT
    $IPTABLES -t nat -A PREROUTING -i $EXT_IF -p tcp --dport 6882 -j =
DNAT --to-destination 192.168.0.206:6882
    $IPTABLES -A FORWARD -s 6882 -p tcp --dport 6882 -j ACCEPT
    $IPTABLES -t nat -A PREROUTING -i $EXT_IF -p tcp --dport 6883 -j =
DNAT --to-destination 192.168.0.206:6883=20
    $IPTABLES -A FORWARD -s 6883 -p tcp --dport 6883 -j ACCEPT
    $IPTABLES -t nat -A PREROUTING -i $EXT_IF -p tcp --dport 6884 -j =
DNAT --to-destination 192.168.0.206:6884=20
    $IPTABLES -A FORWARD -s 6884 -p tcp --dport 6884 -j ACCEPT
    $IPTABLES -t nat -A PREROUTING -i $EXT_IF -p tcp --dport 6885 -j =
DNAT --to-destination 192.168.0.206:6885=20
    $IPTABLES -A FORWARD -s 6885 -p tcp --dport 6885 -j ACCEPT
       =20

    ##
    ## Transparent proxy - Uncomment this to forward HTTP traffic on =
port 80 to Squid=20
    ##
    #$IPTABLES -t nat -A PREROUTING -i $INT_IF -p tcp --dport 80 -j =
REDIRECT --to-port 3128

    #  DROP packets from invalid source
    $IPTABLES -A INPUT -i $EXT_IF -s 10.0.0.0/8 -j DROP
    $IPTABLES -A INPUT -i $EXT_IF -s 172.16.0.0/12 -j DROP
    $IPTABLES -A INPUT -i $EXT_IF -s 192.168.0.0/16 -j DROP
    $IPTABLES -A INPUT -i $EXT_IF -s 169.254.0.0/16 -j DROP

    #  LOG and DENY everything else
    #$IPTABLES -A INPUT -i $EXT_IF -j LOG --log-prefix "netfilter: "
    # UDP, log & drop
    iptables -A INPUT -i $EXT_IF -p udp -j LOG --log-level debug =
--log-prefix "IPTABLES UDP-IN: "
    iptables -A INPUT -i $EXT_IF -p udp -j DROP
    # ICMP, log & drop
    iptables -A INPUT -i $EXT_IF -p icmp -j LOG --log-level debug =
--log-prefix "IPTABLES ICMP-IN: "
    iptables -A INPUT -i $EXT_IF -p icmp -j DROP
    # Windows NetBIOS noise, log & drop
    iptables -A INPUT -i $EXT_IF -p tcp -s 0/0 --sport 137:139 -j LOG =
--log-level debug --log-prefix "IPTABLES NETBIOS-IN: "
    iptables -A INPUT -i $EXT_IF -p tcp -s 0/0 --sport 137:139 -j DROP
    # IGMP noise, log & drop
    iptables -A INPUT -i $EXT_IF -p 2 -j LOG --log-level debug =
--log-prefix "IPTABLES IGMP-IN: "
    iptables -A INPUT -i $EXT_IF -p 2 -j DROP
    # TCP, log & drop
    iptables -A INPUT -i $EXT_IF -p tcp -j LOG --log-level debug =
--log-prefix "IPTABLES TCP-IN: "
    iptables -A INPUT -i $EXT_IF -p tcp -j DROP
    # Anything else not allowed, log & drop
    iptables -A INPUT -i $EXT_IF -j LOG --log-level debug --log-prefix =
"IPTABLES UNKNOWN-IN: "
    iptables -A INPUT -i $EXT_IF -j DROP


}

getcounters() {
    X1=3D"0 0"
    X2=3D"0 0"
    X3=3D"0 0"
    X4=3D"0 0"
    if [ -s $ACCF ]; then
       X1=3D`grep INPUT    $ACCF | cut -d" " -f2,3`
       X2=3D`grep OUTPUT   $ACCF | cut -d" " -f2,3`
       X3=3D`grep FORW-IN  $ACCF | cut -d" " -f2,3`
       X4=3D`grep FORW-OUT $ACCF | cut -d" " -f2,3`
    fi
}

# Save byte counters
save() {
    # Save iptables rules and accounting information
    lockfile -l300 -r5 $LOCK >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        X=3D`$IPTABLES -nL | wc -l | sed "s/ //g"`
        if [ $X -gt "8" ]; then=20
           $IPTABLES -nvxL INPUT   | grep TRAF-IN  | awk '{print "INPUT =
"   $1" "$2}' > $ACCF
           $IPTABLES -nvxL OUTPUT  | grep TRAF-OUT | awk '{print "OUTPUT =
"  $1" "$2}' >>$ACCF
           $IPTABLES -nvxL FORWARD | grep TRAF-IN  | awk '{print =
"FORW-IN " $1" "$2}' >>$ACCF
           $IPTABLES -nvxL FORWARD | grep TRAF-OUT | awk '{print =
"FORW-OUT "$1" "$2}' >>$ACCF
        fi
        rm -f $LOCK
    fi
}

reset() {
    # Reset to default values
    $IPTABLES -P INPUT ACCEPT
    $IPTABLES -P FORWARD ACCEPT
    $IPTABLES -P OUTPUT ACCEPT

    $IPTABLES -t nat -P PREROUTING ACCEPT
    $IPTABLES -t nat -P POSTROUTING ACCEPT
    $IPTABLES -t nat -P OUTPUT ACCEPT

    $IPTABLES -t mangle -P PREROUTING ACCEPT
    $IPTABLES -t mangle -P OUTPUT ACCEPT

    $IPTABLES -F
    $IPTABLES -t nat -F
    $IPTABLES -t mangle -F

    $IPTABLES -X
    $IPTABLES -t nat -X
    $IPTABLES -t mangle -X
}

stop() {
    save
    reset
}

# DROP all packets from external interface, allow from internal network
lock() {
    reset
    getcounters
    $IPTABLES -N TRAF-IN
    $IPTABLES -N TRAF-OUT
    $IPTABLES -A INPUT -i $EXT_IF -j TRAF-IN -c $X1
    $IPTABLES -A INPUT -i lo -j ACCEPT
    $IPTABLES -A INPUT -i $INT_IF -j ACCEPT
    $IPTABLES -A INPUT -j DROP
}

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    save)
        save
        ;;
    lock)
	lock
        ;;
    restart)
        stop
        start
        ;;
    *)
    echo $"Usage: $0 {start|stop|save|lock|restart}"
esac
exit


------=_NextPart_000_0042_01C42345.62D57B50--


