From: "ArcosCom Linux User" <linux@arcoscom.com>
Subject: CONNMARK versus MARK
Date: Fri, 12 Jan 2007 22:00:00 +0100 (CET)
Message-ID: <50031.84.123.236.132.1168635600.squirrel@www.arcoscom.com>
Reply-To: linux@arcoscom.com
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Another question, this time is about CONNMARK and MARK.

I stand that when CONNMARK put a mark, this mark will be applied for every
related traffic (I supose conntrack modules do it) after CONNMARK put the
mark. Am I in truth?

Analogous with MARK, that only applies to the frame. Is it?

Fine, using the above, when 1 client start TCP connection, that has not
any specific conntrack module for it, and I use something as this:

iptables -t mangle -A POSTROUTING ${condition} -m state --state NEW -j
CONNMARK --set-mark 0x1

Then:

iptables -t mangle -A PREROUTING -m state --state RELATED,ESTABLISHED -j
CONNMARK --save-mark
iptables -t mangle -A PREROUTING -m state --state RELATED,ESTABLISHED -m
connmark ! --mark 0x0 -j RETURN

Can I supose that when the connection is in state RELATED or ESTABLISHED
the core netfilter will automaticaly mark the response frame (ACK) with
the same mark? or I must be more accurate using MARK/mark?

Explain a bit the question:
   1) The frame should be TCP or UDP and is marked as 0x1 when go out from
(or forwading) the box.
   2) The frame is responsed (TCP with ACK or UDP with another frame to
the same source port).
   3) How netfilter will mark the connection if it has not handled by a
conntrack module? Will it mark the connection? or I have to control the
answered frame too?.

I'm a bit confuse with the iptables help/man text about this question:

MARK target v1.3.7 options:
  --set-mark value                   Set nfmark value
  --and-mark value                   Binary AND the nfmark with value
  --or-mark  value                   Binary OR  the nfmark with value

CONNMARK target v1.3.7 options:
  --set-mark value[/mask]       Set conntrack mark value
  --save-mark [--mask mask]     Save the packet nfmark in the connection
  --restore-mark [--mask mask]  Restore saved nfmark value

CONNMARK match v1.3.7 options:
[!] --mark value[/mask]         Match nfmark value with optional mask

MARK match v1.3.7 options:
[!] --mark value[/mask]         Match nfmark value with optional mask

And, sometimes, I think that there are two fields for the mark, one for
the whole connection and another for the frame.

Anyone more experienced could explain this a bit?

Thanks!!


