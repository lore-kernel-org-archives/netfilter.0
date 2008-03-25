From: Whit Blauvelt <whit@transpect.com>
Subject: Why does ipv6 enabled interfere with ipv4 SNAT?
Date: Mon, 24 Mar 2008 21:28:07 -0400
Message-ID: <20080325012807.GA15637@transpect.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

I've just been setting up a replacement for an old server happily running
Netfilter with SNAT for years. The new one - using Ubuntu Server 7.10 - was
refusing to SNAT or MASQ, despite running the same long-proven Netfilter
rules. After checking that everything was getting set right in
/proc/sys/net/ipv4/conf (it was), I for some reason took a look in
/proc/sys/net/ipv6/conf. (Ubuntu insists on running ipv6 by default.) There
was an anomoly: The new machine has 6 NICs, and while ipv4/conf had eth0
through eth5, ipv6/conf only had them through eth3 - just the first 4. As it
happens the Internet-facing NICs for this box are eth4 and eth5.

At first I looked for a way to populate the ipv6 proc area. But not finding
that, and really having no use for ipv6 anyway - stupid to leave stuff on on
a server when it's not being used right? - I finally went to
/etc/modprobe.d/arch/i386 and added a line, "alias net-pf-10 off", which on
rebooting blocks the ipv6 kernel module from loading. Now, with no other
change, SNAT works as well as ever.

But I'd still like to understand what the principle here is. Are there two
independent ipv6-related bugs - one that prevents its /proc space being
populated beyond 4 NICs, and a totally different one that breaks ipv4
Netfilter SNAT? Or was the first bug what broke SNAT? What is ipv4 Netfilter
doing being vulnerable to ipv6 problems anyway? I know there's Netfilter
stuff for ipv6; is it somehow required to invoke that somehow if ipv6 is
enabled in order for the ipv4 Netfilter code to work right with SNAT? 

Finally, is the Ubuntu Server project being boneheaded to even have ipv6
enabled by default, if it's still this far from being ready for prime time?
Servers should be rock-solid at basic functions like SNAT out-of-the-box,
IMHO.

Thanks for any explanations. As I say, things work fine once I figure out
what to disable. But frankly it took me half the day to track down what the
problem was. 

Regards,
Whit
