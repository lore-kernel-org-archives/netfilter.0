From: Chris <chris@deksai.com>
Subject: Re: Parts of firewall disappearing under load
Date: Tue, 2 Jun 2009 11:31:18 -0400
Message-ID: <20090602153117.GA3549@chris-laptop.a2hosting.com>
References: <20090602135200.GA3494@chris-laptop.a2hosting.com> <0E343D269189485382D3A75C20D236B3@phoenix>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <0E343D269189485382D3A75C20D236B3@phoenix>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org
Cc: Jason Pyeron <jpyeron@pdinc.us>

On Tue, Jun 02, 2009 at 10:10:31AM -0400, Jason Pyeron wrote:
> > We've got quite a few heavily loaded boxes (ISP shared 
> > servers) which have firewalls enabled.  The firewalls 
> > basically allow certain ports, block some naughty IPs, and 
> > use limit and recent to keep some services under control.
> > 
> > What we've noticed is that on rare occasions, a box will 
> 
> Can you make a test case? Does it happen on more than one machine?

That's the tricky part.  It happens maybe once or twice a month, and on
different machines.  I don't know of a way to reproduce it.  Any
pointers on information that would be useful to gather at the time it
happens would be extremely useful, since at this point it is a mystery
to me.


> > firewall itself off from the world.  After a few times of 
> > this happening we found that we could sometimes ssh in from 
> > certain IPs, but not others.  That made me curious, so I did 
> > a diff of iptables-save output with a known good state, and 
> > sure enough, the two weren't the same.
> > Much of the firewall was just missing.  I'm not sure if the 
> > firewall rules it output were actually being used or not.
> > 
> > My only guess is that we are being hit particularly hard that 
> > day, and perhaps a table of IPs is getting too large.
> 
> Can you vouch that there are no hardware issues? (disk, ram, or
> power?)
> 
I guess I wouldn't rule it out, but I think it is fairly unlikely, since
it is happening on boxes that are from different batches and
different places in the data center.
