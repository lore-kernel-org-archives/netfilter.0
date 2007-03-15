From: "Michael Plourde" <mplourde@digicom.ca>
Subject: iptables as DHCPD
Date: Thu, 15 Mar 2007 13:03:04 -0500
Message-ID: <001001c7672c$31034bb0$7100000a@W2KMPLOURDE>
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
To: netfilter <netfilter@lists.netfilter.org>

Hi,

is it possible to use iptables as dhcpd ? I mean:

iptables -t mangle -A POSTROUTING -m mac --mac-source "some mac" -j
SNAT --to "some ip"

I know mac-source is not avalaible from postrouting chain, but is there
another way to use it. I'm already using mark for bandwidth control, so i
can use mark so SNAT.

Any idea,

Michael Plourde



