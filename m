From: TheNokia <nokiairc@gmail.com>
Subject: Need help with iptables and iprange module
Date: Wed, 14 Feb 2007 19:15:13 -0500
Message-ID: <b6d73fa90702141615y138d3f0dh176f309ca9ea74dd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello everybody, I installed iptables v1.3.7 (the lastest one)
But when I try to use iprange module (-m iprange) here the error:

debian:~# iptables -A INPUT -m iprange
iptables v1.3.7: iprange match: You must specify `--src-range' or `--dst-range'
Try `iptables -h' or 'iptables --help' for more information.
debian:~# iptables -A INPUT -m iprange --src-range
iptables v1.3.7: Unknown arg `--src-range'
Try `iptables -h' or 'iptables --help' for more information.
debian:~# iptables -A INPUT -m iprange --src-range
xx.xxx.xxx.0-xx.xxx.xxx.255 -j DROP
iptables: No chain/target/match by that name

I try to install the crap-patch-o-matic, impossible to install without
100 years of linux knowledge.

Can someone help me with that ?

Thank you in advance.

