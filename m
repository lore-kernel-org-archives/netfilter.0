From: "Aldo S. Lagana" <alagana@discmail.com>
Subject: RE: Email troubles behind iptables firewall
Date: Thu, 12 Sep 2002 11:43:53 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001c01c25a73$328e9860$3864a8c0@discmail.com>
References: <002c01c25a68$fde16160$6902a8c0@visionsbeyond.mindtrip>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002c01c25a68$fde16160$6902a8c0@visionsbeyond.mindtrip>
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
To: 'Travis Crook' <travis@visionsbeyond.com>, netfilter@lists.netfilter.org


> 
> Hi all,
>     I have an iptables firewall setup to route web, ftp 
> and email traffic to internal servers.  My internal 
> servers have ip addresses in the 192.168.2. range.  
> The problem I am having is that my email server is 
> being used as a spam box (not by me but by someone 
> else on the internet - not with my approval either).
> 
> My question is this:  Qmail is my mail server.  It is 
> supposed to only allow relaying by certain clients.  
> As far as I know it is set up this way.  I think the 
> problem occurs because I allow 192.168.2. ip 
> addresses to relay mail (i.e. everyone behind the 
> firewall).  But every email coming in to the mail 
> server gets a 192.168.2. ip address.  Is this 
> correct?  Is there any way to pass their real ip 
> address through the firewall to the mail server?

We had that problem (using sendmail mind you) when we were running
ipchains.  Moving to iptables has since solved that problem.  The reason
it was a problem (I think) was that we were 'redirecting' incoming
connections to an internal IP address before forwarding it.  Now with
iptables and DNAT, the mail gets directly forwarded without mangling the
source IP address - thus allowing sendmail to have rules to not allow
relay for external addresses and to allow it for internal addresses.  

So if you are correctly using iptables with DNAT it should work as you
want.

> 
> Any help would be greatly appreciated.  I can 
> post the firewall script, etc. if needed.
> 
> Thanks
> 
> Travis Crook
> Visions Beyond
> 


