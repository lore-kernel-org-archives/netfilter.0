From: Adharsh Praveen R <adarsh@multitech.co.in>
Subject: HELP PPTP CONNTRACK MULTIPLE CLIENTS
Date: Thu, 05 Dec 2002 18:40:34 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DEF504A.F4099ACE@multitech.co.in>
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
To: netfilter@lists.netfilter.org

Hai 

I am trying to get PPTP conntrack to work, but with no luck.

I tried with POM's pptp-conntrack-nat.patch (by Harald).

Every time I try to apply the patch it fails.

Finally some how I managed to apply the patch on my 2.4.18 kernel. I

use iptables-1.2.6a.

I have my PPTP server (192.168.1.219) internal to my LAN (eth0) and
clients in a different network.

I have a linux box where I applied the patch with IP address on one
interface

eth0  as 192.168.1.76 and another interface eth1  as 192.168.9.10.

I have two clients (Win 95) with their IP address as 192.168.9.1 and
other's

as 192.168.9.2.

The default gateway for these clients is set to 192.168.9.10.

I added a simple rule in my Linux box

iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

From clients I am able to ping the other networks. ( I am able to ping
192.168.1.219).

When I tried to establish a pptp connection from 192.168.9.1 to
192.168.1.219.

The connection got established and client logged into the network.

The problem aroused here. when I tried from the second client
192.168.9.2 to

establish a pptp connection it failed. At any instant only one
connection is getting

established.

So thought the patch is no good so I downloaded a patch from

http://www.impsec.org/linux/masquerade/ip_masq_vpn.html

which is netfilter-pptp-2.4.17-rev2.patch.

when I tried to apply this patch it applied cleanly.

Now I tried the above mentioned setup again.

Again its the same case. I am not able to connect the second client.

At any instant only one client is getting connected.

I am caught in this loop.

I saw a patch in December's list from Philip.

I would like to know the steps involved in getting PPTP conntrack work.

Which patch I should apply first, is it the one from netfilter.org
pptp-conntrack-nat.patch?

When can I apply the patch given by philip?

What are the iptable rules I should add?

please guide me. I want to connect multiple PPTP clients.

Please explain the steps involved in this as I am a new to iptables /
conntrack.

Thanks in advance.

regards,
adharsh.

