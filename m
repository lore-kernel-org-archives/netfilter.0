From: Christian Riechmann <riechmann@fgan.de>
Subject: Re: Need some clarification or help
Date: Wed, 21 Apr 2004 13:45:43 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040421114543.GB892@rie.rie.priv>
References: <20040420182205.GA2948@rie.rie.priv> <200404201947.39774.Antony@Soft-Solutions.co.uk> <20040420205144.GC2997@rie.rie.priv> <200404202207.04668.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200404202207.04668.Antony@Soft-Solutions.co.uk>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On 2004-04-20 22:07:04 +0100, Antony Stone wrote:

> On Tuesday 20 April 2004 9:51 pm, Christian Riechmann wrote:
> 
> > I know that UDP and TCP protocols are completely different, especially
> > the 3-way handshake. But all its steps are TCP packets. Therefore my idea
> > is to encapsulate on each side each TCP packet into a UDP packet, send
> > this one to the other side, decapsulate the original TCP paket from the UDP
> > packet and inject the TCP packet to the kernel.
> 
> Okay - that sounds to me like a UDP tunnel through which you are sending TCP 
> packets - I agree.

Exact.

> 
> > This way the total TCP dialog shall be exchanged as payload of separate UDP
> > packets. UDP is necessary, because only UDP can use broadcast addresses.
> > (I use this type of address to emulate LAN-broadcast within a mobile
> > adhoc network. Therefore I doubt that vtun would help me.)
> 
> I don't quite understand how this would work.   You say you want to use UDP 
> broadcasts - which suggests to me one sender and many receivers.   TCP cannot 
> work with that, because each receiver is going to want to send 
> acknowledgement packets back to the sender, which will get confused about who 
> is it communicating with.

UDP Broadcast is used to forward packets within the ad hoc network. The
forwarding nodes know whether the received packet has to be forwarded.
Only that node which is the intended receiver of the encapsulated TCP
packet will inject the payload (IP/TCP-packet) to the kernel.
So we have the one-to-one relation. (UDP-Broadcasting is used to a certain
extent as a layer 2 transmission.)
> 
> TCP is basically a one-to-one protocol, and even if you try putting the 
> packets inside UDP packets which can be broadcast to multiple receivers, TCP 
> is still going to want to communicate between one machine at each end.
> 
> Ultimately you have to regard the UDP tunnel as just another route to 
> somewhere, and TCP will use all routes in the same way - to find one machine 
> at the other end.

I think this will not be a problem, because the tunnel is build between
both TCP speaking hosts.

As mentioned earlier, this method works very well if UDP and ICMP packets are
encapsulated. Only a IP/TCP packet (captured and encapsulated at the TCP
sending host and captured, decapsulated and injected at the intended TCPr
receiving host) will not be delivered to the TCP application, although a
tcpdump running on the receiver displays the injected IP/TCP packet,
but with some additional bytes at the end. In other words tcpdump
seems to display an IP/TCP packet, which according to the length field
of IP shall have only 64 bytes but really consists of 80 bytes (numbers
are only examples).

My assumption is, that some surplus bytes beyond the end, lead to the
problem (maybe a checksum error because of those bytes not belonging to
the TCP packet.) I do not see why during injection the surplus bytes
have not been deleted, although the verdict call is parameterized with
the new length.

Regards
Christian

-- 
Christian Riechmann    E-Mail: riechmann@fgan.de
c/o FGAN/FKIE          Tel: (+49) 228/9435 345,378
Neuenahrer Strasse 20  Fax: (+49) 228/9435 685
D-53343 Wachtberg, Germany

