From: =?ISO-8859-1?Q?Tiziano_M=FCller?= <tiziano@ifi.unizh.ch>
Subject: 1:1 NAT, DMZ and Masq
Date: Tue, 18 Feb 2003 22:00:46 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045602046.3e529efe1672f@mail.2wire.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi guys

I apologize for my first message, it was crap.
sorry.

Now, I\'ve a little problem and no idea how to
solve it, I hope, someone could give me a hint.

Situation:

Internet -- Firewall 1 -- DMZ -- Firewall 2 -- LAN
                           |-- Webserver = WWW
                           |-- FTP
                           |-- DNS

now, for the Server in the DMZ, I wanted to use a 1:1
NAT, for the hole rest Masq. So did I the follow (for the WWW)
on the Linux-Router:

10.0.0.4 = DMZ IP WWW; x.x.x.165 = Official IP WWW

ifconfig eth1:1:0 add x.x.x.165
(as described in the NAT HowTo, necessary for the ARP-Packets)

iptables -t nat -A PREROUTING -d x.x.x.165 -j DNAT --to 10.0.0.4
iptables -t nat -A POSTROUTING -s 10.0.0.4 -j SNAT --to x.x.x.165
iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

So far it works well from the inside. From outside I can only ping
the WWW and connect with SSH, but not connect via FTP or WWW (the
services are up and running).

Has someone an idea, why this happens? Or a better idea to do this?

Thanks very much in advance
Tiziano

