From: "Joe Patterson" <jpatterson@asgardgroup.com>
Subject: RE: detection of the third tcp packet in a tcp connection setup
Date: Thu, 27 Jun 2002 15:50:49 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <NJEFLNJDIFFNMHDEBKMJEEJBDOAA.jpatterson@asgardgroup.com>
References: <20020627193043.UMUP19225.mta07-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <20020627193043.UMUP19225.mta07-svc.ntlworld.com@there>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Antony Stone <Antony@Soft-Solutions.co.uk>, netfilter@lists.samba.org

Nope.  If you've got data flowing in one direction, then you should have a
steady stream of packets with tcp data and (I believe) PSH,ACK set flowing
one way, and a steady stream of packets with ACK set and zero tcp data
length flowing the other way.  But I could be wrong....  Actually, no, just
checked it with a sniffer, and I couldn't be wrong.  :)  Other than order I
don't see any way to distinguish the first ack from the 100th.

Now, you could say that if the tcp data length is greater than zero, then
the packet is either *not* valid, or is *not* the third packet (although
there was at one point a proposed tcp-like protocol that had data in the
third packet, to keep down latency on short duration sessions, but I believe
it's still considered evil in tcp-land).

But even then, the length match wouldn't necessarily help.  I believe
(although not sure) that the length match matches the length of the entire
ip packet, and I further believe that it would be entirely valid to pad the
end of the third packet in a tcp handshake with a bunch of NOOP options,
thereby making the ip packet larger than you would expect for a tcp packet
with no data.  It's still somewhat usefull, but not reliable.

That kind of touches on an idea I had a while back, to log packets going to,
for example, port 25 with a length greater than a tcp packet with no options
and no data, but less than a tcp packet with no options and a few (2?  3?)
bytes of data.  You *might* be able to use this to notice people who are
telnetting to an smtp port and typing in commands by hand.  Certainly not
reliable, but possibly interesting nonetheless.

-Joe

> -----Original Message-----
> From: netfilter-admin@lists.samba.org
> [mailto:netfilter-admin@lists.samba.org]On Behalf Of Antony Stone
> Sent: Thursday, June 27, 2002 3:31 PM
> To: netfilter@lists.samba.org
> Subject: Re: detection of the third tcp packet in a tcp connection setup
>
>
> On Thursday 27 June 2002 8:10 pm, Joe Patterson wrote:
>
> > catching the third packet is easy.  The hard part is to both catch the
> > third packet and *not* catch all of the rest of the ack packets.
> >
> > There are some distinguishing characteristics... it is the first packet
> > sent by the client that is in state ESTABLISHED.  it should have ACK set
> > and no other flags.  the tcp data length should be zero.
>
> Isn't that in itself a bit of a giveaway ?   I can't think of a
> reason why a
> zero-length packet should ever occur in the remainder of the data
> stream... ?
>
> There's a -m length --length <min>:<max> match somewhere, but I'm
> not sure if
> it's in the standard build or p-o-m
>
>
>
> Antony.
>
>
>


