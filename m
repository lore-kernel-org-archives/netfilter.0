From: "Rio Martin" <rio@martin.mu>
Subject: How to classify this packets into correct mangle table?
Date: Fri, 21 Jan 2005 17:13:40 +0000
Message-ID: <1106327620204.t3rmppc@com.sg>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Dear all,
I am so confuse classifying the correct packets into mangle table.
Here i describe the situation.

LAN ---- :eth1 [ LINUX-BOX ] eth0: ---- INTERNET
eth0 220.1.1.1
eth0:1 192.168.1.1
eth0:2 192.168.1.2
eth1 10.10.10.1 [network 10.10.10.0/24]

I ve those two private IP aliases in eth0 and those get NATed to 220.1.1.1
before reaching the internet.

I need to shape those two IPs in TC, but i am confuse how to classify it on
mangle table. I need to shape the incoming and outgoing packets from those
two IPs.

Need help, thanks ..

Regards,
Rio Martin.


