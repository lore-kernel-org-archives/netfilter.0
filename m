From: Karol Tomala <ktomala@tgc.pl>
Subject: RE: Serious NAT problem
Date: Tue, 30 Mar 2004 12:23:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080642189.2754.163.camel@wolverine.waw.tgc.pl>
References: <7C9884991ADAE0479C14F10C858BCDF5122F31@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF5122F31@alderaan.smgtec.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

W li=B6cie z pon, 29-03-2004, godz. 21:59, Daniel Chemko pisze:=20
> Karol Tomala wrote:
> > Hello!
> > I have a question regarding netfilter. I have been looking for an
> > answer for two days and I'm hopeless. That's why I have decided to
> > ask for help here.

[cut]

> 1. If the default gateway on the 172 network is not your firewall, then
> this will break, because replies to the 10 network will trickle through
> your default router, not this firewall.

Network 172.18. shouldn't be obviously visible from network 10.128. Only
particular hosts should be transparently mapped to the 10.128. network
IP addresses. Unfortunatelly this firewall is not default gateway for
172.18. network.=20

> 2. The DNAT rule is all you need if you just want to establishe
> conntections TO the 172 network. The SNAT rule is all you need to
> establishe connections TO the 10 network.

How should proper rule look like? Something like:

iptables -t nat -A PREROUTING -i eth2 -s 10.128.2.64/255.255.255.224 -d
10.128.2.70 -j SNAT --to-destination 172.18.5.2


> 3. You must either bind the .70 address to your eth2, or you have to
> proxy arp the address to the interface. Otherwise, requests for .70 in
> the 10 network will return failure. EG:
> ip addr add 10.128.2.70/16 dev eth2

I don't want to bind additional addresses for eth2. I have done a:
echo 1 > /proc/sys/net/ipv4/conf/eth2/proxy_arp
But still pinging 10.128.2.70 gives nothing but "arp who-has 10.128.2.70
tell 10.128.2.66" on tcpdump -i eth2 output. Could you help me a little
with setting proxy-arp properly?

Greetings,
--
Karol Tomala


