From: "Marco" <marco@noope.de>
Subject: iptables source net and layer7
Date: Sat, 23 Oct 2004 14:17:50 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200410231218.i9NCI4r9028417@post.webmailer.de>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello!

I want to mark all outgoing traffic depending on its service.
Example:

eth0 = 192.168.0.1 (local interface)
ppp0 = 80.10.10.10 (internet 1)
ppp1 = 80.10.10.11 (internet 2)

http traffic over internet 1 (ppp0) ssh traffic to interface 2 (ppp1).

I tried the following (routing and rules are set):
iptables -A PREROUTING -t mangle -s 192.168.0.0/24 -p tcp --dport 80 -j MARK
--set-mark 1
iptables -A PREROUTING -t mangle -s 192.168.0.0/24 -p tcp --dport 22 -j MARK
--set-mark 2

This works fine, but only for standard ports. Now I would like to use
layer7:

iptables -t mangle -A PREROUTING -s 192.168.0.0/24 -m layer7 --l7proto http
-j MARK --set-mark 1
iptables -t mangle -A PREROUTING -s 192.168.0.0/24 -m layer7 --l7proto ftp
-j MARK --set-mark 2

Do not work. An iptables -t mange -L -n -v does not show traffic on the MARK
rules.

But if I do this without the source rule:

iptables -t mangle -A PREROUTING -m layer7 --l7proto http -j MARK --set-mark
1

The traffic is marked. Sure, I can not open a website because the incoming
traffic is also marked and will go out to ppp0, but the layer7 works.


Now my question:

If I would like to use layer7, is there a way to use a source rule too?
Is there an other way to mark with layer7 only the http traffic with source
net 192.168.0.0/24?


Kernel 2.4.27 patched with kernel-2.4-layer7-0.9.1.patch
iptables 1.2.11 patched with iptables-layer7-0.9.1.patch




Thanks,

Marco



