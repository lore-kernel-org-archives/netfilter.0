From: "Aaron P. Martinez" <ml@proficuous.com>
Subject: NETMAP patch
Date: 21 Nov 2003 10:26:04 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069431963.25622.13.camel@aaron-rh9-ws.proficuous.com>
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
To: netfilter@lists.samba.org

I'm tryin to use the netmap argument with iptables, and when i try using
the example, which even though i don't have those ips, should still work
i get the following....


root@test root]# iptables -t nat -A PREROUTING -d 1.2.3.0/24 -j NETMAP
--to 5.6.7.0/24
iptables v1.2.8: Unknown arg `--to'
Try `iptables -h' or 'iptables --help' for more information.
[root@test root]#

I'm running RH 3.0EL, 2.4.22 kernel w/the current patchomatic installed,
use the "base" option.

Any ideas?

Thanks in advance,

Aaron P. Martinez


