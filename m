From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: forward udp broadcast packets on same subnet /interface with diff source
Date: Wed, 14 Jul 2004 10:01:27 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407141001.27652.Antony@Soft-Solutions.co.uk>
References: <20040714050247.94067.qmail@web90110.mail.scd.yahoo.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040714050247.94067.qmail@web90110.mail.scd.yahoo.com>
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

On Wednesday 14 July 2004 6:02 am, Tom Thumb wrote:

> Hi,
>
> Can I use iptables to forward UDP broadcast packets on the same subnet and
> interface but just change the source IP?

These broadcast packet questions are starting to get weird now :)

> That is, the forwarding machine is 192.168.1.5, with mask 255.255.255.0 and
> has a single NIC.
>
> A machine with IP 192.168.1.6 with the same mask sends a UDP broadcast to
> 192.168.1.255.
>
> The forwarding machine receives this packet. Can it be configured to resend
> it out on the same interface that it received it on (its only interface) and
> just change the source IP to be a 3rd address, like 192.168.1.7, but also as
> a UDP broadcast to 192.168.1.255?

I don't see how you could, because as you're not changing the destination 
address, there's no way to get the pack forwarded through the netfilter 
machine, and it needs to get forwarded so that it can reach the POSTROUTING 
nat table, where you could do the SNAT and change the source address.

Why, please, do you want to do this???

> Is there any way to do this without adding a physical NIC?  Do I need to add
> a "virtual" NIC to do it? How?

My recommendation would be to write a simple program (Perl would do the job if 
you don't like C etc) which listens for UDP broadcasts and then generates a 
new packet with the destination IP = local subnet broadcast address, and a 
faked source IP (192.168.1.7, even though the machine it's running on is 
192.168.1.5).

Why do you want to do this?

Antony.

-- 
If at first you don't succeed, destroy all the evidence that you tried.

                                                     Please reply to the list;
                                                           please don't CC me.


