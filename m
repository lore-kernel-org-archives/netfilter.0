From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: long ruleset perfomance issue
Date: Mon, 04 Apr 2005 08:34:22 -0400
Message-ID: <1112618062.5125.12.camel@jasiiitosh.nexusmgmt.com>
References: <005901c5390b$a363fe30$03c01751@jg>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <005901c5390b$a363fe30$03c01751@jg>
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
To: anton@web-sat.com
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Mon, 2005-04-04 at 12:44 +0100, anton@web-sat.com wrote:
> Hello,
> I need to mark packets going through a linux router with iptables for some 4500 ip addresses(to use with tc bandwidth shaping filters).
> This list needs to be updated every 10 minutes.
> So i made a shell script file looking like:
> 
> /usr/local/sbin/iptables -F 
> /usr/local/sbin/iptables -A FORWARD -t mangle -d 1.1.1.1 -j MARK --set-mark 1
> /usr/local/sbin/iptables -A FORWARD -t mangle -d 1.1.1.3 -j MARK --set-mark 2
> /usr/local/sbin/iptables -A FORWARD -t mangle -d 1.1.1.2 -j MARK --set-mark 1
> and so on for 4500 times.
> 
> When i run this script on Xeon 2.4ghz cpu it takes 2-3 minutes real time with 100% cpu load to process.
> During this time server becomes unusable. 
> Is there any way to make it run faster, like optimizing ruleset or trying a different approach?
> I have tried to search on this issue but was not successful.
> 
> Any input is greatly appreciatred.
> 
> Thank you,
> Anton
Absolutely.  Use iptables-restore (be careful with the command line
parameters, you may want iptables-restore -n).  You feed iptables-
restore a file with the rules in a slightly different syntax than
iptables.  The difference in load time is dramatic.

The ISCS network security management project that I maintain is designed
for large, enterprise or carrier class, multi-layered security and can
thus generate enormous rule sets (http://iscs.sourceforge.net).  We thus
always use iptables-restore in our work.  We also have moved away from
the creation of monolithic rule sets (from this source addr on this sort
port going to that dest addr on that dest port take this action) to
modular rules which evaluate source separately from access type
separately from destination.  This produces a much smaller rule set
which is traversed much more efficiently for large environments.  A
little off your question but also an important issue for minimizing rule
sets, load times and traversal speed.

For your immediate question, iptables-restore is your answer - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

If you would like to participate in the development of an open source
enterprise class network security management system, please visit
http://iscs.sourceforge.net


