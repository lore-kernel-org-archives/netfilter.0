From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: How do I envoke the firewall script?
Date: Sat, 04 Dec 2004 06:56:39 -0500
Message-ID: <1102161398.2019.135.camel@localhost>
References: <200412020847.AA199754942@mail.cybercorpinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200412020847.AA199754942@mail.cybercorpinc.com>
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
To: glens@mail.cybercorpinc.com
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Thu, 2004-12-02 at 11:47, Glen Spidal wrote:
> Greetings,
> 
> I've edited the script from Oskar Andreasson's tutorial for a DMZ
> firewall (rc.DMZ.firewall), but since I'm kind of a newbie I don't
> know how to automaticvally run it at startup.  I have a fresh minimal
> install of Redhat 9.  I selected medium firewall with this install. 
> How do I undo that and run only the DMZ firewall script?  I manually
> ran the DMZ script without errors.  Also how do the stress test the
> firewall to make sure it is working?  I will have a mailserver, two
> BIND DNS servers, plus multiple websites on the DMZ subnet.
> 
> <snip>
Welcome to the adventurous world of iptables!

I believe what happens in Redhat 9 is that the boot sequence runs
through the S prefixed files of the /etc/rc.d/rcX.d directory (where X
is whatever run level you are entering) in numeric order.  One of those
is SXXiptables where XX is the sequencing number.

This file reads its configuration in the iptables-restore format from
/etc/sysconfig/iptables file.  You can overwrite this file directly
although I do not believe the iptables-restore syntax is clearly
documented (perhaps someone else can point to that documentation) or you
can add and delete rules from the command line with the iptables command
until your set up is as you'd like it and then do a 
service iptables save
which overwrite the /etc/sysconfig/iptables file with the current
configuration.

The /proc/sys settings like rp_filter or ip_forward are loaded when
/etc/rc.d/rcX.d/SXXnetwork is run.  The configuration is called from
/etc/sysctl.conf.  You can edit that file to configure the /proc
settings as you'd like.

You can load your script from rc.local but it will then be added to
whatever Redhat is doing when it loads iptables.  That may lead to
unexpected results.

I do not recall because it has been a long time since I wrote them but
some of this material may be in the training section of the ISCS web
page (http://iscs.sourceforge.net).

You can use Nessus (http://www.nessus.org) to give your firewall a good
workout.  Good luck - John
>            
-- 
John A. Sullivan III
Open Source Development Corporation
Financially sustainable open source development
http://www.opensourcedevel.com


