From: George Georgalis <georgw@galis.org>
Subject: Re: ssh connecting to wrong machine....
Date: Mon, 3 Jun 2002 01:05:44 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020603010544.E16556@trot.haven.dom>
References: <20020602192157.A16556@trot.haven.dom> <002c01c20aaa$812e04b0$020aa8c0@matttm9svd8lrh>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <002c01c20aaa$812e04b0$020aa8c0@matttm9svd8lrh>; from mhellman@raccoon.com on Sun, Jun 02, 2002 at 09:58:14PM -0500
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Matthew Hellman <mhellman@raccoon.com>
Cc: netfilter@lists.samba.org

On Sun, Jun 02, 2002 at 09:58:14PM -0500, Matthew Hellman wrote:
>George,
>The general rule for ip/port forwarding to internal machine is simple. You
>have one PREROUTING rule that changes the destination address/port.  You
>then have one FORWARD rule that allows the packets to be forwarded (because
>you are, or should be, by default dropping everything in the FORWARD chain).

Yes, drop is my default policy for forward and input. Thanks for the
succinct explanation of how input and nat work together! I think I knew,
but didn't understand.

>
>> iptables -t nat -A PREROUTING -p tcp -s $EXT_host04 -j DNAT --to-destination $LAN_host04
>
>This is the major problem. If you're connection from a host on the Internet
>the source address is not going to be your firewall. Change this line to:
>iptables -t nat -A PREROUTING -p tcp -j DNAT --to-destination $LAN_host04

How's this? ($EXT_host04 is just an alias, and there will be more) 

iptables -t nat -A PREROUTING -p tcp -d $EXT_host04 -j DNAT --to-destination $LAN_host04

>
>I would consider tightening up your forward rules as well:
>

Done.

>Also, what is UDP port 22 for?  Is your firewall running all the same
>services as $LAN_host04?  You are allowing the same access to it.

Well, don't know that openssh uses it, but since 22/udp is in
/etc/services I thought it might be implemented in some curcumstance...
all the boxes are secured, so I'm not too worried about letting in
ports now, just trying to to manage a smooth production migration (the
$LAN_host04 functions will split to other machines, just want a sound
firewall script now, before it gets long).  The firewall is actually
running dns and smtp now too. Once I get all the services packaged,
portable and on $LAN_host04, I'm going to use an old box for the
firewall (with LEAF) and turn the firewall into a LAN server. The setup
should (hopefully) scale additional Internet IPs and LAN computers well,
someday we may even setup a DMZ :)

This seems to be doing the job :-} I added another nat rule, does it
look okay?

LANIF=eth0
EXTIF=eth1
TCP_OPEN="22,25,53,80"
UDP_OPEN="53"
LAN_host04=192.168.xx.xx
EXT_host04=xx.xx.xx.xx  

iptables -P INPUT DROP
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i $EXTIF -m state --state NEW -p tcp -m multiport --dport $TCP_OPEN -j ACCEPT
iptables -A INPUT -i $EXTIF -m state --state NEW -p udp -m multiport --dport $UDP_OPEN -j ACCEPT
iptables -A INPUT -i $LANIF -m state --state NEW -j ACCEPT
iptables -A INPUT -i lo     -m state --state NEW -j ACCEPT
iptables -A INPUT -j LOG --log-prefix "INPUT-DROP "
iptables -A INPUT -j REJECT

iptables -t nat -A PREROUTING -d $EXT_host04 -j DNAT --to-destination $LAN_host04

iptables -P FORWARD DROP
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -i $EXTIF -o $LANIF -d $LAN_host04 -p tcp -m multiport --dport $TCP_OPEN -m state --state NEW -j ACCEPT
iptables -A FORWARD -i $EXTIF -o $LANIF -d $LAN_host04 -p udp -m multiport --dport $UDP_OPEN -m state --state NEW -j ACCEPT
iptables -A FORWARD -j LOG --log-prefix "FORWARD-DROP "

iptables -t nat -A POSTROUTING -s $LAN_host04 -j SNAT --to-source $EXT_host04
iptables -t nat -A POSTROUTING -o $EXTIF -j MASQUERADE

iptables -P OUTPUT ACCEPT


Thanks again,
// George


-- 
GEORGE GEORGALIS, System Admin/Architect    cell: 347-451-8229 
Security Services, Web, Mail,            mailto:george@galis.org 
File, Print, DB and DNS Servers.       http://www.galis.org/george 


