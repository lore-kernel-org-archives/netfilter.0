From: <netfilter@drbroyles.com>
Subject: Re: OT 3com nic prob
Date: Mon, 20 Oct 2003 01:44:47 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <009601c396cd$457a4950$73593a42@drbroyles.com>
References: <F22386C3FEB012449238672E38ED61E70A8D60@overlord.overturemedia.com>
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
To: Fritz Mesedilla <fritz.mesedilla@overturemedia.com>
Cc: "[netfilter] Mailing List" <netfilter@lists.netfilter.org>

Fritz,
    I have noticed similar problems when I've tried to have multiple nics on
the same computer and also on the same subnet.  I'm guessing that since you
don't have a route entry for eth0, that most likely no computers on your
network are getting eth0's MAC address when performing arp requests on IP
192.168.247.233.

What I think is probably happening is the following scenario.  When you
initiate the ping to 192.168.247.233 (eth0) from a computer on your network,
an ARP response is getting sent back with the MAC address for eth1.  So the
computer happily keeps sending pings to 192.168.247.233 (eth0) with the MAC
address of eth1.  I'm guessing that your /proc/sys/net/ipv4/ip_forward is
set to 1, so the ping requests are getting transferred within the kernel
from eth1 to eth0.  This would be why the ping works in the first place.
But when you disconnect eth1, the pings stop because the MAC address that
the computer was sending the pings to is gone from your ethernet space.

What you need to do to fix this behavior is to make sure that your testing
computer is getting the correct MAC address when it initiates its ARP
request.  You may want to try the following commands to give eth0 its own
entry in your route table.

route -A inet del -net 198.168.0.0 netmask 255.255.0.0
route -A inet add -net 198.168.0.0 netmask 255.255.0.0 eth0

Hopefully this will remove the duplicated entry in your route table and add
a new one for eth0.

You can use tcpdump to inspect ARP packets while you perform the ping test.
Just have a window on your sever with the following command running.

tcpdump -i eth1 -n -vvv arp

This should show you all of the ARP packets that eth1 sees.

I am by no means an expert on this myself, but I've been studying the same
sort of problems on my own server.  Good luck.

Brandon Broyles

----- Original Message -----
From: "Fritz Mesedilla" <fritz.mesedilla@overturemedia.com>
To: "Netfilter Mailing List (E-mail)" <netfilter@lists.netfilter.org>
Sent: Monday, October 20, 2003 12:58 AM
Subject: OT 3com nic prob



I have a new problem. Although not entirely iptables related, I use it for
iptables.
I have 2 network cards: 1 built-in intel with the motherboard and 1 3com
3c509x.
I was gonna use the 2 nics for iptables.

Now the problem comes when assigning ip addresses and rules based on network
cards.

eth0: 192.168.247.233 - internal lan, no gateway
eth1: 192.168.247.232 - external access, with gateway access

I have squid running on the server. When people try to use squid on
192.168.247.233 they can connect properly but I notice on /var/log/kernel
that IN=eth1 DST=192.168.247.233

And "route" gives me:
Kernel IP routing table
Destination     Gateway         Genmask         Flags Metric Ref    Use
Iface
192.168.0.0     *               255.255.0.0     U     0      0        0 eth1
192.168.0.0     *               255.255.0.0     U     0      0        0 eth1
127.0.0.0       *               255.0.0.0       U     0      0        0 lo
default         192.168.247.1   0.0.0.0         UG    0      0        0 eth1

I can't seem to find my eth0 in the route function.


ifconfig produces the correct settings:
eth0      Link encap:Ethernet  HWaddr 00:02:55:EE:C3:91
          inet addr:192.168.247.233  Bcast:192.168.255.255  Mask:255.255.0.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:5966 errors:0 dropped:0 overruns:0 frame:0
          TX packets:177 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:3947472 (3.7 Mb)  TX bytes:21673 (21.1 Kb)
          Interrupt:10 Base address:0xa000

eth1      Link encap:Ethernet  HWaddr 00:10:5A:D0:19:16
          inet addr:192.168.247.232  Bcast:192.168.255.255  Mask:255.255.0.0
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:26729 errors:0 dropped:0 overruns:0 frame:0
          TX packets:21025 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:100
          RX bytes:6420599 (6.1 Mb)  TX bytes:17324985 (16.5 Mb)
          Interrupt:10 Base address:0xb800

On pinging 192.168.247.233, it produces a successful result but when I pull
the plug on eth1 it stops working. So why does ifconfig say 192.168.247.233
is on eth0 when I pull the rj45 on eth1 it stops responding?

/etc/modules.conf says:
alias eth0 eepro100
alias eth1 3c59x

Hope you can help me again. Thanks.



fritz <www.mesedilla.com>
---
+ Basta Ikaw Lord


----------------------------------------------------------------------
This email and any files transmitted with it are confidential and
intended solely for the use of the individual or entity to whom they
are addressed. If you have received this email in error please notify
the sender immediately by e-mail and delete this e-mail from your
system. Please note that any views or opinions presented in this
email are solely those of the author and do not necessarily represent
those of the company. Finally, the recipient should check this email
and any attachments for the presence of viruses. The company accepts
no liability for any damage caused by any virus transmitted by this
email.

Overture Media, Inc.
Direct Line: (632) 635-4785
Trunkline:   (632) 631-8971 Local 146
Fax: (632) 637-2206
Level 1 Summit Media Offices, Robinsons Galleria EDSA Cor. Ortigas Ave.,
Quezon City 1100




