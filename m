From: Hudson Delbert J Contr 61 CS/SCBN <Delbert.Hudson@LOSANGELES.AF.MIL>
Subject: RE: Problem with ssh
Date: Wed, 25 Aug 2004 09:55:01 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7EACCDBB65D37443912D80713CC1245D02382AD1@fsnsab20.losangeles.af.mil>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

duh????

11000000.10100100.00000000.00000000 .eq.  192.168.0.0

11000000.10100100.11001000.00000000 .eq.  192.168.200.0

but they are .EQ. if one looks thru the lens of the netmask 
as only the 16 leftmost bits are considered as net and the 
16 rightmost are considered as host addys.

11000000.10100100.11001000.00000000/16 .EQ
11000000.10100100.00000000.00000000

the /16 mask .EQ. 0.0.255.255 

he could really mean 192.168.0.0/16 instead of 192.168.200.0/16

it is common industry practice to subnet 192.168.0.0 on a 16 bit mask...

looks like he might have gotten confused but...anyway, hope he fixes the
typo..
if its not a typo, then heeding the crack about reading the IP Subnetting
text would be wise...

v/r,
~piranha

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Jason
Opperisano
Sent: Wednesday, August 25, 2004 5:32 AM
To: netfilter@lists.netfilter.org
Subject: RE: Problem with ssh


> Hi all,
>
> First off, a feeble attempt at diagramming my setup :
>
> 192.168.200.x   eth -> eth  Embedded Linux Wireless  ppp -> ppp Embedded
> Linux Access Point eth0 -> 192.168.1.x
>
> The two Embedded Linux Wireless boxes are actually what I am working on.
> The second one in the list above is configured as a bridge, and doesn't
> currently have any firewalling (because I haven't figured out whether I
> need ebtables or iptables, but that's another story).
>
> The client side wireless box (on the left) has the following rule in it :
>
> $IPTABLES -A bad_tcp_packets -i $INET_IFACE -s 192.168.200.0/16 -j DROP

192.168.200.0/16 == 192.168.0.0 - 192.168.255.255

try using 192.168.200.0/24; and if that wasn't a typo, reading up on IP
subnetting.

-j

