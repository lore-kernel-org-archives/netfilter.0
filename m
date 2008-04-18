From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: loosing packets with netfilter and ipsec in tunnel mode
Date: Thu, 17 Apr 2008 21:13:28 -0500
Message-ID: <480803C8.80901@riverviewtech.net>
References: <1255.10.211.1.1.1208465600.squirrel@mail.thom.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1255.10.211.1.1.1208465600.squirrel@mail.thom.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 4/17/2008 3:53 PM, devel@thom.fr.eu.org wrote:
> I don't know if it is the right place to post this question, but here 
> it is.

Sure, this is close enough to if not one of the better places to ask.

> I have setup 2 servers that are doing mainly firewalling and VPN for 
> two interconnected private networks.

OK...

> Each one having 2 network interfaces like this :
> 
>         Host A                                          Host B
>                        |      NAT BOX         |
>  eth1           eth0   |     eth0 eth1        |      eth0   |eth1
> Private      |Internet | Internet|semi        |      semi   |private
> network      |         |         |private     |      private|network
> 10.211.0.0/16|80.1.1.1 | 80.1.1.2|192.168.1.1 | 192.168.1.10|10.212.0.0/16
> 
> One machine is running linux-2.6.23 kernel, the other is running 
> 2.6.24 kernel (both downloaded from kernel.org).

*nod*

> In this setup, I can't configure or manage anything with what I 
> called the NAT box. This is provided by the ISP as modem/router.

Don't you just love it when you have an uncooperative entity in the 
middle?  <sarcasm>I know I sure do.</sarcasm>

> Firewalling works ok, I can browse internet pages send emails... from 
> both private nets. I could setup the IPSEC tunnel and this is coming 
> up correctly. I did add one nat rule to prevent the packet that were 
> to be encrypted being SNATed (e.g. for host A): $IPTABLES -t nat -A 
> POSTROUTING -o $INET_IFACE -d $HOST_B_LAN_RANGE -j ACCEPT

How many packets does the rule match?  If this rule does match packets, 
are these packets really crossing the net or are they looping back 
through the kernel to be IPSec encapsulated?

> With this configuration I managed to send pings from eth1 on host A 
> to eth1 on host B and this works.

*nod*  As it should (with or with out the IPTables rule above).

> I did add one more nat rule (e.g. for host A): $IPTABLES -t nat -A 
> POSTROUTING -o $INET_IFACE -s $INET_IP -d $HOST_B_LAN_RANGE -j SNAT 
> --to-source $LAN_IP to each host to be able to ping eth1 from host B 
> from eth0 on host A and vice versa. That works too.

Why do you have this rule?  Again the only traffic that *MAY* be seen by 
this rule is the traffic that is going to loop through the kernel to be 
subsequently IPSec encapsulated.

> Finally, I added a third rule to make the packets coming out of the 
> tunnel, being SNATed to the private lan IP address of the host on 
> which it came out  (e.g. for host A): $IPTABLES -t nat -A POSTROUTING 
> -s $HOST_B_LAN_RANGE -d $LAN_IP_RANGE -j SNAT --to-source $LAN_IP

Ok, this rule should see a fair bit of traffic.  However you are 
breaking traffic going from one LAN to the other.

Do you not want the hosts on a given LAN to see the source IP of traffic 
on the other LAN?  In short, are you SNATing the traffic to hide 
something or is this just an undesired side effect?

> With this configuration, I'm able to ping from eth0 or 1 on host A to 
> any host on the private lan host B is connected to.
> 
> Now, if I try to ping from a host on private network host A is 
> connected to eth1 on host B or another host in host B private 
> network, the packets won't get through.

I bet they do get there, but as the leave the tunnel Host B SNATs the 
traffic to Host B's eth1 LAN IP.  So I bet you have a lot of traffic on 
the ultimate target host that is from Host B.

Why are you using the third rule again?

> By adding some log targets to track down the packets, I could see 
> that the packet gets into eth1 of host A, crosses the raw prerouting 
> table, crosses the nat prerouting table, then disappear from host A 
> (I assume at that point the packet must have been encrypted and sent 
> over the tunnel), and does not appears at host B.

What rule(s) are you using to look for the packet(s)?  I'm wondering if 
your traffic is not being NATed and thus no longer matching the rule(s) 
that you may be using to track it.

> Anybody can tell what I am doing wrong ?

Why are you even NATing the traffic between the two LANs?  Why not just 
route the traffic through the VPN?  All you should need to do is 
standard routing one each system plus bringing up your VPN.  The kernel 
should alter your routing table for you for the VPN.

(Based on your diagram from above, I'm going to try to show a packet flow.)

+---+   +---+   +---+   +---+   +---+
| 1 +---+ A +---+ N +---+ B +---+ 2 |
|   |   |   |   +---+   |   |   |   |
| X----------+         +----------X |   (Unencrypted packet(s))
+---+  + + + +         + + + +  +---+   (De/Encryption process)
        +=====================+          (Encrypted packet(s))
         +---+           +---+

In this example the client 1 on LAN A pings client 2 on LAN B.
  - The packet(s) will leave 1 and go out via A.
  - A will realize that the packet(s) are to be routed via the VPN.
  - The packet(s) will pass through A's kernel one time unencrypted.
  - The packet(s) will be encrypted and loop back through the kernel.
  - The packet(s) will pass through A's kernel one time encrypted.
  - Encrypted packet(s) pass through N on the way to B.
  - The packet9s) will pass through B's kernel one time encrypted.
  - The packet(s) will be unencrypted and loop back through the kernel.
  - The packet(s) will pass through B's kernel one time unencrypted.
  - B will send the packet(s) to 2.
  - The packet(s) will arrive at 2 and be processed.
The process happens in reverse for the reply traffic.

> Thanks a lot

You are welcome.



Grant. . . .
