From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: port forwarding with one interface to trace traffic?
Date: Wed, 21 Jan 2004 22:07:07 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401212207.07929.Antony@Soft-Solutions.co.uk>
References: <400E9EB3.4070309@triad.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <400E9EB3.4070309@triad.de>
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

On Wednesday 21 January 2004 3:45 pm, Rasca wrote:

> Hi IP-gurus,
>
> May be some one can help here. The setup is quite simple.
>
> * one class C net (192.168.10.0)
> * a linux box with one interface (eth0), kernel 2.4.24
>    and iptables 1.2.9 (192.168.10.156
>
> * macos9 machine with 9.2.x (192.168.10...)
>
> * HP laser printer with network interface (192.168.10.9)
>
> I want to configure the Mac to print to the linux box.
> The linux box should do port forwarding to the hp printer.
> So I can use "ethereal" or what ever to dump the traffic.

Your problem with this is a simple networking one, nothing specific to 
netfilter.

Here's a description of where the packets go in your setup:

1. Mac sends to 192.168.10.156
2. Netfilter translates destination address and packet goes to printer at 
192.168.10.9
3. Printer replies to Mac (because source address remains unchanged).

Therefore the Mac is unhappy and upset, because it sent to 192.168.10.156, and 
got a reply from 192.168.109.9.

TCP doesn't allow that, therefore printing doesn't work.

Your solutions?

1. Add second interface to the firewall, and make sure the client and server 
are on opposite sides of it, so that packets in both directions have to go 
through the netfilter machine (which will then perform the reverse NAT in the 
opposite direction)

2. Perform SNAT as well as DNAT on the netfilter system so that the Mac think 
it's printing to the netfilter box (which does DNAT so the packets get sent 
to the printer, but also does SNAT so the printer replies back to netfilter, 
and reverse NAT can then successfully send the replies back to the Mac)

3. Connect a hub (not a switch) to the printer's ethernet cable (or to the 
Mac's ethernet cable), and plug the Linux machine running ethereal into the 
hub, so you can sniff the packets off the wire without any NAT.

My recommendation would be for option 3, because it makes the least change to 
your existing network setup and ensures you can investigate the problem 
without doing something which may affect packet routing etc (which could turn 
out to be the cause you are looking for).

Regards,

Antony.

-- 
This email is intended for the use of the individual addressee(s) named above 
and may contain information that is confidential, privileged or unsuitable 
for overly sensitive persons with low self-esteem, no sense of humour, or 
irrational religious beliefs.

If you have received this email in error, you are required to shred it 
immediately, add some nutmeg, three egg whites and a dessertspoonful of 
caster sugar.   Whisk until soft peaks form, then place in a warm oven for 40 
minutes.   Remove promptly and let stand for 2 hours before adding some 
decorative kiwi fruit and cream.   Then notify me immediately by return email 
and eat the original message.

                                                     Please reply to the list;
                                                           please don't CC me.


