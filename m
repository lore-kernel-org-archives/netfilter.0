From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: DNATing packets sent to the NATing box
Date: Sun, 14 Dec 2003 10:51:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312141051.55776.JALaramie@Loudoun-Fairfax.com>
References: <20031214135211.GA11695@tinuviel.compendium.com.ar> <200312140919.04832.JALaramie@Loudoun-Fairfax.com> <20031214152613.GA14170@tinuviel.compendium.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031214152613.GA14170@tinuviel.compendium.com.ar>
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

On Sunday 14 December 2003 10:26, horape@tinuviel.compendium.com.ar wrote:
> > > I'm really replacing the DNAT rule with the LOG one (only rule in the
> > > chain is the LOG one)
> >
> > If there are no other rules in the nat PREROUTING chain and assuming that
> > you don't have and mangle PREROUTING rules (you don't, do you?) then that
> > log rule will see every single packet that comes in off the wire. Try
> > this:
> >
> > iptables -A PREROUTING -p all -j LOG --log-prefix "PREROUTING: "
>
> I do:
>
> iptables -t nat -A PREROUTING -p udp -j LOG --log-prefix "PREROUTING: "
> iptables -t filter -A INPUT -p udp -j LOG --log-prefix "INPUT: "
>
> (I'm logged in that box via ssh, so I prefer not to do -p all)
>
> There are no more rules than these ones.
>
> In the log I see the INPUT ones but not the PREROUTING (only see on
> PREROUTING packets to port 137, maybe some worm...)
>

That's very strange. You said in your first post that you had a udp proxy 
running. Is it on this box? I'm not sure at what level a proxy hooks into the 
box, but I know that some programs read the data stream before netfilter sees 
it. If the proxy is in front of netfilter then netfilter would never see 
those packets. The port 137 packets are prolly just internet garbage.

> > You should see tons output in /var/log/messages including the packets
> > you're looking for. If the packets aren't there, then they aren't making
> > it to the box.
>
> But the packets got to the INPUT rule, that should be after PREROUTING. And
> got to my socket.
>

Can you show these log entries? I don't even know how that could happen. Maybe 
someone else has some ideas.

Jeff


