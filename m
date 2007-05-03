From: cas12@xentech.co.uk
Subject: SIP and NAT conntrack or RTP streams
Date: Thu, 3 May 2007 22:26:14 +0100 (BST)
Message-ID: <Pine.LNX.4.61.0705032116260.24589@clive.accton>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I'm having a problem with what I thought should be a simple SIP setup.

I have a system NATing a number of other systems, one of which is a VOIP phone. 
The UDP port 5060 stuff all works fine, but one of the RTP streams doesn't seem 
to get through the NAT/firewall.

Whats interesting is that both the VOIP providers I've checked against seem to 
end up with the in and out RTP streams with different addresses. The audio RTP 
stream from the phone to the VOIP gateway goes to the same address as the port 
5060 connection and uses the port numbers in the SIP INVITE. The return audio 
RTP data comes on the same ports but from a different IP address.. I see the 
same behavior with soft and hard phones.

If I move the phone to the outside (so it doesn't go through the NAT and 
firewall), its all OK so the VOIP service is not the problem.

Testing with an incoming call to the VOIP phone:

If I look at the /proc/net/nf_conntrack and nf_conntrack_expect files, I see 
the 5060 control connection OK.

The INVITE arrives, the phone rings and an expect get set for the outbound (ie 
phone to server) RTP stream to the same address as the port 5060 SIP 
connection event though the INVITE o= and c= fields have the 'other' IP 
address.

 	172 l3proto = 2 proto=17 src=<phone> dst=<server> sport=0 dport=18986

When I answer the phone, the expect entry is converted to a conntrack entry 
and packets flow outbound OK but the conntrack remains [UNREPLIED], which seems 
reasonable.

Inbound packets (which don't match that conntrack rule since they are from a 
different address) hit the ouside of the NAT gateway and are dropped on the 
floor.

It seems like only one of the needed 2 expect entries are being created.

For inbound and outbound forwarding There are

 	-m state --state RELATED,ESTABLISHED -j ACCEPT

rules set up and other services seem to get out OK.

As a test, I tried to use "conntrack -I" to manually set up another rule for the 
second stream. It did seem to match OK and counts the packets, but the packets 
still get dropped on the floor, so I presume I'm missing some magic to get the 
packets 'un-NATed'. Anyone got some examples for using "conntrack -I" to set 
up a  NAT stream?

This is FC6 with the 2.6.20 kernel. Anyone seen similar problems?


Cheers
Clive


