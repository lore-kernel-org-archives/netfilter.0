From: seberino@spawar.navy.mil
Subject: not sure if 'iptables -Z' needed/useful/superfluous here..
Date: Thu, 13 Jan 2005 22:03:27 -0800
Message-ID: <20050114060327.GA8917@spawar.navy.mil>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

When I want to start from scratch in my firewall
script I usually do this:

$IPTABLES -t filter -F
$IPTABLES -t mangle -F
$IPTABLES -t nat    -F

$IPTABLES -t filter -X
$IPTABLES -t mangle -X
$IPTABLES -t nat    -X

I'm not sure if -Z switch does anything useful after this violent
scrubbing of my iptables...

$IPTABLES -Z

By the way... is this correct/better/wrong??

$IPTABLES -t filter -Z
$IPTABLES -t mangle -Z
$IPTABLES -t nat    -Z

I read man page on iptables but it still was not clear if I need
-Z to 'reset the byte count' and other stuff like it says it will do.

Thanks!

Chris

