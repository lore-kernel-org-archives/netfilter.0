From: Mariusz Kruk <Kruk@epsilon.eu.org>
Subject: GRE over two NATs
Date: Mon, 4 Apr 2005 21:04:44 +0200
Message-ID: <20050404190444.GA22407@epsilon.rdc.pl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I have a router with 4 interfaces on which I prepared a "IMQ without IMQ
setup". Long story short - every packet that traverses the router is
first pushed through a tunnel set up between 127.0.0.2 and 127.0.0.3.
Therefore I can easily shape the trafic for all interfaces.

It looks like this (one interface only for simplicity):

localnet --- eth3 --- localend <---------> remoteend --- eth0 --- world

Where localnet is of course my local network, eth3 is a local interface,
localend is a "local" end of the tunnel, and so on.
I use NAT and therefore I have to NAT every packet twice, since... I
don't exactly remember what was the exact reason but it had something to
do with connection tracking. Anyway, my 192.168.0.0/16 local addresses
are first mapped 1-to-1 to 172.16.0.0/16 addresses and finally all are
mapped to my public IP.
Everything runs well except GRE.
My users complained that they can't connect to their VPNs over PPTP.
PPTP uses GRE, so I started to log packets in various tables.
I found that for a GRE packet generated in localnet it goes like this:
eth3, mangle/prerouting, mangle/forward, filter/forward, mangle/postrouting,
nat/postrouting, localend.
Then the packet gets in the box again from the remoteend end of the
tunnel and, surprisingly to me, gets logged at mangle/prerouting and
nat/prerouting(!).

Why is it so?
I won't be attaching my setup here since it is generated from a script
and has quite a few hundred rules (yes, I know it's not veryeffective,
but I wanted to have a vanilla kernel, and it's kind of a
proof-of-concept), but there is no rule that should filter such packets.
There is no rule in nat/prerouting table that applies to those packets.
I have completely no idea. :-(
-- 
\.\.\.\.\.\.\.\.\.\.\.\.\.\ Sorry, but I'm not programmed to handle this
.\.Kruk@epsilon.eu.org.\.\. case; I'll just pretend that you didn't  ask
\.http://epsilon.eu.org/\.\ for it.(TeX)
.\.\.\.\.\.\.\.\.\.\.\.\.\. 

