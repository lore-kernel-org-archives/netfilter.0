From: Dave Cinege <dcinege-mlists-dated-1116221994.cb02fa@psychosis.com>
Subject: Re: captive web system using DNAT and SNAT
Date: Wed, 11 May 2005 01:39:50 -0400
Message-ID: <200505110139.50503.dcinege-mlists@psychosis.com>
Reply-To: dcinege-mlists@psychosis.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org, Matt Zagrabelny <mzagrabe@d.umn.edu>

On Wednesday 31 December 1969 18:59, netfilter-request@lists.netfilter.org 
wrote:

> any thoughts?

NOTE to Grant: The below might explain some of my issues
  Re: Linux forwarding Win XP hosts VERY slowly
Please comment on your thoughts...

Matt,

Take a look at: /proc/net/ip_conntrack

I'm dealing with a lot of weird issues with an appliance I've made that does 
captive portaling and completely dynamic multiple gateway authorzation. 

I'm starting to think some of my issues, that I thought were locking, are now 
actually connecting that are locked up.

Where I know this was a problem was in my captive portal redirecting. I have 2 
dnsmasq's running. One on port 53 and one on 5353.  The 5353 one replies with 
a dummy IP to DNS responses to allow the browser to attempt a connection...my 
firewall rules then REDIRECT to the appliance, and ultimatly the login page.

The problem is once that 53->5353 redirection conneciton is established, it's 
kept alive, even when a new rule is added that should exclude it. 

Example: 
#Default rule
iptables -t nat -A PREROUTING -p tcp --dport 53 -j REDIRECT --to-ports 5353

#Host then logins in and authorizes. (Notice these are inserted before
#the above.)
iptables -t nat -I PREROUTING -d %(hostip)s -j ACCEPT
iptables -t nat -I PREROUTING -s %(hostip)s -j ACCEPT

Should be ok, right? No. That host will continue to get REDIRECTed to port 
5353.

How I solved this was:
echo 1 > /proc/sys/net/ipv4/netfilter/ip_conntrack_udp_timeout_stream

Which forces the connection to time out in a 1 second. 

I figured this would only be an issue with UDP connections like DNS. But after 
reviewing  /proc/net/ip_conntrack 2 days ago when it seemed a host could no 
longer connect to the appliance's web server, I'm thinking this might be a 
similar issue of TCP connections going stale and no longer jibing with the 
rule set. (This may be caused by or compounded by buggy Windows traffic.)

So if things seem to get 'out of sync' again, you might try lowering some of 
the timeout values in /proc/sys/net/ipv4/netfilter/. I'm going to try this 
myself and see if it helps. 

Dave


