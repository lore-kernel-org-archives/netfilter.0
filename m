From: Robert L Mathews <lists@tigertech.com>
Subject: Re: conntrack and ESTABLISHED / UNREPLIED connections
Date: Tue, 08 Jul 2008 10:38:13 -0700
Message-ID: <4873A605.1010209@tigertech.com>
References: <486D31D9.9070900@tigertech.com> <4872A115.2030604@tigertech.com> <Pine.LNX.4.64.0807081130220.7417@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.64.0807081130220.7417@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Jozsef Kadlecsik wrote:

> If the data packet sent by the server is valid, the client should send an 
> ACK and not a RST packet. If the data packet is invalid, the client should 
> send an ACK again and not a RST. 

Actually, unless I'm misunderstanding, RFC1122 section 4.2.2.13 seems to 
allow what the client is doing:

   A host MAY implement a "half-duplex" TCP close sequence, so
   that an application that has called CLOSE cannot continue to
   read data from the connection.  If such a host issues a
   CLOSE call while received data is still pending in TCP, or
   if new data is received after CLOSE is called, its TCP
   SHOULD send a RST to show that data was lost.

So in this case, the client app closed the connection even though there 
was data from the server that hadn't been delivered, and the client's 
TCP stack replied with a RST as described above.


> If the server receives the RST packet (and it's valid) it should never 
> ever send unsent data but destroy the connection.

That's what I would have thought, but packet dumps are showing 
otherwise. On a standard Debian 2.6.24 kernel it keeps retrying the 
un-acked packet for more than a minute despite the RST, as shown at the 
end of:

  http://tigertech.net/20080703.tcpdump.server.txt

Are you sure that a normal kernel doesn't do this? Maybe it's a Debian 
bug? If you have access to a fairly busy Web server, you can see if 
yours is doing it with:

  egrep 'ESTABLISHED.+port=(80|443).+UNREPLIED' /proc/net/ip_conntrack

Under normal circumstances, there should be none of these, but all our 
Web servers have thousands (from many hundreds of different client IPs).


> Disable picking up connections and you get rid of those stale connections:
> 
> # echo 0 > /proc/sys/net/netfilter/nf_conntrack_tcp_loose

Thanks! That's exactly what I was looking for, and I really appreciate it.

(I also had the idea of changing nf_conntrack_tcp_timeout_close to be 
120, like nf_conntrack_tcp_timeout_fin_wait, which would hopefully cause 
conntrack to remember the first closed connection for long enough that 
it doesn't think the retransmitted outbound packet is new.)

-- 
Robert L Mathews, Tiger Technologies
