From: "Egor Tur" <worldeb@ukr.net>
Subject: REJECT rules with tcp-reset.
Date: Wed, 28 Jan 2004 09:17:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E1Aljwg-000CKc-00@fatlady.ukr.net>
Reply-To: "Egor Tur" <worldeb@ukr.net>
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

Hi folk.
How can I correctly create rules with REJECT and tcp-reset.
If I do
eth0 - NET, eth1 LAN
iptables -A FORWARD -i eth0 -o eth1 -p tcp --sport 1024: -d MY.LAN.IP --dport 113 -j REJECT --reject-with tcp-reset
iptables -A FORWARD -i eth1 -o eth0 -p tcp ! --syn --dport 1024: -s MY.LAN.IP --sport 113 -j ACCEPT
iptables -t nat -A PREROUTING -i eth0 -p tcp --sport 1024: -d MY.NET.IP --dport 113 -j DNAT --to MY.LAN.IP:113
I wait long time when I try connect with ftp & mail services.
(And I see some attempts to connect to auth service)
If I try REJECT --reject-with icmp-port-unreachable
this work quickly but slowly then I permit authentication.
When I try use INPUT & OUTPUT chains I have the same situation.

nat & mangle tables have ACCEPT policy, filter - DROP

What can I do in order to use tcp-reset?
 
iptables 1.2.9, kernel 2.4.24

Thanx.


