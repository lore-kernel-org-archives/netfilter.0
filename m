From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: DNATing packets sent to the NATing box
Date: Sun, 14 Dec 2003 11:55:19 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312141155.19270.JALaramie@Loudoun-Fairfax.com>
References: <20031214135211.GA11695@tinuviel.compendium.com.ar> <200312141051.55776.JALaramie@Loudoun-Fairfax.com> <20031214160416.GA17220@tinuviel.compendium.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031214160416.GA17220@tinuviel.compendium.com.ar>
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

On Sunday 14 December 2003 11:04, horape@tinuviel.compendium.com.ar wrote:
> > > I do:
> > >
> > > iptables -t nat -A PREROUTING -p udp -j LOG --log-prefix "PREROUTING: "
> > > iptables -t filter -A INPUT -p udp -j LOG --log-prefix "INPUT: "
> > >
> > > (I'm logged in that box via ssh, so I prefer not to do -p all)
> > >
> > > There are no more rules than these ones.
> > >
> > > In the log I see the INPUT ones but not the PREROUTING (only see on
> > > PREROUTING packets to port 137, maybe some worm...)
> >
> > That's very strange. You said in your first post that you had a udp proxy
> > running. Is it on this box? I'm not sure at what level a proxy hooks into
> > the box, but I know that some programs read the data stream before
> > netfilter sees it. If the proxy is in front of netfilter then netfilter
> > would never see those packets. The port 137 packets are prolly just
> > internet garbage.
>
> The proxy has a udp socket bound to port 5000, and another udp socket bound
> to some other port, it reads from the first socket and does a sendto using
> the other socket (poll + read + write, no more)
>

It looks like the proxy is grabbing the packets first and then dropping them 
directly onto the INPUT chain. Try disabling the proxy and release the bound 
ports then try it again. Once the packets reach PREROUTING you can DNAT them 
to another port.

Jeff

