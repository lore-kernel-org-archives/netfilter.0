From: Bantam <netfilter@end.yorks.com>
Subject: FTP Forwarding
Date: Fri, 22 Nov 2002 10:08:16 -0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00a801c2920f$1322d5d0$e6353fc1@nexor.co.uk>
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

I've been trying to forward port 21 to an ftp server on another machine, IP
address  10.0.0.199.

eth1 - external (connected to the net)
eth0 - internal

/sbin/iptables -A FORWARD -p tcp -i eth1 --dport 21 -j ACCEPT
/sbin/iptables -A PREROUTING -t nat -p tcp -i eth1 --dport 21 -j DNAT --to
10.0.0.199:21

but can't get it to work..

any ideas ?

Thanks

Wasim



