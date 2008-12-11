From: Thomas Jacob <jacob@internet24.de>
Subject: Re: Using MARK and TOS to route traffic through different  
	interfaces to the same destination
Date: Thu, 11 Dec 2008 13:48:01 +0100
Message-ID: <1228999681.22977.13.camel@enterprise.ims-firmen.de>
References: <145d4e1a0812110418l3a867cb6pe6d45e9fd1007a75@mail.gmail.com>
	 <1228998831.22977.9.camel@enterprise.ims-firmen.de>
	 <49410A7C.6010501@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49410A7C.6010501@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

On Thu, 2008-12-11 at 13:41 +0100, Pascal Hambourg wrote:
> > AFAIK, locally generated packets are routed before they are sent to
> > netfilter, so setting fwmarks there to influence routing is pointless.
> 
> A rerouting happens after the OUTPUT chains in order to take into 
> account destination NAT and marks.

Didn't now that, does this always happen (so all locally generated
packets are routed twice, when iptables is active) or only
when netfilter changes things that might affect the destination
of a packet?

