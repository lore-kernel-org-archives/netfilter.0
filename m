From: Christian Seberino <seberino@spawar.navy.mil>
Subject: can you specify incoming *AND* outgoing NIC on a FORWARD rule?
Date: Wed, 13 Apr 2005 13:44:08 -0700
Message-ID: <1113425048.3544.169.camel@seberino.spawar.navy.mil>
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

FORWARD only table where rules can have -i *and* -o ??

It seems to make sense that you could specify 2 NICs
with FORWARD but not with INPUT or OUTPUT.

Is that right?

Chris


