From: Philippe <netfilter@rootsucks.com>
Subject: Transparent proxying to all hosts/all ports
Date: Tue, 24 Jul 2007 23:40:44 +0200
Message-ID: <46A671DC.9030004@rootsucks.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi ! (Please be kind with my poor English...)


Main goal: having ALL connections using Linux TCP/IP stack.


Is there a way to run a fully transparent UDP/TCP proxy on a Linux
gateway instead of "just" forwarding packets with Netfilter ?

What I would like to achieve is to intercept all outgoing connections
from hosts in the LAN and force Linux to act as a transparent proxy,
being the only one "talking" on Internet.

TPROXY (maybe REDIRECT ?) seems to be the right Target for the
interception part because SRC/DST host:port are not altered but, correct
me if I am wrong, it does only allow to forward packets to one host.

Is there a tool that could inspect incoming packets and, using the
Dst addr/Dst port, connect to the right remote host and tranfer only
application data ? (HTTP, SMTP, DNS, NTP, etc.)

Thanks !

Philippe












