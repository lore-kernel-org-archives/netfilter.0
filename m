From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: netfilter machine in between 2 servers
Date: Sun, 14 Mar 2004 09:44:51 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403140944.51622.Antony@Soft-Solutions.co.uk>
References: <20040314092812.74659.qmail@web60006.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040314092812.74659.qmail@web60006.mail.yahoo.com>
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

On Sunday 14 March 2004 9:28 am, Sandy C wrote:

> Hi there,
>    I have 3 Linux machines. One configured as a server, the second as a
> client, and the third sniffing packets transferring between the 2. All 3
> machines are hooked up to each other over a hub, and all are running
> 100MB/s
>
>    Using ethereal I can see the packets going between the server and the
> client.

All sounds good so far.

> I would like the third, sniffing machine to be able to filter
> packets going between the client and the server. This doesn't seem to work
> though.

No, the third machine cannot filter anything, because nothing passes through 
it.   The third machine is simply seeing the packets as they appear on all 
the sockets of the hub, quite independently of the fact that the client and 
server are talking directly to each other through that hub.

> So I have the following rule on the third machine:
> iptables -A INPUT -p 80 -j LOG
>
> meaning just log all http requests. It doesn't work, but if I have this
> rule on either the client or the server, it works as expected.

Indeed.   The INPUT chain is for packets addressed to the machine with the 
rule running on it - so therefore it works as expected if you put the rule on 
the client or server, because they are actually sending and receiving 
packets.

It doesn't work if you look for packets in the INPUT chain of a machine which 
simply happens to be running ethereal (or tcpdump, or any other sniffer), 
because those packets are not addressed to the machine itself, and therefore 
never make they way up the TCP/IP stack and enter netfilter.   Packet 
sniffers grab the packets much closer to the interface than this, and will 
see stuff which netfilter does not.

> I get the feeling I'm missing something very basic. Can anyone help?

You should think of netfilter as an add-on to Linux's routing capabilties.   
Normal routing allows a machine to pass packets between interfaces.   
Netfilter allows those packets to be blocked, or logged, or redirected to 
another address.   If you are not routing packets through a machine, and it 
is not one of the endpoints taking part in the communication, then you cannot 
filter them with netfilter.

Your setup is not routing packet through machine 3 because client and server 
are on the same subnet, happily talking to each other directly, without any 
need to route through something else.   If you were using a switch instead of 
a hub, machine 3 wouldn't even see the packets in the first place using 
ethereal :)

Hope this helps,

Antony.

-- 
How I want a drink, alcoholic of course, after the heavy chapters involving 
quantum mechanics.

 - 3.14159265358979

                                                     Please reply to the list;
                                                           please don't CC me.


