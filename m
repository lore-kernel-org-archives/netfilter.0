From: Andrew Schulman <andrex-cmaem7PIVQQM4YKboWzA4l6hYfS7NtTn@public.gmane.org>
Subject: Re: Making a Bridging firewall
Date: Mon, 12 Apr 2004 13:47:04 -0400
Sender: netfilter-admin-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
Message-ID: <MPG.1ae4a01fed9fd6ad9896aa@localhost>
References: <407AD23A.3030905@leaplab.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org>
Errors-To: netfilter-admin-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
List-Help: <mailto:netfilter-request-wool9L35kiczKOhml7GhPuLxvTOCFHmI2yCS0tKOigE@public.gmane.org>
List-Post: <mailto:netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request-wool9L35kiczKOhml7GhPuLxvTOCFHmIRj+87qQpzpCql8G6E966Ow@public.gmane.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request-wool9L35kiczKOhml7GhPuLxvTOCFHmIFcjs2lY4wUfKtGCp0j7rLg@public.gmane.org>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org

> Hello.. I've been wanting to rewrite my firewall for a little bit but 
> i'm not that familiar with iptables..  Up until now i've had a shorewall 
> based firewall that also did bridging between my gateway and a VPN 
> gateway over the internet (to link our houses.)  I used the bridge-nf 
> patch on the 2.4 kernel to be able to manage the bridge traffic and 
> block certain broadcast packets (like DHCP)  I've now upgraded to the 
> 2.6 kernel because i heard it may fix some other issues i was having but 
> now my bridge (DHCP blocking) rules no longer work... I'd like to get 
> rid of shorewall and write my own IPTables in the hopes that i could get 
> my ability to control the bridge back.  Can anyone make any suggestions, 
> or point to a guide that does this with the 2.6 kernel?

I found "Linux Firewalls", 2nd ed., by Robert Ziegler, to be an 
excellent, complete guide to packet filter firewalls in general, and 
iptables in particular.  None of it is specific to kernel 2.4, as far as 
I'm aware.  After reading it I built my firewall with kernel 2.4, and it 
continues to work just fine in kernel 2.6.

I'm not familiar with the bridge-nf patch, but you might be able to 
implement your bridge using just the FORWARD table.

Good luck,
Andrew. 

-- 
To reply by email, replace "deadspam.com" by "alumni.utexas.net"


