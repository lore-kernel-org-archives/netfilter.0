From: Chris Garringer <chris.garringer@tic.toshiba.com>
Subject: Re: Iptables on Redhat 7.3
Date: 20 Mar 2003 11:37:23 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048181844.1320.34.camel@bordercollie>
References: <1048173669.1320.17.camel@bordercollie> 
	<200303201232.54126.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200303201232.54126.netfilter@newkirk.us>
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
To: netfilter@newkirk.us
Cc: Netfilter List <netfilter@lists.netfilter.org>

I think I found the problem the log rule was set for tcp instead of
all.  When I changed that I found that DNS udp from my DNS server was
being blocked.  I allowed udp from the DNS server and everything appears
to be working.   Thanks for the quick replies.


On Thu, 2003-03-20 at 11:32, Joel Newkirk wrote:
> On Thursday 20 March 2003 10:21 am, Chris Garringer wrote:
> > I am implementing iptables on 2 Redhat 7.3 boxes, one a WEB server and
> > one a FTP server.  Both are running the latest Redhat kernel for
> > 7.3,Linux version 2.4.18-27.7.xsmp.  Both are dual processor boxes.  I
> > setup iptables by adding rules to the INPUT chain (single NIC, no
> > routing) to accept the connections I wanted, and had a log rule at the
> > end to see what made it past the accepts.  Once I was not getting any
> > logs I assumed I had written the rules to accept all connections I
> > wanted and put a DROP policy in effect for INPUT.  For the WEB server
> > it worked, for a while.  For the FTP server as soon as I changed the
> > policy iptables --list got REALLY slow.  There are only 10-12 rules,
> > iptables --list took 10-15 seconds per line to list them.  Also some
> 
> Are you listing with the -n option?  That tells iptables to list with IPs 
> instead of resolving to actual host names.  This usually results in 
> near-instant rules listings.  The most useful form (IMHO) is
> 
> iptables -v -n -L
> 
> which lists IPs instead of names, and packet & byte counts that match 
> each rule.  By putting the -L last, it is also easier to hit up-arrow, 
> and add a chain name.  ("iptables -v -n -L INPUT" for example)
> 
> > connections were refused, but not logged (the log rule is still
> 
> What exactly IS the log rule?
> 
> > there).  Changing the policy to accept fixed the problem.  After a
> > reboot the ftp server is working with policy DROP, but after a reboot
> > to update the WEB server last night (with policy DROP) sendmail
> > stopped working.   There is nothing in the logs from iptables about
> > packets getting past the ACCEPT rules for sendmail, but the connection
> > is not made (sendmail 8.11.6). Sendmail is in queue mode and should
> > make only outgoing connections which have no rules and an ACCEPT
> > policy.  When I change the INPUT policy back to ACCEPT sendmail starts
> > sending mail to the relay host. What is going on here?  Is changing
> 
> Likely you don't have a rule in INPUT to allow return traffic, so full 
> 2-way connections cannot be established once policy is DROP.  Do you 
> have at least something like the following rule in place?
> 
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
> 
> This will allow replies back in, without explicitly opening any ports, 
> and without necessarily allowing any NEW incoming connections.
> 
> > the policy to DROP not a good way to do this?  This is frustrating as
> > the logs seem to show everything OK, but the policy change causes
> > problems.
> 
> The only way a policy can affect anything is if a packet is failing to 
> match any effective rules in the chain.  If it matches a LOG rule, it 
> will LOG, but still pass to policy at then end if there is not a rule to 
> specifically handle that traffic.
> 
> If you post your script it would be much more likely that someone here 
> could see the problem and offer a solution.  Most people are more 
> comfortable if they sanitize the script by removing their public IP.  
> (if a static IP is in the rules - of course you sent this message from 
> work, but if you send one from home chances are your IP will be trivial 
> to discover...)
> 
> j
-- 
Chris D. Garringer
Toshiba International
LAN/WAN Supervisor
713-466-0277 x3756
Certified Solaris Administrator
Microsoft Certified Engineer (NT)
RedHat Certified Engineer


