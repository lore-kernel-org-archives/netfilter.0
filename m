From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: DNATing packets sent to the NATing box
Date: Sun, 14 Dec 2003 09:28:37 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312140928.37145.JALaramie@Loudoun-Fairfax.com>
References: <20031214135211.GA11695@tinuviel.compendium.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031214135211.GA11695@tinuviel.compendium.com.ar>
Content-Disposition: inline
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

On Sunday 14 December 2003 08:52, horape@tinuviel.compendium.com.ar wrote:
> > > Yes, and I've added a rule like this:
> > > /sbin/iptables -t nat -A PREROUTING -j LOG and don't see the packets.
> >
> > 	Ummmm
> >     if you ADD the rule above after the rule that is re-routing the
> > packet, no ... you wont see the packets.  Try
> > 	iptables -t nat -I PREROUTING (line number)
> > 	where (line number) is less than the line on which your DNAT line
> > occurrs. (see iptables -t nat --line-numbers -v )
>
> I'm really replacing the DNAT rule with the LOG one (only rule in the chain
> is the LOG one)
>
If there are no other rules in the nat PREROUTING chain and assuming that you 
don't have and mangle PREROUTING rules (you don't, do you?) then that log 
rule will see every single packet that comes in off the wire. Try this:

iptables -A PREROUTING -p all -j LOG --log-prefix "PREROUTING: "

You should see tons output in /var/log/messages including the packets you're 
looking for. If the packets aren't there, then they aren't making it to the 
box.

Jeff



