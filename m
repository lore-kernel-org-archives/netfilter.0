From: Askar Ali Khan <askarali@gmail.com>
Subject: rules suggestion
Date: Thu, 22 Jul 2004 10:43:07 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <a0f69e50407212243efa02aa@mail.gmail.com>
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

Hi all

Here are few rules from overs firewall, please let me know is this is
the proper way to deal with windowz ports :)

iptables -A INPUT -p TCP -s 0/0 -d 0/0 --dport 135:140 -j DROP
iptables -A INPUT -p UDP -s 0/0 -d 0/0 --dport 135:140 -j DROP
iptables -A FORWARD -p TCP -s 0/0 -d 0/0 --dport 135:140 -j DROP
iptables -A FORWARD -p UDP -s 0/0 -d 0/0 --dport 135:140 -j DROP
iptables -t nat -A PREROUTING -p TCP -s 0/0 -d 0/0 --dport 135:140 -j DROP
iptables -t nat -A PREROUTING -p UDP -s 0/0 -d 0/0 --dport 135:140 -j DROP

Or we are unnecessary repeating it on some chains/tables.

regards
Askar Ali

