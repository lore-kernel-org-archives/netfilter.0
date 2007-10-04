From: John Madden <jmadden@ivytech.edu>
Subject: Re: "DNAT" w/o changing source address?
Date: Thu, 04 Oct 2007 11:13:50 -0400
Message-ID: <1191510830.13379.73.camel@localhost.localdomain>
References: <1191424890.25752.27.camel@localhost.localdomain>
	 <47042728.1060508@riverviewtech.net>
	 <1191503642.13379.12.camel@localhost.localdomain>
	 <4704F5F5.7010601@plouf.fr.eu.org>
	 <1191507779.13379.50.camel@localhost.localdomain>
	 <4704FFD6.8050304@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4704FFD6.8050304@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

> > Ah, now we're getting somewhere.  No, the mail server doesn't use the
> > NAT box as it's default gateway, it's using a general default route
> > somewhere else in the network for it.  The NAT box and the mail server
> > are on different VLAN's, but that's about all that separates them --
> 
> Do you mean that they are in different subnets ?

Sure.  But they could easily be on the same subnet.  

> Private/public addressing does not matter here. You can have public 
> addresses behind a NAT box, although it may sound unusual (NAT is mostly 
> used to hide private addressing when you don't have enough public 
> addresses). The important word is "behind", meaning that traffic in both 
> directions flows through the NAT box. This is important because the NAT 
> box changed the source and/or destination address on the original 
> traffic, so it must put it back on the reply traffic in order for the 
> client to accept it as a reply. It's not the SNAT rule which puts the 
> original address back, it only makes the server see the NAT box as the 
> client and send the reply traffic back to it. But the drawback is that 
> the server does not see the real client source address.

Right.  What I want instead is for the NAT box to change the destination
IP to direct the flow to the mail server.  I don't care where the reply
traffic goes (back through the NAT box is fine), I just need to maintain
the source IP's (which implies not going back through the NAT, but
rather directly back to the real client) to avoid confusion, make proper
use of RBL's, etc.

Imagine troubleshooting Outlook POP3 clients when everyone's coming from
the same IP.... *shudder*... 

> Without SNAT, the mail server could use the NAT box as a gateway at 
> least for SMTP reply traffic (this could be done with advanced routing 
> if the mail server runs Linux) if they are in the same subnet or if a 
> tunnel can be established directly between them.

The box does run Linux, but let's assume it doesn't.  I really don't
want to be horking with that machine in this manner.

> Sorry, I do not know how LVS works. I just know how Netfilter NAT works.

The idea is that when users hit "mail.ivytech.edu" in their browsers,
they get the web mail client.  When they hit that same address with
their SMTP clients, they'll talk to the MTA.  LVS allows you to do this
transparently and I assumed the same could be done with iptables --
that's all I'm trying to accomplish here.  

If the box could just modify the headers to change the destination IP
and drop the packets back on the wire without any change to the source
IP happening, I think I'd be happy.

John



-- 
John Madden
Sr. UNIX Systems Engineer
Ivy Tech Community College of Indiana
jmadden@ivytech.edu

