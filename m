From: frey@mit.edu
Subject: complex nat setup
Date: Tue, 20 Jun 2006 19:15:05 -0400
Message-ID: <20060620231504.GC560@athena.lcs.mit.edu>
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

I have a machine (tester) that wants to test many network devices
simultaneously.  These devices are all hard coded to one subnet/ip.  I
have many network adaptors on this one testing machine, and I want
them to each have the same ip address (that will be visible to the
devices that I am testing).

           My Network/Internet
               |
            1.2.3.4 
    +---------eth0-------------------------+
    |       1.2.3.4                        |
    |                                      |
    |            tester                    |
    |                                      |
    |   10.1.1.1    10.1.2.1     10.1.N.1  |
    +----eth1---------eth2---------ethN----+
        10.0.0.1    10.0.0.1     10.0.0.1
           |            |            |
        10.0.0.2    10.0.0.2     10.0.0.2
         device1     device2      deviceN

Is this sort of a setup possible?  I know that I could do it if I had
one linux machine per device being tested.

I was hoping to solve this using NETMAP and something like

iptables -t nat -A POSTROUTING -o eth1 -d 10.1.1.0/24 -j NETMAP --to 10.0.0.0/24

but that does not work (I think that NETMAP in a POSTROUTING rule will
only change source addresses, and if I put the NETMAP on PREROUTING or
OUTPUT, then the address gets translated to 10.0.0.2 too early, and I
assume that linux will not know what network card to send it out on.

Any help would be greatly appreciated.

Cliff

