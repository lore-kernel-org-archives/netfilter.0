From: Daniel David Benson <dan@spoontail.com>
Subject: Re: Leaking ICMP and UDP packets
Date: Tue, 20 Apr 2004 11:06:49 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0404201059380.9758-100000@dudester.spoontail.com>
References: <200404201846.38703.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404201846.38703.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org



Ok, so if I understand correctly, the 10.101.10.103 host is trying to 
respond to this windows box -- it only knows the default gateway to get to 
that 169 address.  It doesn't NAT because it doesn't have a corresponding 
"initiated" NAT entry?  I guess I'm confused as to why it doesn't match 
the global NAT entry -- I suspect it's my lack of understanding of how NAT 
is implemented.  In the end, I should be blocking these 169 requests in 
the FORWARD table anyway.  Is it common practice to set thet NAT chains 
default policies to DROP?  I guess, I'd like to know the best way to stop 
these bad boys from getting out to be a good netizen.

-Dan



On Tue, 20 Apr 2004, Antony Stone wrote:

> On Tuesday 20 April 2004 6:13 pm, Daniel David Benson wrote:
> 
> > > Are you sure they are un-NATted packets "leaking" through netfilter, and
> > > not ICMP packets being sent back to some remote system by the firewall
> > > itself, saying "host unreachable" etc?
> >
> > Finally, after 24 hours I got the following packets on my front edge
> > (public) interface:
> >
> > 09:57:48.388232 10.101.10.103 > 169.254.85.249: icmp: time exceeded
> > in-transit 09:58:03.386143 10.101.10.103 > 169.254.85.249: icmp: time
> > exceeded in-transit 09:58:18.386973 10.101.10.103 > 169.254.85.249: icmp:
> > time exceeded in-transit
> >
> > * This internal IP isn't any of the 1 to 1 NATs listed below and should
> > come out as the global NAT IP.
> 
> Correct me if I'm wrong, but isn't 169.254.85.249 one of those Microsoft 
> "let's make up a network range if we can't find anyone to talk to" addresses?
> 
> In other words, the original packet did not come from the outside world, 
> therefore did not come through your firewall (it came from a lonely Windows 
> machine inside your network which has decided to create its own IP address, 
> and has then decided to send packets to 10.101.10.103, which returned an ICMP 
> error through your default gateway), and therefore there was no automatic 
> reverse NAT in place to set the source address to what you would expect?
> 
> I bet you can't find the original packet, to which this ICMP TTL exceeded 
> message corresponds, in your packet sniffer logs, because it never came in 
> through the firewall in the first place.
> 
> Regards,
> 
> Antony.
> 
> 


