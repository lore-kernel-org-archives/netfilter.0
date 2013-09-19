From: iptables@trodman.com
Subject: Re: basic NAT/masquerading setup [thanks Phil, that was it..
Date: Thu, 19 Sep 2013 12:58:26 -0500
Message-ID: <201309191758.r8JHwQGr030358@localhost.localdomain>
References: <201309191636.r8JGaUsc027762@localhost.localdomain> <20130919173648.GA2602@home.localdomain>
Return-path: <netfilter-owner@vger.kernel.org>
In-reply-to: <20130919173648.GA2602@home.localdomain>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

On Thu 9/19/13 10:36 PDT Phil Oester wrote:
> On Thu, Sep 19, 2013 at 11:36:30AM -0500, iptables@trodman.com wrote:
> > I'm trying to set up simple NAT/masquerading on a dual NIC host
> > (hostname == "psi") running fedora 19, so hosts on my LAN can access
> > Internet by routing thru host "psi".
> > 
> > Interface p1p1 is on my LAN, p2p1 is on Internet.
> > 
> > I got the "design" of below /etc/iptables from another of my older (fedora core 10) hosts,
> > where NAT/masquerading works fine.
> > 
> > Everything but the NAT/masquerading works.  
> 
> What does `sysctl net.ipv4.ip_forward` show?  If 0, you need to change to 1.  

Thanks Phil, that was it!  (embarrassed) I wrongly recalled updating /etc/sysctl.conf, and assumed
net.ipv4.ip_forward was '1'.  It's fixed/working across a reboot now.

--
Tom



