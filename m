From: Micha Silver <Micha@arava.co.il>
Subject: RE: Having NAT problems
Date: Fri, 2 Apr 2004 10:41:43 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <8118CC0EE4FDF94AA1C785BD746EF2A69DB279@eshetb>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org



> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] 
> Sent: Friday, April 02, 2004 12:41 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: Having NAT problems
> 
> 
> On April 1, 2004 03:45 pm, Antony Stone wrote:
> > On Thursday 01 April 2004 9:32 pm, Adam Kennedy wrote:
> > > On Thu, 1 Apr 2004 21:19:45 +0100, Antony Stone wrote
> > >
> > > > Okay, how's this then  - please post all the rules 
> which you think 
> > > > are needed for this pcAnywhere setup to work (with 
> suitable partial
> > > > obscuring of IPs if you wish).   Then we'll tell you if 
> we can see
> > > > something missing?
> > >
> > > That's actually what I wound up doing in the last post. 
> That's all 
> > > the rules on the box save for a few NAT entries which I just 
> > > commented out. Commenting them out and re-running the 
> file didn't do 
> > > anything. I'm at my wits end.
> >
> > In that case let's see if there's something strange about 
> the protocol
> > pcAnywhere uses.   Set up a similar DNAT rule for something 
> we know about,
> > like ssh (or http, or any other service you happen to be 
> running on an 
> > internal server), and see if you can connect to that from 
> the outside 
> > world.
> >
> > If you can, then there's obviously something about pcAnywhere which 
> > either doesn't like NAT, or isn't sufficiently simple to work on a 
> > single destination port.

I believe that pcAnywhere also requires UDP port 5632 to be open.

Cheers,
Micha

