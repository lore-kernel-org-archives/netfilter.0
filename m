From: "Dan Searle" <dan@intrago.co.uk>
Subject: Optimize large iptables by hashing on MAC address help
Date: Fri, 11 Oct 2002 10:30:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <002801c27108$e75d6590$0800000a@wormhole>
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

Hi,

I am trying to optimise a very large set of iptables rules that match
packets based on MAC address. The tables contain thousands of rules matching
packets using the --mac-source matching rule, e.g...

...etc...
ACCEPT     tcp  --  anywhere             anywhere           MAC
00:02:E3:16:73:BB tcp dpt:webcache
ACCEPT     udp  --  anywhere             anywhere           MAC
00:02:E3:16:73:BB udp dpt:webcache
ACCEPT     tcp  --  anywhere             anywhere           MAC
00:C1:26:01:DA:92 tcp dpt:webcache
ACCEPT     udp  --  anywhere             anywhere           MAC
00:C1:26:01:DA:92 udp dpt:webcache
...etc...

The problem is that the system seems to be spending a lot of time matching
these rules, as the firewall handles up to 10Mbits of traffic at high load.
To optimise the process I want to create 16 (or perhaps more) sub-tables
based on the Nth least significant bits of the source MAC address (a sort of
hashing), i.e.

* The INPUT chain would contain 16 sub-table jump rules matching the 4 least
sig. bits of the MAC source like this....

INPUT_0   all  --  anywhere             anywhere     PART-MAC
xx:xx:xx:xx:xx:x0
INPUT_1   all  --  anywhere             anywhere     PART-MAC
xx:xx:xx:xx:xx:x1
INPUT_2   all  --  anywhere             anywhere     PART-MAC
xx:xx:xx:xx:xx:x2
INPUT_3   all  --  anywhere             anywhere     PART-MAC
xx:xx:xx:xx:xx:x3
...etc...
INPUT_E   all  --  anywhere             anywhere     PART-MAC
xx:xx:xx:xx:xx:xE
INPUT_F   all  --  anywhere             anywhere     PART-MAC
xx:xx:xx:xx:xx:xF

* Each of the rules will then be dumped into the relevant custom sub-chains,
i.e...
The INPUT_2 chain will contain all the MAC address rules ending in :x2
e.g...

ACCEPT     tcp  --  anywhere             anywhere           MAC
00:C1:26:01:DA:92 tcp dpt:webcache
ACCEPT     udp  --  anywhere             anywhere           MAC
00:C1:26:01:DA:92 udp dpt:webcache
ACCEPT     tcp  --  anywhere             anywhere           MAC
00:B5:23:21:FF:72 tcp dpt:webcache
ACCEPT     udp  --  anywhere             anywhere           MAC
00:B5:23:21:FF:72 udp dpt:webcache
...etc....

Using this hashing method, instead of each packet potentially being compared
against say 1024 rules, only approx. 64 (1024/16) rules would need to be
considered, dramatically increasing the speed at which packets are filtered.

So my question is, is there a "PART-MAC" matching rule, or some other low
level matching rule which could be used to achieve the same effect?

Cheers, Dan...

P.S.
Sorry about such a large post, but I don't know how I could explain it in a
more consise manner.



