From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: SIP conntrack defeating Asterisk canreinvite
Date: Wed, 26 Aug 2009 06:59:16 -0400
Message-ID: <1251284356.6482.2.camel@jaspav.missionsit.net.missionsit.net>
References: <1251248668.6450.59.camel@jaspav.missionsit.net.missionsit.net>
	 <20090826071510.GZ6724@Redstar.dorchain.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090826071510.GZ6724@Redstar.dorchain.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Joerg Dorchain <joerg@dorchain.net>
Cc: netfilter@vger.kernel.org

On Wed, 2009-08-26 at 09:15 +0200, Joerg Dorchain wrote:
> On Tue, Aug 25, 2009 at 09:04:28PM -0400, John A. Sullivan III wrote:
> > The reinvite works by the Asterisk server sending a SIP invite after the
> > call has been set up. The new invite contains the address of the phone
> > in the SDP portion of the packet rather than the address of the PBX.
> > This should redirect the media stream to flow directly between the
> > phones.  However, it appears conntrack is rewriting the SDP so that the
> > address is reverted to the PBX address.
> 
> Rewriting sounds like nat. I am using conntrack_sip to be able
> to have the rtp connections accepted as related to a sip
> connection. Are you sure that you aren't using the sip nat helper
> by change?
> 
> To have reinvites working, I needed sip_direct_media=0 as option
> to nf_conntrack_cip
> 
> Bye,
> 
> Joerg
Yes, as I was thinking after I wrote this, it is probably ip_nat_sip
since it is doing packet rewriting.  So it sounds like it is a problem
without sip_direct_media which sounds like it implies upgrading my
kernel :-(  Thanks - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

http://www.spiritualoutreach.com
Making Christianity intelligible to secular society

