From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: DNATing packets sent to the NATing box
Date: Sun, 14 Dec 2003 12:35:32 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312141235.32793.JALaramie@Loudoun-Fairfax.com>
References: <20031214135211.GA11695@tinuviel.compendium.com.ar> <200312141155.19270.JALaramie@Loudoun-Fairfax.com> <200312141716.40029.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312141716.40029.Antony@Soft-Solutions.co.uk>
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

On Sunday 14 December 2003 12:16, Antony Stone wrote:
> On Sunday 14 December 2003 4:55 pm, Jeffrey Laramie wrote:
> > On Sunday 14 December 2003 11:04, horape@tinuviel.compendium.com.ar wrote:
> > > The proxy has a udp socket bound to port 5000, and another udp socket
> > > bound to some other port, it reads from the first socket and does a
> > > sendto using the other socket (poll + read + write, no more)
> >
> > It looks like the proxy is grabbing the packets first and then dropping
> > them directly onto the INPUT chain. Try disabling the proxy and release
> > the bound ports then try it again. Once the packets reach PREROUTING you
> > can DNAT them to another port.
>
> I could ubnderstand the proxy code managing to grab the packet off the wire
> before netfilter (PREROUTING) sees it, but I don't see how it would then
> get seen by the INPUT chain - as far as I know, it's not possible for a
> packet to reach netfilter's INPUT chain without first going through the
> PREROUTING chain.   If a packet bypasses one of these, it will bypass both.

Well that's what I thought but I can't explain his results any other way. What 
are we missing here?

Jeff


