From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: martians and portforwarding to 127.0.0.1
Date: Tue, 20 Apr 2004 18:00:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404201800.46647.Antony@Soft-Solutions.co.uk>
References: <20040420163326.32095.qmail@web40706.mail.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040420163326.32095.qmail@web40706.mail.yahoo.com>
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

On Tuesday 20 April 2004 5:33 pm, udo wrote:

> Hello,
>
> To be able to run sshd from an unpriviliged port I
> want to let sshd listen to just the lo (12.0.0.1)
> interface, port 2222 and forward connections to port
> 22 on my internet and LAN interfaces to 127.0.0.1:22.

I find it hard to understand quite what you mean here.

1. Why would you want to use ssh to connect to the same machine (which is all 
you can do on the loopback interface)?

2. If you have sshd listening on port 2222, why not just ssh to port 2222?

3. You use the word "forward" in a way which confuses me - are you talking 
about one machine here, or redirecting the packets to some other machine on 
the Internet or your LAN?   (In which case, address 127.0.0.1 is probably not 
approporiate).

> To enable this I use something like:
>
> $path_iptables -t nat -A PREROUTING -p tcp -i $ext_if
> -s 0/0 -d $ext_ip --dport 222 -j DNAT --to
> 127.0.0.1:22
> $path_iptables -t nat -A PREROUTING -p tcp -i
> $local_if -s $local_net -d $local_ip --dport 222 -j
> DNAT --to 127.0.0.1:22

I think those rules need to be in the OUTPUT chain nat table.

> $path_iptables -A FORWARD -p tcp -i $ext_if -o lo  -s
> 0/0 -d 127.0.0.1 --dport 22 -m state --state NEW -j
> ACCEPT

Nothing is going to come in the $ext_if addressed to 127.0.0.1 and destined 
for interface lo.

Packets *to* lo come *from* lo.

> $path_iptables -A FORWARD -p tcp -i $local_if -o lo -s
> $local_net -d 127.0.0.1 --dport 22 -m state --state
> NEW -j ACCEPT
>
> (for a test I enabled port 222 -> 127.0.0.1:22)
>
> This makes the following message appear in the log:
>
> blabla kernel: martian destination 127.0.0.1 from
> x.y.z.q, dev ppp0

Yes.   The loopback address is not a valid destination address for packets 
coming from outside the machine.

> How can I make the sshd (attached to loopback) work
> without `martian destination` messages for packets
> destined for port 22?

Why attach sshd to loopback only?   If you want to accept connections from 
other machines (which it appears that you do), then allow sshd to accept 
connections from ppp0, albeit on a high port number, and that should solve 
your problem?

Or have I misunderstood what you are trying to do?

Regards,

Antony.

-- 
The idea that Bill Gates appeared like a knight in shining armour to lead all 
customers out of a mire of technological chaos neatly ignores the fact that 
it was he who, by peddling second-rate technology, led them into it in the 
first place.

 - Douglas Adams in The Guardian, 25th August 1995

                                                     Please reply to the list;
                                                           please don't CC me.


