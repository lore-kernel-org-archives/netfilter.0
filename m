From: Upma Gandhi <upma@networkprograms.com>
Subject: marking all h323 packets with some TOS
Date: Thu, 09 Jan 2003 13:43:29 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E1D2F29.6443D681@networkprograms.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------7B4AB69A424A61F597E012D1"
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
To: netfilter <netfilter@lists.netfilter.org>


--------------7B4AB69A424A61F597E012D1
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello All,
         I have a following setup

Internet <-> Router with netfilter configure <-> LAN(192.9.201.0/24)

lets supopose eth0 is LAN side Interface and
eth1 is WAN side interface.

what I want to do is "Mark all h323 packets with some tos value".
for which my iptables  command seems to be like this-
     iptables -t mangle -A FORWARD -o eth0 -d 192.9.201.0/24 -p tcp -m
rtp -j FTOS --set-ftos 0xb8.

but it's giving an error message -
iptable: No chain/target/match by tha rule.

Can anybody help me out.

Thanks & Regards
Upma


--------------7B4AB69A424A61F597E012D1
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
Hello All,
<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; I have a following
setup
<p>Internet &lt;-> Router with netfilter configure &lt;-> LAN(192.9.201.0/24)
<p>lets supopose eth0 is LAN side Interface and
<br>eth1 is WAN side interface.
<p><font size=+2>what I want to do is "Mark all h323 packets with some
tos value"</font>.
<br>for which my iptables&nbsp; command seems to be like this-
<br>&nbsp;&nbsp;&nbsp;&nbsp; iptables -t mangle -A FORWARD -o eth0 -d 192.9.201.0/24
-p tcp -m rtp -j FTOS --set-ftos 0xb8.
<p>but it's giving an error message -
<br>iptable: No chain/target/match by tha rule.
<p>Can anybody help me out.
<p>Thanks &amp; Regards
<br>Upma
<br>&nbsp;</html>

--------------7B4AB69A424A61F597E012D1--


