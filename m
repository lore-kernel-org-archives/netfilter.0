From: sean <seandarcy2@gmail.com>
Subject: how do I set the MAC address in POSTROUTING?
Date: Thu, 30 Nov 2006 19:23:07 -0500
Message-ID: <eknslc$rpq$1@sea.gmane.org>
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

I want to use -m mac --mac-source on our server. 
Unfortunately,  lots of packets are coming in without the 
MAC address set:

  MAC-ADDRESS-TEST: IN=ppp0 OUT= MAC= SRC=ww.xx.yy.zz 
DST=zz.yy.xx.ww LEN=52
  TOS=0x00 PREC=0x00 TTL=51 ID=41426 DF PROTO=TCP SPT=52437 
DPT=445 WINDOW=63 RES=0x00 ACK URGP=0

This is from a linux client.

How do I set up the client to insert its MAC address? Can I 
use some mange voodoo on the client PSOTROUTING chain?

Is this even an iptables issue? Is the MAC address being 
stripped out somewhere?

sean


