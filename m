From: =?iso-8859-1?Q?Gast=F3n?= Franco <gfranco@arcert.gov.ar>
Subject: Re: Mailserver
Date: Thu, 23 Jan 2003 12:30:59 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E300AB2.3AAB05D4@arcert.gov.ar>
References: <NEBBICCJKLGJHMMNBPIKKEJPEDAA.sbisgaard@xtrasource.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: Steffen Bisgaard <sbisgaard@xtrasource.com>
Cc: netfilter@lists.netfilter.org

Hi,
from your config file, I can see that you define the following variables

IPADDR=3D"10.2.0.28"
CLASS_A=3D"10.0.0.0/8" # Class A private networks

and the following rule
iptables -A INPUT -s $CLASS_A -j DROP

so, this rule is dropping all the packects that come from machines with s=
ource address 10.x.x.x
a for your IPADDR, I supouse that it's dropping ALL your network
Take this rule off..

hope this helps

Steffen Bisgaard wrote:

> Dear Everyone,
>
> First of all my apologies for this lengthy email, but below is my entir=
e
> rule, and I am not sure where in this my problem lies.
>
> I am trying to build a ruleset for a mailserver - thats all.
>
> If I start iptables with the below ruleset, (/etc/rc.d/init.d/iptables
> start), the output of iptables -nvL |grep "tcp dpt:25" is:
>  0     0 ACCEPT     tcp  --  eth0   *       0.0.0.0/0            0.0.0.=
0/0
> tcp dpt:25
>  0     0 ACCEPT     tcp  --  *      eth0    0.0.0.0/0            0.0.0.=
0/0
> tcp dpt:25
>
> The output of iptables -nvL |grep "tcp dpt:110" is:
>  0     0 ACCEPT     tcp  --  eth0   *       0.0.0.0/0            0.0.0.=
0/0
> tcp dpt:110
>  0     0 ACCEPT     tcp  --  *      eth0    0.0.0.0/0            0.0.0.=
0/0
> tcp dpt:110
>
> So as far as I can tell this should allow me to send and receive emails=

> through this server.
>
> When I try to do that however, I only get "Unable to connect to server"=
 from
> my outlook client. If I stop the firewall (/etc/rc.d/init.d/iptables st=
op),
> I can send and receive emails through that sevrer no problems.
>
> If anybody with the neccessary experience could have a look and possibl=
y
> point out where the problem lies I would very much appreciate it.
>
> many thanks, and Kind Regards...
>
> # ---------------------------------------------------------------------=
-----
> --
> #
> # Invoked from /etc/rc.d/init.d/iptables.
> # chkconfig: - 60 95
> # description: Starts and stops the IPTABLES packet filter \
> # used to provide firewall network services.
> # Source function library.
> . /etc/rc.d/init.d/functions
> # Source networking configuration.
> . /etc/sysconfig/network
> # Check that networking is up.
> if [ ${NETWORKING} =3D "no" ]
> then
> exit 0
> fi
> if [ ! -x /sbin/iptables ]; then
> exit 0
> fi
> # See how we were called.
> case "$1" in
> start)
> echo -n "Starting Firewalling: "
> # ---------------------------------------------------------------------=
-----
> --
> # Some definitions for easy maintenance.
> IPADDR=3D"10.2.0.28"
> EXTERNAL_INTERFACE=3D"eth0" # Internet connected interface
> LOOPBACK_INTERFACE=3D"lo" # Your local naming convention
> PRIMARY_NAMESERVER=3D"212.120.66.194" # Your Primary Name Server
> SECONDARY_NAMESERVER=3D"212.120.66.195" # Your Secondary Name Server
> LOOPBACK=3D"127.0.0.0/8" # Reserved loopback addr range
> CLASS_A=3D"10.0.0.0/8" # Class A private networks
> CLASS_B=3D"172.16.0.0/12" # Class B private networks
> CLASS_C=3D"192.168.0.0/16" # Class C private networks
> CLASS_D_MULTICAST=3D"224.0.0.0/4" # Class D multicast addr
> CLASS_E_RESERVED_NET=3D"240.0.0.0/5" # Class E reserved addr
> BROADCAST_SRC=3D"0.0.0.0" # Broadcast source addr
> BROADCAST_DEST=3D"255.255.255.255" # Broadcast destination addr
> PRIVPORTS=3D"0:1023" # Privileged port range
> UNPRIVPORTS=3D"1024:" # Unprivileged port range
> # ---------------------------------------------------------------------=
-----
> --
> # The SSH client starts at 1023 and works down to 513 for each
> # additional simultaneous connection originating from a privileged port=
=2E
> # Clients can optionally be configured to use only unprivileged ports.
> SSH_LOCAL_PORTS=3D"1022:65535" # Port range for local clients
> SSH_REMOTE_PORTS=3D"1:65535" # Port range for remote clients
> # traceroute usually uses -S 32769:65535 -D 33434:33523
> TRACEROUTE_SRC_PORTS=3D"32769:65535"
> TRACEROUTE_DEST_PORTS=3D"33434:33523"
> # ---------------------------------------------------------------------=
-----
> --
> # Default policy is DENY
> # Explicitly accept desired INCOMING & OUTGOING connections
> # Remove all existing rules belonging to this filter
> iptables -F
> # Remove any existing user-defined chains.
> iptables -X
> # Set the default policy of the filter to deny.
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD DROP
> # ---------------------------------------------------------------------=
-----
> --
> # LOOPBACK
> # --------
> # Unlimited traffic on the loopback interface.
> iptables -A INPUT -i $LOOPBACK_INTERFACE -j ACCEPT
> iptables -A OUTPUT -o $LOOPBACK_INTERFACE -j ACCEPT
> #
> #
> #
> # ---------------------------------------------------------------------=
-----
> --
> # SPOOFING & BAD ADDRESSES
> # Refuse spoofed packets.
> # Ignore blatantly illegal source addresses.
> # Protect yourself from sending to bad addresses.
> # Refuse incoming packets pretending to be from the external address.
> iptables -A INPUT -s $IPADDR -j DROP
> # Refuse incoming packets claiming to be from a Class A, B or C private=

> ##network
> iptables -A INPUT -s $CLASS_A -j DROP
> iptables -A INPUT -s $CLASS_B -j DROP
> iptables -A INPUT -s $CLASS_C -j DROP
> # Refuse broadcast address SOURCE packets
> iptables -A INPUT -s $BROADCAST_DEST -j DROP
> iptables -A INPUT -d $BROADCAST_SRC -j DROP
> # Refuse Class D multicast addresses
> # Multicast is illegal as a source address.
> # Multicast uses UDP.
> iptables -A INPUT -s $CLASS_D_MULTICAST -j DROP
> # Refuse Class E reserved IP addresses
> iptables -A INPUT -s $CLASS_E_RESERVED_NET -j DROP
> # Refuse special addresses defined as reserved by the IANA.
> # Note: The remaining reserved addresses are not included
> # filtering them causes problems as reserved blocks are
> # being allocated more often now. The following are based on
> # reservations as listed by IANA as of 2001/01/04. Please regularly
> # check at http://www.iana.org/ for the latest status.
> # Note: this list includes the loopback, multicast, & reserved addresse=
s.
> # 0.*.*.* - Can't be blocked for DHCP users.
> # 127.*.*.* - LoopBack
> # 169.254.*.* - Link Local Networks
> # 192.0.2.* - TEST-NET
> # 224-255.*.*.* - Classes D & E, plus unallocated.
> iptables -A INPUT -s 0.0.0.0/8 -j DROP
> iptables -A INPUT -s 127.0.0.0/8 -j DROP
> iptables -A INPUT -s 169.254.0.0/16 -j DROP
> iptables -A INPUT -s 192.0.2.0/24 -j DROP
> iptables -A INPUT -s 224.0.0.0/3 -j DROP
> #
> #
> #
> # ---------------------------------------------------------------------=
-----
> --
> # UDP TRACEROUTE
> # --------------
> # traceroute usually uses -S 32769:65535 -D 33434:33523
> iptables -A INPUT -i $EXTERNAL_INTERFACE -p udp \
> --source-port $TRACEROUTE_SRC_PORTS \
> -d $IPADDR --destination-port $TRACEROUTE_DEST_PORTS -j DROP
> iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p udp \
> -s $IPADDR --source-port $TRACEROUTE_SRC_PORTS \
> --destination-port $TRACEROUTE_DEST_PORTS -j ACCEPT
> #
> #
> #
> # ---------------------------------------------------------------------=
-----
> --
> # DNS forward-only nameserver
> # ---------------------------
> iptables -A INPUT -i $EXTERNAL_INTERFACE -p udp \
> -s $PRIMARY_NAMESERVER --source-port 53 \
> -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT
> iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p udp \
> -s $IPADDR --source-port $UNPRIVPORTS \
> -d $PRIMARY_NAMESERVER --destination-port 53 -j ACCEPT
> iptables -A INPUT -i $EXTERNAL_INTERFACE -p tcp ! --syn \
> -s $PRIMARY_NAMESERVER --source-port 53 \
> -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT
> iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp \
> -s $IPADDR --source-port $UNPRIVPORTS \
> -d $PRIMARY_NAMESERVER --destination-port 53 -j ACCEPT
> iptables -A INPUT -i $EXTERNAL_INTERFACE -p udp \
> -s $SECONDARY_NAMESERVER --source-port 53 \
> -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT
> iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p udp \
> -s $IPADDR --source-port $UNPRIVPORTS \
> -d $SECONDARY_NAMESERVER --destination-port 53 -j ACCEPT
> iptables -A INPUT -i $EXTERNAL_INTERFACE -p tcp ! --syn \
> -s $SECONDARY_NAMESERVER --source-port 53 \
> -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT
> iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp \
> -s $IPADDR --source-port $UNPRIVPORTS \
> -d $SECONDARY_NAMESERVER --destination-port 53 -j ACCEPT
> #
> #
> #
> # ------------------------------------------------------------------
> # POP server (110)
> # ----------------
> iptables -A INPUT -i $EXTERNAL_INTERFACE -p tcp \
> --source-port $UNPRIVPORTS \
> -d $IPADDR --destination-port 110 -j ACCEPT
> iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp ! --syn \
> -s $IPADDR --source-port 110 \
> --destination-port $UNPRIVPORTS -j ACCEPT
> # POP client (110)
> # ----------------
> iptables -A INPUT -i $EXTERNAL_INTERFACE -p tcp ! --syn \
> --source-port 110 \
> -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT
> iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp \
> -s $IPADDR --source-port $UNPRIVPORTS \
> --destination-port 110 -j ACCEPT
> #
> #
> #
> # ------------------------------------------------------------------
> # SMTP server (25)
> # ----------------
> iptables -A INPUT -i $EXTERNAL_INTERFACE -p tcp \
> --source-port $UNPRIVPORTS \
> -d $IPADDR --destination-port 25 -j ACCEPT
> iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp ! --syn \
> -s $IPADDR --source-port 25 \
> --destination-port $UNPRIVPORTS -j ACCEPT
> #
> #
> #
> # ------------------------------------------------------------------
> # SMTP client (25)
> # ----------------
> iptables -A INPUT -i $EXTERNAL_INTERFACE -p tcp ! --syn \
> --source-port 25 \
> -d $IPADDR --destination-port $UNPRIVPORTS -j ACCEPT
> iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p tcp \
> -s $IPADDR --source-port $UNPRIVPORTS \
> --destination-port 25 -j ACCEPT
> #
> #
> #
> # ------------------------------------------------------------------
> # SSH server (22)
> # ---------------
> #
> iptables -I INPUT -i $EXTERNAL_INTERFACE -p tcp --dport 22 --sport
> 1024:65535 -j ACCEPT
> iptables -I OUTPUT -p tcp --sport 22 -j ACCEPT
> #
> #
> # ---------------------------------------------------------------------=
-----
> --
> # ICMP
> # ----
> # To prevent denial of service attacks based on ICMP bombs, filter
> # incoming Redirect (5) and outgoing Destination Unreachable (3).
> # Note, however, disabling Destination Unreachable (3) is not
> # advisable, as it is used to negotiate packet fragment size.
> # For bi-directional ping.
> # Message Types: Echo_Reply (0), Echo_Request (8)
> # To prevent attacks, limit the src addresses to your ISP range.
> #
> # For outgoing traceroute.
> # Message Types: INCOMING Dest_Unreachable (3), Time_Exceeded (11)
> # default UDP base: 33434 to base+nhops-1
> #
> # For incoming traceroute.
> # Message Types: OUTGOING Dest_Unreachable (3), Time_Exceeded (11)
> # To block this, deny OUTGOING 3 and 11
> # 0: echo-reply (pong)
> # 3: destination-unreachable, port-unreachable, fragmentation-needed, e=
tc.
> # 4: source-quench
> # 5: redirect
> # 8: echo-request (ping)
> # 11: time-exceeded
> # 12: parameter-problem
> iptables -A INPUT -i $EXTERNAL_INTERFACE -p icmp \
> --icmp-type echo-reply \
> -d $IPADDR -j ACCEPT
> iptables -A INPUT -i $EXTERNAL_INTERFACE -p icmp \
> --icmp-type destination-unreachable \
> -d $IPADDR -j ACCEPT
> iptables -A INPUT -i $EXTERNAL_INTERFACE -p icmp \
> --icmp-type source-quench \
> -d $IPADDR -j ACCEPT
> iptables -A INPUT -i $EXTERNAL_INTERFACE -p icmp \
> --icmp-type time-exceeded \
> -d $IPADDR -j ACCEPT
> iptables -A INPUT -i $EXTERNAL_INTERFACE -p icmp \
> --icmp-type parameter-problem \
> -d $IPADDR -j ACCEPT
> iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p icmp \
> -s $IPADDR --icmp-type fragmentation-needed -j ACCEPT
> iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p icmp \
> -s $IPADDR --icmp-type source-quench -j ACCEPT
> iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p icmp \
> -s $IPADDR --icmp-type echo-request -j ACCEPT
> iptables -A OUTPUT -o $EXTERNAL_INTERFACE -p icmp \
> -s $IPADDR --icmp-type parameter-problem -j ACCEPT
> #
> #
> #
> # ---------------------------------------------------------------------=
-----
> --
> # Enable logging for selected denied packets
> iptables -A INPUT -i $EXTERNAL_INTERFACE -p tcp -j DROP
> iptables -A INPUT -i $EXTERNAL_INTERFACE -p udp \
> --destination-port $PRIVPORTS -j DROP
> iptables -A INPUT -i $EXTERNAL_INTERFACE -p udp \
> --destination-port $UNPRIVPORTS -j DROP
> iptables -A INPUT -i $EXTERNAL_INTERFACE -p icmp \
> --icmp-type 5 -j DROP
> iptables -A INPUT -i $EXTERNAL_INTERFACE -p icmp \
> --icmp-type 13/255 -j DROP
> iptables -A OUTPUT -o $EXTERNAL_INTERFACE -j REJECT
> # ---------------------------------------------------------------------=
-----
> --
> ;;
> stop)
> echo -n "Shutting Firewalling: "
> # Remove all existing rules belonging to this filter
> iptables -F
> # Delete all user-defined chain to this filter
> iptables -X
> # Reset the default policy of the filter to accept.
> iptables -P INPUT ACCEPT
> iptables -P OUTPUT ACCEPT
> iptables -P FORWARD ACCEPT
> ;;
> status)
> status iptables
> ;;
> restart|reload)
> $0 stop
> $0 start
> ;;
> *)
> echo "Usage: iptables {start|stop|status|restart|reload}"
> exit 1
> esac
> echo "done"
> exit 0

--
---------------------------------------------------------
                     ArCERT
 Te:(54-11) 43439001 int.514    Fax:(54-11) 4343-7458
 e-mail: gfranco@arcert.gov.ar  http://www.arcert.gov.ar
 Av.R. Saenz Pe=F1a 511 Of 514    Cap.Fed. - Argentina
---------------------------------------------------------



