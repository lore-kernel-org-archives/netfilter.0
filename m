From: "Preston Wade" <Preston_Wade@hilton.com>
Subject: RE: Should i be worried?
Date: Tue, 28 Jan 2003 17:30:30 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0B2759D401C1D211ACA500805FFE2C3F0860BE22@cmxserv3.hilton.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: 'Erik Ahlner' <whyz@home.se>, netfilter@lists.netfilter.org

This rule would allow someone outside your firewall to route to your
internal boxes.  I wouldn't accept all connection from the external
interface to the internal interface.

$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -j ACCEPT

Also I wouldn't have a default policy of ACCEPT for the INPUT chain either.
$IPTABLES -P INPUT ACCEPT


Anyway.... the log entry below is interesting because it shows that the
packet came in on eth0 and went out eth0, but given the source and
destination addresses I would think it would have came in on one interface
and gone out a different.  The first two look like DNS queries based on the
DPT, but the source port is that of a NetBIOS service.  The last entry looks
like potentially a legitimate web request.

Which interface is your outside?
Can you show us the output of a netstat -nr?

Thanks,
Preston


-----Original Message-----
From: Erik Ahlner [mailto:whyz@home.se] 
Sent: Tuesday, January 28, 2003 4:30 PM
To: netfilter@lists.netfilter.org
Subject: Should i be worried?

Hello!

I just happened to do a dmesg, and got this output:

IN=eth0 OUT=eth0 SRC=192.168.0.186 DST=130.236.230.9 LEN=74 TOS=0x00
PREC=0x00 TTL=127 ID=14459 PROTO=UDP SPT=137 DPT=53 LEN=54
IN=eth0 OUT=eth0 SRC=192.168.0.186 DST=130.236.230.9 LEN=74 TOS=0x00
PREC=0x00 TTL=127 ID=14715 PROTO=UDP SPT=137 DPT=53 LEN=54
IN=eth0 OUT=eth0 SRC=192.168.0.88 DST=217.209.28.135 LEN=48 TOS=0x00
PREC=0x00 TTL=127 ID=37469 DF PROTO=TCP SPT=2418 DPT=80 WINDOW=16384
RES=0x00 SYN URGP=0


As you can see, i get some message about traffic from 192.168.0.186 and .88
.. these two computers are NOT in my home network, so i guess that someone
has named his computers like that on the university network, even though the
university network has 130.236.x.x.
Is this a problem for me?
And what does this output actually mean?
Has someone used my computer as a router?
If they have, how is that possible?
This is what my iptable looks like:

$IPTABLES -P INPUT ACCEPT
$IPTABLES -F INPUT
$IPTABLES -P OUTPUT ACCEPT
$IPTABLES -F OUTPUT
$IPTABLES -P FORWARD DROP
$IPTABLES -F FORWARD
$IPTABLES -t nat -F

$IPTABLES -A FORWARD -i $EXTIF -o $INTIF -j ACCEPT
$IPTABLES -A FORWARD -i $INTIF -o $EXTIF -j ACCEPT
$IPTABLES -A FORWARD -j LOG

$IPTABLES -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE
$IPTABLES -A INPUT -s 192.168.0.0/24 -i eth0 -j DROP

I thought that the last line was to stop this from happening..
Or am i just stupid? Did dmesg just show me that some packets have been
dropped?

Many thanks

Erik Ahlner




