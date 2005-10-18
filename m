From: "Lee Al" <leethya@hotmail.com>
Subject: MASQ multiple connections to a single port of a host to a single
Date: Wed, 19 Oct 2005 07:21:55 +0800
Message-ID: <BAY109-F28E834FEDE83F2F305059AA7710@phx.gbl>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi all,
    I got a question on making MASQUERADE work in the following
    scenario.

    Suppose there are three hosts, let's say host_nat1,
    host_nat2, and host3.  host_nat1 and host_nat2 are behind nat1 and
    nat2 respectively, and obtained their IP from the DHCP server
    running on the respective nat box.  host3 is not behind any nat.  The 
major
    iptables rule I am using for MASQUERADE on both nat1 and nat2 is: 

    iptables -A POSTROUTING -t nat -s 192.168.0.0/16 -o eth0 -j MASQUERADE

    I am developing a new P2P protocol based on UDP, and I tried to
    send some UDP packets from host3 to host_nat2:10000, and I
    recorded the NATed port on nat2, which is nat2:10000.  The key
    feature of my protocol is to handoff the connection
    <host_nat2:10000, host3> to <host_nat2:10000, host_nat1:10000>.  I
    made host_nat1:10000 to send UDP packets to nat2:10000 after host3
    sent packet to nat2:10000, and hope nat2:10000 can be NATed back
    to host_nat2:10000 so that the connection can be handed off.
    However, I got a destination port 10000 unreachable error on nat2.

    I read the connection tracking document, and I think nat2 dropped
    the packet because the connection between host_nat1 and host_nat2
    is not established.  So I make host_nat2:10000 send a packet to
    host_nat1:10000, hoping the connection between host_nat1 and
    host_nat2 is established when host3 tried to handoff the connection
    to host_nat1.  But I found nat1 NATed host_nat1:10000 into
    nat1:1028 to reply the packet sent from host_nat2.  Therefore I
    got the destination port 10000 unreachable error on nat2 again,
    with the connections on nat2:

    src host_nat2:10000 dst nat1:10000      <UNREPLIED>
    src nat1:1028       dst host_nat2:10000 <UNREPLIED>

    Since there will be some other host_nat2A, host_nat2B behind nat2
    running the same P2P protocol (they also obtained their IPs from
    the DHCP server running on nat2).  I think one possible solution
    is to configure iptables to map dynamically host_nat2:10000 to
    nat2:10000, host_nat2A:10000 to nat2:10005, and etc, regardless
    the other peer's IP and NATed port.  In other words, multiple UDP
    connections to a specific port on a host are mapped with only one
    binding on the nat box.  Doing that, both host_nat1 and host3 can
    both send the packets to nat2:10000, and host_nat2:10000 will be able
    to get the packet.  Next time when host_nat2 gets a new IP
    address or the nat binding expires, host_nat2:10000 may be mapped
    to nat2:10010.  And host_nat1 and host3 can both send the packet to
    nat2:10010 for host_nat2:10000.

    I am not sure if the solution depicted in the previous paragraph
    is configurable or not.  Please make your valuable comments.  Thanks a 
lot.

Regards,
Al



