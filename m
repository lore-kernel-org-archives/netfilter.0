From: "PAUL FABRICIO VILLACRESES LEON" <paulvillacreses@hotmail.com>
Subject: Can Any DeveloperCould help me please How iptables block port tcp ?
Date: Tue, 28 Jan 2003 22:50:21 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F124TSrdUWhn65DWG6t000009b6@hotmail.com>
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

Hi
Core developer and all people include in this list.

I'm Paul Villacreses
Student University's ESPOL -FIEC- Ecuador

Here i have :

LAN ---------- eth1 ------ MyBridge -------eth0 -------- Internet

I have linux Redhat 8.0

I'm developing a software using library libiptc, for put rules programming 
in the table filter inside chain FORWARD and can block port IP like 
udp,tcp,icmp etc,
but ,i want put rules in the table nat for REDIRECT and change NAT some 
packets.
with libiptc i cant because it accept this targets 
ACCEPT,DROP,RETURN,etc.not accept DNAT,SNAT, REDIRECT .
and furthermore, I want to put all this rules programming, not with script, 
for block port TCP like DNS,SNMP,HTTP,TELNET etc.

I read inside de iptables and i think(correct me please if i wrong) it 
charge extended dinamic library(like tcpxxxx.so) for put this rules in the 
iptables program.

Please can Anybody  explaint me
How Can i put rules for block ports TCP?

How can i put rules in table nat for REDIRECT or DNAT(PREROUTING) or 
SNAT(POSTROUTING) ?

thank for the super help

thank so much if you answer this question.

Paul











_________________________________________________________________
Tired of spam? Get advanced junk mail protection with MSN 8. 
http://join.msn.com/?page=features/junkmail


