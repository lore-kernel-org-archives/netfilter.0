From: "Doug Yeager" <doug@aircomwireless.net>
Subject: RE: denying local traffic
Date: Tue, 11 Feb 2003 15:20:19 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000601c2d20b$035c2980$bb00a8c0@DOUG1>
References: <20030211202837.1225ac17.arnt@c2i.net>
Reply-To: <doug@aircomwireless.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030211202837.1225ac17.arnt@c2i.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Cool,

This is my first ascii art attempt:

/--------------------\
|  INTERNET          |
\--------------------/
       |
       |
/----linux server---------------------\
|  no cat gateway on eth0             |
|  iptables                           |
|  dhcp  192.168.19.0/255.255.255.0   |
|  hostap on wlan0 192.168.19.1       |
\-------------------------------------/
   |             |            |
   |             |            |
/-------\       /-------\     /-----------\
|client1|       |client2|     |client3    |
\-------/       \-------/     \-----------/

clients are of all flavors of OS.  And the users are not to smart
either.
It is in a coffee shop and users frequently leave shared drives open.

I want to be able to shut down all communications between clients so
they get to surf the net but not each other.  

Here is the firewall rules that set NOCAT up.   I just need the iptables
commands to shut down client to client traffic to add to these:

Localnet is 192.168.19.0/255.255.255.0  on wlan0
External device is eth0




#!/bin/sh
##
#
# initialize.fw: setup the default firewall rules
#
# *** NOTE ***
#
# If you want to have local firewall rules in addition to what NoCat
# provides, add them at the bottom of this file.  They will be recreated
# each time gateway is restarted.
#
##

# The current service classes by fwmark are:
#
#  1: Owner
#  2: Co-op
#  3: Public
#  4: Free

PATH=/sbin:/usr/sbin:/usr/local/sbin:/bin:/usr/bin:/usr/local/bin
export PATH

# Enable IP forwarding and rp_filter (to kill IP spoof attempts).
#
echo "1" > /proc/sys/net/ipv4/ip_forward
echo "1" > /proc/sys/net/ipv4/conf/all/rp_filter

# Load alllll the kernel modules we need.
#
rmmod ipchains > /dev/null 2>&1 # for RH 7.1 users.

for module in ip_tables ipt_REDIRECT ipt_MASQUERADE ipt_MARK ipt_REJECT
\
    ipt_TOS ipt_LOG iptable_mangle iptable_filter iptable_nat ip_nat_ftp
\
    ip_conntrack ipt_mac ipt_state ipt_mark; do

    modprobe $module
done

# Flush all user-defined chains
#
iptables -t filter -N NoCat 2>/dev/null
iptables -t filter -F NoCat
iptables -t filter -D FORWARD -j NoCat 2>/dev/null
iptables -t filter -A FORWARD -j NoCat

iptables -t filter -N NoCat_Ports 2>/dev/null
iptables -t filter -F NoCat_Ports
iptables -t filter -D NoCat -j NoCat_Ports 2>/dev/null
iptables -t filter -A NoCat -j NoCat_Ports

iptables -t filter -N NoCat_Inbound 2>/dev/null
iptables -t filter -F NoCat_Inbound
iptables -t filter -D NoCat -j NoCat_Inbound 2>/dev/null
iptables -t filter -A NoCat -j NoCat_Inbound

iptables -t nat -N NoCat_Capture 2>/dev/null
iptables -t nat -F NoCat_Capture
iptables -t nat -D PREROUTING -j NoCat_Capture 2>/dev/null
iptables -t nat -A PREROUTING -j NoCat_Capture

iptables -t nat -N NoCat_NAT 2>/dev/null
iptables -t nat -F NoCat_NAT

#
# Only nat if we're not routing
#
iptables -t nat -D POSTROUTING -j NoCat_NAT 2>/dev/null
[ "$RouteOnly" ] || iptables -t nat -A POSTROUTING -j NoCat_NAT

iptables -t mangle -N NoCat 2>/dev/null
iptables -t mangle -F NoCat
iptables -t mangle -D PREROUTING -j NoCat 2>/dev/null
iptables -t mangle -A PREROUTING -j NoCat


fwd="iptables       -t filter -A NoCat"
ports="iptables     -t filter -A NoCat_Ports"
nat="iptables       -t nat    -A NoCat_NAT"
redirect="iptables  -t nat    -A NoCat_Capture"
mangle="iptables    -t mangle -A NoCat"

if [ "$MembersOnly" ]; then
  classes="1 2"
else
  classes="1 2 3"
fi

# Handle tagged traffic.
#
for iface in $InternalDevice; do
    for net in $LocalNetwork; do
        for fwmark in $classes; do
            # Only forward tagged traffic per class
            $fwd -i $iface -s $net -m mark --mark $fwmark -j ACCEPT
#           $fwd -o $iface -d $net -m mark --mark $fwmark -j ACCEPT

            # Masquerade permitted connections.
            $nat -o $ExternalDevice -s $net -m mark --mark $fwmark -j
MASQUERADE
        done

        # Allow web traffic to the specified hosts, and don't capture
        # connections intended for them.
        #
        if [ "$AuthServiceAddr" -o "$AllowedWebHosts" ]; then
            for host in $AuthServiceAddr $AllowedWebHosts; do
                for port in 80 443; do
                    $nat      -s $net -d $host -p tcp --dport $port -j
MASQUERAD
E
                    $redirect -s $net -d $host -p tcp --dport $port -j
RETURN
                    $fwd -s $net -d $host -p tcp --dport $port -j ACCEPT
                    $fwd -d $net -s $host -p tcp --sport $port -j ACCEPT
                done
            done
        fi

        # Accept forward and back traffic to/from DNSAddr
        if [ "$DNSAddr" ]; then
            $fwd -i $iface -s $net -d $DNSAddr -p tcp --dport 53 -j
ACCEPT
            $fwd -i $iface -s $net -d $DNSAddr -p udp --dport 53 -j
ACCEPT
            $fwd -o $iface -d $net -s $DNSAddr -j ACCEPT

            $nat -p tcp -o $ExternalDevice -s $net -d $DNSAddr --dport
53 -j MAS
QUERADE
            $nat -p udp -o $ExternalDevice -s $net -d $DNSAddr --dport
53 -j MAS
QUERADE
        fi
    done

    # Set packets from internal devices to fw mark 4, or 'denied', by
default.
    $mangle -i $iface -j MARK --set-mark 4
done

# Redirect outbound non-auth web traffic to the local gateway process
#
# If MembersOnly is active, then redirect public class as well
#
for port in 80 443; do
    $redirect -m mark --mark 4 -p tcp --dport $port  -j REDIRECT
--to-port $Gate
wayPort
    if [ "$MembersOnly" ]; then
        $redirect -m mark --mark 3 -p tcp --dport $port  -j REDIRECT
--to-port $
GatewayPort
    fi
done



# Lock down more ports for public users, if specified. Port restrictions
# are not applied to co-op and owner class users.
#
# There are two philosophies in restricting access:  That Which Is Not
# Specifically Permitted Is Denied, and That Which Is Not Specifically
# Denied Is Permitted.
#
# If "IncludePorts" is defined, the default policy will be to deny all
# traffic, and only allow the ports mentioned.
#
# If "ExcludePorts" is defined, the default policy will be to allow all
# traffic, except to the ports mentioned.
#
# If both are defined, ExcludePorts will be ignored, and the default
policy
# will be to deny all traffic, allowing everything in IncludePorts, and
# issue a warning.
#
if [ "$IncludePorts" ]; then
  if [ "$ExcludePorts" ]; then
    echo "Warning: ExcludePorts and IncludePorts are both defined."
    echo "Ignoring 'ExcludePorts'.  Please check your nocat.conf."
  fi

  # Enable all ports in IncludePorts
  for iface in $InternalDevice; do
    for port in $IncludePorts; do
      $ports -p tcp -i $iface --dport $port -m mark --mark 3 -j ACCEPT
      $ports -p udp -i $iface --dport $port -m mark --mark 3 -j ACCEPT
    done

    # Always permit access to the GatewayPort (or we can't logout)
    $ports -p tcp -i $iface --dport $GatewayPort -j ACCEPT
    $ports -p udp -i $iface --dport $GatewayPort -j ACCEPT

    # ...and disable access to the rest.
    $ports -p tcp -i $iface -m mark --mark 3 -j DROP
    $ports -p udp -i $iface -m mark --mark 3 -j DROP
  done

elif [ "$ExcludePorts" ]; then
  # If ExcludePorts has entries, simply deny access to them.
  for iface in $InternalDevice; do
    for port in $ExcludePorts; do
        $ports -p tcp -i $iface --dport $port -m mark --mark 3 -j DROP
        $ports -p udp -i $iface --dport $port -m mark --mark 3 -j DROP
    done
  done
fi

#
# Disable access on the external to GatewayPort from anything but the
AuthServic
eAddr
#
if [ "$AuthServiceAddr" ]; then
    $fwd -i $ExternalDevice -s ! $AuthServiceAddr -p tcp --dport
$GatewayPort -j
 DROP
fi

# Filter policy.
$fwd -j DROP





-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Arnt Karlsen
Sent: Tuesday, February 11, 2003 2:29 PM
To: netfilter@lists.netfilter.org
Subject: Re: denying local traffic

On Tue, 11 Feb 2003 10:06:40 -0500, 
"Doug Yeager" <doug@aircomwireless.net> wrote in message 
<000101c2d1df$3166fb60$bb00a8c0@DOUG1>:

> I'm using nocat as a wireless gateway w/ the hostap driver. This is 
> Great because I should be able to use iptables firewall rules to 
> Administer things. I've had some success w/ these rules as I'm new to 
> iptables.
>  
> What I can't figure out is how to block local traffic between clients 
> on the LAN. Basically, I want them to be invisible to each other but 
> be able to get to the internet through the gateway.
> Right now they can get to the internet but can see each other's shares
> and so forth.
  
> What should be the iptables commands for doing this.
>  
> My lan is 192.168.19.0/255.255.255.0

..ascii art figure?  We use vpn (poptop) tunnels, but your net 
is likely different from ours.  

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.





