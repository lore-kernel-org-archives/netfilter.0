From: Carlos Ble <carlosble@terra.es>
Subject: netfilter and squid transparent proxy
Date: Tue, 1 Apr 2003 16:42:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E190Ntg-0000s8-00@Alfa.linuxserver1.net>
Reply-To: carlosble@terra.es
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

Hi all.I'm new in the mailinglist.
I have a linux router with 3 ethernet interfaces:
eth0 is my LAN, eth1 and eth2 are internet gateways.
My system default gateway is eth2.
At the moment im working with mangle table to mark packets and
to use two gateways; http goes across eth1 and
other protocols goes across eth2, for example.
This is ok. Everything works ok.
But now i want to run a transparent squid proxy-cache y the
linux router machine and i have some problems.
With the next rule, squid works fine:
iptables -t nat -A PREROUTING -s 192.168.60.0/255.255.255.0 \
-p tcp --dport 80 -j REDIRECT --to-port 3128
but it use eth2, the default via, it take no notice of mangle
table and don't goes across eth1, because squid takes the
control. I really had proven a lot of different rules but
i can't do simultaneously mangling and web caching.
Can somebody help me please?
Thanks in advance.

PS- Reading other messages from de list, i think this is
one of the more interesting mailinglist i had subscribed.
I hope i'll be able to help other people in the mailinglist in 
the future.
Thanks to all.


-----------
Carlos Ble
email: carlosble@terra.es,
       tecnico@wireless-canarias.com,
       alu2388@csi.ull.es
irc.oftc.net: kharly_
irc.irc-hispano.org: kharly_

Impulsado por Debian/GNU Linux

