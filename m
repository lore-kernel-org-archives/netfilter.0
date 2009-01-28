From: Kostas Pelechrinis <kpele_ntua@yahoo.com>
Subject: Re: Blocking outgoing 802.11 ACKs
Date: Wed, 28 Jan 2009 04:06:22 -0800 (PST)
Message-ID: <386978.92907.qm@web31606.mail.mud.yahoo.com>
References: <d39744a20901280329y4a2edc9yc0f7c59eb86c4bbc@mail.gmail.com>
Reply-To: kpele_ntua@yahoo.com
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <d39744a20901280329y4a2edc9yc0f7c59eb86c4bbc@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ivan Petrushev <ivanatora@gmail.com>
Cc: netfilter@vger.kernel.org

Hi Ivan,

thanks a lot for the info about the nth module.  Well I know that the quality of the link is going to drop but this is what exactly I want :) I want to force a client "reduce" its rate by not sending ACKs to him.  My concern is that 802.11 ACKs are being handled at the firmware and I do not know if iptables can handle this.  

Anyone knows anything about this?

Thanks a lot,
Kostas


--- On Wed, 1/28/09, Ivan Petrushev <ivanatora@gmail.com> wrote:

> From: Ivan Petrushev <ivanatora@gmail.com>
> Subject: Re: Blocking outgoing 802.11 ACKs
> To: kpele_ntua@yahoo.com
> Cc: netfilter@vger.kernel.org
> Date: Wednesday, January 28, 2009, 6:29 AM
> iptables has "nth" match extension that matches
> every n-th packet. It
> is described in the man page.
> But why would you want to drop ACK packets? That would have
> negative
> impact on your link.
> 
> Ivan.
> 
> On Wed, Jan 28, 2009 at 12:41 PM, Kostas Pelechrinis
> <kpele_ntua@yahoo.com> wrote:
> > Hi all,
> >
> > I have two nodes communicating via their wireless
> interfaces.  Let us assume that node A sends packets to node
> B.  Once node B is receiving the packets, he transmits the
> 802.11 ACK frame.  What I want to do is to prevent node B
> from sending this ACK frames once every two packets for
> example.
> >
> > One indirect way I have thought about is setting the
> following rule to node B:
> >
> > iptables -A INPUT -i ath0 -m limit --limit
> _SPECIFIED-LIMIT_ -s _NODE'S A IP_ -j DROP
> >
> > However,  I am not sure if this prevents the 802.11
> ACKs from being transmitted.  This has to do with the place
> where the above rule is being enforced.
> >
> > Do you have any comments or suggestions on how I can
> achieve what I am trying to?
> >
> > Thanks,
> > Kostas
> >
> >
> >
> > --
> > To unsubscribe from this list: send the line
> "unsubscribe netfilter" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> >


      
