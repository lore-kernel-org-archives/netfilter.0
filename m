From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: Advice setting up DMZ
Date: Thu, 06 Jan 2005 06:49:00 -0500
Message-ID: <1105012140.7100.11.camel@localhost>
References: <41DB42CE.1000401@cox.net> <1104893487.3747.128.camel@localhost>
	<41DC9D5B.9090505@cox.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41DC9D5B.9090505@cox.net>
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
To: Thomas Simmons <twsnnva@cox.net>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Wed, 2005-01-05 at 21:07 -0500, Thomas Simmons wrote:
> John A. Sullivan III wrote:
> > On Tue, 2005-01-04 at 20:28 -0500, Thomas Simmons wrote:
> > 
> <snip>

> Thanks for your suggestions, I like the sound of the iprange and the 
> NETMAP patches. As for the script, I have not used the iptables-restore 
> syntax, and am very comfortable with iptables commands. My intentions 
> are to actually have two firewall scripts. The default script would have 
> rules that would forward needed traffic to our primary webserver. The 
> second would have rules that would forward traffic to our failover 
> webserver. I would have the firewall verify that our primary server is 
> still online every 30 seconds or so with an echo. If not the second 
> script would execute, forwarding all traffic to the backup server. I am 
> going to have a rather complicated setup(30 web servers 30 mail servers, 
> IPsec VPN gateway + pptp roadwarrior access) and would like to use 
> iptables commands because im so comfortable with them. I also like the 
> idea of doing everything with one (technically two) scripts, as a 
> recovery after a disk failure would be as simple as installing Linux, 
> putting the script on the server and executing it.
> 
> As for using iproute2 vs. aliases, why would you use iproute2? What are 
> the benefits of doing this?
> 
> Again, thanks alot for the suggestions.
> 
> Regards,
> Thomas
> 
> 
Honestly, I do not have any experience using aliases.  iproute2 is a
more contemporary way of handling the need for multiple addresses.  It
is also far, far more powerful than just a tool for adding more
addresses.  It is an extremely powerful policy routing tool so it is
well worth learning.  Look for a file in your distribution named ip-
cref.ps.  I do recall reading of problems using aliases on some list --
I do not recall if that is netfilter or openswan -- I suspect the
latter.  There is a small training slide show on using it in the
training section of the ISCS web site (http://iscs.sourceforge.net).

The failover scripting idea sounds quite nice and you can certainly do
it with raw iptables commands.  Time is your critical decision
criterion.  This may be especially critical in a failover scenario.
Your times will vary based upon your processing power.  For a very small
rule set, smaller than you will probably have, the difference in time to
load from iptables versus iptables-restore is only a second or two.  For
very large rule sets numbering in the thousands of rules, the difference
may be in the many tens of minutes.

Good luck with the project - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


