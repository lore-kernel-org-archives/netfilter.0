From: Michael Eck <michael.eck@gmail.com>
Subject: Many Many table rules
Date: Tue, 14 Sep 2004 13:06:53 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <d82fbdb70409141006173a23f2@mail.gmail.com>
Reply-To: Michael Eck <michael.eck@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I have a bridging traffic shaper that uses htb and sfq.  My iptables
and kernel are patched with ipp2p and layer-7 filtering to mark p2p
traffic.  Currently, this unit is at the head end of a broadband
network.  I'm dividing up my users into htb classes based on their
location on the network.  This amounts to 5 rules per IP address, 1
for generic traffic, and 4 for ipp2p and a few layer7 rules.  That
puts me at about 820 rules for the inside interface portion of my
iptables.

Is this a problem?  What do I need to look out for or change to
account for this many rules?  I'm not able to reproduce any actual
problems but some users have complained of intermittant sluggishness
and slow speeds.  Some of this can be attributed to a network that is,
in certain areas, at or beyond reasonable capacity.  I just want to
find out if I should pay special attention to anything when using this
many rules.

Thanks,
Michael Eck

