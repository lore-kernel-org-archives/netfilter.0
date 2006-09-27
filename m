From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: tos or dscp match with a mask
Date: Wed, 27 Sep 2006 13:49:50 +0800
Message-ID: <02d501c6e1f8$bf36b390$0100a8c0@newlife>
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
To: netfilter@lists.netfilter.org


Is it possible to specify tos or dscp match with a mask, example

     iptable ... -m dscp --dscp 0x20 0x1f ....

I want to match value above certain value only, I don't need
to perform exact value match.






