From: Manuel Tato <madness@adinet.com.uy>
Subject: Voice IP
Date: Mon, 27 Oct 2003 18:34:52 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F9D8F7C.7010508@adinet.com.uy>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Hi, i'm configuring a firewall/router with a static ip ADSL and a voice
IP gateway.
The voiceip gw es in configured at 192.168.1.40.
With this script i can make calls, but i cant recive any.

- ---------------------------------------------------
echo 1 > /proc/sys/net/ipv4/ip_forward

modprobe ip_conntrack_h323
modprobe ip_nat_h323

iptables -A INPUT -j ACCEPT
iptables -A FORWARD -j ACCEPT
iptables -A OUTPUT -j ACCEPT

iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

iptables -t nat -A PREROUTING -p tcp --dport 1726:1789 -i eth1 -j DNAT
- --to 192.168.1.40:1726:1789
iptables -A FORWARD -i eth1 -p tcp -d 192.168.1.40 --dport 1726:1789 -j
ACCEPT
iptables -t nat -A PREROUTING -p udp --dport 1726:1789 -i eth1 -j DNAT
- --to 192.168.1.40:1726:1789
iptables -A FORWARD -i eth1 -p udp -d 192.168.1.40 --dport  1726:1789 -j
ACCEPT
- -----------------------------------------------------

Any idea?
i'm blocking ports?
i need any other module??
thanks in advance
thanks a lot...


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org

iD8DBQE/nY98W/G6GKzQKp4RAndEAJ4pYh04AZuTc/f8MQ8Ae6RB/GpRFgCgkaCg
SwAh5HHLSdd0rj68FzTPdXY=
=RcOK
-----END PGP SIGNATURE-----



