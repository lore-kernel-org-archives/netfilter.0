From: Gabriel Kujawski <gabriel.kujawski@brama.waw.pl>
Subject: mark match
Date: Mon, 30 Jun 2003 22:49:23 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F00A253.3060703@brama.waw.pl>
Reply-To: gabriel.kujawski@brama.waw.pl
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

Hi,
I mark packets this way:
iptables -t mangle -I PREROUTING -p icmp -s 192.168.0.2 -d 0/0 -j MARK 
--set-mark 0x2
This workes correctly.
Next I try to log these marked packets with ULOG target:
iptables -t mangle -I POSTROUTING -m mark --mark 0x2 -j ULOG 
--ulog-nlgroup 1 --ulog-prefix MARKtest
but this rule doesn't work.
However, if I use FORWARD chain packets are logged.
Could you tell me the reason?


