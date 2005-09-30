From: Lore <skizzo82@yahoo.com>
Subject: Destination_IP Field in packets coming from QUEUE
Date: Sat, 1 Oct 2005 00:38:01 +0200 (CEST)
Message-ID: <20050930223801.3269.qmail@web52810.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi everybody...

I'm facing the problem to understand the destination
of an OUTGOING tcp packet caught by the chain
iptables -t filter -A OUTPUT -j QUEUE

The destination address field in the ip header has my
ip while the real destination is another.

Here I'd like to know if is a common behaviour that
can be changed with some flags in the chain or there
is anyway to know where the packet was addressed to
(perhaps using the IPQ).

Thanks in advance.

Lore

(I know I posted some sort of message like this but I
figured out that the content was un-understandable...
sorry for my english)


		
___________________________________ 
Yahoo! Messenger: chiamate gratuite in tutto il mondo 
http://it.messenger.yahoo.com

