From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: iptables/nat/others problem
Date: Sun, 11 Jun 2006 20:18:03 +0200
Message-ID: <448C5E5B.50406@plouf.fr.eu.org>
References: <20060609153324.57289.qmail@web34313.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060609153324.57289.qmail@web34313.mail.mud.yahoo.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

marc pascual a =E9crit :
> hello all. my friend's network has a lotus domino
> server having both a public ip and a lan ip. he asked
> me to setup a linux firewall and put the lotus domino
> server behind it, while maintaining accessibility from
> the outside via port forwarding.
>=20
> the domino server's public ip is xxx.xxx.103.29 and
> its LAN ip is 10.10.0.1. the firewall's public ip is
> xxx.xxx.103.26 and its LAN ip is 10.10.0.50. i issued
> a couple of iptables command like this:
>=20
> # iptables -t nat -A POSTROUTING -o eth0 -j SNAT
> --to-source xxx.xxx.103.26
> # iptables -t nat -A PREROUTING -i eth0 -p tcp -d
> xxx.xxx.103.26 --dport 80 -j DNAT --to-destination
> 10.10.0.1:80
>=20
> i fired up a web browser (from another public ip) to
> http://xxx.xxx.103.26 and it timed out.

Not surprising.

[...]
> [root@localhost ~]# nmap xxx.xxx.103.26
> 22/tcp   open     ssh
> 25/tcp   filtered smtp
> 135/tcp  filtered msrpc
> 136/tcp  filtered profile
> 137/tcp  filtered netbios-ns
> 138/tcp  filtered netbios-dgm
> 139/tcp  filtered netbios-ssn
> 445/tcp  filtered microsoft-ds
> 1080/tcp filtered socks
> 1720/tcp filtered H.323/Q.931
> 6112/tcp filtered dtspc
>=20
> this is kinda odd since the firewall is running linux,
> and the only open port on it is 22.

My guess is some upstream router blocks all the ports shown as filtered.=20
But this has nothing to do with your problem.

[...]
> questions:
> 1. is it safe to say that if i turn off the public
> interface on the domino server, run services on the
> lan scope, and do port forwarding from the gateway,
> this specific problem will go away?

What do you mean by "safe" ? If you mean it will work, my answer is yes.=20
Anyway isn't the final goal to turn off the public interface so all=20
communications have to pass through the firewall ?

> 2. what could be the exact reason why i cant do
> port-forwarding to the domino's lan ip while the
> public ip is active?

The reason lies in the return path routing. Return packets from the=20
server will follow the default route and be sent via the public=20
interface directly to the gateway, by-passing the NAT box. Incoming=20
packets were sent to the private address, so outgoing packets are sent=20
with the same private address, even though sent via the public=20
interface. Here we have two possibilites. Any upstream router on the way=20
back to the client may drop these packets with a private source address.=20
If none does, the clients will not recognize the packets as return=20
packets from the server because the source address does not match the=20
destination address in the forward packets sent to the server.

Possible workarounds :
On the server, force routing of return packets or packets with private=20
source address via the private interface.
- OR -
On the server, force routing of return packets via the same interface as=20
the forward packets were received on.
- OR -
On the NAT box, masquerade the client source address with the private=20
NAT box address with SNAT or MASQUERADE, so return packets go back to=20
the NAT box and can be de-NATed.
Note : the real client address is unknown to the server (for logging or=20
access purpose).

