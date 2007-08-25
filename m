From: Arash Yadegarnia <arash@bluehome.net>
Subject: Interface forwarding
Date: Sat, 25 Aug 2007 14:22:14 +0330
Message-ID: <1188039134.6048.11.camel@Thinkpad>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi, :)

I'm working on a special sort of VPN. I'm suppose to do it using TUN/TAP
driver. All I need is to forward (or any other appropriate technical
term) all traffic from a physical interface (eth0) into my tunnel
interface (tap0), so I can modify them and send them out.

Frankly, I'm not sure that it can be done with iptables but since I'm
having serious headaches using bridge (bridging eth0 with tap0) to
capture those packets, well, I thought maybe you guys can help me. :)


Thanks,



