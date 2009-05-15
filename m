From: Michael Douglass <mikedoug@mikedoug.net>
Subject: Routing before LOCAL
Date: Fri, 15 May 2009 17:02:38 -0500
Message-ID: <87ad04f0905151502l42fb74ebw364992fc7cd31dc0@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

I am attempting to setup multiple networks on a single system which
are completely isolated from one another.=A0 Here is the configuration:

    eth0: ip 10.0.0.10/24 gw 10.0.0.1
    eth1: ip 192.168.0.10/24 gw 192.168.0.1

There will be PPTP connections to the 10.0.0.10/24 interface/network.
I want ALL traffic for the ppp interfaces to be routed out to 10.0.0.1
-- EVEN if the traffic is destined for 192.168.0.10 (a LOCAL interface
on the same box).

My first thought was to use ip rules such as this:

    ip rule add from 10.0.0.0/24 table vpn
    ip rule add from all to 10.0.0.0/24 lookup vpn
    ip route add default table vpn via 10.0.0.1
    ip route delete 10.0.0.0/24=A0 # Removes this network from default
routing table

This works for everything that I want EXCEPTtraffic to the local
interface (192.168.0.10) doesn't hit my 'vpn' routing table because
the route for it is in the LOCAL routing table which is rule 0 in the
ip rule list.

Is there a "right" way to do what I want to do?

I've been looking at the ROUTE target in the netfilter extentions --
but compiling them into my kernel has proven troublesome (though I am
still hacking away at getting it to work). I've read and heard that
the ROUTE target is not necessarily the best way to go -- however it
sounds like it answers my problem PERFECTLY.  With the ROUTE target, I
can specify that any traffic coming FROM 10.0.0.0/24 has a --gw
10.0.0.1, and I'd be done.

=46urther, the "fwmark" doesn't appear to answer my problem because I
still need a way to check the fwmark in my ip rule list BEFORE the
local table which is hard coded at 0 -- so I don't believe that is the
answer to my problem.

Thanks in advance for any and all assistance!
MikeDoug
