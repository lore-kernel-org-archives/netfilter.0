From: "JUSTIN GERRY" <JGERRY@butchers.com>
Subject: Re: Trying to setup two ethernet cards with two websites
Date: Thu, 02 Jan 2003 15:25:21 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <se1459fa.075@butchers.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: JGERRY@butchers.com, netfilter@lists.netfilter.org

To streamline the firewall I am writing, can I be safe to assume that:

CLASS_A="10.0.0.0/8" 
IF1="eth0"
IF2="eth1"

(For example, I will drop anything claiming to be from a Class A
Private Network on either interface)
iptables -A INPUT  -i $IF1 -s $CLASS_A -j DROP
iptables -A INPUT  -i $IF2 -s $CLASS_A -j DROP

can be written in one line as:
iptables -A INPUT -s $CLASS_A -j DROP

This way by not specifying the interface (as it can come from either
eth0 or eth1) it will stop completely drop any requests claiming to be
from a class A private network?

Many thanks,
Justin






