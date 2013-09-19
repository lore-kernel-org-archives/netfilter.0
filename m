From: Phil Oester <kernel@linuxace.com>
Subject: Re: basic NAT/masquerading setup
Date: Thu, 19 Sep 2013 10:36:49 -0700
Message-ID: <20130919173648.GA2602@home.localdomain>
References: <201309191636.r8JGaUsc027762@localhost.localdomain>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <201309191636.r8JGaUsc027762@localhost.localdomain>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: iptables@trodman.com
Cc: netfilter@vger.kernel.org

On Thu, Sep 19, 2013 at 11:36:30AM -0500, iptables@trodman.com wrote:
> Hello:
> 
> I'm trying to set up simple NAT/masquerading on a dual NIC host
> (hostname == "psi") running fedora 19, so hosts on my LAN can access
> Internet by routing thru host "psi".
> 
> Interface p1p1 is on my LAN, p2p1 is on Internet.
> 
> I got the "design" of below /etc/iptables from another of my older (fedora core 10) hosts,
> where NAT/masquerading works fine.
> 
> Everything but the NAT/masquerading works.  

What does `sysctl net.ipv4.ip_forward` show?  If 0, you need to change to 1.  

Phil
