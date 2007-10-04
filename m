From: John Madden <jmadden@ivytech.edu>
Subject: Re: "DNAT" w/o changing source address?
Date: Thu, 04 Oct 2007 10:22:59 -0400
Message-ID: <1191507779.13379.50.camel@localhost.localdomain>
References: <1191424890.25752.27.camel@localhost.localdomain>
	 <47042728.1060508@riverviewtech.net>
	 <1191503642.13379.12.camel@localhost.localdomain>
	 <4704F5F5.7010601@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4704F5F5.7010601@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

> If traffic does not flow without it, it could mean that the mail server 
> does not send the reply traffic back to the NAT box. This is a routing 
> problem. Does the mail server use the NAT box as its default gateway ?

Ah, now we're getting somewhere.  No, the mail server doesn't use the
NAT box as it's default gateway, it's using a general default route
somewhere else in the network for it.  The NAT box and the mail server
are on different VLAN's, but that's about all that separates them --
both have globally routable IP's.  

I'm literally just trying to emulate the functionality of LVS here,
where port 80 on an IP goes to one machine and port 25 goes somewhere
else.

John




-- 
John Madden
Sr. UNIX Systems Engineer
Ivy Tech Community College of Indiana
jmadden@ivytech.edu

