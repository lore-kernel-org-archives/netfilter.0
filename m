From: u9067580@cis.nctu.edu.tw
Subject: Can I only allow those normal TCP 3-handshake packets through my
 firewall?
Date: Wed, 28 Apr 2004 20:45:34 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <408FA76E.2040302@cis.nctu.edu.tw>
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

Hi,

I use a test tool to verify my iptables firewall, but unfortunately it 
doesn't pass. The test tool doesn't follow the normal TCP 3-handshake 
Syn->SynAck->Ack, it goes as below.

1.   A:25205  ---SYN--->  B:80     
2.   A:25205  <---SYN---  B:80
(ie. 25205 and 80 are port numbers)

My test report tells me that it can successfully send a reply (2nd) 
packet, which only has SYN flag, through my firewall. I found the tcp 
tracking state is SYN_RECV from the /proc/net/ip_conntrack after the 2nd 
packet is pass. As my understood, the SYN_RECV only happens when the 
"Syn+Ack" packet is pass, doesn't it?

Besides, can I only allow those normal TCP 3-handshake packets through 
my firewall?

/Jason


