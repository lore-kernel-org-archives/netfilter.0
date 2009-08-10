From: "Gun Akkor" <gakkor@patton.com>
Subject: problem loading kernel modules on iptables 1.4.0 with 2.6.25.5 kernel.
Date: Mon, 10 Aug 2009 12:34:30 -0400
Message-ID: <005401ca19d8$71cc86a0$556593e0$@com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello --

I used to run iptables 1.3.8 on an older kernel with most of the
iptables/netfilter extensions build as modules. I never had any problem with
auto-loading of those modules when iptables needed them for a rule -- for
example protocol match, state match, iprange match, etc.

Recently, I moved to iptables 1.4.0 on a 2.6.25.5 kernel and although all
the modules are built correctly and iptables works correctly, kernel modules
are no longer loaded dynamically. I have to load them manually using insmod
or modprobe depending on the rule I am writing after which everything works
fine -- but of course this defies the purpose of having them as modules in
the first place.

I searched the list and the Internet and did not come across any posting on
this issue so it is very likely that I am doing something wrong and hence
would appreciate the help of the list.

Could you tell me where I might have a problem?

I have the kernel modules under /lib/modules/2.6.25.5/kernel/net/netfilter
for all x_tables support and under
/lib/modules/2.6.25.5/kernel/net/ipv4/netfilter for the rest of the modules.
I am having difficulty dynamically loading modules from either location.

BTW, I have the same problem running kernel 2.6.23.1.

Thanks in advance,
Gun Akkor

