From: John Lange <john.lange@open-it.ca>
Subject: Problems with OUTPUT rules ESTABLISHED,RELATED
Date: Tue, 02 Aug 2005 13:59:23 -0500
Message-ID: <1123009163.12889.164.camel@ws50.darkcore.net>
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

I'm looking for some advice tuning iptables rules.

The problem is, quite a few packets are being dropped which I don't
think should be.

Here are the basic rules:

iptables -P INPUT DROP
iptables -P OUTPUT DROP

iptables -A INPUT -p tcp --syn --dport 80 -j ACCEPT

iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

With the above rules why does the following get blocked?

-----
Aug  2 13:04:47 HOST kernel: IN= OUT=eth0 SRC=XXX.XXX.XXX.XXX
DST=XXX.XXX.XXX.XXX LEN=1500 TOS=0x00 PREC=0x00 TTL=64 ID=11945 DF
PROTO=TCP SPT=80 DPT=48473 WINDOW=1805 RES=0x00 ACK URGP=0 UID=501
-----

This appears to be the return ACK of the inital SYN. Shouldn't that be
permitted under the above rules?

Could it have something to do with the DF flag on the packet?

-- 
John Lange



