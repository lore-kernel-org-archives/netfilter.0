From: mdew <mdew@mdew.dyndns.org>
Subject: opening a port..
Date: 09 Jan 2003 01:12:37 +1300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042027958.606.7.camel@nirvana>
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
To: netfilter <netfilter@lists.netfilter.org>


Hi,
Just *testing* this out..

iptables -A INPUT -i eth0 -p tcp --dport 4662 -j ACCEPT
iptables -A INPUT -i eth0 -p udp --dport 4662 -j ACCEPT
iptables -A INPUT -i eth1 -p udp --dport 4662 -j ACCEPT
iptables -A INPUT -i eth1 -p tcp --dport 4662 -j ACCEPT
iptables -A INPUT -i eth1 -p tcp --sport 4662 -j ACCEPT
iptables -A INPUT -i eth1 -p udp --sport 4662 -j ACCEPT
iptables -A INPUT -i eth0 -p udp --sport 4662 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --sport 4662 -j ACCEPT

iptables -A FORWARD -o eth0 -p tcp --dport 4662 -j ACCEPT
iptables -A FORWARD -o eth1 -p tcp --dport 4662 -j ACCEPT
iptables -A FORWARD -o eth1 -p udp --dport 4662 -j ACCEPT
iptables -A FORWARD -o eth0 -p udp --dport 4662 -j ACCEPT
iptables -A FORWARD -o eth0 -p udp --sport 4662 -j ACCEPT
iptables -A FORWARD -o eth1 -p udp --sport 4662 -j ACCEPT
iptables -A FORWARD -o eth1 -p tcp --sport 4662 -j ACCEPT
iptables -A FORWARD -o eth0 -p tcp --sport 4662 -j ACCEPT

yet, when i try to telnet to it,

mdew:~# telnet 127.0.0.1 4662
Trying 127.0.0.1...
telnet: Unable to connect to remote host: Connection refused

Yeah I know I have lots of unnessary rules, but im only testing 'em...it
just seems a little strange that i cant see 4662 (Edonkey port) on the
router.

-mdew




