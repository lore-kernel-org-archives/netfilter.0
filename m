From: "Sven Agnew" <sven.agnew@gmail.com>
Subject: Assistance required marking packets for access to l2tp
Date: Sun, 11 Feb 2007 01:29:58 +0200
Message-ID: <fa4605890702101529u858a9ccqdda403774ff9c428@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

 Hello everyone,

    I am new to iptables. I am hoping someone can assist me with a
    problem setting a mark for esp packets and then matching them to
    allow access to l2tpd for the purpose of creating a vpn from a WinXP
roadwarrior ( client )
    to our Linux server.
    below are the iptables commands that i am using ( found at
    www.funknet.org/doc/tunnel/l2tp.html).
    The configuration of iptables is being done with firehol thusly:-
    #iptables -t mangle -A PREROUTING -i eth0 -p esp -j MARK --set-mark 1
    #iptables -A INPUT -i eth0 -m mark --mark 1 -j ACCEPT
    #
    #iptables -A OUTPUT -s a.b.c.d -p udp -m udp --sport 1701 -j ACCEPT
    #
    #iptables -A INPUT -p esp -j ACCEPT
    #iptables -A OUTPUT -p esp -j ACCEPT
    #
    #iptables -A INPUT -d a.b.c.d -p udp -m udp --dport 500 -j ACCEPT

- Ignored:
    #iptables -A OUTPUT -s a.b.c.d -p udp -m udp --sport 500 -j ACCEPT
    #
      -where a.b.c.d is the external ip address of the firehol host.

    I am then trying to match the packets and allow access to l2tpd, so
    that the firewall will allow tunneled data access to hosts and
    services behind it.
    Thus:

    #server_l2tp_ports="udp/1701"
    #client_l2tp_ports="any"

    #interface eth0 internet
    #server l2tp accept mark 1

    I am running the following OS

    #host ~ # uname -a
    #Linux fw 2.6.16-gentoo-r9 #2 SMP Fri Dec 8 10:00:15 UTC 2006 i686
    Intel(R) Pentium(R) 4 CPU 3.00GHz GenuineIntel GNU/Linux

    and my version of iptables is

    #host ~ # iptables --version
    #iptables v1.3.5

    Thanking  you in advance,

    - --
    Sven Agnew

