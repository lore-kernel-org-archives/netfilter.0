From: jonathan@innovativesource.net
Subject: Re: Forward to DMZ addresses
Date: Tue, 16 Aug 2005 11:15:42 -0500 (CDT)
Message-ID: <22055.206.166.83.50.1124208942.squirrel@mail.innovativesource.net>
References: <57933.67.53.150.63.1123957195.squirrel@mail.innovativesource.net>
	<430028A8.3090508@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <430028A8.3090508@riverviewtech.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: Grant Taylor <gtaylor@riverviewtech.net>


Kind of... I'm trying to redirect _any_ traffic destined for my DMZ
address to be forwarded to the machines themselves.  I tried the rule you
suggested, and I also realized that I had already tried that.

Basically, I want to forward any traffic destined for DMZ address pass th=
e
firewall and onto the DMZ machines themselves, well once they gone throug=
h
some bad packet checks...

FYI, the rule didn't work as expected.  The following is my script thus f=
ar:

#************************************
/sbin/modprobe ip_tables
/sbin/modprobe ip_conntrack
/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe iptable_filter
/sbin/modprobe ipt_LOG
/sbin/modprobe ipt_limit
/sbin/modprobe iptable_nat
/sbin/modprobe ipt_REJECT
/sbin/modprobe ipt_state

#
# Enable IP forwarding
#

echo "1" > /proc/sys/net/ipv4/ip_forward

$ipt -F
$ipt -X
$ipt -Z


$ipt -P INPUT DROP
$ipt -P OUTPUT ACCEPT
$ipt -P FORWARD DROP

###########################################
#
# Rules
#

#
# Accept EST. and REL. packets
#
$ipt -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
$ipt -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

#
# Forward all from LAN through WAN
#
$ipt -A FORWARD -i $LAN_INTERFACE -o $WAN_INTERFACE -j ACCEPT

#
# NAT all outgoing packets
#
$ipt -t nat -A POSTROUTING -o $WAN_INTERFACE  -j SNAT --to-source $WAN_IP

#
# temp - this does the actual allowing of outgoing packets
# from the dmz server... but it still nat's them... I don't want to nat
# them, I want them to appear as they are
#
$ipt -A FORWARD -i $DMZ_INTERFACE -o $WAN_INTERFACE -j ACCEPT
############################################################
#
# Firewall specific rules
#

#
# Allow access from LAN to firewall
#
$ipt -A INPUT -i $LAN_INTERFACE -j ACCEPT

#
# Save rules
#
/etc/init.d/iptables save

#************************************

this is basic, as I'm trying to take it one step at a time.  I'm currentl=
y
dealing with 2 issues.  the one mentioned above...and the other is not
NATing the outgoing DMZ packets...  I would like them to go out with thei=
r
IP addresses...


> Jonathan, are you needing to add a rule to your nat table PREROUTING ch=
ain
> to cause any (ssh) traffic that is destined to your firewall's WAN
> interface to be redirected over to your DMZ server?  If so you just nee=
d
> to add a rule like this:
>
> iptables -t nat -A PREROUTING -i eth1 -d xx.xx.xx.xx -p tcp --dport 22 =
-j
> DNAT --to-destination yy.yy.yy.yy
>
> Where xx.xx.xx.xx is your globally routable WAN IP and yy.yy.yy.yy is t=
he
> IP of your DMZ server.
>
>
>
> Grant. . . .
>
> jonathan@innovativesource.net wrote:
>> I have a machine that I using as a firewall, separting WAN / LAN / DMZ
>>
>> Rules thus far are to NAT all outgoing packets that come in from the L=
AN
>> interface.
>>
>>>From the machine itself, I can ping machines on my DMZ interface (eth2=
)
>> and my LAN interface (eth0)
>>
>> I'm having trouble getting through the firewall to my DMZ machines, bu=
t
>> I
>> can access the NIC that routes to the DMZ machine via SSH...  I've tri=
ed
>> various forwarding rules, and even changed the default FORWARD policy =
to
>> ACCEPT anything.  Here is a basic rule I'm trying:
>>
>> #eth1 =3D WAN NIC
>> #eth2 =3D DMZ NIC
>> iptables -A FORWARD -i eth1 -o eth2 -d xx.xx.xx.xx  -p tcp --dport 22 =
-j
>> ACCEPT
>>
>> now, if I do a netstat on the firewall nothing... if I do a netstat on
>> the
>> machine I'm attempting to connect from... all I see is SYN_SENT
>>
>> **I'm trying from external machines...i.e. machines not on my network.
>>
>> physical network is
>>
>> router -> vlan -> firewall -> DMZ
>> router -> vlan -> firewall -> LAN
>>
>> I can also access the DMZ machine via the firewall itself and vice
>> versa,
>> but once logged into the DMZ machine, I can't get to anything past the
>> firewall.  I have the following rules for that
>>
>> iptables -A FORWARD -i eth2 -o eth1 -j ACCEPT
>>
>> Kinda confused here...
>>
>> the LAN stuff works... at least for now... to simply forward the packe=
ts
>> out through the WAN NIC and NAT them...
>>
>> *shrug*
>
>



