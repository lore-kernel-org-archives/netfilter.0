From: u9067580@cis.nctu.edu.tw
Subject: Re: Re: Can I only allow those normal TCP 3-handshake packets through
 my firewall?
Date: Fri, 30 Apr 2004 11:03:04 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4091C1E8.3020401@cis.nctu.edu.tw>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org
Cc: David Cannings <lists@edeca.net>

On Wednesday 28 April 2004 15:50, David Cannings Wrote:
 > On Wednesday 28 April 2004 13:45, u9067580@cis.nctu.edu.tw wrote:
 >> I use a test tool to verify my iptables firewall, but unfortunately it
 >> doesn't pass. The test tool doesn't follow the normal TCP 3-handshake
 >> Syn->SynAck->Ack, it goes as below.
 >> 1. A:25205 ---SYN---> B:80
 >> 2. A:25205 <---SYN--- B:80
 >> (ie. 25205 and 80 are port numbers)
 >> My test report tells me that it can successfully send a reply (2nd)
 >> packet, which only has SYN flag, through my firewall. I found the tcp
 >> tracking state is SYN_RECV from the /proc/net/ip_conntrack after the
 >> 2nd packet is pass. As my understood, the SYN_RECV only happens when
 >> the "Syn+Ack" packet is pass, doesn't it?
 >
 > No. If a packet with the SYN and ACK packets is received in response 
to a
 > packet with only SYN sent, you send an ACK (the third part of the three
 > way handshake) and enter the ESTABLISHED state. The "normal" three way
 > handshake does not enter the SYN_RECEIVED state on the client side.
 >
 > What you are seeing is perfectly valid, receiving a packet with only SYN
 > set in response to the first step of the three way handshake enters
 > SYN_RECEIVED and is called a "simultaneous open". Using Google Image
 > Search for "tcp state diagram" will bring up a multitude of diagrams
 > which show this.
 >

Yes, "simultaneous open".
The test suite is 'CDRouter', and it verifies the piggyback TCP SYN 
connections from WAN.  Have you ever heard this kind of attack?  I 
consider the test suite can't simply accuse my firewall of allowing this 
attack, however this behavior is acceptable.

 >> Besides, can I only allow those normal TCP 3-handshake packets through
 >> my firewall?
 >
 > Just using conntrack as normal and denying any NEW packets to ports that
 > shouldn't have daemons listening on them probably will not stop these
 > packets. Denying these packets using the --syn flag, for ports that
 > should not have daemons on, should work. I have not tested it but I
 > believe this would stop the situation you describe. If you do test this,
 > please post your results so I and others know whether it works or not.
 > Note that what you are seeing is an acceptable situation however, you 
may
 > not wish to block it.
 >

I believe it can work, too. But, it's hard to specify those open ports 
to me. I would like to modify the 'state' match or create a new match 
for Syn->SynAck->Ack.

Thanks,
/Jason


