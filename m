From: Bgs <bgs@bgs.hu>
Subject: Problem with SNAT
Date: Thu, 02 Sep 2004 20:57:18 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <41376D0E.3070208@bgs.hu>
Reply-To: bgs@bgs.hu
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter <netfilter@lists.netfilter.org>


  Greetings,

I have problems with the following setup:

A linux with two NICs. One with IP of 10.0.2.2 and one with 10.0.3.57.
I have DNAT-ed traffic coming in on the 10.0.2.2 that was originally 
sent to 10.0.2.1. (Another node doing the DNAT). I have problems on the 
route back so I decided to SNAT the backward udp traffic to  soource 
10.0.2.1 and send the SNATed packets back on another route.

I added the line to nat postrouting (-d target_net -s 10.0.2.2 -p udp -j 
SNAT --to-source 10.0.2.1) but the packages don't even seem to hit the 
nat postrouting chain. Let alone my SNAT rule.

Any ideas what could be wrong ?

Thanks
Bgs



