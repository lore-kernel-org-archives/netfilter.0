From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: source ip mangling
Date: Thu, 10 Nov 2005 18:32:20 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0511101831001.18870@yvahk01.tjqt.qr>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter User Mailing List <netfilter@lists.netfilter.org>

Hello,


how would I go about changing the source address of a packet/connection 
when the packet comes right in? I'd say
  ipt -t mangle -A INPUT -s a.b.c.d -j CHANGEME --to-source e.f.g.h
but what is the correct target, if there exists such at all?



