From: Arnt Karlsen <arnt@c2i.net>
Subject: Re: applying a rule
Date: Wed, 12 Feb 2003 22:45:01 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030212224501.2e48967f.arnt@c2i.net>
References: <000001c2d2d1$48f886c0$bb00a8c0@DOUG1>
	<003201c2d2d3$82c6bc30$3864a8c0@discmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <003201c2d2d3$82c6bc30$3864a8c0@discmail.com>
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
To: "Aldo S. Lagana" <alagana@discmail.com>
Cc: doug@aircomwireless.net, netfilter@lists.netfilter.org

On Wed, 12 Feb 2003 15:15:39 -0500, 
"Aldo S. Lagana" <alagana@discmail.com> top posted in message 
<003201c2d2d3$82c6bc30$3864a8c0@discmail.com>:

> From: Doug Yeager
> Sent: Wednesday, February 12, 2003 3:00 PM
> 
> > 
> > I have ppp0 (external interface)
> >  
> > I also have ppp1 through ppp200  (vpn connections)
> >  
> > How can I apply a rule to all the vpn connections but omit ppp0
> >  

..for i in `seq 1 1 200` ; do $write-rule-for ppp$i ; done #  ;-)

> > Is it some combination of ppp+ and ! ppp0
> >  
> > Or is it two separate rules.  And which rule would go first if they
> > are separate?
> >  
> > Thx,
> > doug
> 
> silly question - Can you rename your ppp0 interface to something else?
> That is what I did for a similar problem.

..word has it there are only silly _answers_.  
Show him how _you_ did it.  ;-)

-- 
..med vennlig hilsen = with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three: 
  best case, worst case, and just in case.



