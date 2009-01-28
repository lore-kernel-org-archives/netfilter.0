From: Kostas Pelechrinis <kpele_ntua@yahoo.com>
Subject: Re: Blocking outgoing 802.11 ACKs
Date: Wed, 28 Jan 2009 04:08:35 -0800 (PST)
Message-ID: <769867.61314.qm@web31602.mail.mud.yahoo.com>
References: <alpine.DEB.2.00.0901281257540.22626@aurora.sdinet.de>
Reply-To: kpele_ntua@yahoo.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0901281257540.22626@aurora.sdinet.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sven-Haegar Koch <haegar@sdinet.de>
Cc: netfilter@vger.kernel.org

Hi Sven,

thanks for the reply.  I just saw it.  Thanks for the info.  I was afraid that this would be the case :)

Thanks,
Kostas


--- On Wed, 1/28/09, Sven-Haegar Koch <haegar@sdinet.de> wrote:

> From: Sven-Haegar Koch <haegar@sdinet.de>
> Subject: Re: Blocking outgoing 802.11 ACKs
> To: "Kostas Pelechrinis" <kpele_ntua@yahoo.com>
> Cc: netfilter@vger.kernel.org
> Date: Wednesday, January 28, 2009, 7:00 AM
> On Wed, 28 Jan 2009, Kostas Pelechrinis wrote:
> 
> > I have two nodes communicating via their wireless
> interfaces.  Let us 
> > assume that node A sends packets to node B.  Once node
> B is receiving 
> > the packets, he transmits the 802.11 ACK frame.  What
> I want to do is 
> > to prevent node B from sending this ACK frames once
> every two packets 
> > for example. 
> 
> iptables does not see 802.11 ACK frames, and depending on
> the used 
> driver they are even invisible to the layers below IP, as
> they are 
> generated/handled in hardware/firmware of the wireless
> interface.
> 
> I do not see a "normal" way to block them beside
> modifying the wireless 
> driver or mac80211 layer (if used by your driver).
> 
> c'ya
> sven
> 
> -- 
> The lights are fading out, once more...


      
