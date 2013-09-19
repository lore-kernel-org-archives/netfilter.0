From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: basic NAT/masquerading setup
Date: Thu, 19 Sep 2013 13:38:57 -0400
Message-ID: <201309191338.57155.neal.p.murphy@alum.wpi.edu>
References: <201309191636.r8JGaUsc027762@localhost.localdomain>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201309191636.r8JGaUsc027762@localhost.localdomain>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Thursday, September 19, 2013 12:36:30 PM iptables@trodman.com wrote:
> Hello:
> 
> I'm trying to set up simple NAT/masquerading on a dual NIC host
> (hostname == "psi") running fedora 19, so hosts on my LAN can access
> Internet by routing thru host "psi".
> 
> Interface p1p1 is on my LAN, p2p1 is on Internet.
> 
> I got the "design" of below /etc/iptables from another of my older (fedora
> core 10) hosts, where NAT/masquerading works fine.
> 
> Everything but the NAT/masquerading works.

Perhaps I missed it: where do you ACCEPT *NEW* conns in chain FORWARD?
