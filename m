From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: Help!! How to steal UDP traffic?
Date: Tue, 25 Jan 2005 12:29:31 +0200
Message-ID: <3063e505012502291406261e@mail.gmail.com>
References: <Pine.LNX.4.61.0501221918080.6027@quasar.las.ic.unicamp.br>
	<Pine.LNX.4.61.0501242211240.6917@quasar.las.ic.unicamp.br>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0501242211240.6917@quasar.las.ic.unicamp.br>
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
To: Guilherme Cesar Soares Ruppert <ruppert@las.ic.unicamp.br>
Cc: netfilter@lists.netfilter.org

Why not MARK-ing it with iptables and send it to the tunnel with iproute ? 


On Mon, 24 Jan 2005 22:12:04 -0200 (BRST), Guilherme Cesar Soares
Ruppert <ruppert@las.ic.unicamp.br> wrote:
> 
> 
>   Hi everyone, please I need some help!!
> 
>   I'm developing a program that needs to intercept an UDP traffic generated
>   locally by another application. It's like a tunnel. My program will steal the
>   outgoing packets from the application (in the same machine) and will send to
>   a tcp tunnel.
> 
>   I am using Libipq to do that, but I have a BIG problem. After send the UDP
>   packets to my tunnel, I need to DROP the packets because I don't want them to
>   be sent over the network. So I am doing:
>   ipq_set_verdict(handle, m->packet_id, NF_DROP, 0, NULL);
> 
>   But the problem is that when I drop the packet, the application that
>   generated the packet remains blocked in sendto() until the packet is
>   accepted. When I change to NF_ACCEPT, the application doesn't block but the
>   packets are sent to the network and I don't want it.
> 
>   How could I drop a packet silently, without blocking the application? Is
>   there any way to intercept outgoing packets locally without let the
>   applications notice that their packet were stolen?
> 
>   Here is the same example using netcat:
>   $ iptables -A OUTPUT -p udp -j QUEUE
>   $ echo "Test" | nc -n -u 10.1.1.23 800
>   And this last remains blocked, not returning to shell.
> 
>   I tested will ping (icmp echo) also and the same happened, but ping didn't
>   block. Instead, it said "operation not permitted".
> 
>   Please give me some hope!!! :-)
> 
>   Thanks
> 
>   Guilherme Ruppert
> 
> 


-- 
Bla bla

