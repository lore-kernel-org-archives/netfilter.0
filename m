From: =?ISO-8859-1?Q?Tiziano_M=FCller?= <tiziano@ifi.unizh.ch>
Subject: (no subject)
Date: Tue, 18 Feb 2003 13:20:09 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045570809.3e5224f96e5ed@mail.2wire.ch>
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

Hi there...


I have to do a firewall with DMZ (nat) as follows:

                            (DMZ)
Internet ------ Firewall 1 --------- Firewall 2 ------ LAN
                              |-- WWW
                              |-- Mail
                              |-- DNS

We have 16 extern IP\'s, so, every Server in the DMZ has
to be mapped to a real IP.

I did the follow:

ifconfig eth1:1:0 add 1.2.3.4 (= real IP for the WWW-Server)
and
iptables -t nat -A PREROUTING -d 1.2.3.4 -j DNAT --to-destination 10.0.0.4
(= IP of the WWW-Server in the DMZ)
iptables -t nat -A POSTROUTING -s 10.0.0.4 -j SNAT --to-source 1.2.3.4

so, ping and SSH works, but nothing else.
has anyone an idea?

thanks in advance

