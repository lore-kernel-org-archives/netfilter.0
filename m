From: "Breno Cardoso Perucchi" <brenol@omegatec.net>
Subject: SNAT
Date: Tue, 12 Nov 2002 17:53:34 -0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003201c28a85$304077d0$2c00a8c0@PERUCCHI>
References: <Pine.LNX.4.33.0211121036290.3900-100000@ts1.alberni.net>
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
To: netfilter@lists.netfilter.org

Hello,
How I can do that the iptables that my IP INVALID (192.168.0.1) in the
OUTPUT transform my IP INVALID for ip valid in the output (200.200.200.1)
using SNAT

Example IP:
Internal 192.168.0.1 port 53
External 200.200.200.1 port 53

I want when to request internal 192.168.0.1:53 he leaves how ip external
200.200.200.1:53
I tried to do that. But no this working
iptables -t nat -I POSTROUTING -p udp -s 192.168.0.1 --sport 53 -j
SNAT --to-source 200.200.200.1:53


Breno Cardoso Perucchi
breno@omegatec.net



