From: Andrew Schulman <andrex-cmaem7PIVQQM4YKboWzA4l6hYfS7NtTn@public.gmane.org>
Subject: Re: Iptables don't block traffic
Date: Thu, 22 Apr 2004 10:47:46 -0400
Sender: netfilter-admin-wool9L35kiczKOhml7GhPkB+6BGkLq7r@public.gmane.org
Message-ID: <MPG.1af1a519745c740e9896b6@localhost>
References: <4087CE5F.5030503@riafinancial.com>
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

> Hi all, this is my first message to the list, so excuse me if it is 
too
> trivial...
> 
>     I have a Red Hat box running as a firewall in my network. It's
> working fine, but now I'm doing tests in order to block certain Internet
> traffic. I've added the following rules which should drop packets from
> my PC to a known public IP (a web server):
> 
> iptables -A FORWARD -s 192.138.35.110 -d 193.110.128.200 -j DROP
> 
>     But the packets are not droped because I still can connect to the
> web server.

Look at your whole FORWARD chain: 'iptables -v -L FORWARD'.  You have an 
earlier rule in the chain that's allowing those packets through.

If you want to be sure, try replacing '-A' by '-I'.  This will insert 
your rule at the front of the FORWARD chain, instead of at the end.  

>    The default rule for FORWARD chain is DROP

This confirms it.  If you didn't have an earlier rule that was letting 
the packets through, then with a DROP policy you wouldn't need the above 
rule at all.


