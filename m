From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Need some clarification or help
Date: Tue, 20 Apr 2004 22:07:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404202207.04668.Antony@Soft-Solutions.co.uk>
References: <20040420182205.GA2948@rie.rie.priv> <200404201947.39774.Antony@Soft-Solutions.co.uk> <20040420205144.GC2997@rie.rie.priv>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040420205144.GC2997@rie.rie.priv>
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
To: netfilter@lists.netfilter.org

On Tuesday 20 April 2004 9:51 pm, Christian Riechmann wrote:

> I know that UDP and TCP protocols are completely different, especially
> the 3-way handshake. But all its steps are TCP packets. Therefore my idea
> is to encapsulate on each side each TCP packet into a UDP packet, send
> this one to the other side, decapsulate the original TCP paket from the UDP
> packet and inject the TCP packet to the kernel.

Okay - that sounds to me like a UDP tunnel through which you are sending TCP 
packets - I agree.

> This way the total TCP dialog shall be exchanged as payload of separate UDP
> packets. UDP is necessary, because only UDP can use broadcast addresses.
> (I use this type of address to emulate LAN-broadcast within a mobile
> adhoc network. Therefore I doubt that vtun would help me.)

I don't quite understand how this would work.   You say you want to use UDP 
broadcasts - which suggests to me one sender and many receivers.   TCP cannot 
work with that, because each receiver is going to want to send 
acknowledgement packets back to the sender, which will get confused about who 
is it communicating with.

TCP is basically a one-to-one protocol, and even if you try putting the 
packets inside UDP packets which can be broadcast to multiple receivers, TCP 
is still going to want to communicate between one machine at each end.

Ultimately you have to regard the UDP tunnel as just another route to 
somewhere, and TCP will use all routes in the same way - to find one machine 
at the other end.

Have I understood correctly what you wanted to do?

Regards,

Antony.

-- 
"Linux is going to be part of the future. It's going to be like Unix was."

 - Peter Moore, Asia-Pacific general manager, Microsoft

                                                     Please reply to the list;
                                                           please don't CC me.


