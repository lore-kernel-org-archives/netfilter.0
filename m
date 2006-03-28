From: Mr Ritter <netfilter@candlefire.org>
Subject: packets missing/skipping DNAT rules
Date: Tue, 28 Mar 2006 15:34:20 -0700
Message-ID: <4429B9EC.8030200@candlefire.org>
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

I have some basic rules in the PREROUTING of *nat that perform a DNAT 
like so:

-A PREROUTING -p tcp --dport 1234 -j DNAT --to 1.2.3.4

However, on a pretty consistent basis this rule fails to be applied and 
I'll see the results of that in the kernel logs like:

Mar 28 15:24:21 hostname IN=eth1 OUT= MAC=<mac addrs> SRC=w.x.y.z 
DST=4.3.2.1 LEN=40 TOS=0x00 PREC=0x00 TTL=242 ID=37514 DF PROTO=TCP 
SPT=3232 DPT=1234 WINDOW=0 RES=0x00 ACK RST URGP=0

The log shows that a small sampling of packets did not apply the DNAT, 
and it is happening enough to notice, I'd say 1 in 100.

Any suggestions on how to troubleshoot and resolve this?

I'm not trying to do anything real fancy, its a simple dual NIC 
interface, eth0 is private and eth1 public.

TIA

--
Ritter

