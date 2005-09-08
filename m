From: "Giacomo" <delleceste@gmail.com>
Subject: help developing kernel module for nat
Date: Thu, 8 Sep 2005 14:51:35 +0200
Message-ID: <002501c5b474$0e0f0ac0$0300a8c0@giacomino>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Good morning.
I'm writing a nat module for study purposes in linux kernel.

I do NAT, changing addresses and port in network packets (outgoing and 
coming back)
Then i recalculate checksum.

i don't mangle payload (not interested in ftp).

Should i do any other adjustment? (TCP window, seq/ack) ?

I think it should be enough, since process should be transparent to hosts 
behind nat machine,
the fact is that in some networks it works fine, in other networks 
communication fails.

Tried changing mtu and clamp-tcpmss-to-pmtu with no effect.

Thanks-

Giacomo.



