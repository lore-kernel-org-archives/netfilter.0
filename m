From: Matti Luoma <matti.luoma@bitboys.com>
Subject: Small problem -> Prerouting
Date: Wed, 16 Apr 2003 15:11:09 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4.3.2.7.2.20030416150214.02748848@10.0.0.99>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hiya!

Well i upgraded my kernel to 2.4.20 from 2.4.3, and also compiled newest 
iptables 1.2.8

now i got this weird problem with

example this line:

iptables -A PREROUTING -t nat -p UDP -d IP -dport port -j DNAT --to IP:Port

It should works, and it works, but not anymore, SSH forwarding like this 
works thou

also im gettin some stuff in syslog:

kernel: NAT: 0 dropping untracked packet c66ab6c0

i think these things are related, and probably some module is causing this, 
any ideas?

Cheers,
Matti


