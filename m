From: "Jason Pyeron" <jpyeron@pdinc.us>
Subject: RE: Parts of firewall disappearing under load
Date: Tue, 2 Jun 2009 10:10:31 -0400
Message-ID: <0E343D269189485382D3A75C20D236B3@phoenix>
References: <20090602135200.GA3494@chris-laptop.a2hosting.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20090602135200.GA3494@chris-laptop.a2hosting.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


> -----Original Message-----
> From: netfilter-owner@vger.kernel.org 
> [mailto:netfilter-owner@vger.kernel.org] On Behalf Of Chris
> Sent: Tuesday, June 02, 2009 9:52
> To: netfilter@vger.kernel.org
> Subject: Parts of firewall disappearing under load
> 
> We've got quite a few heavily loaded boxes (ISP shared 
> servers) which have firewalls enabled.  The firewalls 
> basically allow certain ports, block some naughty IPs, and 
> use limit and recent to keep some services under control.
> 
> What we've noticed is that on rare occasions, a box will 

Can you make a test case? Does it happen on more than one machine?

> firewall itself off from the world.  After a few times of 
> this happening we found that we could sometimes ssh in from 
> certain IPs, but not others.  That made me curious, so I did 
> a diff of iptables-save output with a known good state, and 
> sure enough, the two weren't the same.
> Much of the firewall was just missing.  I'm not sure if the 
> firewall rules it output were actually being used or not.
> 
> My only guess is that we are being hit particularly hard that 
> day, and perhaps a table of IPs is getting too large.

Can you vouch that there are no hardware issues? (disk, ram, or power?)

> 
> Has anyone seen this before?  There isn't anything in the 
> logs to give me a clue.  If anyone has pointers on how to 
> further debug this, I would really appreciate it.  
> 

Not that issue, but I have seen some very random issues with loaded boxes with
bad power supplies.

> We are using CentOS, with kernels which at this time are 
> 2.6.18-128.1.10.el5.  If I need to be asking on a CentOS or 
> Redhat specific list, please let me know.


