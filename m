From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: /etc/sysconfig/iptables does not load on reboot
Date: Mon, 4 Jul 2005 08:39:02 -0500
Message-ID: <200507040839.02705.rob0@gmx.co.uk>
References: <NEBBKBPLMLNABNADCIPACEGEBDAB.dleangen@canada.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <NEBBKBPLMLNABNADCIPACEGEBDAB.dleangen@canada.com>
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
To: NetFilter <netfilter@lists.netfilter.org>

On Monday 04 July 2005 06:13, David Leangen wrote:
> > > add some shell code to your startup scripts which redirect more
> > > verbose output to files. In this case maybe some echo commands to
> > > show which file is being fed to iptables-restore.
>
> Well, I did little more digging. Although I see more and more what's
> going on, I'm understanding less and less.
>
> I have two machines on which I freshly installed FC3, in the exaclty
> the same way, with minimal packages. Since I installed FC3 exactly
> the same way, it should behave the same way on both systems, right?
> Well, not so. That's the first point I do not understand.

Same kernel?

> On one machine ("goodhost"), everything works exactly as expected.
>
> On the misbehaving machine, however, ("badhost"), I noticed that
> contrary to what I mentioned in my previous posts,
> /etc/sysconfig/iptables does indeed appear to get loaded at system
> startup.
>
> However, IT DOES NOT GET LOADED THE SAME WAY!!

Please define that.

> Why is that? Why would the same file not get loaded the same way on
> startup as it does when running iptables-restore afterward? And why

A custom kernel on the badhost might explain it, at least in part.

> does it work on one machine, but not on another with the same
> installation? I've tried on a few different firewall rules files, and
> the same thing always seems to happen. I even tried with the default
> RedHat firewall rules. The diff of 'iptables-L' between the two
> (firewall loaded at startup vs. firewall loaded afterward with
> iptables-restore) is below.
>
> Any ideas about this very strange situation? Any help would be most
> appreciated!

1. It's hard to glean useful information out of iptables -L, even with 
-v. It's harder when filtered through diff(1) and when we don't have 
the original iptables-restore file to see. If you want help you should 
post:
   a. The complete but uncommented iptables-restore file
   b. iptables-save(8) output after the boot, but before ..
   c. iptables-save(8) output after manual restoring.
   d. Bank and credit card account information, mother's maiden name.
   e. Debugging output as described below.
   f. What have you changed from default? Kernel? Patch-o-matic?

> < RH-Firewall-1-INPUT  all  --  anywhere             anywhere
> ---
>
> > DROP     tcp  --  anywhere       anywhere      tcp dpts:0:1023

2. This looks like one of those useless RH default firewalls, in the 
style of ipchains. Get a real firewall script to generate your rules. 
It is a waste of time to fix this one. (But it's possible the same 
problem would exist with a better firewall.)

3. My guess is that the --protocol match extensions, tcp, udp and icmp, 
are failing to load at boot. Something which differs between your login 
environment and the environment of init(8) enables the automatic 
loading of netfilter modules.

4. Shell debugging code. Redirect both stdout and stderr of the 
iptables-restore(8) command at boot time to a file. Read the files. 
Your stderr file will probably tell you what went wrong. It wouldn't 
hurt to put in a "set > /root/init-env" too.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

