From: Jason Opperisano <opie@817west.com>
Subject: Re: Setting TOS in POSTROUTING mangle table
Date: Wed, 06 Oct 2004 11:58:22 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1097078302.5214.10.camel@wolfpack.ljm.dom>
References: <E0E0E80CC865BFEC576183B5@[10.169.6.246]>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E0E0E80CC865BFEC576183B5@[10.169.6.246]>
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

On Wed, 2004-10-06 at 11:40, Kenneth Porter wrote:
> All the HOWTO's I've seen online seem to indicate that one puts TOS 
> manipulation in the PREROUTING mangle table, but it looks like this will 
> only affect inbound packets. 

it affects packets prior to any routing decision being made.  you can't
control how fast packets come into a machine--you can only really
control how fast you allow them to leave.  that's the essence of traffic
shaping.

> For outbound packets I'd need to put the rule 
> in the POSTROUTING table. Should I set TOS in both tables on a gateway and 
> POSTROUTING on an endpoint?

if you're setting TOS on machine A so that a queuing decision can be
made by machine B--you can set TOS in POSTROUTING if you want.

> My main objective is to set Minimize-Delay on all UDP packets to give them 
> priority in my traffic shaper. (I'm using Wondershaper from 
> http://lartc.org/.) This insures that game and VOIP traffic takes 
> precedence over web and file transfers.

if the netfilter box is also the traffic shaper--set TOS in PREROUTING
so that that tc filters have the TOS values available to make a
decision.

-j

-- 
Jason Opperisano <opie@817west.com>


