From: "Thom" <thom@galaxynet.com>
Subject: brouter
Date: Sat, 31 May 2003 08:01:52 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001701c32785$9398bca0$a8997242@isomedia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hi Rusty,
    Feel like I almost know you after having read, re-read and read again
your several articles on NAT, Netfiltering and a couple of others.....

    I have a bridging router in place that works for most everything but it
does have one little annoying hic-up.  I am sure there is a very simple
answer/fix but I can't 'see' it, and after 4 months of hacking away at it I
felt it was time to seek a more informed opinion....yours.

I will use the limited artistic abilities I have and try to show you a 'map'
of what we have.

network1----Brouter
                    |         |
                   /          Switch----network2
            Router1           |
             |                  Router2
             |                        |
       Internet                Internet
          T1 (1)                   T1(2)

Routing works internally, seemingly perfect.  Outgoing routing using either
Internet Gateway T1(1) or T1(2) appears to work correctly as well.  We used
the 'default via T1(1) nexthop via T1(2)' as the routing mechanism in
Brouter.  Router 1 is an LRP router, Router2 is a Cisco router.

The problem comes in when we have a host whose gateway is Brouter.
Internally we can see the host just fine.  Externally (such as dialup) when
we try to go to that host we get 'not found' even when specifying the IP
address about 99.99% of the time, occasionally (no pattern) we can see the
host.............  Set the host's GW to Router2 and you can see the host all
day long..........

Right now I have stripped all the iptables rules out except one, and set
them to ALLOW.  The only iptables command in place is "-t nat POSTROUTING -o
eth1 -j SNAT --to IP ADDRESS of T1(1)" (close to that anyway, I don't happen
to be in front of the Brouter at this moment).  This iptables 'rule' appears
to work as we are able to tcpdump the connections we make and see them
actually working and have actually closed T1(2) and only used T1(1) and
everything works just fine except you still can not see any host that has a
gateway of Brouter.

Question is - where have I gone wrong?

Sincerely

Thom


