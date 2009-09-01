From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: SIP conntrack defeating Asterisk canreinvite
Date: Mon, 31 Aug 2009 23:11:29 -0400
Message-ID: <1251774689.6803.25.camel@jaspav.missionsit.net.missionsit.net>
References: <1251248668.6450.59.camel@jaspav.missionsit.net.missionsit.net>
	 <20090826071510.GZ6724@Redstar.dorchain.net>
	 <1251284356.6482.2.camel@jaspav.missionsit.net.missionsit.net>
	 <1251414068.6475.58.camel@jaspav.missionsit.net.missionsit.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1251414068.6475.58.camel@jaspav.missionsit.net.missionsit.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joerg Dorchain <joerg@dorchain.net>
Cc: netfilter@vger.kernel.org

On Thu, 2009-08-27 at 19:01 -0400, John A. Sullivan III wrote:
> On Wed, 2009-08-26 at 06:59 -0400, John A. Sullivan III wrote:
> > On Wed, 2009-08-26 at 09:15 +0200, Joerg Dorchain wrote:
> > > On Tue, Aug 25, 2009 at 09:04:28PM -0400, John A. Sullivan III wrote:
> > > > The reinvite works by the Asterisk server sending a SIP invite after the
> > > > call has been set up. The new invite contains the address of the phone
> > > > in the SDP portion of the packet rather than the address of the PBX.
> > > > This should redirect the media stream to flow directly between the
> > > > phones.  However, it appears conntrack is rewriting the SDP so that the
> > > > address is reverted to the PBX address.
> > > 
> > > Rewriting sounds like nat. I am using conntrack_sip to be able
> > > to have the rtp connections accepted as related to a sip
> > > connection. Are you sure that you aren't using the sip nat helper
> > > by change?
> > > 
> > > To have reinvites working, I needed sip_direct_media=0 as option
> > > to nf_conntrack_cip
> > > 
> > > Bye,
> > > 
> > > Joerg
> > Yes, as I was thinking after I wrote this, it is probably ip_nat_sip
> > since it is doing packet rewriting.  So it sounds like it is a problem
> > without sip_direct_media which sounds like it implies upgrading my
> > kernel :-(  Thanks - John
> Hmm . . . on the other hand, these connections are NOT doing NAT.  If
> they are separated by a VPN and using RFC 1918 addresses.  Why would
> ip_nat_sip even come into play? Thanks - John
Well . . . we've had mixed success.  We finally gave in and upgraded to
kernel 2.6.30.5 rather than stay with the stock CentOS 5.3 kernel.
Setting sip_direct_media=0 helped but there is still an issue.

Without changing that setting, the conversation would succeed until the
reinvite was issued and then audio would go dead.  Now, sometimes, the
audio starts off dead until the end points send a SIP packet to each
other.  Then the RDP stream jumps alive.  Until then, the RDP packets
are blocked.   It's as if conntrack did not pick up the changed end
point address in the SDP.  Once the end points sent an allowed SIP
packet, the RDP packets were appropriately associated with that
connection.

This seems to manifest itself in another way.  When a call is
transferred, we frequently have one way audio.  The culprit is again the
reinvite.  As soon as the PBX sends the end point address in the SDP,
the audio breaks.

Is this something we have misconfigured or is it a shortcoming in the
SIP conntrack module? Of course, I would imagine conntrack can only do
so much, e.g., what if the transfer made the call traverse a different
firewall - that would not be conntrack's fault!

On a related note, we also tried implementing sip_direct_signalling=0
but what exactly, in practical terms, does that do? Thanks - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

http://www.spiritualoutreach.com
Making Christianity intelligible to secular society

