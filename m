From: "Eric Wood" <eric@interplas.com>
Subject: h323 support?
Date: Tue, 18 Feb 2003 14:00:03 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <012f01c2d77f$f1dff540$9100000a@intgrp.com>
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

RH 7.3, 2.4.18-10 kernel

Does anyone have a quick fix to get h323 support going?  I need to allow MS
Netmeetings through and just doing this:

323_ports="389 522 1503 1720 1731"
for port in $h323_ports; do
iptables -t nat -A PREROUTING -i eth0 -p tcp -d 66.41.122.14 --dport
$port -j DNAT --to 10.0.0.145:$port
iptables -A FORWARD -i eth0 -o eth1 -p tcp -d 10.0.0.145 --dport $port -m
state--state NEW -j ACCEPT
done

doesn't work (so I've heard).  I have to load a conntrack module
specifically for h323.  Is there a way I can simply compile the module
against my active running kernel, or does the iptables-1.2.5-3 source rpm
have to be patched and rebuilt?

Thanks,
-Eric Wood

PS. Any other easier standard than h323 that gets video and sound going for
cameras? I don't need file transfer, whiteboard, chatting , etc....


