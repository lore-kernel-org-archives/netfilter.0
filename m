From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: CONNMARK versus MARK
Date: Fri, 12 Jan 2007 23:46:34 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0701122343290.19224@yvahk01.tjqt.qr>
References: <50031.84.123.236.132.1168635600.squirrel@www.arcoscom.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <50031.84.123.236.132.1168635600.squirrel@www.arcoscom.com>
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
To: ArcosCom Linux User <linux@arcoscom.com>
Cc: netfilter@lists.netfilter.org


>Another question, this time is about CONNMARK and MARK.
>
>I stand that when CONNMARK put a mark, this mark will be applied for every
>related traffic (I supose conntrack modules do it) after CONNMARK put the
>mark. Am I in truth?

man iptables:

   CONNMARK
       This module sets the netfilter mark value associated with a 
       connection


>
>Analogous with MARK, that only applies to the frame. Is it?

Ethernet frames?


>Fine, using the above, when 1 client start TCP connection, that has not
>any specific conntrack module for it, and I use something as this:
>
>iptables -t mangle -A POSTROUTING ${condition} -m state --state NEW -j
>CONNMARK --set-mark 0x1
>
>Then:
>
>iptables -t mangle -A PREROUTING -m state --state RELATED,ESTABLISHED -j
>CONNMARK --save-mark
>iptables -t mangle -A PREROUTING -m state --state RELATED,ESTABLISHED -m
>connmark ! --mark 0x0 -j RETURN
>
>Can I supose that when the connection is in state RELATED or ESTABLISHED
>the core netfilter will automaticaly mark the response frame (ACK) with
>the same mark? or I must be more accurate using MARK/mark?

Not sure if --save-mark is inteded here.

>Explain a bit the question:
>   1) The frame should be TCP or UDP and is marked as 0x1 when go out from
>(or forwading) the box.
>   2) The frame is responsed (TCP with ACK or UDP with another frame to
>the same source port).
>   3) How netfilter will mark the connection if it has not handled by a
>conntrack module? Will it mark the connection? or I have to control the
>answered frame too?.
>
>I'm a bit confuse with the iptables help/man text about this question:
>
>MARK target v1.3.7 options:
>  --set-mark value                   Set nfmark value
>  --and-mark value                   Binary AND the nfmark with value
>  --or-mark  value                   Binary OR  the nfmark with value
>
>CONNMARK target v1.3.7 options:
>  --set-mark value[/mask]       Set conntrack mark value
>  --save-mark [--mask mask]     Save the packet nfmark in the connection
>  --restore-mark [--mask mask]  Restore saved nfmark value
>
>CONNMARK match v1.3.7 options:
>[!] --mark value[/mask]         Match nfmark value with optional mask
>
>MARK match v1.3.7 options:
>[!] --mark value[/mask]         Match nfmark value with optional mask
>
>And, sometimes, I think that there are two fields for the mark, one for
>the whole connection and another for the frame.

Correct. (packet, not frame) There are yet more, though.

>
>Anyone more experienced could explain this a bit?
>
>Thanks!!
>
>

	-`J'
-- 

