From: =?ISO-8859-1?Q?M=E5rten_Segerkvist?= <volodja@acc.umu.se>
Subject: RE: NAT doesn't work (only a fraction of the forwarded packets reach
 the postrouting chain)
Date: Sun, 13 Mar 2005 13:01:22 +0100 (MET)
Message-ID: <Pine.GSO.4.62.0503131236230.10059@shaka.acc.umu.se>
References: <02BB8A4AC86C564C89C7F14CF98CE0C49B72@knowledge.wizdom.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <02BB8A4AC86C564C89C7F14CF98CE0C49B72@knowledge.wizdom.nu>
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

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
> Iptables --table nat --append POSTROUTING --out-interface eth0 -j SNAT=20
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

