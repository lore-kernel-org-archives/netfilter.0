From: Robert L Mathews <lists@tigertech.com>
Subject: Re: conntrack and RSTs received during CLOSE_WAIT
Date: Sat, 16 May 2009 20:09:34 -0700
Message-ID: <4A0F7FEE.3010405@tigertech.com>
References: <4A0DE859.7000209@tigertech.com> <alpine.DEB.2.00.0905162348430.4156@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.0905162348430.4156@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Jozsef Kadlecsik wrote:

> The TCP session seems to be totally broken. After the client sends
> 
> client > server [FIN,ACK] Seq=421 Ack=1449 Len=0
> 
> it should send the RST packet with Seq=422 and not Seq=421. The RST 
> segment won't be accepted by the server.

Okay. The client is definitely sending exactly that (I'm pretty sure 
it's a SonicWall firewall). That explains why the connection stays in 
the CLOSE_WAIT state according to netstat.

So the problem can be described as:

Some buggy clients send an out-of-sequence RST. When that happens, 
conntrack forgets about the connection ten seconds later, even though 
the TCP stack doesn't.

If nf_conntrack_tcp_loose is set to 0, this gives clients a trivial way 
to bypass connlimit, because the client then has open connections that 
aren't counted.

If nf_conntrack_tcp_loose is set to 1, subsequent packets sent more than 
ten seconds later will result in conntrack seeing a new ESTABLISHED 
connection. Unfortunately, if the subsequent packets were merely TCP 
retransmits (which is likely), the "new connection" will not really 
exist. Connlimit counts a nonexistent connection as being open for five 
days until it times out.

Both of these outcomes are obviously undesirable. Any suggestions how to 
avoid this, or to minimize the impact?


> And I don't get the server either: after sending Ack=422 it can't send 
> Ack=421.
> 
> Is it a real TCP session recording or a mistyped one?

You're right; that was a typo on my part, for which I apologize. I had 
to retype it from Wireshark, and I copied the wrong line. The ten 
retransmitted packets at the end do indeed send Ack=422, just as you say 
they should.

(However, the client problem is not a typo. The client definitely did 
send Seq=421 in the RST, which explains why netstat shows the connection 
remaining in CLOSE_WAIT and why the server continues to retransmit packets.)

-- 
Robert L Mathews, Tiger Technologies     http://www.tigertech.net/
