From: Daniel Dorau <daniel.dorau@alumni.tu-berlin.de>
Subject: decrypted ipsec packets lost, last seen in INPUT chain
Date: Sat, 20 Nov 2004 14:52:21 +0100
Message-ID: <1100958740.3687.11.camel@haktar>
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

Hello list,
I have a problem with decrypted ipsec packets lost. I'm not sure if this
is netfilter related, maybe someone has any idea.

I have a local interface with both 192.168.178.2 (unencrypted) and
192.168.202.5 assigned to it. Packets directed to the private network
are routed to local address 192.168.202.5 which is the local ipsec
tunnel endpoint.
Now if I ping a machine within the VPN, a ICMP echo request is sent
encrypted via 192.168.202.5 into the tunnel. An encrypted ICMP echo
reply is sent back, can be seen with ethereal and in netfilter's INPUT
chain. That echo reply is decrypted and can be seen again in ethereal
(now decrypted) as well as in the INPUT chain.

INPUT chain has policy ACCEPT and doesn't contain any rule except
logging every packet for debugging.

So, basically ipsec works as I get the echo reply decrypted to my INPUT
chain.
But then the packet is lost, ping itself never receives it (strace shows
-EAGAIN as result of recvmsg).
Same for TCP connections. I can see the SYN,ACK in the INPUT chain but
the application never gets it.

Does anybody has an idea where and/or why packets can get lost after
travelling through INPUT chain? (POLICY ACCEPT s.above)
IP adresses and packets itself as inspected within ethereal look
perfectly ok.

Any ideas? I'm completely lost. :-/

Thank you,
Daniel

-- 
Daniel Dorau



