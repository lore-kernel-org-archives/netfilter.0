From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Routing problem
Date: Sat, 14 Feb 2004 15:38:32 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402141538.32855.Antony@Soft-Solutions.co.uk>
References: <002c01c3f247$9d3ee350$1530a8c0@HUSH> <200402140909.20468.Antony@Soft-Solutions.co.uk> <003a01c3f30d$f21c9630$1530a8c0@HUSH>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003a01c3f30d$f21c9630$1530a8c0@HUSH>
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
To: netfilter <netfilter@lists.netfilter.org>

On Saturday 14 February 2004 3:19 pm, Carlos Fernandez Sanz wrote:

> > What (exactly) do you mean by "It also has our first public address"?  
> > Is that public IP assigned to one of your router's interfaces?   If it
> > is,
>
> Actually I don't have it *assigned*, because the interface where packets
> come from internet has 172.x.y.99... so when anything comes to our first
> public address, I DNAT it to the router private address. I guess I could
> 'ip addr add' the IP instead of doing this.

> > then simply connect the machine needing the second public IP address on it
> > to that interface,
>
> How? By connecting the router interface, the second machine, and the
> carrier gateway to the same switch/hub?

No, the router (external I/F) is connected to the carrier gateway (these are 
talking to each other ising 172.x.y.z).   Leave these as they are and connect 
nothing else to them.

Assign public IP number 1 as a second address to the router's internal 
interface (alongside 192.168.21.1), and assign public IP number 2 to the 
machine which is causing all the trouble.   That machine is already connected 
to your internal hub/switch, so therefore it can talk to the router, using 
public IP number 1 as its default gateway address.

Hope this is clear now.

Why didn't the user requiring secure access to the system just use a VPN?

Antony.

-- 
My New Year's resolution is not to make any resolutions I can't keep.

I'm wondering whether I've failed already.


