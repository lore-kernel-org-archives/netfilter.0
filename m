From: Payal Rathod <payal-netfilter@scriptkitchen.com>
Subject: VPN?
Date: Fri, 13 Aug 2004 10:44:50 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040813144450.GA17278@tranquility.scriptkitchen.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: Netfilter ML <netfilter@lists.netfilter.org>

Hi,
I want to pass pptp traffic through my firewall. For that I added,
iptables -A FORWARD -s 192.168.0.0/255.255.0.0 --protocol 47 -j
ACCEPT
in my firewall list plus,
iptables -A FORWARD -s 192.168.0.0/255.255.0.0 -p udp -m udp --dport 1723 -j ACCEPT
iptables -A FORWARD -s 192.168.0.0/255.255.0.0 -p tcp -m tcp --dport 1723 -j ACCEPT
But my clients cannot connect to it. It gives connection timed out.
What must be the error?
My old firewall (before I made changes given above is at),
http://payal.staticky.com/tables.txt

With warm regards,
-Payal

