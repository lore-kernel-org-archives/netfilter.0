From: SBlaze <dagent.geo@yahoo.com>
Subject: Re: filter on ethernet alias
Date: Thu, 4 Sep 2003 09:25:28 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030904162528.96264.qmail@web40204.mail.yahoo.com>
References: <20030904152250.GA25689@mtholyoke.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030904152250.GA25689@mtholyoke.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ron Peterson <rpeterso@mtholyoke.edu>, Netfilter Discussion <netfilter@lists.netfilter.org>


--- Ron Peterson <rpeterso@mtholyoke.edu> wrote:
> I've found several threads on the topic in the list archives, but the
> solutions presented don't quite match my situation.
> 
> Putting the aliases issue aside for the moment, here's the application.
> I configure dhcp to set a linux box's ip address to be the default
> gateway for certain hosts.  Then I use iptables rules to DNAT traffic
> destined for ports 80/443 to to a box (could be same box) running apache
> on say ports 8080/8443.  Apache simply redirects traffic to these ports
> to a particular URL.  So for example, unregistered computers get
> directed to a web page that says they have to register their computer
> before they'll get off-campus Internet access.
> 
> Now I'd like to direct certain people to one page, and others to a
> different page (e.g. their machine has been identified as being hacked,
> so they get directed to a page telling them what to do).
> 
> So I was thinking I could do this by aliasing multiple IP's to a single
> interface, and filter based on the virtual interface.  Can't do this, I
> guess.  Neither can I filter on destination IP, because the box is a
> gateway, not a destination.  Is there any way to filter a packet based
> on which gateway ip address it was sent to, if both addresses are
> assigned to the same interface?
> 

I could be really wrong here but to use virtual IPs or what not the device
takes on another name right? like eth0.1 or something like that does it not?
You should be able to specify which incoming device to filter from. I have
heard that it does not matter if its like eth0.1. As long as its a valid device
name it can be used by iptables.

Hope I understood you right and this helps

SBlaze
> -- 
> Ron Peterson                          -o)
> Network & Systems Manager             /\\
> Mount Holyoke College                _\_v
> http://www.mtholyoke.edu/~rpeterso   ---- 
> 


=====
"Winky is not knowing how sir, winky is not knowing how?" -=Winky / Harry Potter and the Goblet of Fire=-"

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free, easy-to-use web site design software
http://sitebuilder.yahoo.com

