From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Lost packets, un-masqueraded retransmits
Date: Fri, 02 Sep 2005 02:31:47 -0500
Message-ID: <4317FFE3.6060403@riverviewtech.net>
References: <Pine.LNX.4.44.0509012224260.4223-100000@rhubarb.frogtop.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0509012224260.4223-100000@rhubarb.frogtop.com>
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
To: netfilter@lists.netfilter.org

> I'm seeing some very strange problems which I believe are at least half 
> netfilter issues - my apologies if not!  I hope you can help me.
> 
> I have a Fedora Core 4 system (2.6.12-ish, iptables 1.3.0-ish) acting as a 
> masquerading gateway between an ethernet network (MTU 1500) and a PPPoATM 
> connection (MTU 1492).  
> I've simplified things to a single iptables rule,
>   -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
> with net.ipv4.ip_forward=1, and can reproduce the problem.
> 
> Machines on the internal network are unable to access certain websites (the 
> homepage of www.nationalrail.co.uk, for example).  It appears that large 
> packets are being dropped, but also, whilst snooping to debug, I saw 
> unmasqueraded packets being leaked out.
> 
> Snooping on the LAN address of the gateway I see (eg.):
> 
> No.     Time        Source                Destination           Protocol Info
>       1 0.000000    192.168.31.191        213.174.202.41        TCP      1851 > http [SYN] Seq=0 Ack=0 Win=65535 Len=0 MSS=1460
>       2 0.018139    213.174.202.41        192.168.31.191        TCP      http > 1851 [SYN, ACK] Seq=0 Ack=1 Win=32767 Len=0 MSS=16856
>       3 0.018416    192.168.31.191        213.174.202.41        TCP      1851 > http [ACK] Seq=1 Ack=1 Win=65535 Len=0
>       4 0.020234    192.168.31.191        213.174.202.41        HTTP     GET /live/styles/main/home.css HTTP/1.1
>       5 0.051078    213.174.202.41        192.168.31.191        TCP      http > 1851 [ACK] Seq=1 Ack=408 Win=32767 Len=0
>       6 0.054043    213.174.202.41        192.168.31.191        HTTP     Continuation or non-HTTP traffic
>       7 0.054246    192.168.31.191        213.174.202.41        TCP      [TCP Dup ACK 3#1] 1851 > http [ACK] Seq=408 Ack=1 Win=65535 Len=0 SLE=1461 SRE=1674
>      10 16.051440   192.168.31.191        213.174.202.41        TCP      1845 > http [FIN, ACK] Seq=0 Ack=0 Win=65535 Len=0
>      11 54.377013   192.168.31.191        213.174.202.41        TCP      [TCP Retransmission] 1845 > http [FIN, ACK] Seq=0 Ack=0 Win=65535 Len=0
> 
> (packet 6 was seq 1461, ack 408, len 213).  As you can see, a 1460-byte 
> packet went missing between packets 5 and 6.
> 
> Snooping on ppp0, I see nearly the same thing, with the internal IP address 
> replaced by the external IP (correctly, by the masquerading rule).  Once 
> again, the 1460-byte packet is missing.  However, and worryingly, the 
> retransmitted packet, packet 11, and subsequent retransmissions, _appear_ 
> (according to tcpdump and ethereal) to still have the original (RFC1918) 
> source address.  Is this a config error, a reporting error or a bug? :)
> 
> Snooping at the endpoint (213.174.202.41 in this example) showed:
> 
> 21:34:43.491939 85.210.143.231.1851 > 213.174.202.41.http: S 2346403573:2346403573(0) win 65535 <mss 1460,nop,nop,sackOK> (DF)
> 21:34:43.492005 213.174.202.41.http > 213.174.202.41.1851: S 4283534505:4283534505(0) ack 2346403574 win 32767 <mss 16856,nop,nop,sackOK> (DF)
> 21:34:43.509632 85.210.143.231.1851 > 213.174.202.41.http: . ack 1 win 65535 (DF)
> 21:34:43.524462 85.210.143.231.1851 > 213.174.202.41.http: P 1:408(407) ack 1 win 65535 (DF)
> 21:34:43.524484 213.174.202.41.http > 85.210.143.231.1851: . ack 408 win 32767 (DF)
> 21:34:43.525913 213.174.202.41.http > 85.210.143.231.1851: . 1:1461(1460) ack 408 win 32767 (DF)
> 21:34:43.525935 213.174.202.41.http > 85.210.143.231.1851: P 1461:1674(213) ack 408 win 32767 (DF)
> 21:34:43.544692 85.210.143.231.1851 > 213.174.202.41.http: . ack 1 win 65535 <nop,nop,sack sack 1 {1461:1674} > (DF)
> 21:34:46.528362 213.174.202.41.http > 85.210.143.231.1851: . 1:1461(1460) ack 408 win 32767 (DF)
> 21:34:52.527773 213.174.202.41.http > 85.210.143.231.1851: . 1:1461(1460) ack 408 win 32767 (DF)
> 21:35:04.526655 213.174.202.41.http > 85.210.143.231.1851: . 1:1461(1460) ack 408 win 32767 (DF)
> 21:35:28.524181 213.174.202.41.http > 85.210.143.231.1851: . 1:1461(1460) ack 408 win 32767 (DF)
> 
> Everything matches up, and you can see the 1460-byte packets going out, 
> which never make it.  But the reason I think this part of the problem is 
> potentially netfilter related, rather than a connection configuration 
> issue, is that the gateway box itself can access all of these affected site 
> with no problem at all!
> 
> I'd be grateful for any suggestions, I've currently run out of ideas of 
> things to try...

The first thing that comes to mind is (I know that I have said this about 3 or 4 times in the last week to various people on and off this list) that your Path MTU value is killing things.  If you notice in the 2nd traffic dump (tcpdump output) the Don't Fragment (DF) flag is set on the packet.  I would be willing to bet that the returning traffic is being dropped b/c the packets are too large to fit in the frame of the PPP over ATM frame.

21:34:43.491939 85.210.143.231.1851 > 213.174.202.41.http: S 2346403573:2346403573(0) win 65535 <mss 1460,nop,nop,sackOK> (DF)
21:34:43.492005 213.174.202.41.http > 213.174.202.41.1851: S 4283534505:4283534505(0) ack 2346403574 win 32767 <mss 16856,nop,nop,sackOK> (DF)
21:34:43.509632 85.210.143.231.1851 > 213.174.202.41.http: . ack 1 win 65535 (DF)
21:34:43.524462 85.210.143.231.1851 > 213.174.202.41.http: P 1:408(407) ack 1 win 65535 (DF)
21:34:43.524484 213.174.202.41.http > 85.210.143.231.1851: . ack 408 win 32767 (DF)
21:34:43.525913 213.174.202.41.http > 85.210.143.231.1851: . 1:1461(1460) ack 408 win 32767 (DF)
21:34:43.525935 213.174.202.41.http > 85.210.143.231.1851: P 1461:1674(213) ack 408 win 32767 (DF)
21:34:43.544692 85.210.143.231.1851 > 213.174.202.41.http: . ack 1 win 65535 <nop,nop,sack sack 1 {1461:1674} > (DF)

If you notice the next 4 packets are duplications of the 3rd packet from the server to the client.

21:34:46.528362 213.174.202.41.http > 85.210.143.231.1851: . 1:1461(1460) ack 408 win 32767 (DF)
--------------- This packet is approximately 3 seconds after the 1st transmission.
21:34:52.527773 213.174.202.41.http > 85.210.143.231.1851: . 1:1461(1460) ack 408 win 32767 (DF)
--------------- This packet is approximately 6 seconds after the 2nd transmission.
21:35:04.526655 213.174.202.41.http > 85.210.143.231.1851: . 1:1461(1460) ack 408 win 32767 (DF)
--------------- This packet is approximately 12 seconds after the 3rd transmission.
21:35:28.524181 213.174.202.41.http > 85.210.143.231.1851: . 1:1461(1460) ack 408 win 32767 (DF)
--------------- This packet is approximately 24 seconds after the 4th transmission.

If you notice in your tcpdump output from the server  5 packets are identical to each other.  These packets also have the DF flag set.  If you will notice the timestamps between the last 4 packets from the server is doubling in delay between each packet.  This is as if the server is going through it's TCP/IP backout timer assuming that things are congested on the way back to the client.

The ""missing packet you are referring to is a fairly small packet and could easily be a datagram that exceeded the TCP/IP window size of the packet and thus was forced to wrap it the remaining data in to a subsequent packet.  Seeing as how the DF flag is set I could see how things would get lost on their way back to the client.

I would like to see a TCPDump output from the client system verses the dump that you did provide as comparing apples to apples is much easier.

As far as a solution to you try adding a TCPMSS target to your FORWARD chain as such:

iptables -t filter -A FORWARD -j TCPMSS --clamp-mss-to-pmtu



Grant. . . .

