From: Jason Opperisano <opie@817west.com>
Subject: Re: how to remove rules
Date: Tue, 23 Nov 2004 04:39:36 -0500
Message-ID: <1101202776.3503.12.camel@hubcap.ljm.dom>
References: <a0f69e5041123012925d5cfaf@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a0f69e5041123012925d5cfaf@mail.gmail.com>
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

On Tue, 2004-11-23 at 04:29, Askar wrote:
> hi 
> I have trying to remove the extra rules from my routing tables,
> however with no luck
> Also I want to know these duplicate entries have an effect on packets
> going routed?
> I have this overwhelming rules lists from my predessor who added the
> "ip rule add fwmark" entries in firewall script, and on each run of
> firewall script its creates an extra entry in routing table.
> Now I want to get rid of  an extras "from all fwmark 0x2 lookup
> squid.out" leaving only one that what's I needs.
> 
> 
> here is the output of "ip rule ls"

the proper place for your question would be the lartc mailing list: 
http://lartc.org/#mailinglist

-j
 
--
"I'll leave the world the same way I came into it - dirty, screaming
 and torn away from the woman I love."
	--The Simpsons


