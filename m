From: Kenneth Porter <shiva@sewingwitch.com>
Subject: Setting TOS in POSTROUTING mangle table
Date: Wed, 06 Oct 2004 08:40:34 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <E0E0E80CC865BFEC576183B5@[10.169.6.246]>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
To: Netfilter Users <netfilter@lists.netfilter.org>

All the HOWTO's I've seen online seem to indicate that one puts TOS 
manipulation in the PREROUTING mangle table, but it looks like this will 
only affect inbound packets. For outbound packets I'd need to put the rule 
in the POSTROUTING table. Should I set TOS in both tables on a gateway and 
POSTROUTING on an endpoint?

My main objective is to set Minimize-Delay on all UDP packets to give them 
priority in my traffic shaper. (I'm using Wondershaper from 
http://lartc.org/.) This insures that game and VOIP traffic takes 
precedence over web and file transfers.

BTW, where in the packet processing does queuing happen? Is that the 
"routing decision" or is it after POSTROUTING when the packet is sent to 
the interface? (This should probably be added to the diagrams.)

For reference, here's the diagram:

<http://www.faqs.org/docs/iptables/traversingoftables.html>

