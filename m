From: george <gk@t-t-l.co.uk>
Subject: Disappearing packets
Date: Sat, 22 Mar 2008 21:48:01 +0000
Message-ID: <1206222481.14091.19.camel@len.t-t-l.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

I'm desperately trying to let World of Warcraft through my firewall for
my son and I can't work out what's wrong.  I've been inserting log rules
in as many places as I can, to see what's happening to the packets -
which are tcp/3724.

I see the packets going out fine and I see the replies coming back with
my log rule at the top of raw-PREROUTING.  However I don't see the
replies going through FORWARD as I expect with my log rule at the top.

I have no rules in the mangle table and I also checked INPUT just in
case I'd messed up nat somehow but nothing there either.  I also see the
connections in /proc/net/ip_conntrack and see the connection in SYN_RECV
state.

I've reread the iptables tutorial and I don't think this is an iptables
problem - I suspect it's something else the kernel does, but I don't
know where else to look.  If someone can give me some clue where to try
then I would greatly appreciate it.

Here's hoping,
George.

