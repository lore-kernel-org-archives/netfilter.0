From: "Kurupt Kurupt" <kurupt_999@hotmail.com>
Subject: Iptables errors
Date: Wed, 11 Sep 2002 19:19:26 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F184WV0Y9mkkI22xroZ0000cceb@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Whats up,

After i made 2 entrys in my firewall script and then restarting i get the
following error.
(Redhat 7.2
Iptables 1.2.6a
Kernel 2.4.18)
ADSL Connection
And here is what my script looks lke 2 LINES
----------------------------------------------------------------------------
# !/bin/bash
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
--------------------------------------------------------------------------
And here is what my error looks like:
FLushing all current rules ... OK
Clearing all current rules ..... Ok

iptables: libiptc/libip4tc.C:384 do_check Assertion 'h--->info.valid_hooks
== (1 <<0 | 1 << 3)' Failed
/etc/rc3.d/s08 iptables:line -248 280 ABORTED iptables -t $i -F

iptables: libiptc/libip4tc.C:384 do_check Assertion 'h--->info.valid_hooks
== (1 <<0 | 1 << 3)' Failed
/etc/rc3.d/s08 iptables:line -245 284 ABORTED iptables -t $i -X


iptables: libiptc/libip4tc.C:384 do_check Assertion 'h--->info.valid_hooks
== (1 <<0 | 1 << 3)' Failed
/etc/rc3.d/s08 iptables:line -241 288 ABORTED iptables -t $i -Z

APPLYING firewalls Rules.....OK
----------------------------------------------------------------------------------
Im not sure what all this means and how can i fix it...ANYHELP


_________________________________________________________________
MSN Photos is the easiest way to share and print your photos: 
http://photos.msn.com/support/worldwide.aspx


