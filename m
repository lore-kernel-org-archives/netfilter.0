From: "david" <david@aid.inf.cu>
Subject: Fw: I need help , please
Date: Fri, 5 Jul 2002 10:01:26 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <004f01c223fa$2957c7d0$8703000a@aid.inf.cu>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_004B_01C2240A.ECC806C0"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: mimom@rcn.com, George Vieira <GeorgeV@citadelcomputer.com.au>, "jesse.linux" <jdelima@inq7.net>
Cc: netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_004B_01C2240A.ECC806C0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_001_004C_01C2240A.ECC806C0"


------=_NextPart_001_004C_01C2240A.ECC806C0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi:

George and Jesse:

Here i am sending you all that I have done:
KERNEL
Enable loadble modulo support   Y
Network packet Filtering  Y
IP netfilter configuration   Y
IP table support   Y

everything else as modules.

make bzImage
make modules
make modules_Install
reboot
uname -a
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

chkconfig --level 0123456 ipchains off
/etc/rc.d/init.d/ipchains stop
chkconfig --level 2345 iptables on
/etc/rc.d/init.d/iptables start
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D

Here are my script (/etc/rc.d/init.d/iptables) and the errors.

david

Thanks to all of you

------=_NextPart_001_004C_01C2240A.ECC806C0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2920.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi:</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>George and Jesse:</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Here i am sending you all that I have=20
done:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>KERNEL</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Enable loadble modulo =
support&nbsp;&nbsp;=20
Y</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Network packet Filtering&nbsp; =
Y</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>IP netfilter configuration&nbsp;&nbsp;=20
Y</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>IP table support&nbsp;&nbsp; =
Y</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>everything else as =
modules.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>make bzImage</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>make modules</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>make modules_Install</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>reboot</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>uname -a</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>chkconfig --level 0123456 ipchains =
off</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>/etc/rc.d/init.d/ipchains =
stop</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>chkconfig --level 2345 iptables =
on</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>/etc/rc.d/init.d/iptables =
start</FONT></DIV>
<DIV>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D</DIV>
<DIV>&nbsp;</DIV>
<DIV>Here are my script (/etc/rc.d/init.d/iptables) and the =
errors.</DIV>
<DIV>&nbsp;</DIV>
<DIV>david</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks to all of you</DIV></FONT></DIV></BODY></HTML>

------=_NextPart_001_004C_01C2240A.ECC806C0--

------=_NextPart_000_004B_01C2240A.ECC806C0
Content-Type: text/plain;
	name="iptables.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="iptables.txt"

=20
#!/bin/sh

#

# Startup script to implement /etc/sysconfig/iptables pre-defined rules.

#

# chkconfig: 2345 08 92

#

# description: Automates a packet filtering firewall with iptables.

#

# by bero@redhat.com, based on the ipchains script:

# Script Author:      Joshua Jensen <joshua@redhat.com>

#   -- hacked up by gafton with help from notting

# modified by Anton Altaparmakov <aia21@cam.ac.uk>:

# modified by Nils Philippsen <nils@redhat.de>

#

# config: /etc/sysconfig/iptables

=20

# Source 'em up

. /etc/init.d/functions

=20

IPTABLES_CONFIG=3D/etc/sysconfig/iptables

=20

if [ ! -x /sbin/iptables ]; then

      exit 0

fi

=20

KERNELMAJ=3D`uname -r | sed                   -e 's,\..*,,'`

KERNELMIN=3D`uname -r | sed -e 's,[^\.]*\.,,' -e 's,\..*,,'`

=20

if [ "$KERNELMAJ" -lt 2 ] ; then

      exit 0

fi

if [ "$KERNELMAJ" -eq 2 -a "$KERNELMIN" -lt 3 ] ; then

      exit 0

fi

=20

=20

=20

if  /sbin/lsmod 2>/dev/null |grep -q ipchains ; then

      # Don't do both

      exit 0

fi

=20

start() {

      # don't do squat if we don't have the config file

      if [ -f $IPTABLES_CONFIG ]; then

          # If we don't clear these first, we might be adding to

          #  pre-existing rules.

          action $"Flushing all current rules and user defined chains:" =
iptables -F

          action $"Clearing all current rules and user defined chains:" =
iptables -X

          chains=3D`cat /proc/net/ip_tables_names 2>/dev/null`

            for i in $chains; do iptables -t $i -F; done && \

              success $"Flushing all current rules and user defined =
chains:" || \

              failure $"Flushing all current rules and user defined =
chains:"       =20

            for i in $chains; do iptables -t $i -X; done && \

              success $"Clearing all current rules and user defined =
chains:" || \

              failure $"Clearing all current rules and user defined =
chains:"

=20

            for i in $chains; do iptables -t $i -Z; done

=20

          echo $"Applying iptables firewall rules: "

            grep -v "^[[:space:]]*#" $IPTABLES_CONFIG | grep -v =
'^[[:space:]]*$' | /sbin/iptables-restore -c && \

                success $"Applying iptables firewall rules" || \

                failure $"Applying iptables firewall rules"

          echo

          touch /var/lock/subsys/iptables

      fi

     =20

     =20

# =
-------------------------------------------------------------------------=
---


#  Some definitions for easy maintenance.


#  EDIT THESE TO SUIT YOUR SYSTEM AND ISP.


# Este script posee la definiicon de=20


# Local_iNTERFACE,intranet=20


# PERO NO POSEE LA DEFINICION DEL SMTP SERVER


IPADDR=3D"169.158.129.23/27"


EXTERNAL_INTERFACE=3D"eth0"                       # Internet connected =
interface


LOOPBACK_INTERFACE=3D"lo"                         # Your local naming =
convention


LOCAL_INTERFACE_1=3D"eth1"                        # Your Internal LAN =
interface


INTRANET=3D"10.0.0.0/16"                           # Your Private IP =
Addr Range


PRIMARY_NAMESERVER=3D"169.158.129.23/27"           # Your Primary Name =
Server


SECONDARY_NAMESERVER=3D"169.158.129.33/27"         # Your Secondary Name =
Server


#SYSLOG_SERVER=3D"***.**.**.*"                     # Your Syslog =
Internal Server


=20

=20

LOOPBACK=3D"127.0.0.0/8"                          # Reserved loopback =
address range


CLASS_A=3D"10.0.0.0/8"                            # Class A private =
networks


CLASS_B=3D"172.16.0.0/12"                         # Class B private =
networks


CLASS_C=3D"192.168.0.0/16"                        # Class C private =
networks


CLASS_D_MULTICAST=3D"224.0.0.0/4"                 # Class D multicast =
addr


CLASS_E_RESERVED_NET=3D"240.0.0.0/5"              # Class E reserved =
addr


BROADCAST_SRC=3D"0.0.0.0"                         # Broadcast source =
addr


BROADCAST_DEST=3D"255.255.255.255"                # Broadcast =
destination addr


PRIVPORTS=3D"0:1023"                              # Privileged port =
range


UNPRIVPORTS=3D"1024:"                             # Unprivileged port =
range


=20

=20

# =
-------------------------------------------------------------------------=
---


=20

=20

# The SSH client starts at 1023 and works down to 513 for each


# additional simultaneous connection originating from a privileged port.


# Clients can optionally be configured to use only unprivileged ports.


SSH_LOCAL_PORTS=3D"1022:65535"                    # Port range for local =
clients


SSH_REMOTE_PORTS=3D"513:65535"                    # Port range for =
remote clients


=20

=20

# traceroute usually uses -S 32769:65535 -D 33434:33523


TRACEROUTE_SRC_PORTS=3D"32769:65535"


TRACEROUTE_DEST_PORTS=3D"33434:33523"


=20

=20

# =
-------------------------------------------------------------------------=
---


=20

=20

# FIREWALL MODULES


# ----------------


=20

=20

    # Uncomment all of the following modules lines only


    # for modularized kernel system.


=20

=20

    # These modules are necessary to masquerade their respective =
services.


#    /sbin/modprobe ip_tables


#    /sbin/modprobe iptable_nat


#    /sbin/modprobe ip_conntrack


#    /sbin/modprobe ip_conntrack_ftp


#    /sbin/modprobe ip_tables


#    /sbin/modprobe ip_nat_ftp


#    /sbin/modprobe ipt_LOG


#    /sbin/modprobe ipt_MARK


#    /sbin/modprobe ipt_MASQUERADE


#    /sbin/modprobe ipt_REDIRECT


#    /sbin/modprobe ipt_REJECT


#    /sbin/modprobe ipt_TOS


#    /sbin/modprobe ipt_limit


#    /sbin/modprobe ipt_mac


#    /sbin/modprobe ipt_mark


#    /sbin/modprobe ipt_multiport


#    /sbin/modprobe ipt_state


#    /sbin/modprobe ipt_tos


#    /sbin/modprobe iptable_mangle


=20

=20

# =
-------------------------------------------------------------------------=
---


=20

=20

# Default policy is DENY


# Explicitly accept desired INCOMING & OUTGOING connections



#

#    # Remove all existing rules belonging to this filter


#    iptables -F


#    iptables -F -t nat


#


#    # Remove any existing user-defined chains.


#    iptables -X


#


#    # Set the default policy of the filter to deny.


#    iptables -P INPUT   DROP


#    iptables -P OUTPUT  DROP


#    iptables -P FORWARD DROP


##


# =
-------------------------------------------------------------------------=
---


=20

=20

# LOOPBACK


# --------


=20

=20

    # Unlimited traffic on the loopback interface.


=20

=20

    iptables -A INPUT  -i $LOOPBACK_INTERFACE  -j ACCEPT


    iptables -A OUTPUT -o $LOOPBACK_INTERFACE  -j ACCEPT


=20

=20

# =
-------------------------------------------------------------------------=
---


=20

=20

# Unlimited traffic within the local network.


=20

=20

    # All internal machines have access to the fireall machine.


=20

=20

    iptables -A INPUT  -i $LOCAL_INTERFACE_1 -s $INTRANET -j ACCEPT


    iptables -A OUTPUT -o $LOCAL_INTERFACE_1 -d $INTRANET -j ACCEPT


=20

=20

# =
-------------------------------------------------------------------------=
---


# STATEFUL PART!


# --------------


=20

=20

    # Kill malformed XMAS packets


    iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP


    iptables -A FORWARD -p tcp --tcp-flags ALL ALL -j DROP


=20

=20

    # Kill malformed NULL packets


    iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP


    iptables -A FORWARD -p tcp --tcp-flags ALL NONE -j DROP


=20

=20

    # Block faked, or "spoofed," packets from getting through the =
firewall.


    iptables -A FORWARD -i $LOCAL_INTERFACE_1 -s ! $INTRANET -j DROP


=20

=20

    # Allow all internal packets out of our network.


    iptables -A FORWARD -m state --state NEW -i $LOCAL_INTERFACE_1 && \


             -s $INTRANET -j ACCEPT


=20

=20

    # Allow the associated packets with those connections back in.


    iptables -A FORWARD -m state --state ESTABLISHED,RELATED && \


             -i $EXTERNAL_INTERFACE -s ! $INTRANET -j ACCEPT


=20

=20

    # All internal traffic is masqueraded externally.


    iptables -A POSTROUTING -t nat -o $EXTERNAL_INTERFACE -j MASQUERADE


=20

=20

# Blocks any forwards that come from Internet connection. Uncomment only =
for


# users with modem device like "ppp0".


=20

=20

#    iptables -A FORWARD -i $EXTERNAL_INTERFACE -m state \


#    --state NEW,INVALID -j REJECT


=20

=20

# =
-------------------------------------------------------------------------=
---


# SPOOFING & BAD ADDRESSES


# Refuse spoofed packets.


# Ignore blatantly illegal source addresses.


# Protect yourself from sending to bad addresses.


=20

=20

    # Refuse incoming packets pretending to be from the external =
address.


    iptables -A INPUT   -s $IPADDR -j DROP


=20

=20

    # Refuse incoming packets claiming to be from a Class A, B or C =
private network


 #  iptables -A INPUT   -s $CLASS_A -j DROP


    iptables -A INPUT   -s $CLASS_B -j DROP


    iptables -A INPUT   -s $CLASS_C -j DROP


=20

=20

    # Refuse broadcast address SOURCE packets


    iptables -A INPUT   -s $BROADCAST_DEST -j DROP


    iptables -A INPUT   -d $BROADCAST_SRC -j DROP


=20

=20

    # Refuse Class D multicast addresses


    # Multicast is illegal as a source address.


    # Multicast uses UDP.


    iptables -A INPUT   -s $CLASS_D_MULTICAST -j DROP


=20

=20

    # Refuse Class E reserved IP  addresses


    iptables -A INPUT   -s $CLASS_E_RESERVED_NET -j DROP


=20

=20

    # Refuse special addresses defined as reserved by the IANA.


    # Note:  The remaining reserved addresses are not included


    # filtering them causes problems as reserved blocks are


    # being allocated more often now. The following are based on


    # reservations as listed by IANA as of 2001/01/04. Please regularly


    # check at http://www.iana.org/ for the latest status.


=20

=20

    # Note:  this list includes the loopback, multicast, & reserved =
addresses.


=20

=20

    # 0.*.*.*                   - Can't be blocked for DHCP users.


    # 127.*.*.*                 - LoopBack


    # 169.254.*.*               - Link Local Networks


    # 192.0.2.*                 - TEST-NET


    # 224-255.*.*.*             - Classes D & E, plus unallocated.


=20

=20

    iptables -A INPUT   -s 0.0.0.0/8 -j DROP


    iptables -A INPUT   -s 127.0.0.0/8 -j DROP


    iptables -A INPUT   -s 169.254.0.0/16 -j DROP


    iptables -A INPUT   -s 192.0.2.0/24 -j DROP


    iptables -A INPUT   -s 224.0.0.0/3 -j DROP


=20

=20

# =
-------------------------------------------------------------------------=
---


=20

=20

    # UDP TRACEROUTE


    # --------------


=20

=20

    # traceroute usually uses -S 32769:65535 -D 33434:33523


=20

=20

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p udp --source-port =
$TRACEROUTE_SRC_PORTS && \


             -d $IPADDR --destination-port $TRACEROUTE_DEST_PORTS -j =
DROP


=20

=20

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p udp -s $IPADDR =
--source-port $TRACEROUTE_SRC_PORTS && \


             --destination-port $TRACEROUTE_DEST_PORTS -j ACCEPT


=20

=20

# =
-------------------------------------------------------------------------=
---


=20

=20

    # DNS forward-only nameserver


    # ---------------------------


#ESTAS PRIMERAS CUATRO LINEAS SON EL COMPARTAMIENTO DE UN CLIENTE dns=20


#QUE LO QUE HACE ES CONECTARSE A UN SERVIDOR DNS POR EL PUERTO 53.


#En este caso es servidor es el nameserver1


#


#


#    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p udp  \


#             -s $PRIMARY_NAMESERVER --source-port 53 \


#             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT


#


#   iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p udp  \


#             -s $IPADDR --source-port $UNPRIVPORTS \


#             -d $PRIMARY_NAMESERVER --destination-port 53 -j ACCEPT#


#


#    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp ! --syn \


#             -s $PRIMARY_NAMESERVER --source-port 53 \


#             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT


#


#    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp  \


#             -s $IPADDR --source-port $UNPRIVPORTS \


#             -d $PRIMARY_NAMESERVER --destination-port 53 -j ACCEPT


#


# DNS client


=20

=20

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p udp --source-port =
$UNPRIVPORTS && \


             -d $IPADDR --destination-port 53 -j ACCEPT


=20

=20

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p udp -s $IPADDR =
--source-port 53 && \


             --destination-port $UNPRIVPORTS -j ACCEPT


=20

=20

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p udp --source-port 53 && =
\


             -d $IPADDR --destination-port 53 -j ACCEPT


=20

=20

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p udp -s $IPADDR =
--source-port 53 && \


             --destination-port 53 -j ACCEPT


=20

=20

=20

=20

=20

=20

#ESTO LO VOY A ANADIR YO PORQUE ESTO ES LO QUE HACE UN SERVIDOR DNS, o =
sea aceptar peticiones=20


#desde su puerto 53 y que provienen de puertos no privilegiados en otras =
maquinas.


=20

=20

=20

=20

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p udp --source-port =
$UNPRIVPORTS && \


             -d $IPADDR --destination-port 53 -j ACCEPT


=20

=20

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p udp -s $IPADDR =
--source-port 53 && \


             --destination-port $UNPRIVPORTS -j ACCEPT


=20

=20

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p udp --source-port 53 && =
\


             -d $IPADDR --destination-port 53 -j ACCEPT


=20

=20

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p udp -s $IPADDR =
--source-port 53 && \


             --destination-port 53 -j ACCEPT


=20

=20

=20

=20

#Esto tambien lo voy a anadir porque el servidor dns tiene que aceptar =
las=20

#transferencias de zona desde el servidor dns2


 # DNS Zone Transfers (53)


=20

=20

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp -s =
$SECONDARY_NAMESERVER --source-port $UNPRIVPORTS && \


             -d $IPADDR --destination-port 53 -j ACCEPT


=20

=20

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp -s $IPADDR =
--source-port 53 && \


             -d $SECONDARY_NAMESERVER --destination-port $UNPRIVPORTS -j =
ACCEPT


   =20


# ------------------------------------------------------------------


# HTTP client (80)


# ----------------


=20

=20

#    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp ! --syn =
--source-port 80 && \


#             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT



#

#    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp  -s $IPADDR =
--source-port $UNPRIVPORTS && \


#             --destination-port 80 -j ACCEPT


#


    # ------------------------------------------------------------------


=20

=20

    # HTTPS client (443)


    # ------------------


=20

=20

#    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp ! --syn =
--source-port 443 && \


#             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT


#


#    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp  -s $IPADDR =
--source-port $UNPRIVPORTS && \


#             --destination-port 443 -j ACCEPT


=20

=20

    # ------------------------------------------------------------------


=20

=20

    # WWW-CACHE client


    # ----------------


=20

=20

#    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp ! --syn \


#             --source-port 3128 \


#             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT


=20

=20

#    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp  \


#             -s $IPADDR --source-port $UNPRIVPORTS \


#             --destination-port 3128 -j ACCEPT


=20

=20

    # ------------------------------------------------------------------


=20

=20

    # NNTP NEWS client (119)


    # ----------------------


=20

=20

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp ! --syn =
--source-port 119 && \


             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT


=20

=20

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp  -s $IPADDR =
--source-port $UNPRIVPORTS && \


             --destination-port 119 -j ACCEPT


=20

=20

    # ------------------------------------------------------------------


=20

=20

    # POP client (110)


    # ----------------


=20

=20

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp ! --syn =
--source-port 110 && \


             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT


=20

=20

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp -s $IPADDR =
--source-port $UNPRIVPORTS && \


             --destination-port 110 -j ACCEPT


=20

=20

    # ------------------------------------------------------------------


=20

=20

    # IMAP client (143)


    # -----------------


=20

=20

#    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp ! --syn \


#             --source-port 143 \


#             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT


=20

=20

#    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp \


#             -s $IPADDR --source-port $UNPRIVPORTS \


#             --destination-port 143 -j ACCEPT


=20

=20

    # ------------------------------------------------------------------


=20

=20

    # SMTP client (25)


    # ----------------


=20

=20

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp ! --syn =
--source-port 25 && \


             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT


=20

=20

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp  -s $IPADDR =
--source-port $UNPRIVPORTS && \


             --destination-port 25 -j ACCEPT


=20

=20

    # ------------------------------------------------------------------


=20

=20

    # SSH server (22)


    # ---------------


=20

=20

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp  --source-port =
$SSH_REMOTE_PORTS && \=20


             -d $IPADDR --destination-port 22 -j ACCEPT


=20

=20

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp ! --syn -s $IPADDR =
--source-port 22 && \


             --destination-port $SSH_REMOTE_PORTS -j ACCEPT


=20

=20

=20

=20

    # SSH client (22)


    # ---------------


=20

=20

    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp ! --syn =
--source-port 22 && \


             -d $IPADDR --destination-port $SSH_LOCAL_PORTS -j ACCEPT


=20

=20

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp  -s $IPADDR =
--source-port $SSH_LOCAL_PORTS && \


             --destination-port 22 -j ACCEPT


=20

=20

    # ------------------------------------------------------------------


=20

=20

    # TELNET client (23)


    # ------------------


=20

=20

#    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp ! --syn \


#            --source-port 23 \


#             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT


=20

=20

#    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp  \


#             -s $IPADDR --source-port $UNPRIVPORTS \


#             --destination-port 23 -j ACCEPT


=20

=20

    # ------------------------------------------------------------------


=20

=20

    # AUTH server (113)


    # -----------------


=20

=20

    # Reject, rather than deny, the incoming auth port. (NET-3-HOWTO)


    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp  --source-port =
$UNPRIVPORTS && \


             -d $IPADDR --destination-port 113 -j REJECT


=20

=20

=20

=20

    # AUTH client (113)


    # -----------------


=20

=20

#    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp ! --syn \


#             --source-port 113 \


#             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT


=20

=20

#    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp  \


#             -s $IPADDR --source-port $UNPRIVPORTS \


#             --destination-port 113 -j ACCEPT


=20

=20

    # ------------------------------------------------------------------


=20

=20

    # WHOIS client (43)


    # -----------------


=20

=20

#    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp ! --syn \


#             --source-port 43 \


#             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT


=20

=20

#    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp  \


#             -s $IPADDR --source-port $UNPRIVPORTS \


#             --destination-port 43 -j ACCEPT


=20

=20

    # ------------------------------------------------------------------


=20

=20

    # FINGER client (79)


    # ------------------


=20

=20

#    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp ! --syn \


#             --source-port 79 \


#             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT


=20

=20

#    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp  \


#             -s $IPADDR --source-port $UNPRIVPORTS \


#             --destination-port 79 -j ACCEPT


=20

=20

    # ------------------------------------------------------------------


=20

=20

    # FTP client (21)


    # ---------------


=20

=20

    # outgoing request


#    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp  \


#             -s $IPADDR --source-port $UNPRIVPORTS \


#             --destination-port 21 -j ACCEPT


#


#    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp ! --syn \


#             --source-port 21 \


#             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT


=20

=20

=20

=20

    # PORT mode data channel


    iptables -A INPUT  -i $EXTERNAL_INTERFACE -p tcp  --source-port 20 =
&& \


             -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT


=20

=20

    iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp ! --syn -s $IPADDR =
--source-port $UNPRIVPORTS && \


             --destination-port 20 -j ACCEPT


=20

=20

    # ------------------------------------------------------------------


=20

     =20

     =20

     =20

     =20

     =20

     =20

     =20

     =20

}

=20

stop() {

      chains=3D`cat /proc/net/ip_tables_names 2>/dev/null`

        for i in $chains; do iptables -t $i -F; done && \

                success $"Flushing all chains:" || \

                failure $"Flushing all chains:"

        for i in $chains; do iptables -t $i -X; done && \

                success $"Removing user defined chains:" || \

                failure $"Removing user defined chains:"

        echo -n $"Resetting built-in chains to the default ACCEPT =
policy:"

      iptables -P INPUT ACCEPT && \

         iptables -P OUTPUT ACCEPT && \

         iptables -P FORWARD ACCEPT && \

         iptables -t nat -P PREROUTING ACCEPT && \

         iptables -t nat -P POSTROUTING ACCEPT && \

         iptables -t nat -P OUTPUT ACCEPT && \

           iptables -t mangle -P PREROUTING ACCEPT && \

           iptables -t mangle -P OUTPUT ACCEPT && \

         success $"Resetting built-in chains to the default ACCEPT =
policy" || \

         failure $"Resetting built-in chains to the default ACCEPT =
policy"

      echo

      rm -f /var/lock/subsys/iptables

}

=20

case "$1" in

  start)

      start

      ;;

=20

  stop)

      stop

      ;;

=20

  restart)

      # "restart" is really just "start" as this isn't a daemon,

      #  and "start" clears any pre-defined rules anyway.

      #  This is really only here to make those who expect it happy

      start

      ;;

=20

  condrestart)

      [ -e /var/lock/subsys/iptables ] && start

      ;;

=20

  status)

      echo $"Table: filter"

      iptables --list

      echo $"Table: nat"

      iptables -t nat --list

      echo $"Table: mangle"

      iptables -t mangle --list

      ;;

=20

  panic)

      echo -n $"Changing target policies to DROP: "    =20

      iptables -P INPUT DROP && \

          iptables -P FORWARD DROP && \

          iptables -P OUTPUT DROP && \

          iptables -t nat -P PREROUTING DROP && \

          iptables -t nat -P POSTROUTING DROP && \

          iptables -t nat -P OUTPUT DROP && \

          iptables -t mangle -P PREROUTING DROP && \

          iptables -t mangle -P OUTPUT DROP && \

          success $"Changing target policies to DROP" || \

          failure $"Changing target policies to DROP"

      echo

        iptables -F INPUT && \

                iptables -F FORWARD && \

                iptables -F OUTPUT && \

                iptables -t nat -F PREROUTING && \

                iptables -t nat -F POSTROUTING && \

                iptables -t nat -F OUTPUT && \

                iptables -t mangle -F PREROUTING && \

                iptables -t mangle -F OUTPUT && \

                success $"Flushing all chains:" || \

                failure $"Flushing all chains:"

        iptables -X INPUT && \

                iptables -X FORWARD && \

                iptables -X OUTPUT && \

                iptables -t nat -X PREROUTING && \

                iptables -t nat -X POSTROUTING && \

                iptables -t nat -X OUTPUT && \

                iptables -t mangle -X PREROUTING && \

                iptables -t mangle -X OUTPUT && \

                success $"Removing user defined chains:" || \

                failure $"Removing user defined chains:"

        ;;

=20

  save)

      echo -n $"Saving current rules to $IPTABLES_CONFIG: "

      touch $IPTABLES_CONFIG

      chmod 600 $IPTABLES_CONFIG

      /sbin/iptables-save -c > $IPTABLES_CONFIG  2>/dev/null && \

        success $"Saving current rules to $IPTABLES_CONFIG" || \

        failure $"Saving current rules to $IPTABLES_CONFIG"

      echo

      ;;

=20

  *)

      echo $"Usage: $0 =
{start|stop|restart|condrestart|status|panic|save}"

      exit 1

esac

=20

exit 0

=20

=20

------=_NextPart_000_004B_01C2240A.ECC806C0
Content-Type: text/plain;
	name="errors1.txt"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="errors1.txt"

/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
iptables: No chain/target/match by that name
iptables v1.2.3: can't initialize iptables table `nat=0D': Table does =
not exist (do you need to insmod?)
Perhaps iptables or your kernel needs to be upgraded.
/etc/rc.d/init.d/iptables: =0D: command not found
iptables: Table does not exist (do you need to insmod?)
/etc/rc.d/init.d/iptables: =0D: command not found
iptables: Bad policy name
iptables: Bad policy name
iptables: Bad policy name
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
iptables v1.2.3: Invalid target name `ACCEPT=0D'
Try `iptables -h' or 'iptables --help' for more information.
iptables v1.2.3: Invalid target name `ACCEPT=0D'
Try `iptables -h' or 'iptables --help' for more information.
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
iptables v1.2.3: Invalid target name `ACCEPT=0D'
Try `iptables -h' or 'iptables --help' for more information.
iptables v1.2.3: Invalid target name `ACCEPT=0D'
Try `iptables -h' or 'iptables --help' for more information.
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
iptables v1.2.3: Invalid target name `DROP=0D'
Try `iptables -h' or 'iptables --help' for more information.
iptables v1.2.3: Invalid target name `DROP=0D'
Try `iptables -h' or 'iptables --help' for more information.
/etc/rc.d/init.d/iptables: =0D: command not found
iptables v1.2.3: Invalid target name `DROP=0D'
Try `iptables -h' or 'iptables --help' for more information.
iptables v1.2.3: Invalid target name `DROP=0D'
Try `iptables -h' or 'iptables --help' for more information.
/etc/rc.d/init.d/iptables: =0D: command not found
iptables v1.2.3: Invalid target name `DROP=0D'
Try `iptables -h' or 'iptables --help' for more information.
/etc/rc.d/init.d/iptables: =0D: command not found
Try `iptables -h' or 'iptables --help' for more information.
/etc/rc.d/init.d/iptables: -s: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
Try `iptables -h' or 'iptables --help' for more information.
/etc/rc.d/init.d/iptables: -i: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
iptables v1.2.3: Invalid target name `MASQUERADE=0D'
Try `iptables -h' or 'iptables --help' for more information.
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
iptables v1.2.3: Invalid target name `DROP=0D'
Try `iptables -h' or 'iptables --help' for more information.
/etc/rc.d/init.d/iptables: =0D: command not found
iptables v1.2.3: Invalid target name `DROP=0D'
Try `iptables -h' or 'iptables --help' for more information.
iptables v1.2.3: Invalid target name `DROP=0D'
Try `iptables -h' or 'iptables --help' for more information.
/etc/rc.d/init.d/iptables: =0D: command not found
iptables v1.2.3: Invalid target name `DROP=0D'
Try `iptables -h' or 'iptables --help' for more information.
iptables v1.2.3: Invalid target name `DROP=0D'
Try `iptables -h' or 'iptables --help' for more information.
/etc/rc.d/init.d/iptables: =0D: command not found
iptables v1.2.3: Invalid target name `DROP=0D'
Try `iptables -h' or 'iptables --help' for more information.
/etc/rc.d/init.d/iptables: =0D: command not found
iptables v1.2.3: Invalid target name `DROP=0D'
Try `iptables -h' or 'iptables --help' for more information.
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
iptables v1.2.3: Invalid target name `DROP=0D'
Try `iptables -h' or 'iptables --help' for more information.
iptables v1.2.3: Invalid target name `DROP=0D'
Try `iptables -h' or 'iptables --help' for more information.
iptables v1.2.3: Invalid target name `DROP=0D'
Try `iptables -h' or 'iptables --help' for more information.
iptables v1.2.3: Invalid target name `DROP=0D'
Try `iptables -h' or 'iptables --help' for more information.
iptables v1.2.3: Invalid target name `DROP=0D'
Try `iptables -h' or 'iptables --help' for more information.
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
Try `iptables -h' or 'iptables --help' for more information.
/etc/rc.d/init.d/iptables: --source-port: command not found
/etc/rc.d/init.d/iptables: -d: command not found
/etc/rc.d/init.d/iptables: =0D: command not found
Try `iptables -h' or 'iptables --help' for more information.
/etc/rc.d/init.d/iptables: -s: command not found
/etc/rc.d/init.d/iptables: --destination-port: command not found
/etc/rc.d/init.d/iptables: =0D: command not found


------=_NextPart_000_004B_01C2240A.ECC806C0--


