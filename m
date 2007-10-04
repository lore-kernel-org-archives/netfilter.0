From: John Madden <jmadden@ivytech.edu>
Subject: Re: "DNAT" w/o changing source address?
Date: Thu, 04 Oct 2007 09:14:26 -0400
Message-ID: <1191503666.13379.15.camel@localhost.localdomain>
References: <1191424890.25752.27.camel@localhost.localdomain>
	 <47042728.1060508@riverviewtech.net>  <47042AD0.2080806@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <47042AD0.2080806@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

> To be exhaustive, the only exception is in the OUTPUT chain on kernel 
> versions less than 2.6.11, when DNAT changes the output interface the 
> source address is also changed in order to match the new interface. 
> However DNAT in the PREROUTING chain never changes the source address.

This is on RHEL 4, which runs some variation of 2.6.9...

John




-- 
John Madden
Sr. UNIX Systems Engineer
Ivy Tech Community College of Indiana
jmadden@ivytech.edu

