From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Proofreading
Date: Wed, 14 Jul 2004 17:25:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407141725.04011.Antony@Soft-Solutions.co.uk>
References: <7EACCDBB65D37443912D80713CC1245D02382A3A@fsnsab20.losangeles.af.mil>
Reply-To: "'netfilter'" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="------------Boundary-00=_S9OU6J1QF88H1D6IFQ03"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7EACCDBB65D37443912D80713CC1245D02382A3A@fsnsab20.losangeles.af.mil>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: 'netfilter' <netfilter@lists.netfilter.org>


--------------Boundary-00=_S9OU6J1QF88H1D6IFQ03
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Jasper.Rockstone.co.uk id i6EGPCs13759

On Wednesday 14 July 2004 5:10 pm, Hudson Delbert J Contr 61 CS/SCBN wrot=
e:

> where is the ruleset. never saw it in any message traffic.

It was attached to the original request for people to proofread it (if yo=
u=20
didn't see the script, what did you proofread!?).   4.6k textfile called=20
rc.iptables

I've attached it again to this email so you can see it (I hope others on =
the=20
list don't mind the duplicate posting - it's not a very long script...)

Regards,

Antony.

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org]On Behalf Of Antony Stone
> Sent: Wednesday, July 14, 2004 5:13 AM
> To: netfilter
> Subject: Re: Proofreading
>
> On Wednesday 14 July 2004 1:00 pm, Erik Wikstr=F6m wrote:
> > On Tue, Jul 13, 2004 at 04:19:57PM -0700, Hudson Delbert J Contr 61
>
> CS/SCBN
>
> wrote:
> > > X...ports 6k --> at least 6100
> > > rpc...
> > > nfs
> > >
> > > shall i go on.
> >
> > Please do.
>
> I don't quite understand this.   Perhaps Hudson has not noticed the def=
ault
> DROP policy in Erik's ruleset?
>
> Regards,
>
> Antony.

--=20
I don't know, maybe if we all waited then cosmic rays would write all our=
=20
software for us. Of course it might take a while.

 - Ron Minnich, Los Alamos National Laboratory

                                                     Please reply to the =
list;
                                                           please don't C=
C me.

--------------Boundary-00=_S9OU6J1QF88H1D6IFQ03
Content-Type: text/plain;
  charset="iso-8859-1";
  name="rc.iptables"
Content-Disposition: attachment; filename="rc.iptables"
Content-Transfer-Encoding: 7bit

#!/usr/bin/bash

# --------------------
# |    Initialize    |
# --------------------

# Variables
IPT="/usr/sbin/iptables"
WAN="eth0"
LAN="eth1"
LOCAL_NET="192.168.10.0/24"

# Computers
Yorthen="192.168.10.2"
Ohm="192.168.10.10"

# Clear all rules and set policies
for table in filter mangle nat ; do
	$IPT -t $table -F # Flush all rules
	$IPT -t $table -X # Remove all non-builtin chains
	$IPT -t $table -Z # Reset all counters

	# Set policies
	for chain in FORWARD INPUT OUTPUT PREROUTING POSTROUTING ; do
		if [ $table == "filter" ] ; then
			$IPT -t $table -P $chain DROP # Default to filter out all packages
		else
			$IPT -t $table -P $chain ACCEPT
		fi
	done
done

# Add custom chains
$IPT -t filter -N bad_packets



# ---------------------
# |    bad_packets    |
# ---------------------

# Drop INVALID and other bad packets
$IPT -t filter -A bad_packets -m state --state INVALID -j DROP
$IPT -t filter -A bad_packets -p TCP --tcp-flags SYN,ACK SYN,ACK -m state --state NEW -j DROP
$IPT -t filter -A bad_packets -p TCP ! --syn -m state --state NEW -j DROP
# Drop spoofed addresses
$IPT -t filter -A bad_packets -i $WAN -s 192.168.0.0/16  -j DROP
$IPT -t filter -A bad_packets -s 172.16.0.0/12 -j DROP
$IPT -t filter -A bad_packets -s 127.0.0.0/8 -j DROP
$IPT -t filter -A bad_packets -i $LAN -s ! $LOCAL_NET -j DROP



# --------------
# |    LYRA    |
# --------------

# Allow already established connections
$IPT -t filter -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -t filter -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
# Allow traffic on loopback interface
$IPT -t filter -A INPUT -i lo -j ACCEPT
$IPT -t filter -A OUTPUT -o lo -j ACCEPT
# Drop bad_packages
$IPT -t filter -A INPUT -j bad_packets
# Allow firewall to get WAN-IP from DHCP
$IPT -t filter -A OUTPUT -o $WAN -p UDP --dport 67 --sport 68 -j ACCEPT
$IPT -t filter -A INPUT -i $WAN -p UDP --sport 67 --dport 68 -j ACCEPT
# Allow computers on LAN to get IP from DHCP
$IPT -t filter -A INPUT -i $LAN -p UDP --dport 67 --sport 68 -j ACCEPT
$IPT -t filter -A OUTPUT -o $LAN -p UDP --sport 67 --dport 68 -j ACCEPT
# Allow SSH-connections from both LAN and WAN
$IPT -t filter -A INPUT -i $LAN -p TCP --syn -s $LOCAL_NET --dport 22 -j ACCEPT
$IPT -t filter -A INPUT -i $WAN -p TCP --syn --dport 2070 -j ACCEPT
# Allow DNS-requests
$IPT -t filter -A OUTPUT -o $WAN -p UDP --dport 53 -j ACCEPT
# Allow HTTP-requests
$IPT -t filter -A OUTPUT -o $WAN -p TCP --dport 80 -j ACCEPT
# Allow FTP-requests
$IPT -t filter -A OUTPUT -o $WAN -p TCP --dport 21 -j ACCEPT
# Allow SSH to LAN
$IPT -t filter -A OUTPUT -o $LAN -d $LOCAL_NET -p TCP --dport 22 -j ACCEPT
# Reject Ident-requests
$IPT -t filter -A INPUT -i $WAN -p TCP --dport 113 -j REJECT --reject-with tcp-reset



# -------------------
# |    LOCAL_NET    |
# -------------------

# Allow already established connections through
$IPT -t filter -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
# Drop bad_packages
$IPT -t filter -A FORWARD -j bad_packets
# Drop SMB-packages
$IPT -t filter -A FORWARD -p TCP --sport 137:139 -j DROP
$IPT -t filter -A FORWARD -p UDP --sport 137:139 -j DROP
$IPT -t filter -A FORWARD -p TCP --sport 445 -j DROP
$IPT -t filter -A FORWARD -p UDP --sport 445 -j DROP
# Allow traffic from LAN to WAN
$IPT -t filter -A FORWARD -i $LAN -o $WAN -s $LOCAL_NET -j ACCEPT
$IPT -t nat -A POSTROUTING -o $WAN -s $LOCAL_NET -j MASQUERADE
# Forward SSH to Ohm
$IPT -t nat -A PREROUTING -i $WAN -p TCP --syn --dport 22 -j DNAT --to $Ohm
$IPT -t filter -A FORWARD -i $WAN -d $Ohm -p TCP --dport 22 -j ACCEPT
# Forward DC++ to Yorthen
$IPT -t nat -A PREROUTING -i $WAN -p TCP --syn --dport 1436 -j DNAT --to $Yorthen
$IPT -t filter -A FORWARD -i $WAN -d $Yorthen -p TCP --dport 1436 -j ACCEPT
$IPT -t nat -A PREROUTING -i $WAN -p UDP --dport 1436 -j DNAT --to $Yorthen
$IPT -t filter -A FORWARD -i $WAN -d $Yorthen -p UDP --dport 1436 -j ACCEPT
# Forward FTP to Yorthen
$IPT -t nat -A PREROUTING -i $WAN -p TCP --syn --dport 1045:1050 -j DNAT --to $Yorthen
$IPT -t filter -A FORWARD -i $WAN -d $Yorthen -p TCP --dport 1045:1050 -j ACCEPT
$IPT -t nat -A PREROUTING -i $WAN -p TCP --syn --dport 2069 -j DNAT --to $Yorthen
$IPT -t filter -A FORWARD -i $WAN -d $Yorthen -p TCP --dport 2069 -j ACCEPT
# Forward DCC to Yothen
$IPT -t nat -A PREROUTING -i $WAN -p TCP --syn --dport 59 -j DNAT --to $Yorthen
$IPT -t filter -A FORWARD -i $WAN -d $Yorthen -p TCP --dport 59 -j ACCEPT



# ----------------
# |    SYSCTL    |
# ----------------
echo "1" > /proc/sys/net/ipv4/ip_forward
echo "1" > /proc/sys/net/ipv4/ip_dynaddr
echo "1" > /proc&sys/net/ipv4/conf/eth0/rp_filter
echo "1" > /proc/sys/net/ipv4/conf/eth1/rp_filter

--------------Boundary-00=_S9OU6J1QF88H1D6IFQ03--


