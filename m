From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: "DNAT" w/o changing source address?
Date: Thu, 04 Oct 2007 10:29:41 -0500
Message-ID: <470506E5.6030605@riverviewtech.net>
References: <1191424890.25752.27.camel@localhost.localdomain>	 <47042728.1060508@riverviewtech.net>	 <1191503642.13379.12.camel@localhost.localdomain>	 <4704F5F5.7010601@plouf.fr.eu.org>	 <1191507779.13379.50.camel@localhost.localdomain>	 <4704FFD6.8050304@plouf.fr.eu.org> <1191510830.13379.73.camel@localhost.localdomain>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1191510830.13379.73.camel@localhost.localdomain>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/04/07 10:13, John Madden wrote:
> Sure.  But they could easily be on the same subnet.

Ok.  So long as the NATing system can be connected to both subnets / 
VLANs I don't think this will be a problem.  If it is a problem, you may 
have to put both systems on the same subnet.

> Right.  What I want instead is for the NAT box to change the 
> destination IP to direct the flow to the mail server.  I don't care 
> where the reply traffic goes (back through the NAT box is fine), I 
> just need to maintain the source IP's (which implies not going back 
> through the NAT, but rather directly back to the real client) to 
> avoid confusion, make proper use of RBL's, etc.

This is why SNATing will not work.  You will have to do something 
fancier.  Like I eluded to in my previous message, I think you could do 
this with bridging and EBTables.

> Imagine troubleshooting Outlook POP3 clients when everyone's coming 
> from the same IP.... *shudder*...

*NO*, I will not think about such horror, shame on you for even 
suggesting it!

> The box does run Linux, but let's assume it doesn't.  I really don't 
> want to be horking with that machine in this manner.

Understood.

> The idea is that when users hit "mail.ivytech.edu" in their browsers, 
> they get the web mail client.  When they hit that same address with 
> their SMTP clients, they'll talk to the MTA.  LVS allows you to do 
> this transparently and I assumed the same could be done with iptables 
> -- that's all I'm trying to accomplish here.

LVS is not using traditional routing and as such you need to use 
something beyond that.

> If the box could just modify the headers to change the destination IP 
> and drop the packets back on the wire without any change to the 
> source IP happening, I think I'd be happy.

Do you need to even change the destination IP if you can somehow get the 
traffic over to the mail server?  I'm still thinking bridging and 
EBTables.  I'll think about this and get back to you with a proposed 
solution.



Grant. . . .
