From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: NAT doesn't work (only a fraction of the forwarded packets
	reach the postrouting chain)
Date: Sun, 13 Mar 2005 13:14:31 +0100
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C49B73@knowledge.wizdom.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

What do you see, when you tcpdump on your external interface? (tcpdump =
-I eth0). Can you see natted packets exiting that interface?

The reason, that you only see 4 packets in the iptables -t nat -L is =
that if you fire off 10 pings, iptables will see the latter 9 as =
belonging to the same connection and therefor only logs 1.

It might be as simple, that the host you are trying to ping is just =
unpingable.

Specify some more info, like what you are trying to ping, traceroute -I =
output.

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org =
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of M=E5rten =
Segerkvist
Sent: Sunday, March 13, 2005 1:01 PM
To: netfilter@lists.netfilter.org
Subject: RE: NAT doesn't work (only a fraction of the forwarded packets =
reach the postrouting chain)

On Sun, 13 Mar 2005, Sietse van Zanen wrote:

> From man iptables:
> MASQUERADE
> This target is only valid in the nat table, in the POSTROUTING chain.=20
> It should only be used with dynamically assigned IP (dialup)=20
> connections: if you have  a  static  IP address,  you should use the=20
> SNAT target.
>
> Try using regular SNAT rule:
>
> Iptables --table nat --append POSTROUTING --out-interface eth0 -j SNAT =

> --to-source:your.pub.ip.addr
>

Now using:

echo 1 > /proc/sys/net/ipv4/ip_forward
modprobe ipt_MASQUERADE
modprobe iptable_filter
iptables --table nat --append POSTROUTING --out-interface eth0 -j SNAT \
   --to-source 81.172.241.145
iptables --append FORWARD --in-interface eth1 -j ACCEPT

This gives me the same result as previosly. What confuses me further is=20
that no packets seems to be accepted from the wlan-interface.

> iptables -L -v

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source=20
destination
   125  5000 ACCEPT     all  --  wlan0  any     anywhere=20
anywhere

> iptables -t nat -L -v

Chain POSTROUTING (policy ACCEPT 0 packets, 0 bytes)
  pkts bytes target     prot opt in     out     source=20
destination
     4   295 SNAT       all  --  any    eth0    anywhere=20
anywhere            to:<IP>

As before, I'd be most grateful for any suggestions!

/M=E5rten Segerkvist


