From: Jeroen Vriesman <j.vriesman@prompt.nl>
Subject: Re: Macimum number of rules?
Date: Tue, 2 Mar 2004 11:02:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040302110223.6e82f6f9.j.vriesman@prompt.nl>
References: <47D438A0510BD611B9470002A58EDAE704DE64CF@mchh2a6e.mchh.siemens.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <47D438A0510BD611B9470002A58EDAE704DE64CF@mchh2a6e.mchh.siemens.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

jee, 34000?

isn't there some overlap? A way of optimising it to using less rules, port descriptions which can be made into ranges?

Well, if there isn't, I would do the following:

Setup an extra machine, with the ebtables patch, configure it as a bridge, and put it in series with the other machine, you can then use iptables in OSI layes 2, so you can split the rules over two machines without having to change any network changes.
Should give you some extra performance with so many rules.
I've been using the ebtables/iptables layer 2 filtering on 2.4.24 lately, works great, just mail me directly if you need some help with it.

Good luck,
Jeroen.


On Tue, 2 Mar 2004 10:35:49 +0100
Stindl Wolfgang EXT <Wolfgang.Stindl.extern@icn.siemens.de> wrote:

> Hi,
> 
> We are running a quite big iptables-Firewall with about 34000 rules.
> Since today we cannot add any new rules.
> All we get is a Memory allocation Problem.
> 
> When we delete a rule, we can add 1 new rule. So is there a maximum number?
> 
> The firewall box is an dual xeon with 1 GB memory (most is still free)
> 
> So is there anything we can do?
> 
> Thanks a lot
> Wolfgang
> 

