From: Terje Sannum <terje@waste.org>
Subject: Special configuration... need help!
Date: Tue, 30 Aug 2005 18:32:35 +0200
Message-ID: <1125419556.4423.3.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

I'm no networking expert and don't know if this is possible, so any
help and tips are welcome...

Here is the situation: I have this set-top box for cable-tv at home
that is connected to a 100mbps network. This network is connected to
the internet, and plugging in a laptop instead gives me full (NAT'ed)
100mbps access to the internet(!). The problem is that the DHCP server
only gives me 1 ip-address, so I'm looking for a solution where I can
have both my laptop (or better, a subnet) and the set-top box online
on the same time.

Available hardware:
1 Linux PC w/2 network cards
1 switch
(I will invest in the nessesary hardware if that's what it takes)

I've tried using this hardware to make a NAT'ed subnet (with DHCP
server). This works fine for the laptop (i'm using it now :), but the
set-top box complains about no connection to server. The set-top box
is WinXP based, and looking at the traffic at boot-time I see a lot of
netbios packets. I've tried to set up forwarding, but that does not
seem to help. Testing different configurations takes a hell lot of
time since I have to reboot the set-top box everytime, that's why I'm
trying this message. Don't know anything about the MS protocols, and a
little searching tells me that NAT'ing this does not work?

So, is there some way I can watch TV and be online with my computer(s)
at the same time?  The set-top box only needs access to a 10.x.x.x net
(I think), so my thought was that a configuration that sets up a
bridge from that net to the set-top box but still has a NAT'ed subnet
maybe will work. Is this possible? Help! ;)

-Terje




