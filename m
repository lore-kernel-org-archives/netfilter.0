From: Marc Carter <marccarter@speakeasy.net>
Subject: Re: simple, but not for me
Date: Sun, 30 Jun 2002 12:48:37 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D1F3665.3020204@speakeasy.net>
References: <20020630132725.896984212@lists.samba.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org



netfilter-request@lists.samba.org wrote:

[snip]

 > This is what you need to port forward (assuming standard ports):
 >
 > #Forward web services to internal host iptables -t nat -A PREROUTING
 > -p tcp -d $extip --dport 80 -j DNAT--to 192.168.0.8:80
 >
 > #Forward ssh to internal host iptables -t nat -A PREROUTING -p tcp -d
 > $extip --dport 22 -j DNAT--to 192.168.0.8:22
 >
 > #Forward mysql to internal host iptables -t nat -A PREROUTING -p tcp
 > -d $extip --dport 3306 -j DNAT--to 192.168.0.8:3306
 >
 > Remember to shut off the above services on your firewall box.

This last has me curious.  If I shut off ssh (port 22) on the firewall, 
then I can't get into it to work on it (it's headless and far far away 
from a chair -- and just now what seems more important, a fan).

Right now, ssh into the firewall box from the ext_if goes straight to 
one of the internal machines (but only allowed from one other trusted 
machine, 1.2.3.4 in the e.g.), but an ssh request from the internal 
network (into the int_if) stays on the firewall box.

Sort of looks like this:

All chains are flushed and set to default DROP

The nat chain rules are

$IPTABLES -t nat -A PREROUTING -i $EXT_IF -s 1.2.3.4 \
   -d my.static.ip.address -p tcp --dport 22 -j DNAT \
   --to 192.168.1.2

$IPTABLES -t nat -A POSTROUTING -o $EXT_IF -s 192.168.1.2 \
   -p tcp --sport 22 -j SNAT --to my.static.ip.address

The FORWARD chain rule allows port 22 (originating from trusted machine) 
from the firewall to the internal box and then drops the rest

$IPTABLES -A FORWARD -s 1.2.3.4 -d 192.168.1.2 -p tcp -j ACCEPT
$IPTABLES -A FORWARD -p tcp --dport 22 -j DROP

And then an INPUT rule to allow getting into the box from the internal 
network

$IPTABLES -A INPUT -s $INT_NET -i INT_IF -j ACCEPT

but disallows spoofing from the outside

$IPTABLES -A INPUT -s INT_NET -i EXT_IF -j DROP

This seems to work.  If anyone sees anything stupid here, let me know. 
I hate being stupid.

Thanks.

m



-- 
Marc Carter
Assistant Professor, Itinerant Scientist,
         Inveterate Skeptic, Former Surfer.
---
"You can't have a market system that really depends
on everybody behaving as saints."
------
Ken Rose, OSU's National Regulatory Research Institute


