From: "Ric Messier" <kilroy@WasHere.COM>
Subject: RE: syn DDoS attack solution
Date: Fri, 1 Jun 2007 09:01:29 -0600
Message-ID: <007101c7a45d$bc50e380$34f2aa80$@COM>
References: <465EF582.4070904@bgs.hu> <015e01c7a3bf$64fbe7e0$2ef3b7a0$@COM>
	<465FEA82.709@bgs.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <465FEA82.709@bgs.hu>
Content-Language: en-us
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
To: 'Bgs' <bgs@bgs.hu>
Cc: netfilter@lists.netfilter.org


Bgs writes:
> 
> Some more info about the attack: All IPs were real IPs otherway the tcp
> handshake wouldn't have made it. The attacker IPs were also consistent.
> They also new about the blocked IPs as after a new bunch of blocked IPs
> we fared OK then they added another bunch new IPs... we played this for
> quite some time...
> 
> All connections were in the ESTABLISHED state.
> 

Then your original description was incorrect or at least inadequate. It has
nothing to do with SYN as originally suggested since an ESTABLISHED
connection has blown past SYN, through SYN/ACK and by ACK. It has completed
the TCP handshake, as you note above. A SYN attack/flood would stop after
sending the initial SYN and leave the connection half-open to exhaust the
half-open buffers.

> 
> How is the handling of ESTABLISHED connections implemented in the
> TCP/IP
> stack?

There is likely a timer somewhere to time out connections that are just
hanging around doing nothing. You'd have to dig around to find it and turn
it down. You could also use something like tcpkill to get rid of them for
you. 


Ric



